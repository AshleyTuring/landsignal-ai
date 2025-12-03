# Migration Guide: v5.2.0 → v5.2.1

## What Changed?

**v5.2.1 adds iterative convergence** - the system now loops cross-validation → iteration until LLMs converge on technical facts (or max rounds reached).

---

## Do I Need to Migrate?

**Short answer: No, but you should.**

- **Existing projects:** Continue working with both old and new scripts
- **Backward compatibility:** 100% - no breaking changes
- **Recommended action:** Switch to `RUN_ALL_ITERATIVE_v5.sh` for new projects

---

## Changes Summary

### 1. New Script: `RUN_ALL_ITERATIVE_v5.sh`

**What it does:**
- Loops cross-validation → iteration until convergence
- Default: 3 rounds maximum
- Configurable: `./RUN_ALL_ITERATIVE_v5.sh 5`

**Why use it:**
- Guarantees convergence on technical facts
- Eliminates unresolved disagreements
- Higher quality output

---

### 2. Updated Script: `orchestrate_crossvalidation.sh`

**What changed:**
- Now looks for `Iteration_*.md` files from prior rounds
- Includes updated positions in critique context
- LLMs validate latest positions, not just original approaches

**Impact:**
- Enables iterative convergence
- No impact on single-pass usage

---

### 3. Updated Script: `RUN_ALL_v5.sh`

**What changed:**
- Header updated to clarify it's the "single-pass" version
- Functionality unchanged

**Impact:**
- None - works exactly as before

---

## Migration Steps

### For New Projects

**Before (v5.2.0):**
```bash
cd projects/MyProject/.agents_v5
./RUN_ALL_v5.sh
```

**After (v5.2.1):**
```bash
cd projects/MyProject/.agents_v5
./RUN_ALL_ITERATIVE_v5.sh  # Recommended
```

---

### For Existing Projects

**Option A: No changes needed**
```bash
# Continue using single-pass
./RUN_ALL_v5.sh
```

**Option B: Upgrade to iterative**
```bash
# Switch to iterative for better convergence
./RUN_ALL_ITERATIVE_v5.sh
```

**Both work with existing project structures!**

---

## Script Comparison

| Feature | `RUN_ALL_v5.sh` | `RUN_ALL_ITERATIVE_v5.sh` |
|---------|-----------------|---------------------------|
| **Phases** | 0 → 1 → 1.5 → 2 | 0 → [1 → 1.5]ₙ → 2 |
| **Loops?** | No | Yes (until convergence) |
| **Max iterations** | 1 | 3 (configurable) |
| **Runtime** | 15-25 min | 20-40 min |
| **Convergence guarantee** | No | Yes (or max rounds) |
| **Use case** | Quick testing | Production |
| **Output format** | Same | Same |
| **Backward compatible** | N/A | ✅ Yes |

---

## File Structure Changes

**No changes to project directory structure!**

```
projects/MyProject/
├── 00_REQUIREMENTS/
├── 01_DIVERGENT_GENERATION/
├── 02_VALIDITY_CHECK/
│   ├── *_Critique.md
│   ├── DISAGREEMENT_ANALYSIS.md
│   └── Iteration_*.md (may have multiple rounds now)
├── 03_PARALLEL_TESTING/
├── 04_REFINEMENT/
├── 05_SITE_VALIDATION/
├── 06_DEEP_RESEARCH/
└── .agents_v5/
```

**Only difference:** `Iteration_*.md` files may be updated multiple times (one per round)

---

## Testing the Migration

### Step 1: Verify Scripts Exist

```bash
cd templates/.agents_v5
ls -lh RUN_ALL*.sh
```

**Expected output:**
```
RUN_ALL_ITERATIVE_v5.sh  (new)
RUN_ALL_v5.sh            (updated header)
```

---

### Step 2: Test Single-Pass (Unchanged)

```bash
cd projects/TestProject/.agents_v5
./RUN_ALL_v5.sh
```

**Expected:** Works exactly as before (15-25 min)

---

### Step 3: Test Iterative (New)

```bash
cd projects/TestProject/.agents_v5
./RUN_ALL_ITERATIVE_v5.sh
```

**Expected:**
- Loops until convergence or max rounds
- Prints round numbers: "🔁 Iteration Round 1 of 3"
- Final statistics: "Total iteration rounds: X"

---

## FAQ

**Q: Do I need to update existing projects?**  
A: No. Both scripts work with existing project structures.

**Q: Can I switch between scripts?**  
A: Yes. Use iterative for production, single-pass for quick testing.

**Q: What if I'm mid-project?**  
A: Complete current phase with old script, switch to iterative for next project.

**Q: Does this change the output format?**  
A: No. Both scripts produce identical file structures and formats.

**Q: What if I have custom scripts?**  
A: No impact. Your custom scripts continue working as before.

**Q: How do I know which script I used?**  
A: Check `SYSTEM_RUN_SUMMARY.md` - it will show iteration rounds if iterative was used.

---

## Rollback (If Needed)

**If you encounter issues:**

1. **Use single-pass version:**
   ```bash
   ./RUN_ALL_v5.sh
   ```

2. **Report issue with:**
   - Script used
   - Round number where issue occurred
   - Contents of `02_VALIDITY_CHECK/DISAGREEMENT_ANALYSIS.md`

---

## Benefits of Upgrading

### Before (v5.2.0)
```
Round 1:
  Cross-Validation → 3 disagreements
  Technical Iteration → Updates positions
  ❌ No re-validation
  Synthesis → May still have unresolved issues
```

### After (v5.2.1)
```
Round 1:
  Cross-Validation → 3 disagreements
  Technical Iteration → Updates positions

Round 2:
  Cross-Validation → 1 disagreement (validates updated positions)
  Technical Iteration → Updates positions

Round 3:
  Cross-Validation → ✅ No disagreements
  Synthesis → Fully converged positions
```

**Result:** Higher quality, validated convergence

---

## Timeline

- **v5.2.0** (2025-11-20): Stage 4-6 workflow, consolidated Executive Summary
- **v5.2.1** (2025-11-21): Iterative convergence loop

---

## Support

**Documentation:**
- `README_ITERATION.md` - Detailed iteration guide
- `ITERATION_FLOW.md` - Visual flow diagrams
- `CHANGELOG.md` - Full version history

**Scripts:**
- `RUN_ALL_ITERATIVE_v5.sh` - New iterative version
- `RUN_ALL_v5.sh` - Original single-pass version

---

**Migration Status:** ✅ Complete - No breaking changes  
**Backward Compatibility:** ✅ 100%  
**Recommended Action:** Switch to `RUN_ALL_ITERATIVE_v5.sh` for new projects
