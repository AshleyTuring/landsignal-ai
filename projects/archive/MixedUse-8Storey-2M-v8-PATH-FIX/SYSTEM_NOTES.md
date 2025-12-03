# System Notes - v8.0

## Boolean Rate Limit Flags

Each orchestration script has boolean flags at the top to handle LLM CLI rate limits or unavailability.

### How It Works

1. **Flag Declaration (Top of Script)**
```bash
# Rate limit flags
CLAUDE_LIMIT_HIT=true    # Set to true if Claude CLI is rate-limited
GROK_LIMIT_HIT=false     # Set to true if Grok CLI is rate-limited
CODEX_LIMIT_HIT=false    # Set to true if Codex CLI is rate-limited
GEMINI_LIMIT_HIT=false   # Set to true if Gemini CLI is rate-limited
```

2. **Conditional Logic (In Generation Functions)**
```bash
generate_claude() {
    if [ "$CLAUDE_LIMIT_HIT" = true ]; then
        # Manual generation path
        echo "⏸️  MANUAL GENERATION REQUIRED"
        # Create context file
        # Pause for user
        # Verify generated file
    else
        # Normal CLI path
        cat context.txt | claude -p "..." > output.md
    fi
}
```

3. **Pause Mechanism**
When a limit is hit, the script:
- ✅ Creates a context file with ALL required information
- ✅ Prints clear instructions for manual generation
- ✅ Pauses and waits for user confirmation
- ✅ Verifies the generated file exists and is not empty
- ✅ Checks for placeholder content
- ✅ Only proceeds after successful verification

### Current Status (v8.0)

| LLM | CLI Status | Flag Setting | Generation Method |
|-----|------------|--------------|-------------------|
| Gemini | ✅ Working | `false` | CLI (`gemini -p`) |
| Codex | ✅ Working | `false` | CLI (`codex exec --skip-git-repo-check`) |
| Grok | ✅ Working | `false` | CLI (`opencode run -m opencode/grok-code`) |
| Claude | ⏸️ Rate Limited | `true` | Manual (Assistant) |

### When to Change Flags

**Set to `true` when:**
- CLI returns rate limit errors
- CLI authentication fails
- CLI is not installed/configured
- Session limits are reached

**Set to `false` when:**
- CLI is working again
- Rate limits have reset
- Authentication is renewed

### Scripts Affected

All 4 orchestration scripts use this pattern:

1. **`orchestrate_independent.sh` (Phase 0)**
   - `generate_gemini()`
   - `generate_codex()`
   - `generate_grok()`
   - `generate_claude()`

2. **`orchestrate_crossvalidation.sh` (Phase 1)**
   - `critique_gemini()`
   - `critique_codex()`
   - `critique_grok()`
   - `critique_claude()` (if needed)
   - Disagreement analysis (uses Claude)

3. **`orchestrate_technical_iteration.sh` (Phase 1.5)**
   - `iterate_gemini()`
   - `iterate_codex()`
   - `iterate_grok()`
   - `iterate_claude()` (if needed)

4. **`orchestrate_synthesis.sh` (Phase 2)**
   - Synthesis (uses Claude only)

## Full Context Inclusion (v8.0 Fix)

### The Problem (v4-v7)
Previous versions used file path references in prompts:
```bash
echo "Use FILTER_PATTERNS.md for strategies" >> context.txt
head -300 "$PROJECT_DIR/../SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" >> context.txt
```

**Result:** LLMs saw file paths but couldn't read them → empty/placeholder outputs

### The Solution (v8.0)
Now we include FULL file contents (like `run_filter_patterns_review.sh` does):
```bash
cat "$PROJECT_DIR/../FILTER_PATTERNS.md" >> context.txt
cat "$PROJECT_DIR/../LEARNINGS_DATABASE.md" >> context.txt
cat "$PROJECT_DIR/../SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" >> context.txt
cat "$PROJECT_DIR/../SearchlandContext/PresetFiltersBuiltIntoSearchLand.md" >> context.txt
cat "$PROJECT_DIR/../PRESET_STRATEGY_GUIDE.md" >> context.txt
```

**Result:** LLMs receive complete context (~10K+ lines) and can generate quality outputs

### Context Sizes (Approximate)

| File | Lines | Purpose |
|------|-------|---------|
| FILTER_PATTERNS.md | ~2000 | 23 strategic patterns (v2.1) |
| LEARNINGS_DATABASE.md | ~400 | 20+ motivation signals, syntax rules |
| AvailableFiltersInSearchLand_ACTUAL.md | ~3000 | Complete filter list with operators |
| PresetFiltersBuiltIntoSearchLand.md | ~800 | 86 expert preset examples |
| PRESET_STRATEGY_GUIDE.md | ~500 | Comprehensive strategy guide |
| **Total Context** | **~6700+** | Plus project requirements |

This large context is necessary for LLMs to:
- Know which filters actually exist
- Understand correct syntax and units
- Reference proven strategies
- Avoid known pitfalls
- Generate technically valid approaches

## Manual Generation Process

When Claude CLI is rate-limited (`CLAUDE_LIMIT_HIT=true`):

### Step 1: Script Pauses
```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
⏸️  MANUAL GENERATION REQUIRED
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Claude assistant needs to generate:
  → /path/to/output/Claude_Approaches.md

Context available at:
  → /path/to/context/shared_context.txt

Press Enter AFTER Claude has generated the file...
```

### Step 2: Assistant Reads Context
- Assistant reads the `*_context.txt` file
- Context includes ALL reference materials and instructions
- Assistant generates the requested output

### Step 3: Assistant Writes File
- Assistant creates the output file (e.g., `Claude_Approaches.md`)
- Follows the format specified in the context
- Includes all required sections

### Step 4: User Confirms
- User presses Enter to continue
- Script verifies file exists and is not empty
- Script checks for placeholder content
- If valid, script proceeds to next phase

### Step 5: Script Continues
- Other LLMs continue via CLI in parallel
- System completes normally
- All outputs are integrated in synthesis

## Version History

| Version | Key Feature | Status |
|---------|-------------|--------|
| **v8.0** | Full context inclusion fix | ✅ Current |
| v7.0 | Context fix attempt | ⚠️ Archived (CONTEXT-FIX) |
| v6.0 | Pause mechanism added | ⚠️ Archived |
| v5.0 | Real CLI implementation | ⚠️ Archived (PARTIAL) |
| v4.0 | Collaborative exploration | ⚠️ Archived (ECHO CHAMBER) |
| v3.2 | Systematic angle exploration | ⚠️ Archived |
| v3.1 | Technical iteration added | ⚠️ Archived |
| v3.0 | Divergent hypothesis testing | ⚠️ Archived |
| v2.x | Convergent refinement | ⚠️ Archived |
| v1.0 | Initial single approach | ⚠️ Archived (0 results) |

## Critical Learnings

### What Works
- ✅ Full file contents via `cat` (not `head` or file paths)
- ✅ Independent generation (not collaborative prompts)
- ✅ Technical validation only (not strategic preferences)
- ✅ Pause mechanism for manual generation
- ✅ Boolean flags for graceful rate limit handling
- ✅ Real CLI calls (not Claude simulating other LLMs)

### What Doesn't Work
- ❌ File path references in prompts
- ❌ Partial file contents (`head -N`)
- ❌ Forced collaboration ("you are working together")
- ❌ Forced divergence (artificial personas)
- ❌ Strategic consensus (let data decide)
- ❌ Simulating LLMs (echo chamber effect)

---

**Last Updated:** 2025-11-20  
**System Version:** v8.0  
**Status:** Production Ready

