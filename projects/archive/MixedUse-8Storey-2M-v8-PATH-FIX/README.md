# MixedUse-8Storey-2M Project (v8.0)

## System Version
**v8.0** - Independent Generation with Full Context Inclusion

## Project Goal
Find properties in the UK suitable for an 8-storey mixed-use development (retail + residential) with:
- **Target Profit:** £2,000,000
- **Capital Outlay:** £200,000
- **Reference:** Approved planning application (8-storey mixed-use, flexible retail Class E + residential Class C3)

## System Architecture

### Phase 0: Independent Generation
- **4 LLMs work independently:** Gemini, Codex, Grok, Claude
- Each generates 1-3 unique property search strategies
- **Full context provided:** All reference materials (FILTER_PATTERNS, LEARNINGS_DATABASE, available filters) included in prompt
- No collaboration, no forced divergence, no shared knowledge between agents

### Phase 1: Cross-Validation (Technical Critique)
- Each LLM reviews ALL approaches for **technical validity only**
- Checks: Filter existence, unit correctness, syntax validity, capital feasibility
- Does NOT check: Strategic preference, priority rankings, implementation style

### Phase 1.5: Technical Iteration (If Needed)
- Triggered if disagreements detected (e.g., 2 say VALID, 1 says INVALID)
- LLMs reconsider positions based on evidence
- Focuses on factual correctness, not strategic consensus

### Phase 2: Synthesis & Extraction
- Claude synthesizes all approaches and critiques
- Creates validation matrix
- Extracts ready-to-test approaches (VALID or CONDITIONAL)
- Generates copy-paste ready SearchLand AI prompts

## Critical Fix in v8.0

**Issue:** Previous versions (v4-v7) used file path references in prompts, causing LLMs to return empty/placeholder outputs because they couldn't read local files.

**Fix:** All orchestration scripts now use `cat` to include FULL file contents:
- ✅ `FILTER_PATTERNS.md` (23 patterns, v2.1, ~2000 lines)
- ✅ `LEARNINGS_DATABASE.md` (20+ motivation signals)
- ✅ `AvailableFiltersInSearchLand_ACTUAL.md` (complete filter list)
- ✅ `PresetFiltersBuiltIntoSearchLand.md` (86 expert presets)
- ✅ `PRESET_STRATEGY_GUIDE.md` (comprehensive guide)

This mirrors the proven pattern from `run_filter_patterns_review.sh` which successfully generated quality output from all LLMs.

## Key Differences from Previous Versions

### v7.0 (archived - CONTEXT-FIX)
- ❌ Partial context inclusion (used `head -300`, file paths)
- ❌ LLMs couldn't access reference materials
- ❌ Resulted in empty/placeholder outputs

### v6.0 (archived)
- ✅ Boolean rate limit flags implemented
- ✅ Pause mechanism for manual generation
- ❌ Still had context inclusion issues

### v5.0 (archived - PARTIAL)
- ✅ Real LLM CLIs (not simulated)
- ✅ Independent generation model
- ❌ Codex/Grok/Claude failed due to rate limits

### v4.0 (archived - ECHO CHAMBER)
- ❌ Used `claude` CLI for all agents (simulation)
- ❌ Not truly multi-agent

### v3.0-v3.2 (archived)
- ✅ First divergent generation attempts
- ❌ Forced collaboration or forced divergence
- ❌ Overly prescriptive prompts

## How to Run

### Quick Start
```bash
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v8/.agents
./RUN_ALL_v5.sh
```

### Manual Step-by-Step
```bash
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v8/.agents

# Phase 0: Independent Generation (4 LLMs in parallel)
./orchestrate_independent.sh

# Phase 1: Cross-Validation (Technical critique)
./orchestrate_crossvalidation.sh

# Phase 1.5: Technical Iteration (If disagreements found)
./orchestrate_technical_iteration.sh

# Phase 2: Synthesis & Extraction
./orchestrate_synthesis.sh
```

## Rate Limit Handling

If Claude CLI is rate-limited, the script will:
1. Create a context file for manual generation
2. Pause with clear instructions
3. Wait for user confirmation
4. Verify generated content before proceeding

**Current Flags:**
- `CLAUDE_LIMIT_HIT=true` (assistant generates directly)
- `GROK_LIMIT_HIT=false` (CLI works)
- `CODEX_LIMIT_HIT=false` (CLI works)
- `GEMINI_LIMIT_HIT=false` (CLI works)

See `SYSTEM_NOTES.md` for details.

## Expected Outputs

### Phase 0
- `Gemini_Approaches.md` - 1-3 unique strategies
- `Codex_Approaches.md` - 1-3 unique strategies
- `Grok_Approaches.md` - 1-3 unique strategies
- `Claude_Approaches.md` - 1-3 unique strategies
- Total: 4-12 diverse approaches

### Phase 1
- `Gemini_Critique.md` - Technical validation
- `Codex_Critique.md` - Technical validation
- `Grok_Critique.md` - Technical validation
- `Claude_Critique.md` - Technical validation (if needed)

### Phase 1.5 (If triggered)
- `DISAGREEMENT_ANALYSIS.md` - Identified conflicts
- `Iteration_Gemini.md` - Reconsidered positions
- `Iteration_Codex.md` - Reconsidered positions
- `Iteration_Grok.md` - Reconsidered positions
- `Iteration_Claude.md` - Reconsidered positions (if needed)

### Phase 2
- `SYNTHESIS_OUTPUT.md` - Comprehensive analysis
- `FINAL_ValidationMatrix.md` - Status of all approaches
- `ApproachX_ReadyToTest.md` - Copy-paste ready filters (one per valid approach)

## Next Steps After System Run

1. Review `FINAL_ValidationMatrix.md` for approach statuses
2. Copy SearchLand AI prompts from `ApproachX_ReadyToTest.md` files
3. Test in SearchLand.co.uk
4. Document results in `03_PARALLEL_TESTING/`
5. Update `LEARNINGS_DATABASE.md` with universal insights
6. Proceed to `04_REFINEMENT/` if needed

## System Philosophy

### Design Principles
1. **Independence:** LLMs work independently, not collaboratively
2. **Diversity:** Natural convergence or divergence, not forced
3. **Technical Rigor:** Validate facts, not preferences
4. **Empirical Testing:** Let SearchLand results decide winners
5. **Learning Capture:** Store universal insights, not project-specific results

### What Makes v8.0 Different
- ✅ **Complete Context:** LLMs receive ALL reference materials inline
- ✅ **Proven Pattern:** Uses same approach as successful `run_filter_patterns_review.sh`
- ✅ **Scalable:** Works with any number of LLMs (tested with 4)
- ✅ **Robust:** Handles rate limits gracefully with pause mechanism
- ✅ **Transparent:** Clear prompts, no hidden file dependencies

---

**Project Created:** 2025-11-20  
**System Version:** v8.0  
**Status:** Ready to Run

**Critical Fix:** Full context inclusion (see `CRITICAL_FIX_v7.md` in root)

