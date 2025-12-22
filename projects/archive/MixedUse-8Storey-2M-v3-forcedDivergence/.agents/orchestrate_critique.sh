#!/bin/bash

# Multi-Agent Cross-Critique Orchestrator
# Each agent reviews ALL 6 approaches for technical validity

set -e

PROJECT_DIR="/home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v3"
AGENTS_DIR="$PROJECT_DIR/.agents"
CONTEXT_DIR="/home/ashsubband/landsignal"

echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║          Multi-Agent Cross-Critique System v3.2                  ║"
echo "║     All Agents Review Collaborative Approaches                   ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""

# Create critique context (collaborative approaches + validation criteria)
create_critique_context() {
    echo "Creating critique context package..."
    
    cat > "$AGENTS_DIR/critique_context.txt" << 'CRITIQUE_PROMPT'
# CRITIQUE TASK: Technical Validation of All Approaches

You are reviewing ALL approaches generated in the collaborative exploration phase.

## YOUR TASK
For EACH approach generated (typically 4-10 across 5 strategic angles), perform TECHNICAL VALIDATION ONLY:

### Validation Criteria:
1. **Filter Existence:** Do all filters exist in AvailableFiltersInSearchLand_ACTUAL.md?
2. **Correct Units:** Are units correct (acres not sqm, sqft not sqm, metres)?
3. **Valid Syntax:** Is the syntax valid per LEARNINGS_DATABASE.md?
4. **Logical Coherence:** Are there contradictions? (e.g., "Title area > 10 AND < 5")
5. **Capital Feasibility:** Can £200k realistically enable this strategy?

### DO NOT Judge:
- ❌ Which approach is "better"
- ❌ Which you "prefer"
- ❌ How many results it will get (only flag if obviously 0 or millions)

### Output Format:
For each approach, provide:

```
## Approach: [Approach Name from Collaborative Output]
(Strategic Angle: Precedent / Regulation / Structural / Behavioral / Challenge)

**Technical Validation:** PASS / FAIL

**Issues Found:**
1. [Issue description] - Severity: CRITICAL / MAJOR / MINOR
2. [Issue description] - Severity: CRITICAL / MAJOR / MINOR
...

**Suggested Fixes:**
- [How to fix issue 1]
- [How to fix issue 2]
...

**Overall Assessment:** VALID (proceed to testing) / INVALID (needs revision) / CONDITIONAL (fix minor issues first)
```

### Severity Definitions:
- **CRITICAL:** Approach will not work (wrong filters, impossible logic)
- **MAJOR:** Approach will work but with significant issues (wrong units, suboptimal filters)
- **MINOR:** Approach works but could be improved (optional enhancements)

Be HONEST and THOROUGH. The goal is to catch errors BEFORE testing in SearchLand.

---

CRITIQUE_PROMPT

    # Append collaborative exploration output
    cat "$PROJECT_DIR/01_DIVERGENT_GENERATION/CollaborativeExploration_Output.md" \
        "$CONTEXT_DIR/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" \
        "$CONTEXT_DIR/LEARNINGS_DATABASE.md" >> "$AGENTS_DIR/critique_context.txt"
    
    echo "✅ Critique context created ($(wc -l < $AGENTS_DIR/critique_context.txt) lines)"
}

# Agent Gemini critiques all approaches
critique_agent_gemini() {
    echo ""
    echo "🤖 Agent Gemini reviewing all collaborative approaches..."
    
    cat "$AGENTS_DIR/critique_context.txt" | \
    claude > "$PROJECT_DIR/02_VALIDITY_CHECK/Critique_Gemini.md" 2>&1
    
    echo "✅ Agent Gemini critique complete"
}

# Agent Codex critiques all approaches
critique_agent_codex() {
    echo ""
    echo "🤖 Agent Codex reviewing all collaborative approaches..."
    
    cat "$AGENTS_DIR/critique_context.txt" | \
    claude > "$PROJECT_DIR/02_VALIDITY_CHECK/Critique_Codex.md" 2>&1
    
    echo "✅ Agent Codex critique complete"
}

# Agent Claude critiques all approaches
critique_agent_claude() {
    echo ""
    echo "🤖 Agent Claude reviewing all collaborative approaches..."
    
    cat "$AGENTS_DIR/critique_context.txt" | \
    claude > "$PROJECT_DIR/02_VALIDITY_CHECK/Critique_Claude.md" 2>&1
    
    echo "✅ Agent Claude critique complete"
}

echo "═══════════════════════════════════════════════════════════════════"
echo "📦 STAGE 3: Preparing Critique Context"
echo "═══════════════════════════════════════════════════════════════════"
create_critique_context

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "🔍 STAGE 4: Cross-Critique (Parallel Execution)"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "Each agent will review ALL collaborative approaches..."
echo ""

# Run all critiques in parallel
critique_agent_gemini &
PID_GEMINI=$!

critique_agent_codex &
PID_CODEX=$!

critique_agent_claude &
PID_CLAUDE=$!

# Wait for all to complete
echo "⏳ Waiting for all critiques to complete..."
echo "   • Agent Gemini critique (PID $PID_GEMINI)"
echo "   • Agent Codex critique (PID $PID_CODEX)"
echo "   • Agent Claude critique (PID $PID_CLAUDE)"
echo ""

wait $PID_GEMINI
wait $PID_CODEX
wait $PID_CLAUDE

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "✅ STAGE 4 COMPLETE: All Critiques Finished"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "📊 Results:"
ls -lh "$PROJECT_DIR/02_VALIDITY_CHECK/Critique_"*".md" | awk '{print "   •", $9, "-", $5}'
echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "⏭️  NEXT: Stage 5 - Consensus"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "Run: ./orchestrate_consensus.sh"
echo ""

