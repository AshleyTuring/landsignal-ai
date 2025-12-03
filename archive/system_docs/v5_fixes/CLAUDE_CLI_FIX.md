# Claude CLI Output Fix - v5.1

## Problem Discovered

Claude CLI was generating 30-60 line summaries instead of full 150-300 line detailed approaches with SearchLand filter prompts.

## Root Cause

Claude Code (CLI version) has a built-in system prompt instruction:
```
"Your output will be displayed on a command line interface. Your responses should be short and concise."
```

This instruction was **overriding user prompts**, causing Claude to summarize instead of providing full detailed output.

## Solution

Use `--system-prompt` flag to **replace** the default system prompt entirely:

```bash
claude --system-prompt "You are an expert property development analyst. Always provide full, detailed, comprehensive responses. Follow the prompt instructions exactly. Include all requested sections and details." -p "Your task here..."
```

**Do NOT use:**
- `--append-system-prompt` - This appends to the existing prompt, so the "short and concise" instruction still exists
- Prompt-based overrides (e.g., "NOTE: Do not give condensed output") - These don't work as the base instruction is stronger

## Testing Results

| Method | Lines | SearchLand Prompts | Status |
|--------|-------|-------------------|--------|
| Default (no flags) | 33 | 0 | ❌ Summaries only |
| `--append-system-prompt` | 60 | 0 | ❌ Still summaries |
| Prompt notes ("Do not condense") | 44 | 0 | ❌ Ignored |
| `--output-style explanatory` setting | 37 | 0 | ❌ Added boxes but still brief |
| **`--system-prompt` (SOLUTION)** | **301** | **3** | **✅ WORKS!** |

## Files Updated

All v5 orchestration scripts updated:

1. ✅ `orchestrate_independent.sh` - Generation phase
2. ✅ `orchestrate_crossvalidation.sh` - Critique phase + Disagreement analysis
3. ✅ `orchestrate_technical_iteration.sh` - Iteration phase
4. ✅ `orchestrate_synthesis.sh` - Synthesis phase

## System Version

- **v13:** Claude CLI generating summaries (broken)
- **v14:** Claude CLI with `--system-prompt` fix (working)

## Credit

User identified the issue after noticing Claude CLI's "short and concise" instruction in its base configuration.

