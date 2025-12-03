# Codex CLI Fix - Agentic vs Passive Model

## Problem Discovered
Codex CLI was not reading context from stdin like Gemini does, resulting in incomplete/generic outputs.

## Root Cause
**Codex is an agentic model** - fundamentally different from passive models:

| Model | Type | Context Handling |
|-------|------|------------------|
| **Gemini** | Passive | Reads full context from stdin via pipe |
| **Grok** | Passive | Reads full context from stdin via pipe |
| **Codex** | Agentic | Uses tools (cat, grep, ls) to read files from disk |
| **Claude** | Passive | Reads full context from stdin via pipe (when CLI works) |

## Testing Process

### Test 1: Simple Pipe Test
```bash
echo "CONTEXT: The capital of France is Paris. The population is 2.1 million." | \
codex exec --skip-git-repo-check "Based on the context above, what is the population of Paris?"
```
**Result:** Codex answered correctly BUT it was using its training data, not the piped content.

### Test 2: Nonsense Data Test
```bash
echo "CONTEXT: The city of Flarbenburg has a population of 7.3 million people..." | \
codex exec --skip-git-repo-check "What is the population of Flarbenburg?"
```
**Result:** Codex searched the file system using `rg` and reported "no data found" - **proving it ignored stdin**.

### Test 3: File Path Test
```bash
echo "Test context in a file" > /tmp/test_context.txt
codex exec --skip-git-repo-check "Read /tmp/test_context.txt and tell me what it says"
```
**Result:** ✅ **SUCCESS!** Codex used `cat` tool to read the file and correctly reported the content.

## Solution

### Before (BROKEN):
```bash
cat "$OUTPUT_DIR/shared_context.txt" | \
codex exec --skip-git-repo-check "Generate 1-3 unique property search strategies..." \
> "$OUTPUT_DIR/Codex_Approaches.md"
```
- Piped context is **ignored**
- Codex only sees the short prompt string
- Results in generic/incomplete output

### After (WORKING):
```bash
codex exec --skip-git-repo-check \
"Read the file at $OUTPUT_DIR/shared_context.txt and generate 1-3 unique property search strategies based on the requirements. Focus on detailed execution, technical precision, and niche opportunities. Output in the exact format specified in the file." \
> "$OUTPUT_DIR/Codex_Approaches.md"
```
- Codex uses its `cat` tool to read the context file
- Full 5500+ line context is processed
- Results in high-quality, context-aware output

## Files Updated

### 1. `orchestrate_independent.sh`
- Changed `CODEX_LIMIT_HIT` from `true` to `false`
- Updated `generate_codex()` to pass file path instead of piping stdin
- Removed manual generation fallback (no longer needed)

### 2. `orchestrate_crossvalidation.sh`
- Updated `critique_codex()` to pass file path: `$OUTPUT_DIR/critique_context.txt`

### 3. `orchestrate_technical_iteration.sh`
- Updated `iterate_codex()` to pass file path: `$VALIDITY_DIR/iteration_codex_prompt.txt`

### 4. `orchestrate_synthesis.sh`
- No Codex function (synthesis uses Claude only)

## Key Learnings

1. **Not all LLM CLIs work the same way**
   - Gemini/Grok/Claude: Passive models, read stdin
   - Codex: Agentic model, uses tools to access files

2. **Codex's design is intentional**
   - Designed to work with code repositories
   - Uses tools (cat, grep, ls, bash) to explore context
   - Better suited for "agent" workflows than "passive prompt" workflows

3. **File-based approach is superior for Codex**
   - Leverages Codex's strengths (tool use)
   - More reliable than trying to force stdin
   - Allows Codex to selectively read relevant sections (if needed)

4. **Testing is essential**
   - Don't assume all CLIs work the same
   - Use nonsense data to verify context is actually being read
   - Test with real file paths before deploying

## Impact

- ✅ Codex now receives full 5500+ line context
- ✅ Codex generates context-aware, detailed approaches
- ✅ No more generic/incomplete outputs
- ✅ System works correctly with 4 LLMs (Gemini, Codex, Grok, Claude)

---

**Date:** 2025-11-20  
**System Version:** v11.0  
**Fix Type:** Critical - Codex Agentic Model Handling

