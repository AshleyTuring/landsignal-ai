#!/bin/bash

# Multi-LLM Cross-Validation - v5.2.2
# Each LLM reviews ALL approaches for technical validity
# Now with structured folder organization per iteration round
#
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# CLAUDE_LIMIT_HIT WORKFLOW (Manual Generation Mode)
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#
# When CLAUDE_LIMIT_HIT=true:
#   1. Script PAUSES before running `claude` CLI
#   2. Script PRINTS full system prompt + task prompt + context inline
#   3. User COPIES printed text
#   4. User PASTES to Claude assistant (in chat/IDE)
#   5. Claude assistant GENERATES the required .md file using write tool
#   6. User HITS ENTER in terminal
#   7. Script VERIFIES file exists and continues
#
# This enables Claude assistant to act as the `claude` CLI when rate-limited.
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

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
GENERATION_DIR="$PROJECT_DIR/01_DIVERGENT_GENERATION"
VALIDITY_BASE="$PROJECT_DIR/02_VALIDITY_CHECK"

# Get iteration round from parent script (default 1)
ROUND="${ITERATION_ROUND:-1}"

# Create round-specific folders
ROUND_DIR="$VALIDITY_BASE/Round$ROUND"
CRITIQUE_DIR="$ROUND_DIR/Critiques"
PROMPT_DIR="$ROUND_DIR/_prompts"

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  Phase 1: Cross-Validation (Round $ROUND)                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check inputs exist
if [ ! -d "$GENERATION_DIR" ]; then
    echo "❌ ERROR: Generation directory not found. Run orchestrate_independent.sh first."
    exit 1
fi

mkdir -p "$CRITIQUE_DIR"
mkdir -p "$PROMPT_DIR"

# Create critique context (all approaches)
cat > "$PROMPT_DIR/critique_context.txt" << CONTEXT_EOF
$CONTEXT_CRITIQUE
CONTEXT_EOF

# Append all original approaches
echo "" >> "$PROMPT_DIR/critique_context.txt"
echo "## ALL APPROACHES TO REVIEW (Original Generation)" >> "$PROMPT_DIR/critique_context.txt"
echo "" >> "$PROMPT_DIR/critique_context.txt"

for llm_file in "$GENERATION_DIR"/*.md; do
    if [ -f "$llm_file" ]; then
        echo "### $(basename "$llm_file" .md)" >> "$PROMPT_DIR/critique_context.txt"
        echo "" >> "$PROMPT_DIR/critique_context.txt"
        cat "$llm_file" >> "$PROMPT_DIR/critique_context.txt"
        echo "" >> "$PROMPT_DIR/critique_context.txt"
        echo "---" >> "$PROMPT_DIR/critique_context.txt"
        echo "" >> "$PROMPT_DIR/critique_context.txt"
    fi
done

# 🔹 Append UPDATED POSITIONS from ALL prior iteration rounds
# Check all previous rounds (Round1, Round2, etc.) for iteration files
for ((prev_round=1; prev_round<ROUND; prev_round++)); do
    PREV_ITERATION_DIR="$VALIDITY_BASE/Round$prev_round/Iterations"
    
    if [ -d "$PREV_ITERATION_DIR" ] && ls "$PREV_ITERATION_DIR"/Iteration_*.md >/dev/null 2>&1; then
        echo "" >> "$PROMPT_DIR/critique_context.txt"
        echo "## UPDATED POSITIONS FROM ROUND $prev_round (USE THESE FOR VALIDATION)" >> "$PROMPT_DIR/critique_context.txt"
        echo "" >> "$PROMPT_DIR/critique_context.txt"
        echo "NOTE: These updated positions supersede earlier versions." >> "$PROMPT_DIR/critique_context.txt"
        echo "Validate these updated positions for technical and business case validity." >> "$PROMPT_DIR/critique_context.txt"
        echo "" >> "$PROMPT_DIR/critique_context.txt"
        
        for iteration_file in "$PREV_ITERATION_DIR"/Iteration_*.md; do
            if [ -f "$iteration_file" ] && [ -s "$iteration_file" ]; then  # Check file exists and not empty
                echo "### $(basename "$iteration_file" .md) (Round $prev_round)" >> "$PROMPT_DIR/critique_context.txt"
                echo "" >> "$PROMPT_DIR/critique_context.txt"
                cat "$iteration_file" >> "$PROMPT_DIR/critique_context.txt"
                echo "" >> "$PROMPT_DIR/critique_context.txt"
                echo "---" >> "$PROMPT_DIR/critique_context.txt"
                echo "" >> "$PROMPT_DIR/critique_context.txt"
            fi
        done
    fi
done

# Append FULL reference materials (like run_filter_patterns_review.sh does)
# Note: PROJECT_DIR is projects/ProjectName, so ../../ goes to root
ROOT_DIR="$PROJECT_DIR/../.."

echo "" >> "$PROMPT_DIR/critique_context.txt"
echo "## REFERENCE MATERIALS (ALL CONTENT INCLUDED BELOW)" >> "$PROMPT_DIR/critique_context.txt"
echo "" >> "$PROMPT_DIR/critique_context.txt"

echo "## REFERENCE: SearchLand Available Filters (CRITICAL - Use ONLY These)" >> "$PROMPT_DIR/critique_context.txt"
echo "" >> "$PROMPT_DIR/critique_context.txt"
cat "$ROOT_DIR/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" >> "$PROMPT_DIR/critique_context.txt" 2>/dev/null || echo "[AvailableFiltersInSearchLand_ACTUAL.md not found at $ROOT_DIR]" >> "$PROMPT_DIR/critique_context.txt"

echo "" >> "$PROMPT_DIR/critique_context.txt"
echo "## REFERENCE: LEARNINGS_DATABASE.md" >> "$PROMPT_DIR/critique_context.txt"
echo "" >> "$PROMPT_DIR/critique_context.txt"
cat "$ROOT_DIR/LEARNINGS_DATABASE.md" >> "$PROMPT_DIR/critique_context.txt" 2>/dev/null || echo "[LEARNINGS_DATABASE.md not found at $ROOT_DIR]" >> "$PROMPT_DIR/critique_context.txt"

# Run critiques in parallel
critique_gemini() {
    echo "🔷 Running Gemini critique..."
    
    cat "$PROMPT_DIR/critique_context.txt" | \
    gemini -p "$PROMPT_CRITIQUE" \
    > "$CRITIQUE_DIR/Critique_Gemini.md" 2>&1
    
    echo "✅ Gemini critique complete"
}

critique_codex() {
    echo "🔶 Running ChatGPT critique..."
    
    # Codex doesn't read stdin - must give it file path
    codex exec --skip-git-repo-check "Read the file at $PROMPT_DIR/critique_context.txt and $PROMPT_CRITIQUE" \
    > "$CRITIQUE_DIR/Critique_Codex.md" 2>/dev/null
    
    echo "✅ ChatGPT critique complete"
}

critique_grok() {
    echo "🟣 Running Grok critique..."
    
    cat "$PROMPT_DIR/critique_context.txt" | \
    opencode run -m opencode/grok-code "$PROMPT_CRITIQUE" \
    > "$CRITIQUE_DIR/Critique_Grok.md" 2>&1
    
    echo "✅ Grok critique complete"
}

critique_claude() {
    if [ "$CLAUDE_LIMIT_HIT" = true ]; then
        echo "🔵 Running Claude critique (direct generation - CLI unavailable)..."
        
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "⏸️  MANUAL GENERATION REQUIRED"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "Claude assistant needs to generate:"
        echo "  → $CRITIQUE_DIR/Critique_Claude.md"
        echo ""
        echo "Context available at:"
        echo "  → $PROMPT_DIR/critique_context.txt"
        echo ""
        echo "📋 COPY THIS MESSAGE AND SEND TO CLAUDE:"
        echo ""
        echo "---"
        echo "Generate Claude_Critique.md for Phase 1 (Cross-Validation)"
        echo "Context file: $PROMPT_DIR/critique_context.txt"
        echo "Output file: $CRITIQUE_DIR/Critique_Claude.md"
        echo "Task: Critique all approaches for technical and business validity"
        echo "---"
        echo ""
        read -p "Press Enter AFTER Claude has generated the file..."
        echo ""
        
        # Verify file was actually created with real content
        if [ ! -f "$CRITIQUE_DIR/Critique_Claude.md" ] || [ ! -s "$CRITIQUE_DIR/Critique_Claude.md" ]; then
            echo "❌ ERROR: Claude_Critique.md not found or empty"
            echo "   Please generate the file before continuing"
            exit 1
        fi
        
        # Check it's not just a placeholder
        if grep -q "Manual Generation Required" "$CRITIQUE_DIR/Critique_Claude.md"; then
            echo "❌ ERROR: Claude_Critique.md still contains placeholder text"
            echo "   Please replace with actual critique"
            exit 1
        fi
        
        echo "✅ Claude critique complete (manual generation verified)"
    else
        echo "🔵 Running Claude critique..."
        cat "$PROMPT_DIR/critique_context.txt" | \
        claude --system-prompt "$SYSTEM_PROMPT" -p "$PROMPT_CRITIQUE" \
        > "$CRITIQUE_DIR/Critique_Claude.md" 2>&1
        echo "✅ Claude critique complete"
    fi
}

# Run all in parallel (except Claude if manual mode)
critique_gemini &
PID_GEMINI=$!

critique_codex &
PID_CODEX=$!

critique_grok &
PID_GROK=$!

# Claude runs in foreground if manual mode (needs stdin for read -p)
if [ "$CLAUDE_LIMIT_HIT" = true ]; then
    # Don't background Claude - it needs to interact with terminal
    echo "⏳ Waiting for all critiques to complete..."
    echo "   • Gemini (PID $PID_GEMINI)"
    echo "   • ChatGPT (PID $PID_CODEX)"
    echo "   • Grok (PID $PID_GROK)"
    echo "   • Claude (PID $$)"
    echo ""
    
    wait $PID_GEMINI
    wait $PID_CODEX
    wait $PID_GROK
    
    # Now run Claude in foreground (after others complete)
    critique_claude
else
    # Normal mode - run Claude in parallel
    critique_claude &
    PID_CLAUDE=$!
    
    echo "⏳ Waiting for all critiques to complete..."
    echo "   • Gemini (PID $PID_GEMINI)"
    echo "   • ChatGPT (PID $PID_CODEX)"
    echo "   • Grok (PID $PID_GROK)"
    echo "   • Claude (PID $PID_CLAUDE)"
    echo ""
    
    wait $PID_GEMINI
    wait $PID_CODEX
    wait $PID_GROK
    wait $PID_CLAUDE
fi

# Check for technical disagreements
echo ""
echo "🔍 Checking for technical disagreements..."
echo ""

cat > "$PROMPT_DIR/disagreement_check_prompt.txt" << CONTEXT_EOF
$CONTEXT_DISAGREEMENT
CONTEXT_EOF

# Append critiques
echo "" >> "$PROMPT_DIR/disagreement_check_prompt.txt"
echo "## CRITIQUES TO ANALYZE" >> "$PROMPT_DIR/disagreement_check_prompt.txt"
echo "" >> "$PROMPT_DIR/disagreement_check_prompt.txt"

for critique_file in "$CRITIQUE_DIR"/Critique_*.md; do
    if [ -f "$critique_file" ]; then
        echo "### $(basename "$critique_file" .md)" >> "$PROMPT_DIR/disagreement_check_prompt.txt"
        echo "" >> "$PROMPT_DIR/disagreement_check_prompt.txt"
        cat "$critique_file" >> "$PROMPT_DIR/disagreement_check_prompt.txt"
        echo "" >> "$PROMPT_DIR/disagreement_check_prompt.txt"
        echo "---" >> "$PROMPT_DIR/disagreement_check_prompt.txt"
        echo "" >> "$PROMPT_DIR/disagreement_check_prompt.txt"
    fi
done

# Run disagreement analysis
if [ "$CLAUDE_LIMIT_HIT" = true ]; then
    echo "🔍 Running disagreement analysis (direct generation - CLI unavailable)..."
    
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "⏸️  MANUAL GENERATION REQUIRED"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "Claude assistant needs to generate:"
    echo "  → $CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md"
    echo ""
    echo "Context available at:"
    echo "  → $PROMPT_DIR/disagreement_check_prompt.txt"
    echo ""
    echo "📋 COPY THIS MESSAGE AND SEND TO CLAUDE:"
    echo ""
    echo "---"
    echo "Generate DISAGREEMENT_ANALYSIS.md for Phase 1 (Disagreement Check)"
    echo "Context file: $PROMPT_DIR/disagreement_check_prompt.txt"
    echo "Output file: $CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md"
    echo "Task: Analyze critiques for technical/business case disagreements"
    echo "---"
    echo ""
    read -p "Press Enter AFTER Claude has generated the file..."
    echo ""
    
    # Verify file was actually created with real content
    if [ ! -f "$CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md" ] || [ ! -s "$CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md" ]; then
        echo "❌ ERROR: DISAGREEMENT_ANALYSIS.md not found or empty"
        echo "   Please generate the file before continuing"
        exit 1
    fi
    
    # Check it's not just a placeholder
    if grep -q "Manual Generation Required" "$CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md"; then
        echo "❌ ERROR: DISAGREEMENT_ANALYSIS.md still contains placeholder text"
        echo "   Please replace with actual analysis"
        exit 1
    fi
    
    echo "✅ Disagreement analysis complete (manual generation verified)"
    
    # Check if iteration needed
    if grep -q "DISAGREEMENTS_FOUND: YES" "$CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md"; then
        echo ""
        echo "⚠️  Technical/business case disagreements detected!"
        echo "    Iteration required: orchestrate_technical_iteration.sh"
        echo ""
    else
        echo ""
        echo "✅ No disagreements - all LLMs agree on technical and business case facts"
        echo "   (Strategic differences are preserved as intended)"
        echo ""
    fi
else
    echo "🔍 Running disagreement analysis (Claude)..."
    cat "$PROMPT_DIR/disagreement_check_prompt.txt" | \
    claude --system-prompt "$SYSTEM_PROMPT" -p "$PROMPT_DISAGREEMENT" \
    > "$CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md" 2>&1
    
    # Check if iteration needed
    if grep -q "DISAGREEMENTS_FOUND: YES" "$CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md"; then
        echo ""
        echo "⚠️  Technical/business case disagreements detected!"
        echo "    Iteration required: orchestrate_technical_iteration.sh"
        echo ""
    else
        echo ""
        echo "✅ No disagreements - all LLMs agree on technical and business case facts"
        echo "   (Strategic differences are preserved as intended)"
        echo ""
    fi
fi

# Summary
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  ✅ Phase 1 Complete: Cross-Validation                       ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Outputs:"
echo "  • Gemini: $(wc -l < "$CRITIQUE_DIR/Critique_Gemini.md") lines"
echo "  • ChatGPT: $(wc -l < "$CRITIQUE_DIR/Critique_Codex.md") lines"
echo "  • Grok: $(wc -l < "$CRITIQUE_DIR/Critique_Grok.md") lines"
echo "  • Claude: $(wc -l < "$CRITIQUE_DIR/Critique_Claude.md") lines"
echo "  • Disagreement Analysis: $(wc -l < "$CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md") lines"
echo ""

if grep -q "DISAGREEMENTS_FOUND: YES" "$CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md"; then
    echo "Next: Run orchestrate_technical_iteration.sh"
else
    echo "Next: Run orchestrate_synthesis.sh"
fi
echo ""

