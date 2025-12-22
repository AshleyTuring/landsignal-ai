#!/bin/bash

# Multi-Agent Consensus Orchestrator
# Synthesizes all 3 critiques into final validation matrix

set -e

PROJECT_DIR="/home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v3"
AGENTS_DIR="$PROJECT_DIR/.agents"
CONTEXT_DIR="/home/ashsubband/landsignal"

echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║          Multi-Agent Consensus System v3.1                       ║"
echo "║      Synthesizing 3 Critiques into Final Validation              ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""

# Create consensus context
create_consensus_context() {
    echo "Creating consensus context package..."
    
    cat > "$AGENTS_DIR/consensus_context.txt" << 'CONSENSUS_PROMPT'
# CONSENSUS TASK: Final Validation Matrix

You are the FINAL ARBITRATOR synthesizing 3 agent critiques.

## YOUR TASK
Review all 3 critiques (Gemini, Codex, Claude) and create a FINAL VALIDATION MATRIX.

### For EACH of the 6 approaches, determine:

1. **Consensus Status:**
   - ✅ VALID - All agents agree it's technically sound (proceed to testing)
   - ⚠️ CONDITIONAL - Minor issues, easy fixes (provide specific fixes)
   - ❌ INVALID - Critical issues found by 2+ agents (reject)

2. **Critical Issues (if any):**
   - List ONLY issues flagged by 2+ agents as CRITICAL or MAJOR
   - Ignore minor disagreements

3. **Required Fixes (if CONDITIONAL):**
   - Specific, actionable fixes
   - Must be implementable without regenerating entire approach

4. **Proceed to Testing?**
   - YES (valid or conditional with trivial fixes)
   - NO (critical issues prevent testing)

### Output Format:

```markdown
# Final Validation Matrix

## Summary
- **Total Approaches:** 6
- **Valid (✅):** X approaches
- **Conditional (⚠️):** Y approaches  
- **Invalid (❌):** Z approaches
- **Proceed to Testing:** N approaches

---

## Approach A: [Name]
**Final Status:** ✅ VALID / ⚠️ CONDITIONAL / ❌ INVALID

**Agent Consensus:**
- Gemini: PASS/FAIL - [key points]
- Codex: PASS/FAIL - [key points]
- Claude: PASS/FAIL - [key points]

**Critical Issues:**
1. [Issue found by 2+ agents] - Severity: CRITICAL/MAJOR
2. ...

**Required Fixes (if CONDITIONAL):**
- [ ] Fix 1: [Specific change needed]
- [ ] Fix 2: [Specific change needed]

**Proceed to Testing?** YES / NO

**Rationale:** [1-2 sentences explaining decision]

---

[Repeat for all 6 approaches]

---

## Testing Priority
**High Priority (Test First):**
1. Approach X - [Why]
2. Approach Y - [Why]

**Medium Priority:**
1. Approach Z - [Why]

**Low Priority / Do Not Test:**
1. Approach W - [Why rejected]

---

## Recommendations
[Summary of which approaches to test and in what order]
```

### Decision Rules:
1. If 2+ agents say CRITICAL issue → Approach is INVALID
2. If all 3 agents say PASS → Approach is VALID
3. If split (e.g., 2 PASS, 1 FAIL with MINOR issues) → Approach is CONDITIONAL
4. Prioritize approaches with VALID status for testing first

Be decisive. The goal is to give clear YES/NO decisions for testing.

---

CONSENSUS_PROMPT

    # Append all 3 critiques + iterations (if exist) + original approaches
    cat "$PROJECT_DIR/02_VALIDITY_CHECK/Critique_Gemini.md" \
        "$PROJECT_DIR/02_VALIDITY_CHECK/Critique_Codex.md" \
        "$PROJECT_DIR/02_VALIDITY_CHECK/Critique_Claude.md" >> "$AGENTS_DIR/consensus_context.txt"
    
    # Include iterations if they exist (agents reconsidered their positions)
    if [ -f "$PROJECT_DIR/02_VALIDITY_CHECK/Iteration_Gemini.md" ]; then
        echo "" >> "$AGENTS_DIR/consensus_context.txt"
        echo "=== UPDATED POSITIONS AFTER ITERATION ===" >> "$AGENTS_DIR/consensus_context.txt"
        cat "$PROJECT_DIR/02_VALIDITY_CHECK/Iteration_Gemini.md" \
            "$PROJECT_DIR/02_VALIDITY_CHECK/Iteration_Codex.md" \
            "$PROJECT_DIR/02_VALIDITY_CHECK/Iteration_Claude.md" >> "$AGENTS_DIR/consensus_context.txt"
    fi
    
    # Append original approaches
    cat "$PROJECT_DIR/01_DIVERGENT_GENERATION/AgentGemini_Output.md" \
        "$PROJECT_DIR/01_DIVERGENT_GENERATION/AgentCodex_Output.md" \
        "$PROJECT_DIR/01_DIVERGENT_GENERATION/AgentClaude_Output.md" >> "$AGENTS_DIR/consensus_context.txt"
    
    echo "✅ Consensus context created ($(wc -l < $AGENTS_DIR/consensus_context.txt) lines)"
}

# Run consensus synthesis
run_consensus() {
    echo ""
    echo "🤖 Running consensus synthesis..."
    echo "   Analyzing all critiques for final validation..."
    
    cat "$AGENTS_DIR/consensus_context.txt" | \
    claude > "$PROJECT_DIR/02_VALIDITY_CHECK/FINAL_ValidationMatrix.md" 2>&1
    
    echo "✅ Consensus complete"
}

echo "═══════════════════════════════════════════════════════════════════"
echo "📦 STAGE 5: Preparing Consensus Context"
echo "═══════════════════════════════════════════════════════════════════"
create_consensus_context

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "⚖️  STAGE 6: Consensus Synthesis"
echo "═══════════════════════════════════════════════════════════════════"

run_consensus

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "✅ ALL STAGES COMPLETE!"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "📊 Final Results:"
echo ""
ls -lh "$PROJECT_DIR/02_VALIDITY_CHECK/FINAL_ValidationMatrix.md" | awk '{print "   •", $9, "-", $5}'
echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "⏭️  NEXT STEPS:"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "1. Review: $PROJECT_DIR/02_VALIDITY_CHECK/FINAL_ValidationMatrix.md"
echo "2. Implement any CONDITIONAL fixes (if needed)"
echo "3. Test ALL VALID approaches in SearchLand (Stage 3 - Parallel Testing)"
echo "4. Document results per approach"
echo "5. Capture universal learnings in LEARNINGS_DATABASE.md"
echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo ""

