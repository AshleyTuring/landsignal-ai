# System Notes - v6 with Rate Limit Handling

**Date:** 2025-11-20  
**Project:** MixedUse-8Storey-2M-v6  
**System Version:** 5.0 (with rate limit flags)

---

## What's New in v6

### Rate Limit Flag System

All orchestration scripts now have **rate limit flags** at the top that control whether to call the CLI or use manual generation:

```bash
# Rate limit flags (set to true if CLI unavailable)
CLAUDE_LIMIT_HIT=true   # Session limit until 3pm
GROK_LIMIT_HIT=false
CODEX_LIMIT_HIT=false
GEMINI_LIMIT_HIT=false
```

### How It Works

Instead of calling a CLI and getting an error, the scripts check the flag:

**Before (v5):**
```bash
critique_claude() {
    cat "$OUTPUT_DIR/critique_context.txt" | claude ...  # Would fail with session limit
}
```

**After (v6):**
```bash
critique_claude() {
    if [ "$CLAUDE_LIMIT_HIT" = true ]; then
        # Claude assistant generates directly (manual)
        # File should already exist from manual generation
    else
        # Call Claude CLI normally
        cat "$OUTPUT_DIR/critique_context.txt" | claude ...
    fi
}
```

### Benefits

1. **Clean separation:** Flag controls behavior, not file checks
2. **Easy to toggle:** Just change `true`/`false` at top of script
3. **Works for any LLM:** Can handle Gemini, Codex, Grok, or Claude rate limits
4. **Manual generation supported:** Scripts expect files to exist when flag is `true`

---

## Current Status

### Phase 0: Independent Generation
- **Gemini:** ✅ CLI working (96 lines generated)
- **Codex:** ✅ CLI fixed (`codex exec --skip-git-repo-check`)
- **Grok:** ✅ CLI fixed (`opencode run -m opencode/grok-code`)
- **Claude:** ⚠️ Rate limit (`CLAUDE_LIMIT_HIT=true`)

### What's Needed

Since `CLAUDE_LIMIT_HIT=true`, I (Claude assistant) need to generate:

1. **Phase 0:** `01_DIVERGENT_GENERATION/Claude_Approaches.md` (DONE)
2. **Phase 1:** `02_VALIDITY_CHECK/Claude_Critique.md` (AFTER Gemini/Codex/Grok critiques complete)
3. **Phase 1:** `02_VALIDITY_CHECK/DISAGREEMENT_ANALYSIS.md` (AFTER all critiques)
4. **Phase 1.5:** `02_VALIDITY_CHECK/Iteration_Claude.md` (IF disagreements detected)
5. **Phase 2:** `02_VALIDITY_CHECK/SYNTHESIS_OUTPUT.md` (Final synthesis)

---

## How to Run v6

### Step 1: Check Rate Limit Flags

Before running, check which LLMs are available:

```bash
# In each orchestration script, check the flags:
CLAUDE_LIMIT_HIT=true   # Set to false after 3pm when session resets
GROK_LIMIT_HIT=false    # Check if Grok CLI working
CODEX_LIMIT_HIT=false   # Check if Codex CLI working
GEMINI_LIMIT_HIT=false  # Check if Gemini CLI working
```

### Step 2: Pre-generate Claude Content (If Needed)

If `CLAUDE_LIMIT_HIT=true`, Claude assistant should generate files BEFORE running scripts.

For Phase 0:
- Already done: `Claude_Approaches.md` (3 approaches: C, D, E)

For Phase 1 (after other LLMs critique):
- Wait for: Gemini, Codex, Grok critiques to complete
- Then generate: `Claude_Critique.md`
- Then generate: `DISAGREEMENT_ANALYSIS.md`

### Step 3: Run Orchestration

```bash
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v6/.agents

# Phase 0: Independent Generation
./orchestrate_independent.sh

# Phase 1: Cross-Validation
./orchestrate_crossvalidation.sh

# Phase 1.5: Technical Iteration (if needed)
./orchestrate_technical_iteration.sh

# Phase 2: Synthesis
./orchestrate_synthesis.sh
```

### Step 4: Extract Results

After Phase 2, manually extract:
- `FINAL_ValidationMatrix.md` from synthesis output
- `03_PARALLEL_TESTING/ApproachX_ReadyToTest.md` for each valid approach

---

## Files Generated

### Phase 0 Output (01_DIVERGENT_GENERATION/)
- ✅ `Gemini_Approaches.md` (2 approaches: A, B)
- ⏳ `Codex_Approaches.md` (pending - will run when script executes)
- ⏳ `Grok_Approaches.md` (pending - will run when script executes)
- ✅ `Claude_Approaches.md` (3 approaches: C, D, E - manually generated)

### Phase 1 Output (02_VALIDITY_CHECK/)
- ⏳ `Gemini_Critique.md`
- ⏳ `Codex_Critique.md`
- ⏳ `Grok_Critique.md`
- ⏳ `Claude_Critique.md` (manual generation after others complete)
- ⏳ `DISAGREEMENT_ANALYSIS.md` (manual generation)

### Phase 1.5 Output (02_VALIDITY_CHECK/ - if needed)
- ⏳ `Iteration_Gemini.md`
- ⏳ `Iteration_Codex.md`
- ⏳ `Iteration_Grok.md`
- ⏳ `Iteration_Claude.md` (manual generation)

### Phase 2 Output
- ⏳ `SYNTHESIS_OUTPUT.md` (manual generation)
- ⏳ `FINAL_ValidationMatrix.md` (extracted from synthesis)
- ⏳ `03_PARALLEL_TESTING/ApproachX_ReadyToTest.md` (extracted)

---

## After 3pm (Session Reset)

Once Claude CLI session resets:

1. **Update flags in all scripts:**
   ```bash
   CLAUDE_LIMIT_HIT=false   # Changed from true
   ```

2. **Test Claude CLI:**
   ```bash
   echo "test" | claude -p "respond with 'working'"
   ```

3. **Future projects will run fully automated:**
   - All 4 LLMs in parallel (Phase 0)
   - All 4 LLMs in parallel (Phase 1)
   - Automatic disagreement detection
   - Automatic synthesis

---

## Comparison: v5 vs v6

| Feature | v5 | v6 |
|---------|----|----|
| **Rate Limit Handling** | File checks, error prone | Boolean flags, clean |
| **Manual Generation** | Unclear when needed | Explicit flag system |
| **Scalability** | Hard to add LLMs | Easy (just add flag) |
| **Error Messages** | Confusing (file vs CLI) | Clear (flag controls) |
| **Maintainability** | Low | High |

---

## Next Steps

1. **Immediate:** Run `orchestrate_independent.sh` (Gemini, Codex, Grok will generate)
2. **After Phase 0:** Generate Claude critique manually
3. **After all critiques:** Generate disagreement analysis manually
4. **After Phase 1:** Generate synthesis manually (if needed)
5. **Extract:** Create testing files from synthesis

**Or wait until 3pm and set `CLAUDE_LIMIT_HIT=false` for fully automated run.**

---

**Status:** Ready to execute Phase 0  
**Claude Content:** Pre-generated (3 approaches)  
**Next:** Run `orchestrate_independent.sh` to get Gemini, Codex, Grok approaches

