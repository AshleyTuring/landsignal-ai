# Quick Reference: v5.2.1 Iterative System

## TL;DR

**Use `RUN_ALL_ITERATIVE_v5.sh` for production** ✅  
**Use `RUN_ALL_v5.sh` for quick testing** ⚡

---

## The Fix (One Sentence)

**System now loops cross-validation → iteration until LLMs converge on technical facts (or max rounds reached).**

---

## Visual Comparison

### Single-Pass (Old Behavior)
```
┌─────────────┐
│ Independent │
└──────┬──────┘
       ↓
┌─────────────────┐
│ Cross-Validate  │
└──────┬──────────┘
       ↓
   ┌───────┐
   │ Agree?│
   └───┬───┘
       ↓ NO
┌─────────────┐
│ Iterate     │  ← ONE TIME ONLY
│ (no recheck)│  ← ❌ PROBLEM
└──────┬──────┘
       ↓
┌─────────────┐
│ Synthesis   │
└─────────────┘
```

### Iterative (New Behavior)
```
┌─────────────┐
│ Independent │
└──────┬──────┘
       ↓
   ╔═══════════════╗
   ║ LOOP (max 3x) ║
   ╚═══════════════╝
       ↓
┌─────────────────┐
│ Cross-Validate  │ ← Sees updated positions
└──────┬──────────┘
       ↓
   ┌───────┐
   │ Agree?│
   └───┬───┘
       ↓ NO
┌─────────────┐
│ Iterate     │
└──────┬──────┘
       │
       └──────┐
              ↓
       ⤴️ Loop back ✅
              ↓
   ┌───────┐
   │ Agree?│
   └───┬───┘
       ↓ YES
┌─────────────┐
│ Synthesis   │
└─────────────┘
```

---

## Script Comparison

| Feature | `RUN_ALL_v5.sh` | `RUN_ALL_ITERATIVE_v5.sh` |
|---------|-----------------|---------------------------|
| **Loops?** | ❌ No | ✅ Yes |
| **Sees updates?** | ❌ No | ✅ Yes |
| **Converges?** | ❌ Maybe | ✅ Yes |
| **Runtime** | 15-25 min | 20-40 min |
| **Use for** | Quick tests | Production |

---

## Usage Examples

### Production Run (Recommended)
```bash
cd projects/MyProject/.agents_v5
./RUN_ALL_ITERATIVE_v5.sh
```

**What happens:**
```
Phase 0: Independent Generation (4 LLMs)
  ✅ 4 approaches generated

Round 1:
  Phase 1: Cross-Validation
    ⚠️ 3 disagreements found
  Phase 1.5: Technical Iteration
    ✅ Positions updated

Round 2:
  Phase 1: Cross-Validation (validates updated positions)
    ⚠️ 1 disagreement remains
  Phase 1.5: Technical Iteration
    ✅ Positions updated

Round 3:
  Phase 1: Cross-Validation
    ✅ No disagreements - converged!

Phase 2: Synthesis
  ✅ 5 ready-to-test approaches

Statistics:
  • Total rounds: 3
  • Convergence: Full
  • Runtime: 32 minutes
```

---

### Quick Test Run
```bash
cd projects/MyProject/.agents_v5
./RUN_ALL_v5.sh
```

**What happens:**
```
Phase 0: Independent Generation (4 LLMs)
  ✅ 4 approaches generated

Phase 1: Cross-Validation
  ⚠️ 3 disagreements found

Phase 1.5: Technical Iteration (ONE TIME ONLY)
  ✅ Positions updated
  ❌ No re-validation

Phase 2: Synthesis
  ⚠️ May still have unresolved disagreements
  ✅ 5 ready-to-test approaches

Runtime: 18 minutes
```

---

## Custom Max Rounds

```bash
# Default: 3 rounds
./RUN_ALL_ITERATIVE_v5.sh

# Custom: 5 rounds
./RUN_ALL_ITERATIVE_v5.sh 5

# Custom: 10 rounds (overkill, but possible)
./RUN_ALL_ITERATIVE_v5.sh 10
```

**Recommendation:** 3-5 rounds is usually sufficient

---

## Key Technical Changes

### 1. Cross-Validation Context
**File:** `orchestrate_crossvalidation.sh`

**Before:**
```bash
# Only looked at original approaches
for llm_file in "$GENERATION_DIR"/*.md; do
    cat "$llm_file" >> critique_context.txt
done
```

**After:**
```bash
# Also looks at updated positions
if ls Iteration_*.md >/dev/null 2>&1; then
    echo "## UPDATED POSITIONS" >> critique_context.txt
    for iteration_file in Iteration_*.md; do
        cat "$iteration_file" >> critique_context.txt
    done
fi
```

---

### 2. Iterative Loop
**File:** `RUN_ALL_ITERATIVE_v5.sh`

```bash
ROUND=0
MAX_ROUNDS=3

while true; do
  ROUND=$((ROUND + 1))
  
  orchestrate_crossvalidation.sh
  
  if no disagreements; then
    break  # Converged!
  fi
  
  if ROUND >= MAX_ROUNDS; then
    break  # Max rounds reached
  fi
  
  orchestrate_technical_iteration.sh
  # Loop back to cross-validation
done

orchestrate_synthesis.sh
```

---

## When to Use Each

### Use `RUN_ALL_ITERATIVE_v5.sh` when:
- ✅ Production runs
- ✅ Quality matters more than speed
- ✅ You need guaranteed convergence
- ✅ You want minimal manual intervention

### Use `RUN_ALL_v5.sh` when:
- ✅ Quick testing/debugging
- ✅ Exploratory runs
- ✅ Time-constrained
- ✅ You'll manually review and re-run if needed

---

## Convergence Examples

### Example 1: Fast (2 rounds, 25 min)
```
Round 1: 3 disagreements → Iterate
Round 2: ✅ Converged
```

### Example 2: Normal (3 rounds, 35 min)
```
Round 1: 4 disagreements → Iterate
Round 2: 2 disagreements → Iterate
Round 3: ✅ Converged
```

### Example 3: Max Rounds (3 rounds, 40 min)
```
Round 1: 3 disagreements → Iterate
Round 2: 2 disagreements → Iterate
Round 3: 1 disagreement (strategic) → ⚠️ Max rounds
Note: Strategic differences are acceptable
```

---

## Output Files

**Same for both scripts!**

```
projects/MyProject/
├── 01_DIVERGENT_GENERATION/
│   ├── Gemini_Approaches.md
│   ├── Codex_Approaches.md
│   ├── Grok_Approaches.md
│   └── Claude_Approaches.md
├── 02_VALIDITY_CHECK/
│   ├── *_Critique.md
│   ├── Iteration_*.md (updated each round)
│   └── DISAGREEMENT_ANALYSIS.md
├── 03_PARALLEL_TESTING/
│   └── Approach*_ReadyToTest.md
├── 04_REFINEMENT/
│   └── SYSTEM_RUN_SUMMARY.md
└── ExecutiveSummary.md
```

---

## Documentation

📖 **README_ITERATION.md** - Full guide (when to use, FAQ)  
📖 **ITERATION_FLOW.md** - Visual flow diagrams  
📖 **MIGRATION_GUIDE_v5.2.1.md** - Upgrade guide  
📖 **CHANGELOG.md** - Version history

---

## FAQ

**Q: Do I need to migrate?**  
A: No, but recommended for new projects.

**Q: Which script is better?**  
A: Iterative for production, single-pass for testing.

**Q: What if LLMs never converge?**  
A: System proceeds after max rounds (strategic differences are OK).

**Q: Can I switch mid-project?**  
A: Yes, both work with existing project structures.

**Q: How do I know which I used?**  
A: Check `SYSTEM_RUN_SUMMARY.md` for iteration statistics.

---

## Version History

- **v5.2.0** (2025-11-20): Stage 4-6 workflow, consolidated Executive Summary
- **v5.2.1** (2025-11-21): Iterative convergence loop ← YOU ARE HERE

---

**System Version:** v5.2.1  
**Last Updated:** 2025-11-21  
**Credit:** User feedback identified the missing loop
