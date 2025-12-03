# Iterative vs Single-Pass Execution

## TL;DR

**Use `RUN_ALL_ITERATIVE_v5.sh` for production** (recommended)  
**Use `RUN_ALL_v5.sh` for quick testing** (faster, but may not converge)

---

## The Problem (Pre-v5.2.1)

The original system did **one pass**:

```
Independent Generation
    ↓
Cross-Validation + Disagreement Check
    ↓
(Optional) Single Technical Iteration
    ↓
Synthesis
```

**Issue:** After technical iteration updated LLM positions, there was **no second disagreement check**. The system never looped back to validate if LLMs had actually converged on technical facts.

---

## The Solution (v5.2.1)

### Two Scripts, Two Use Cases

#### 1. `RUN_ALL_ITERATIVE_v5.sh` (Recommended)

**What it does:**
- Loops: Cross-Validation → Technical Iteration
- Continues until: (a) no disagreements, or (b) max rounds reached
- Default: 3 rounds (configurable)

**Usage:**
```bash
./RUN_ALL_ITERATIVE_v5.sh          # Default: 3 rounds
./RUN_ALL_ITERATIVE_v5.sh 5        # Custom: 5 rounds
```

**When to use:**
- Production runs
- When you need guaranteed convergence on technical facts
- When quality matters more than speed
- When you want to minimize manual intervention

**Runtime:** 20-40 minutes (depends on convergence)

**Output:**
- Full convergence statistics
- Clear indication if max rounds reached without full agreement
- Ready-to-test approaches with validated technical accuracy

---

#### 2. `RUN_ALL_v5.sh` (Single-Pass)

**What it does:**
- One pass: Independent → Cross-Validation → (Optional) Single Iteration → Synthesis
- No loop-back for re-validation
- Stops after first iteration (if any)

**Usage:**
```bash
./RUN_ALL_v5.sh
```

**When to use:**
- Quick testing/debugging
- When you want manual control over iteration rounds
- Time-constrained exploratory runs
- When you plan to manually review and re-run if needed

**Runtime:** 15-25 minutes

**Limitation:** May complete with unresolved disagreements

---

## Technical Details

### What Changed in v5.2.1

#### 1. Cross-Validation Now Sees Iterations

**File:** `orchestrate_crossvalidation.sh`

**Before:**
```bash
# Only looked at original approaches in 01_DIVERGENT_GENERATION/
for llm_file in "$GENERATION_DIR"/*.md; do
    cat "$llm_file" >> "$OUTPUT_DIR/critique_context.txt"
done
```

**After:**
```bash
# Also looks at updated positions from prior iterations
if ls "$OUTPUT_DIR"/Iteration_*.md >/dev/null 2>&1; then
    echo "## UPDATED POSITIONS (FROM PRIOR ITERATION)" >> ...
    for iteration_file in "$OUTPUT_DIR"/Iteration_*.md; do
        cat "$iteration_file" >> "$OUTPUT_DIR/critique_context.txt"
    done
fi
```

**Impact:** LLMs now validate the **latest positions**, not just original approaches.

---

#### 2. Iterative Wrapper Script

**File:** `RUN_ALL_ITERATIVE_v5.sh`

**Logic:**
```bash
ROUND=0
MAX_ROUNDS=3  # Configurable

while true; do
  ROUND=$((ROUND + 1))
  
  # Run cross-validation
  orchestrate_crossvalidation.sh
  
  # Check for disagreements
  if no disagreements found; then
    echo "✅ Converged in $ROUND rounds"
    break
  fi
  
  # Check max rounds
  if [ "$ROUND" -ge "$MAX_ROUNDS" ]; then
    echo "⚠️ Max rounds reached"
    break
  fi
  
  # Run iteration
  orchestrate_technical_iteration.sh
  
  # Loop back to cross-validation
done

# Final synthesis
orchestrate_synthesis.sh
```

---

## Example Scenarios

### Scenario 1: Quick Convergence (2 rounds)

```
Round 1:
  Cross-Validation → Disagreement: "Applications filter behavior unclear"
  Technical Iteration → LLMs update positions

Round 2:
  Cross-Validation → No disagreements
  ✅ Converged in 2 rounds

Synthesis → 5 ready-to-test approaches
```

**Total time:** ~25 minutes

---

### Scenario 2: Partial Convergence (max rounds)

```
Round 1:
  Cross-Validation → 3 disagreements
  Technical Iteration → 2 resolved, 1 remains

Round 2:
  Cross-Validation → 1 disagreement (GDV estimation method)
  Technical Iteration → Still debating

Round 3:
  Cross-Validation → 1 disagreement (strategic, not technical)
  ⚠️ Max rounds reached

Synthesis → Proceeds with note: "Strategic difference preserved"
```

**Total time:** ~35 minutes

---

### Scenario 3: Single-Pass (No Iteration Needed)

```
Cross-Validation → No disagreements
✅ All LLMs agree on technical facts

Synthesis → 6 ready-to-test approaches
```

**Total time:** ~15 minutes  
**Note:** Both scripts handle this efficiently

---

## Convergence Statistics

The iterative script provides detailed statistics:

```
╔══════════════════════════════════════════════════════════════╗
║  🎯 Iterative Pipeline Complete                              ║
╚══════════════════════════════════════════════════════════════╝

Statistics:
  • Total iteration rounds: 2
  • Convergence: Full (no disagreements)
  • Ready-to-test approaches: 5

Next Steps:
  → Review ExecutiveSummary.md
  → Proceed to Stage 4 (Refinement)
```

---

## FAQ

**Q: Why not always use the iterative version?**  
A: Single-pass is faster for testing. If you're debugging prompts or doing exploratory runs, you may not need full convergence.

**Q: What if LLMs never converge?**  
A: The system proceeds after max rounds. Strategic differences are acceptable and preserved. Only technical/business case facts need agreement.

**Q: Can I increase max rounds?**  
A: Yes: `./RUN_ALL_ITERATIVE_v5.sh 10` (but 3-5 is usually sufficient)

**Q: Does this change the output format?**  
A: No. Both scripts produce identical outputs (same directory structure, same files).

**Q: What counts as a "disagreement"?**  
A: Technical facts (filter existence, syntax, capital feasibility) or business case facts (ROI calculations, implementation viability). Strategic differences are NOT disagreements.

---

## Migration Guide

**If you were using `RUN_ALL_v5.sh`:**

1. **No changes required** - it still works as before
2. **To upgrade:** Replace with `RUN_ALL_ITERATIVE_v5.sh` in your workflow
3. **Expect:** Slightly longer runtime, but higher quality convergence

**Backward compatibility:** 100% - all existing projects work with both scripts

---

## Credits

**User feedback:** "Your system does one pass... but there's no loop. It never comes back around for a second disagreement check."

This iterative loop was added in v5.2.1 based on this critical observation.

---

**System Version:** v5.2.1  
**Last Updated:** 2025-11-21

