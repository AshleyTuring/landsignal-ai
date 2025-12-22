# File Organization System v5.2.2

## Problem Statement

**Issues Identified (2025-11-21 by User):**
1. **Files get overwritten** - Round 2 overwrites Round 1 iterations/critiques
2. **Naming inconsistency** - `Codex_Critique.md` makes files unsorted by round
3. **No subfolder organization** - Everything dumped flat in `02_VALIDITY_CHECK/`
4. **Prompt files unclear** - `.txt` files not explained
5. **Gemini saw "Unreviewed Iterations"** - Round 2 couldn't find Round 1 files

## Root Cause

Current system:
- Overwrites `Iteration_Gemini.md` → `Iteration_Gemini.md` (no Round tracking)
- Names as `LLM_Type.md` instead of `Round_LLM_Type.md`
- Flat directory structure makes it hard to find specific round outputs

## Solution: Structured Folder System

### New Directory Structure

```
02_VALIDITY_CHECK/
├── Round1/
│   ├── Critiques/
│   │   ├── Critique_Gemini.md
│   │   ├── Critique_Codex.md
│   │   ├── Critique_Grok.md
│   │   ├── Critique_Claude.md
│   │   └── DISAGREEMENT_ANALYSIS.md
│   ├── Iterations/  (only if needed)
│   │   ├── Iteration_Gemini.md
│   │   ├── Iteration_Codex.md
│   │   ├── Iteration_Grok.md
│   │   └── Iteration_Claude.md
│   └── _prompts/
│       ├── critique_context.txt
│       ├── disagreement_check_prompt.txt
│       ├── iteration_context.txt  (if iterations ran)
│       └── iteration_[llm]_prompt.txt (full context sent to each LLM)
├── Round2/
│   └── ... (same structure)
├── Round3/
│   └── ...
├── ValidationMatrix.md  (final summary)
└── RejectedApproaches.md  (final rejected list)
```

### Benefits

1. **No file overwriting** - Each round has its own folder
2. **Chronological clarity** - Easy to see progression across rounds
3. **Organized prompts** - `_prompts/` subfolder keeps context files separate
4. **Cross-round reference** - orchestrate_crossvalidation.sh can read ALL previous rounds
5. **Clean workspace** - Top-level only has final summary files

### File Naming Conventions

| Type | Pattern | Example |
|------|---------|---------|
| Critique | `Critique_[LLM].md` | `Critique_Gemini.md` |
| Iteration | `Iteration_[LLM].md` | `Iteration_Codex.md` |
| Disagreement | `DISAGREEMENT_ANALYSIS.md` | (same) |
| Context (prompts) | `[phase]_[llm]_prompt.txt` | `iteration_gemini_prompt.txt` |
| Context (shared) | `[phase]_context.txt` | `critique_context.txt` |

**Rationale:**
- Type-first naming (`Critique_`, `Iteration_`) groups files by purpose
- Round folders eliminate need for `Round1_Critique_Gemini.md` (redundant)
- Underscores for consistency

### What Are `.txt` Prompt Files?

**Purpose:** These are the FULL context sent to each LLM CLI

**Types:**

1. **`critique_context.txt`** - Shared context for all critiques
   - Contains: All approaches, reference materials, validation instructions
   
2. **`disagreement_check_prompt.txt`** - Full context for disagreement analysis
   - Contains: All 4 critiques, analysis instructions
   
3. **`iteration_context.txt`** - Shared base for iteration prompts
   - Contains: Disagreement analysis, iteration instructions
   
4. **`iteration_[llm]_prompt.txt`** - LLM-specific iteration context
   - Contains: `iteration_context.txt` + that LLM's original critique

**Why keep them?**
- **Debugging** - See exactly what was sent to each LLM
- **Reproducibility** - Re-run with same context if needed
- **Audit trail** - Verify LLMs received correct information

## Implementation

### Changes to Scripts

**1. `RUN_ALL_ITERATIVE_v5.sh`**
- Export `ITERATION_ROUND` variable before calling child scripts

**2. `orchestrate_crossvalidation.sh`**
- Read `ITERATION_ROUND` variable (default 1)
- Create `02_VALIDITY_CHECK/Round${ITERATION_ROUND}/` folders
- Save critiques to `Round${ITERATION_ROUND}/Critiques/`
- Save prompts to `Round${ITERATION_ROUND}/_prompts/`
- **Cross-round reference:** Append ALL previous `Round*/Iterations/*.md` files to critique context

**3. `orchestrate_technical_iteration.sh`**
- Read `ITERATION_ROUND` variable
- Save iterations to `Round${ITERATION_ROUND}/Iterations/`
- Save prompts to `Round${ITERATION_ROUND}/_prompts/`

**4. `orchestrate_synthesis.sh`**
- Read from ALL `Round*/Critiques/*.md` and `Round*/Iterations/*.md`
- No changes to output (still creates in `02_VALIDITY_CHECK/`)

### Backward Compatibility

**For existing projects (flat structure):**
- Scripts check if `Round1/` exists
- If NO, fall back to flat structure (don't break existing projects)
- If YES, use new structure

**Migration:**
- Manual migration recommended for active projects
- Or: Archive old project, start fresh with v5.2.2

## Examples

### Example 1: No Disagreements (Single Round)

```
02_VALIDITY_CHECK/
├── Round1/
│   ├── Critiques/
│   │   ├── Critique_Gemini.md
│   │   ├── Critique_Codex.md
│   │   ├── Critique_Grok.md
│   │   ├── Critique_Claude.md
│   │   └── DISAGREEMENT_ANALYSIS.md  (says "NO")
│   └── _prompts/
│       ├── critique_context.txt
│       └── disagreement_check_prompt.txt
├── ValidationMatrix.md
└── RejectedApproaches.md
```

**Result:** No `Iterations/` folder created (not needed)

### Example 2: Multiple Rounds Until Convergence

```
02_VALIDITY_CHECK/
├── Round1/
│   ├── Critiques/
│   │   └── ... (4 critiques + disagreement analysis)
│   ├── Iterations/
│   │   └── ... (4 updated positions)
│   └── _prompts/
│       └── ... (critique + iteration contexts)
├── Round2/
│   ├── Critiques/
│   │   └── ... (re-validation with Round1 iterations included)
│   ├── Iterations/
│   │   └── ... (further updates)
│   └── _prompts/
│       └── ...
├── Round3/
│   ├── Critiques/
│   │   └── ... (final validation, no disagreements)
│   └── _prompts/
│       └── ... (no iterations needed)
├── ValidationMatrix.md
└── RejectedApproaches.md
```

**Flow:**
1. Round1: Critiques → Disagreements found → Iterations
2. Round2: Critiques (sees Round1 iterations) → Still disagreements → Iterations
3. Round3: Critiques (sees Round1+2 iterations) → No disagreements → STOP

## Testing Plan

1. Archive `MixedUse-8Storey-2M-v19`
2. Create `v20` with updated scripts
3. Run `RUN_ALL_ITERATIVE_v5.sh`
4. Verify folder structure created correctly
5. Verify cross-round references work (Round 2 sees Round 1 iterations)

## Version History

- **v5.2.2** (2025-11-21) - Structured folder organization
  - Issue: Files overwritten, naming inconsistent, flat structure
  - Solution: Round-based folders, consistent naming, _prompts subfolder
  - Contributor: ashsubband (identified issues)

---

**Status:** Ready for implementation
**Next Steps:** Update orchestration scripts, test with v20

