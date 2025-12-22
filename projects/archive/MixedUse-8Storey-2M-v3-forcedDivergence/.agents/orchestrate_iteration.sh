#!/bin/bash

# Multi-Agent Critique Iteration - Resolve Technical Disagreements
# Runs ONLY if agents disagree on technical validity

set -e

PROJECT_DIR="/home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v3"
AGENTS_DIR="$PROJECT_DIR/.agents"

echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║       Multi-Agent Iteration System v3.1.2                        ║"
echo "║     Resolving Technical Disagreements Through Iteration          ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""

# Check for disagreements
check_for_disagreements() {
    echo "Analyzing critiques for technical disagreements..."
    
    # This would need to parse the critique files for PASS/FAIL patterns
    # For now, we'll create the iteration prompt assuming disagreements exist
    
    cat > "$AGENTS_DIR/iteration_prompt.txt" << 'ITERATION_PROMPT'
# ITERATION TASK: Resolve Technical Disagreements

You previously critiqued filter approaches. However, there are DISAGREEMENTS among agents on technical validity.

## YOUR TASK
Review the critiques from all 3 agents and YOUR OWN critique. For approaches where there's disagreement:

### Identify Disagreements:
Look for approaches where agents disagree on PASS/FAIL:
- 2 agents say VALID, 1 says INVALID = disagreement
- 2 agents say INVALID, 1 says VALID = disagreement
- All 3 disagree = major disagreement

### Reconsider Your Position:
For each disagreement, ask yourself:
1. **Is this a technical error or a suggestion?**
   - Technical: "Filter doesn't exist" = error
   - Suggestion: "Could use better filter" = preference (ignore)

2. **Did I miss something the other agents caught?**
   - Check AvailableFiltersInSearchLand_ACTUAL.md again
   - Verify units (acres vs sqm, etc.)
   - Check syntax validity

3. **Am I being too strict or too lenient?**
   - Too strict: Marking INVALID for minor suggestions
   - Too lenient: Missing actual technical errors

### Output Format:
For EACH approach where you disagreed with majority:

```
## Approach [X]: [Name]

**My Original Position:** VALID / INVALID
**Majority Position:** VALID / INVALID

**After Reconsideration:**
- [Specific point I reconsidered]
- [What I checked in available filters]
- [What other agents caught that I missed OR what I still disagree with]

**Updated Position:** VALID / INVALID / CONDITIONAL

**Rationale:** [Brief explanation]

**If Still Disagree:** [Explain technical reason why]
```

### Rules:
- Focus ONLY on technical correctness (filter existence, units, syntax)
- Ignore strategic preferences ("I like approach A better")
- If you were wrong, admit it and update position
- If you're still right, explain technical reason clearly

---

ITERATION_PROMPT

    # Append all critiques
    cat "$PROJECT_DIR/02_VALIDITY_CHECK/Critique_Gemini.md" \
        "$PROJECT_DIR/02_VALIDITY_CHECK/Critique_Codex.md" \
        "$PROJECT_DIR/02_VALIDITY_CHECK/Critique_Claude.md" \
        "$CONTEXT_DIR/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" >> "$AGENTS_DIR/iteration_prompt.txt"
    
    echo "✅ Iteration prompt created"
}

# Run iteration for each agent
run_iteration_gemini() {
    echo ""
    echo "🤖 Agent Gemini reconsidering positions..."
    
    cat "$AGENTS_DIR/iteration_prompt.txt" | \
    claude > "$PROJECT_DIR/02_VALIDITY_CHECK/Iteration_Gemini.md" 2>&1
    
    echo "✅ Gemini iteration complete"
}

run_iteration_codex() {
    echo ""
    echo "🤖 Agent Codex reconsidering positions..."
    
    cat "$AGENTS_DIR/iteration_prompt.txt" | \
    claude > "$PROJECT_DIR/02_VALIDITY_CHECK/Iteration_Codex.md" 2>&1
    
    echo "✅ Codex iteration complete"
}

run_iteration_claude() {
    echo ""
    echo "🤖 Agent Claude reconsidering positions..."
    
    cat "$AGENTS_DIR/iteration_prompt.txt" | \
    claude > "$PROJECT_DIR/02_VALIDITY_CHECK/Iteration_Claude.md" 2>&1
    
    echo "✅ Claude iteration complete"
}

echo "═══════════════════════════════════════════════════════════════════"
echo "📦 STAGE 5: Checking for Technical Disagreements"
echo "═══════════════════════════════════════════════════════════════════"

check_for_disagreements

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "🔄 STAGE 6: Running Iteration (Parallel)"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "Each agent will reconsider their positions..."
echo ""

# Run all iterations in parallel
run_iteration_gemini &
PID_GEMINI=$!

run_iteration_codex &
PID_CODEX=$!

run_iteration_claude &
PID_CLAUDE=$!

# Wait for all
echo "⏳ Waiting for all iterations..."
wait $PID_GEMINI
wait $PID_CODEX
wait $PID_CLAUDE

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "✅ ITERATION COMPLETE"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "📊 Results:"
ls -lh "$PROJECT_DIR/02_VALIDITY_CHECK/Iteration_"*".md" | awk '{print "   •", $9, "-", $5}'
echo ""
echo "⏭️  NEXT: Re-run consensus with updated positions"
echo ""

