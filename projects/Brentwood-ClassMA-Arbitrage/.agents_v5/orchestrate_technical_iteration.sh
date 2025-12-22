#!/bin/bash

# Technical Iteration - v5.2.2
# Only runs if technical disagreements detected
# Now with structured folder organization per iteration round

set -e

# Source shared prompts
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/PROMPTS_CONFIG.sh"

# Rate limit flags (set to true if CLI unavailable)
CLAUDE_LIMIT_HIT=true  # Manual mode - paste prompts to Claude assistant
GROK_LIMIT_HIT=false
CODEX_LIMIT_HIT=false
GEMINI_LIMIT_HIT=false

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VALIDITY_BASE="$PROJECT_DIR/02_VALIDITY_CHECK"

# Get iteration round from parent script (default 1)
ROUND="${ITERATION_ROUND:-1}"

# Create round-specific folders
ROUND_DIR="$VALIDITY_BASE/Round$ROUND"
CRITIQUE_DIR="$ROUND_DIR/Critiques"
ITERATION_DIR="$ROUND_DIR/Iterations"
PROMPT_DIR="$ROUND_DIR/_prompts"

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  Phase 1.5: Technical Iteration (Round $ROUND)               ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check if disagreements exist
if [ ! -f "$CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md" ]; then
    echo "❌ ERROR: Run orchestrate_crossvalidation.sh first"
    exit 1
fi

if ! grep -q "DISAGREEMENTS_FOUND: YES" "$CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md"; then
    echo "✅ No disagreements detected - iteration not needed"
    echo ""
    exit 0
fi

echo "⚠️  Technical disagreements detected - running iteration"
echo ""

mkdir -p "$ITERATION_DIR"

# Create iteration context
cat > "$PROMPT_DIR/iteration_context.txt" << CONTEXT_EOF
$CONTEXT_ITERATION
CONTEXT_EOF

# Append disagreement analysis
echo "" >> "$PROMPT_DIR/iteration_context.txt"
echo "## DISAGREEMENT ANALYSIS" >> "$PROMPT_DIR/iteration_context.txt"
echo "" >> "$PROMPT_DIR/iteration_context.txt"
cat "$CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md" >> "$PROMPT_DIR/iteration_context.txt"

# Append original critiques
echo "" >> "$PROMPT_DIR/iteration_context.txt"
echo "## YOUR ORIGINAL CRITIQUE" >> "$PROMPT_DIR/iteration_context.txt"
echo "" >> "$PROMPT_DIR/iteration_context.txt"
# (Will be appended per-LLM below)

# Append FULL reference materials (like run_filter_patterns_review.sh does)
# Note: PROJECT_DIR is projects/ProjectName, so ../../ goes to root
ROOT_DIR="$PROJECT_DIR/../.."

echo "" >> "$PROMPT_DIR/iteration_context.txt"
echo "## REFERENCE MATERIALS (ALL CONTENT INCLUDED BELOW)" >> "$PROMPT_DIR/iteration_context.txt"
echo "" >> "$PROMPT_DIR/iteration_context.txt"

echo "## REFERENCE: SearchLand Available Filters (CRITICAL - Use ONLY These)" >> "$PROMPT_DIR/iteration_context.txt"
echo "" >> "$PROMPT_DIR/iteration_context.txt"
cat "$ROOT_DIR/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" >> "$PROMPT_DIR/iteration_context.txt" 2>/dev/null || echo "[AvailableFiltersInSearchLand_ACTUAL.md not found at $ROOT_DIR]" >> "$PROMPT_DIR/iteration_context.txt"

echo "" >> "$PROMPT_DIR/iteration_context.txt"
echo "## REFERENCE: LEARNINGS_DATABASE.md" >> "$PROMPT_DIR/iteration_context.txt"
echo "" >> "$PROMPT_DIR/iteration_context.txt"
cat "$ROOT_DIR/LEARNINGS_DATABASE.md" >> "$PROMPT_DIR/iteration_context.txt" 2>/dev/null || echo "[LEARNINGS_DATABASE.md not found at $ROOT_DIR]" >> "$PROMPT_DIR/iteration_context.txt"

# Run iterations for each LLM
iterate_gemini() {
    echo "🔷 Gemini reconsidering..."
    
    # Add Gemini's original critique
    cat "$PROMPT_DIR/iteration_context.txt" > "$PROMPT_DIR/iteration_gemini_prompt.txt"
    cat "$CRITIQUE_DIR/Critique_Gemini.md" >> "$PROMPT_DIR/iteration_gemini_prompt.txt"
    
    cat "$PROMPT_DIR/iteration_gemini_prompt.txt" | \
    gemini -p "$PROMPT_ITERATION" \
    > "$ITERATION_DIR/Iteration_Gemini.md" 2>&1
    
    echo "✅ Gemini iteration complete"
}

iterate_codex() {
    echo "🔶 ChatGPT reconsidering..."
    
    # Add Codex's original critique to context
    cat "$PROMPT_DIR/iteration_context.txt" > "$PROMPT_DIR/iteration_codex_prompt.txt"
    cat "$CRITIQUE_DIR/Critique_Codex.md" >> "$PROMPT_DIR/iteration_codex_prompt.txt"
    
    # Codex doesn't read stdin - must give it file path
    codex exec --skip-git-repo-check "Read the file at $PROMPT_DIR/iteration_codex_prompt.txt and $PROMPT_ITERATION" \
    > "$ITERATION_DIR/Iteration_Codex.md" 2>/dev/null
    
    echo "✅ ChatGPT iteration complete"
}

iterate_grok() {
    echo "🟣 Grok reconsidering..."
    
    # Add Grok's original critique
    cat "$PROMPT_DIR/iteration_context.txt" > "$PROMPT_DIR/iteration_grok_prompt.txt"
    cat "$CRITIQUE_DIR/Critique_Grok.md" >> "$PROMPT_DIR/iteration_grok_prompt.txt"
    
    cat "$PROMPT_DIR/iteration_grok_prompt.txt" | \
    opencode run -m opencode/grok-code "$PROMPT_ITERATION" \
    > "$ITERATION_DIR/Iteration_Grok.md" 2>&1
    
    echo "✅ Grok iteration complete"
}

iterate_claude() {
    if [ "$CLAUDE_LIMIT_HIT" = true ]; then
        echo "🔵 Claude reconsidering (direct generation - CLI unavailable)..."
        
        # Create context file for Claude assistant to read
        cat "$PROMPT_DIR/iteration_context.txt" > "$PROMPT_DIR/iteration_claude_prompt.txt"
        cat "$CRITIQUE_DIR/Critique_Claude.md" >> "$PROMPT_DIR/iteration_claude_prompt.txt"
        
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "⏸️  MANUAL GENERATION REQUIRED"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "Claude assistant needs to generate:"
        echo "  → $ITERATION_DIR/Iteration_Claude.md"
        echo ""
        echo "Context available at:"
        echo "  → $PROMPT_DIR/iteration_claude_prompt.txt"
        echo ""
        echo "📋 COPY THIS MESSAGE AND SEND TO CLAUDE:"
        echo ""
        echo "---"
        echo "Generate Iteration_Claude.md for Phase 1.5 (Technical Iteration)"
        echo "Context file: $PROMPT_DIR/iteration_claude_prompt.txt"
        echo "Output file: $ITERATION_DIR/Iteration_Claude.md"
        echo "Task: Reconsider position based on disagreement analysis"
        echo "---"
        echo ""
        read -p "Press Enter AFTER Claude has generated the file..."
        echo ""
        
        # Verify file was actually created with real content
        if [ ! -f "$ITERATION_DIR/Iteration_Claude.md" ] || [ ! -s "$ITERATION_DIR/Iteration_Claude.md" ]; then
            echo "❌ ERROR: Iteration_Claude.md not found or empty"
            echo "   Please generate the file before continuing"
            exit 1
        fi
        
        # Check it's not just a placeholder
        if grep -q "Manual Generation Required" "$ITERATION_DIR/Iteration_Claude.md"; then
            echo "❌ ERROR: Iteration_Claude.md still contains placeholder text"
            echo "   Please replace with actual iteration content"
            exit 1
        fi
        
        echo "✅ Claude iteration complete (manual generation verified)"
    else
        echo "🔵 Claude reconsidering..."
        cat "$PROMPT_DIR/iteration_context.txt" > "$PROMPT_DIR/iteration_claude_prompt.txt"
        cat "$CRITIQUE_DIR/Critique_Claude.md" >> "$PROMPT_DIR/iteration_claude_prompt.txt"
        
        cat "$PROMPT_DIR/iteration_claude_prompt.txt" | \
        claude --system-prompt "$SYSTEM_PROMPT" -p "$PROMPT_ITERATION" \
        > "$ITERATION_DIR/Iteration_Claude.md" 2>&1
        echo "✅ Claude iteration complete"
    fi
}

# Run all in parallel (except Claude if manual mode)
iterate_gemini &
PID_GEMINI=$!

iterate_codex &
PID_CODEX=$!

iterate_grok &
PID_GROK=$!

# Claude runs in foreground if manual mode (needs stdin for read -p)
if [ "$CLAUDE_LIMIT_HIT" = true ]; then
    # Don't background Claude - it needs to interact with terminal
    echo "⏳ Waiting for all iterations to complete..."
    
    wait $PID_GEMINI
    wait $PID_CODEX
    wait $PID_GROK
    
    # Now run Claude in foreground (after others complete)
    iterate_claude
else
    # Normal mode - run Claude in parallel
    iterate_claude &
    PID_CLAUDE=$!
    
    echo "⏳ Waiting for all iterations to complete..."
    wait $PID_GEMINI
    wait $PID_CODEX
    wait $PID_GROK
    wait $PID_CLAUDE
fi

# Summary
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  ✅ Phase 1.5 Complete: Technical Iteration                  ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Updated positions:"
echo "  • Gemini: $(wc -l < "$ITERATION_DIR/Iteration_Gemini.md") lines"
echo "  • ChatGPT: $(wc -l < "$ITERATION_DIR/Iteration_Codex.md") lines"
echo "  • Grok: $(wc -l < "$ITERATION_DIR/Iteration_Grok.md") lines"
echo "  • Claude: $(wc -l < "$ITERATION_DIR/Iteration_Claude.md") lines"
echo ""
echo "Next: Run orchestrate_synthesis.sh"
echo ""

