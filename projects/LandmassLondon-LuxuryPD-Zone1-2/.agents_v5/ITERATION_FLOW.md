# Iterative Convergence Flow Diagram

## Visual Comparison: Single-Pass vs Iterative

### BEFORE (v5.2.0): Single-Pass - No Loop Back ❌

```
┌─────────────────────────────────────────────────────────────┐
│ Phase 0: Independent Generation                             │
│ (Gemini, Codex, Grok, Claude work independently)            │
└─────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│ Phase 1: Cross-Validation                                   │
│ • All 4 LLMs critique ALL approaches                        │
│ • Disagreement analysis runs                                │
└─────────────────────────────────────────────────────────────┘
                            ↓
                   ┌────────────────┐
                   │ Disagreements? │
                   └────────┬───────┘
                            │
              ┌─────────────┴─────────────┐
              │ YES                   NO  │
              ↓                           ↓
┌─────────────────────────┐    ┌──────────────────┐
│ Phase 1.5: Iteration    │    │ Skip Iteration   │
│ (ONE TIME ONLY)         │    │                  │
│ • LLMs update positions │    │                  │
│ • NO RE-VALIDATION ❌   │    │                  │
└─────────────────────────┘    └──────────────────┘
              │                           │
              └─────────────┬─────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────┐
│ Phase 2: Synthesis                                          │
│ • May still have unresolved disagreements ⚠️                │
└─────────────────────────────────────────────────────────────┘
```

**Problem:** After iteration updates positions, there's no check if LLMs actually converged!

---

### AFTER (v5.2.1): Iterative - Loops Until Convergence ✅

```
┌─────────────────────────────────────────────────────────────┐
│ Phase 0: Independent Generation                             │
│ (Gemini, Codex, Grok, Claude work independently)            │
└─────────────────────────────────────────────────────────────┘
                            ↓
        ╔═══════════════════════════════════════════╗
        ║   ITERATIVE LOOP (Max 3 rounds default)   ║
        ╚═══════════════════════════════════════════╝
                            ↓
┌─────────────────────────────────────────────────────────────┐
│ Phase 1: Cross-Validation (Round N)                         │
│ • All 4 LLMs critique ALL approaches                        │
│ • 🔹 NOW SEES: Iteration_*.md from prior rounds             │
│ • Disagreement analysis runs                                │
└─────────────────────────────────────────────────────────────┘
                            ↓
                   ┌────────────────┐
                   │ Disagreements? │
                   └────────┬───────┘
                            │
              ┌─────────────┴─────────────┐
              │ YES                   NO  │
              ↓                           ↓
    ┌──────────────────┐         ┌──────────────────┐
    │ Max rounds hit?  │         │ ✅ CONVERGED!    │
    └────────┬─────────┘         │ Exit loop        │
             │                   └──────────────────┘
       ┌─────┴─────┐                      │
       │YES    NO  │                      │
       ↓           ↓                      │
  ┌────────┐  ┌──────────────────┐       │
  │ ⚠️ Stop │  │ Phase 1.5:       │       │
  │ Proceed│  │ Iteration        │       │
  └────────┘  │ • Update positions│      │
       │      │ • Loop back ⤴️    │      │
       │      └──────────────────┘       │
       │               │                 │
       │               └─────────────────┘
       │                       ↓
       └───────────────────────┤
                               ↓
┌─────────────────────────────────────────────────────────────┐
│ Phase 2: Synthesis                                          │
│ • Uses latest converged positions ✅                        │
│ • Or proceeds with note if max rounds reached               │
└─────────────────────────────────────────────────────────────┘
```

**Solution:** System loops back to re-validate updated positions until convergence!

---

## Detailed Flow: What Happens Each Round

### Round 1

```
┌─ Cross-Validation ─────────────────────────────────────────┐
│ Context includes:                                          │
│ • 01_DIVERGENT_GENERATION/*.md (original approaches)       │
│ • Reference materials                                      │
│                                                            │
│ Output:                                                    │
│ • Gemini_Critique.md                                       │
│ • Codex_Critique.md                                        │
│ • Grok_Critique.md                                         │
│ • Claude_Critique.md                                       │
│ • DISAGREEMENT_ANALYSIS.md                                 │
│   → "DISAGREEMENTS_FOUND: YES"                             │
└────────────────────────────────────────────────────────────┘
                            ↓
┌─ Technical Iteration ──────────────────────────────────────┐
│ Each LLM reconsiders with full context                     │
│                                                            │
│ Output:                                                    │
│ • Iteration_Gemini.md                                      │
│ • Iteration_Codex.md                                       │
│ • Iteration_Grok.md                                        │
│ • Iteration_Claude.md                                      │
└────────────────────────────────────────────────────────────┘
                            ↓
                    [Loop back to Round 2]
```

---

### Round 2

```
┌─ Cross-Validation ─────────────────────────────────────────┐
│ Context NOW includes:                                      │
│ • 01_DIVERGENT_GENERATION/*.md (original)                  │
│ • 🔹 02_VALIDITY_CHECK/Iteration_*.md (UPDATED POSITIONS)  │
│ • Reference materials                                      │
│                                                            │
│ LLMs now validate the LATEST positions!                   │
│                                                            │
│ Output:                                                    │
│ • Updated critiques (overwrite previous)                   │
│ • DISAGREEMENT_ANALYSIS.md                                 │
│   → "DISAGREEMENTS_FOUND: NO" ✅                           │
└────────────────────────────────────────────────────────────┘
                            ↓
                    [Exit loop - converged!]
                            ↓
┌─ Synthesis ────────────────────────────────────────────────┐
│ Uses Iteration_*.md files (latest positions)               │
│ Extracts ready-to-test approaches                          │
└────────────────────────────────────────────────────────────┘
```

---

## Key Technical Changes

### 1. Cross-Validation Context Builder

**File:** `orchestrate_crossvalidation.sh`

```bash
# OLD: Only original approaches
for llm_file in "$GENERATION_DIR"/*.md; do
    cat "$llm_file" >> "$OUTPUT_DIR/critique_context.txt"
done

# NEW: Also includes updated positions
if ls "$OUTPUT_DIR"/Iteration_*.md >/dev/null 2>&1; then
    echo "## UPDATED POSITIONS (FROM PRIOR ITERATION)" >> ...
    for iteration_file in "$OUTPUT_DIR"/Iteration_*.md; do
        cat "$iteration_file" >> "$OUTPUT_DIR/critique_context.txt"
    done
fi
```

---

### 2. Iterative Wrapper Logic

**File:** `RUN_ALL_ITERATIVE_v5.sh`

```bash
ROUND=0
MAX_ROUNDS=3

while true; do
  ROUND=$((ROUND + 1))
  
  # Cross-validation (sees latest positions)
  orchestrate_crossvalidation.sh
  
  # Check convergence
  if ! grep -q "DISAGREEMENTS_FOUND: YES" ...; then
    echo "✅ Converged in $ROUND rounds"
    break
  fi
  
  # Check max rounds
  if [ "$ROUND" -ge "$MAX_ROUNDS" ]; then
    echo "⚠️ Max rounds reached"
    break
  fi
  
  # Iterate and loop back
  orchestrate_technical_iteration.sh
done

# Final synthesis
orchestrate_synthesis.sh
```

---

## Convergence Examples

### Example 1: Fast Convergence (2 rounds)

```
Round 1:
  Disagreement: "Applications filter behavior unclear"
  → Iteration updates positions

Round 2:
  ✅ No disagreements
  → Converged!

Total time: ~25 minutes
```

---

### Example 2: Slow Convergence (3 rounds)

```
Round 1:
  Disagreements: 3 technical issues
  → Iteration updates positions

Round 2:
  Disagreements: 1 remaining (GDV calculation)
  → Iteration updates positions

Round 3:
  ✅ No disagreements
  → Converged!

Total time: ~35 minutes
```

---

### Example 3: Max Rounds (Strategic Difference)

```
Round 1:
  Disagreements: 2 technical, 1 strategic
  → Iteration resolves 2 technical

Round 2:
  Disagreements: 1 strategic (risk tolerance)
  → Iteration: LLMs maintain positions

Round 3:
  Disagreements: 1 strategic (acceptable)
  → ⚠️ Max rounds reached
  → Proceed to synthesis with note

Total time: ~40 minutes
Note: Strategic differences are preserved (by design)
```

---

## File Lifecycle

### Before Iteration
```
02_VALIDITY_CHECK/
├── critique_context.txt
├── Gemini_Critique.md
├── Codex_Critique.md
├── Grok_Critique.md
├── Claude_Critique.md
└── DISAGREEMENT_ANALYSIS.md (DISAGREEMENTS_FOUND: YES)
```

### After Round 1 Iteration
```
02_VALIDITY_CHECK/
├── critique_context.txt
├── Gemini_Critique.md
├── Codex_Critique.md
├── Grok_Critique.md
├── Claude_Critique.md
├── DISAGREEMENT_ANALYSIS.md (DISAGREEMENTS_FOUND: YES)
├── Iteration_Gemini.md         ← NEW
├── Iteration_Codex.md          ← NEW
├── Iteration_Grok.md           ← NEW
└── Iteration_Claude.md         ← NEW
```

### After Round 2 Cross-Validation
```
02_VALIDITY_CHECK/
├── critique_context.txt (now includes Iteration_*.md)
├── Gemini_Critique.md (UPDATED - validates Iteration_*.md)
├── Codex_Critique.md (UPDATED)
├── Grok_Critique.md (UPDATED)
├── Claude_Critique.md (UPDATED)
├── DISAGREEMENT_ANALYSIS.md (UPDATED: DISAGREEMENTS_FOUND: NO)
├── Iteration_Gemini.md
├── Iteration_Codex.md
├── Iteration_Grok.md
└── Iteration_Claude.md
```

---

## Summary

| Feature | Single-Pass (v5.2.0) | Iterative (v5.2.1) |
|---------|---------------------|-------------------|
| **Loops back?** | ❌ No | ✅ Yes |
| **Sees updated positions?** | ❌ No | ✅ Yes |
| **Guarantees convergence?** | ❌ No | ✅ Yes (or max rounds) |
| **Runtime** | 15-25 min | 20-40 min |
| **Use case** | Quick testing | Production |
| **Script** | `RUN_ALL_v5.sh` | `RUN_ALL_ITERATIVE_v5.sh` |

---

**System Version:** v5.2.1  
**Last Updated:** 2025-11-21
