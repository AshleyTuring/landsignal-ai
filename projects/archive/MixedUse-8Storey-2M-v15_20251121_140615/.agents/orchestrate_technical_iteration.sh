#!/bin/bash

# Technical Iteration - v5.1
# Only runs if technical disagreements detected

set -e

# Source shared prompts
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/PROMPTS_CONFIG.sh"

# Rate limit flags (set to true if CLI unavailable)
CLAUDE_LIMIT_HIT=false  # CLI working
GROK_LIMIT_HIT=false
CODEX_LIMIT_HIT=false
GEMINI_LIMIT_HIT=false

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VALIDITY_DIR="$PROJECT_DIR/02_VALIDITY_CHECK"

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  Phase 1.5: Technical Iteration (Resolve Disagreements)      ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check if disagreements exist
if [ ! -f "$VALIDITY_DIR/DISAGREEMENT_ANALYSIS.md" ]; then
    echo "❌ ERROR: Run orchestrate_crossvalidation.sh first"
    exit 1
fi

if ! grep -q "DISAGREEMENTS_FOUND: YES" "$VALIDITY_DIR/DISAGREEMENT_ANALYSIS.md"; then
    echo "✅ No disagreements detected - iteration not needed"
    echo ""
    exit 0
fi

echo "⚠️  Technical disagreements detected - running iteration"
echo ""

# Create iteration context
cat > "$VALIDITY_DIR/iteration_context.txt" << 'ITERATION_EOF'
# Technical & Business Case Iteration Task

## Context
You previously reviewed approaches and identified technical and business case issues. Other LLMs disagreed with some of your assessments.

## Your Task
**Reconsider your positions** based on the disagreement analysis below. You may:
1. **Maintain your position** (with additional evidence)
2. **Change your position** (if you were mistaken)
3. **Clarify your position** (if misunderstood)

## What to Focus On
- Factual correctness (filter existence, units, syntax)
- Business case viability (capital, ROI, implementation feasibility)
- Evidence-based reasoning (cite sources)
- Technical and financial precision (not strategic preference)

## Output Format
### Updated Assessment (Technical & Business Case)

**Approaches I'm changing my assessment on:**
- Approach [X]: Was [STATUS], now [STATUS] because [evidence]

**Approaches I'm maintaining my assessment on:**
- Approach [Y]: Still [STATUS] because [evidence]

**Clarifications:**
- [Any misunderstandings to clear up]

ITERATION_EOF

# Append disagreement analysis
echo "" >> "$VALIDITY_DIR/iteration_context.txt"
echo "## DISAGREEMENT ANALYSIS" >> "$VALIDITY_DIR/iteration_context.txt"
echo "" >> "$VALIDITY_DIR/iteration_context.txt"
cat "$VALIDITY_DIR/DISAGREEMENT_ANALYSIS.md" >> "$VALIDITY_DIR/iteration_context.txt"

# Append original critiques
echo "" >> "$VALIDITY_DIR/iteration_context.txt"
echo "## YOUR ORIGINAL CRITIQUE" >> "$VALIDITY_DIR/iteration_context.txt"
echo "" >> "$VALIDITY_DIR/iteration_context.txt"
# (Will be appended per-LLM below)

# Append FULL reference materials (like run_filter_patterns_review.sh does)
# Note: PROJECT_DIR is projects/ProjectName, so ../../ goes to root
ROOT_DIR="$PROJECT_DIR/../.."

echo "" >> "$VALIDITY_DIR/iteration_context.txt"
echo "## REFERENCE MATERIALS (ALL CONTENT INCLUDED BELOW)" >> "$VALIDITY_DIR/iteration_context.txt"
echo "" >> "$VALIDITY_DIR/iteration_context.txt"

echo "## REFERENCE: SearchLand Available Filters (CRITICAL - Use ONLY These)" >> "$VALIDITY_DIR/iteration_context.txt"
echo "" >> "$VALIDITY_DIR/iteration_context.txt"
cat "$ROOT_DIR/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" >> "$VALIDITY_DIR/iteration_context.txt" 2>/dev/null || echo "[AvailableFiltersInSearchLand_ACTUAL.md not found at $ROOT_DIR]" >> "$VALIDITY_DIR/iteration_context.txt"

echo "" >> "$VALIDITY_DIR/iteration_context.txt"
echo "## REFERENCE: LEARNINGS_DATABASE.md" >> "$VALIDITY_DIR/iteration_context.txt"
echo "" >> "$VALIDITY_DIR/iteration_context.txt"
cat "$ROOT_DIR/LEARNINGS_DATABASE.md" >> "$VALIDITY_DIR/iteration_context.txt" 2>/dev/null || echo "[LEARNINGS_DATABASE.md not found at $ROOT_DIR]" >> "$VALIDITY_DIR/iteration_context.txt"

# Run iterations for each LLM
iterate_gemini() {
    echo "🔷 Gemini reconsidering..."
    
    # Add Gemini's original critique
    cat "$VALIDITY_DIR/iteration_context.txt" > "$VALIDITY_DIR/iteration_gemini_prompt.txt"
    cat "$VALIDITY_DIR/Gemini_Critique.md" >> "$VALIDITY_DIR/iteration_gemini_prompt.txt"
    
    cat "$VALIDITY_DIR/iteration_gemini_prompt.txt" | \
    gemini -p "$PROMPT_ITERATION" \
    > "$VALIDITY_DIR/Iteration_Gemini.md" 2>&1
    
    echo "✅ Gemini iteration complete"
}

iterate_codex() {
    echo "🔶 Codex reconsidering..."
    
    # Add Codex's original critique to context
    cat "$VALIDITY_DIR/iteration_context.txt" > "$VALIDITY_DIR/iteration_codex_prompt.txt"
    cat "$VALIDITY_DIR/Codex_Critique.md" >> "$VALIDITY_DIR/iteration_codex_prompt.txt"
    
    # Codex doesn't read stdin - must give it file path
    codex exec --skip-git-repo-check "Read the file at $VALIDITY_DIR/iteration_codex_prompt.txt and $PROMPT_ITERATION" \
    > "$VALIDITY_DIR/Iteration_Codex.md" 2>/dev/null
    
    echo "✅ Codex iteration complete"
}

iterate_grok() {
    echo "🟣 Grok reconsidering..."
    
    # Add Grok's original critique
    cat "$VALIDITY_DIR/iteration_context.txt" > "$VALIDITY_DIR/iteration_grok_prompt.txt"
    cat "$VALIDITY_DIR/Grok_Critique.md" >> "$VALIDITY_DIR/iteration_grok_prompt.txt"
    
    cat "$VALIDITY_DIR/iteration_grok_prompt.txt" | \
    opencode run -m opencode/grok-code "$PROMPT_ITERATION" \
    > "$VALIDITY_DIR/Iteration_Grok.md" 2>&1
    
    echo "✅ Grok iteration complete"
}

iterate_claude() {
    if [ "$CLAUDE_LIMIT_HIT" = true ]; then
        echo "🔵 Claude reconsidering (direct generation - CLI unavailable)..."
        
        # Create context file for Claude assistant to read
        cat "$VALIDITY_DIR/iteration_context.txt" > "$VALIDITY_DIR/iteration_claude_prompt.txt"
        cat "$VALIDITY_DIR/Claude_Critique.md" >> "$VALIDITY_DIR/iteration_claude_prompt.txt"
        
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "⏸️  MANUAL GENERATION REQUIRED"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "Claude assistant needs to generate:"
        echo "  → $VALIDITY_DIR/Iteration_Claude.md"
        echo ""
        echo "Context available at:"
        echo "  → $VALIDITY_DIR/iteration_claude_prompt.txt"
        echo ""
        read -p "Press Enter AFTER Claude has generated the file..."
        echo ""
        
        # Verify file was actually created with real content
        if [ ! -f "$VALIDITY_DIR/Iteration_Claude.md" ] || [ ! -s "$VALIDITY_DIR/Iteration_Claude.md" ]; then
            echo "❌ ERROR: Iteration_Claude.md not found or empty"
            echo "   Please generate the file before continuing"
            exit 1
        fi
        
        # Check it's not just a placeholder
        if grep -q "Manual Generation Required" "$VALIDITY_DIR/Iteration_Claude.md"; then
            echo "❌ ERROR: Iteration_Claude.md still contains placeholder text"
            echo "   Please replace with actual iteration content"
            exit 1
        fi
        
        echo "✅ Claude iteration complete (manual generation verified)"
    else
        echo "🔵 Claude reconsidering..."
        cat "$VALIDITY_DIR/iteration_context.txt" > "$VALIDITY_DIR/iteration_claude_prompt.txt"
        cat "$VALIDITY_DIR/Claude_Critique.md" >> "$VALIDITY_DIR/iteration_claude_prompt.txt"
        
        cat "$VALIDITY_DIR/iteration_claude_prompt.txt" | \
        claude --system-prompt "$SYSTEM_PROMPT" -p "$PROMPT_ITERATION" \
        > "$VALIDITY_DIR/Iteration_Claude.md" 2>&1
        echo "✅ Claude iteration complete"
    fi
}

# Run all in parallel
iterate_gemini &
PID_GEMINI=$!

iterate_codex &
PID_CODEX=$!

iterate_grok &
PID_GROK=$!

iterate_claude &
PID_CLAUDE=$!

# Wait for all
echo "⏳ Waiting for all iterations to complete..."
wait $PID_GEMINI
wait $PID_CODEX
wait $PID_GROK
wait $PID_CLAUDE

# Summary
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  ✅ Phase 1.5 Complete: Technical Iteration                  ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Updated positions:"
echo "  • Gemini: $(wc -l < "$VALIDITY_DIR/Iteration_Gemini.md") lines"
echo "  • Codex: $(wc -l < "$VALIDITY_DIR/Iteration_Codex.md") lines"
echo "  • Grok: $(wc -l < "$VALIDITY_DIR/Iteration_Grok.md") lines"
echo "  • Claude: $(wc -l < "$VALIDITY_DIR/Iteration_Claude.md") lines"
echo ""
echo "Next: Run orchestrate_synthesis.sh"
echo ""

