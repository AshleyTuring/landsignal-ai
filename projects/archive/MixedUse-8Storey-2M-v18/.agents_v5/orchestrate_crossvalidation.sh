#!/bin/bash

# Multi-LLM Cross-Validation - v5.2
# Each LLM reviews ALL approaches for technical validity

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
OUTPUT_DIR="$PROJECT_DIR/02_VALIDITY_CHECK"

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  Phase 1: Cross-Validation (4 LLMs in parallel)             ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check inputs exist
if [ ! -d "$GENERATION_DIR" ]; then
    echo "❌ ERROR: Generation directory not found. Run orchestrate_independent.sh first."
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

# Create critique context (all approaches)
cat > "$OUTPUT_DIR/critique_context.txt" << CONTEXT_EOF
$CONTEXT_CRITIQUE
CONTEXT_EOF

# Append all approaches
echo "" >> "$OUTPUT_DIR/critique_context.txt"
echo "## ALL APPROACHES TO REVIEW (Original Generation)" >> "$OUTPUT_DIR/critique_context.txt"
echo "" >> "$OUTPUT_DIR/critique_context.txt"

for llm_file in "$GENERATION_DIR"/*.md; do
    if [ -f "$llm_file" ]; then
        echo "### $(basename "$llm_file" .md)" >> "$OUTPUT_DIR/critique_context.txt"
        echo "" >> "$OUTPUT_DIR/critique_context.txt"
        cat "$llm_file" >> "$OUTPUT_DIR/critique_context.txt"
        echo "" >> "$OUTPUT_DIR/critique_context.txt"
        echo "---" >> "$OUTPUT_DIR/critique_context.txt"
        echo "" >> "$OUTPUT_DIR/critique_context.txt"
    fi
done

# 🔹 NEW: Append UPDATED POSITIONS from any prior iteration (if they exist)
if ls "$OUTPUT_DIR"/Iteration_*.md >/dev/null 2>&1; then
    echo "" >> "$OUTPUT_DIR/critique_context.txt"
    echo "## UPDATED POSITIONS (FROM PRIOR ITERATION - USE THESE FOR VALIDATION)" >> "$OUTPUT_DIR/critique_context.txt"
    echo "" >> "$OUTPUT_DIR/critique_context.txt"
    echo "NOTE: These updated positions supersede the original approaches above." >> "$OUTPUT_DIR/critique_context.txt"
    echo "Validate these updated positions for technical and business case validity." >> "$OUTPUT_DIR/critique_context.txt"
    echo "" >> "$OUTPUT_DIR/critique_context.txt"
    
    for iteration_file in "$OUTPUT_DIR"/Iteration_*.md; do
        if [ -f "$iteration_file" ]; then
            echo "### $(basename "$iteration_file" .md)" >> "$OUTPUT_DIR/critique_context.txt"
            echo "" >> "$OUTPUT_DIR/critique_context.txt"
            cat "$iteration_file" >> "$OUTPUT_DIR/critique_context.txt"
            echo "" >> "$OUTPUT_DIR/critique_context.txt"
            echo "---" >> "$OUTPUT_DIR/critique_context.txt"
            echo "" >> "$OUTPUT_DIR/critique_context.txt"
        fi
    done
fi

# Append FULL reference materials (like run_filter_patterns_review.sh does)
# Note: PROJECT_DIR is projects/ProjectName, so ../../ goes to root
ROOT_DIR="$PROJECT_DIR/../.."

echo "" >> "$OUTPUT_DIR/critique_context.txt"
echo "## REFERENCE MATERIALS (ALL CONTENT INCLUDED BELOW)" >> "$OUTPUT_DIR/critique_context.txt"
echo "" >> "$OUTPUT_DIR/critique_context.txt"

echo "## REFERENCE: SearchLand Available Filters (CRITICAL - Use ONLY These)" >> "$OUTPUT_DIR/critique_context.txt"
echo "" >> "$OUTPUT_DIR/critique_context.txt"
cat "$ROOT_DIR/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" >> "$OUTPUT_DIR/critique_context.txt" 2>/dev/null || echo "[AvailableFiltersInSearchLand_ACTUAL.md not found at $ROOT_DIR]" >> "$OUTPUT_DIR/critique_context.txt"

echo "" >> "$OUTPUT_DIR/critique_context.txt"
echo "## REFERENCE: LEARNINGS_DATABASE.md" >> "$OUTPUT_DIR/critique_context.txt"
echo "" >> "$OUTPUT_DIR/critique_context.txt"
cat "$ROOT_DIR/LEARNINGS_DATABASE.md" >> "$OUTPUT_DIR/critique_context.txt" 2>/dev/null || echo "[LEARNINGS_DATABASE.md not found at $ROOT_DIR]" >> "$OUTPUT_DIR/critique_context.txt"

# Run critiques in parallel
critique_gemini() {
    echo "🔷 Running Gemini critique..."
    
    cat "$OUTPUT_DIR/critique_context.txt" | \
    gemini -p "$PROMPT_CRITIQUE" \
    > "$OUTPUT_DIR/Gemini_Critique.md" 2>&1
    
    echo "✅ Gemini critique complete"
}

critique_codex() {
    echo "🔶 Running Codex critique..."
    
    # Codex doesn't read stdin - must give it file path
    codex exec --skip-git-repo-check "Read the file at $OUTPUT_DIR/critique_context.txt and $PROMPT_CRITIQUE" \
    > "$OUTPUT_DIR/Codex_Critique.md" 2>/dev/null
    
    echo "✅ Codex critique complete"
}

critique_grok() {
    echo "🟣 Running Grok critique..."
    
    cat "$OUTPUT_DIR/critique_context.txt" | \
    opencode run -m opencode/grok-code "$PROMPT_CRITIQUE" \
    > "$OUTPUT_DIR/Grok_Critique.md" 2>&1
    
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
        echo "  → $OUTPUT_DIR/Claude_Critique.md"
        echo ""
        echo "Context available at:"
        echo "  → $OUTPUT_DIR/critique_context.txt"
        echo ""
        echo "📋 COPY THIS MESSAGE AND SEND TO CLAUDE:"
        echo ""
        echo "---"
        echo "Generate Claude_Critique.md for Phase 1 (Cross-Validation)"
        echo "Context file: $OUTPUT_DIR/critique_context.txt"
        echo "Output file: $OUTPUT_DIR/Claude_Critique.md"
        echo "Task: Critique all approaches for technical and business validity"
        echo "---"
        echo ""
        read -p "Press Enter AFTER Claude has generated the file..."
        echo ""
        
        # Verify file was actually created with real content
        if [ ! -f "$OUTPUT_DIR/Claude_Critique.md" ] || [ ! -s "$OUTPUT_DIR/Claude_Critique.md" ]; then
            echo "❌ ERROR: Claude_Critique.md not found or empty"
            echo "   Please generate the file before continuing"
            exit 1
        fi
        
        # Check it's not just a placeholder
        if grep -q "Manual Generation Required" "$OUTPUT_DIR/Claude_Critique.md"; then
            echo "❌ ERROR: Claude_Critique.md still contains placeholder text"
            echo "   Please replace with actual critique"
            exit 1
        fi
        
        echo "✅ Claude critique complete (manual generation verified)"
    else
        echo "🔵 Running Claude critique..."
        cat "$OUTPUT_DIR/critique_context.txt" | \
        claude --system-prompt "$SYSTEM_PROMPT" -p "$PROMPT_CRITIQUE" \
        > "$OUTPUT_DIR/Claude_Critique.md" 2>&1
        echo "✅ Claude critique complete"
    fi
}

# Run all in parallel
critique_gemini &
PID_GEMINI=$!

critique_codex &
PID_CODEX=$!

critique_grok &
PID_GROK=$!

critique_claude &
PID_CLAUDE=$!

# Wait for all to complete
echo "⏳ Waiting for all critiques to complete..."
echo "   • Gemini (PID $PID_GEMINI)"
echo "   • Codex (PID $PID_CODEX)"
echo "   • Grok (PID $PID_GROK)"
echo "   • Claude (PID $PID_CLAUDE)"
echo ""

wait $PID_GEMINI
wait $PID_CODEX
wait $PID_GROK
wait $PID_CLAUDE

# Check for technical disagreements
echo ""
echo "🔍 Checking for technical disagreements..."
echo ""

cat > "$OUTPUT_DIR/disagreement_check_prompt.txt" << CONTEXT_EOF
$CONTEXT_DISAGREEMENT
CONTEXT_EOF

# Append critiques
echo "" >> "$OUTPUT_DIR/disagreement_check_prompt.txt"
echo "## CRITIQUES TO ANALYZE" >> "$OUTPUT_DIR/disagreement_check_prompt.txt"
echo "" >> "$OUTPUT_DIR/disagreement_check_prompt.txt"

for critique_file in "$OUTPUT_DIR"/*_Critique.md; do
    if [ -f "$critique_file" ]; then
        echo "### $(basename "$critique_file" .md)" >> "$OUTPUT_DIR/disagreement_check_prompt.txt"
        echo "" >> "$OUTPUT_DIR/disagreement_check_prompt.txt"
        cat "$critique_file" >> "$OUTPUT_DIR/disagreement_check_prompt.txt"
        echo "" >> "$OUTPUT_DIR/disagreement_check_prompt.txt"
        echo "---" >> "$OUTPUT_DIR/disagreement_check_prompt.txt"
        echo "" >> "$OUTPUT_DIR/disagreement_check_prompt.txt"
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
    echo "  → $OUTPUT_DIR/DISAGREEMENT_ANALYSIS.md"
    echo ""
    echo "Context available at:"
    echo "  → $OUTPUT_DIR/disagreement_check_prompt.txt"
    echo ""
    echo "📋 COPY THIS MESSAGE AND SEND TO CLAUDE:"
    echo ""
    echo "---"
    echo "Generate DISAGREEMENT_ANALYSIS.md for Phase 1 (Disagreement Check)"
    echo "Context file: $OUTPUT_DIR/disagreement_check_prompt.txt"
    echo "Output file: $OUTPUT_DIR/DISAGREEMENT_ANALYSIS.md"
    echo "Task: Analyze critiques for technical/business case disagreements"
    echo "---"
    echo ""
    read -p "Press Enter AFTER Claude has generated the file..."
    echo ""
    
    # Verify file was actually created with real content
    if [ ! -f "$OUTPUT_DIR/DISAGREEMENT_ANALYSIS.md" ] || [ ! -s "$OUTPUT_DIR/DISAGREEMENT_ANALYSIS.md" ]; then
        echo "❌ ERROR: DISAGREEMENT_ANALYSIS.md not found or empty"
        echo "   Please generate the file before continuing"
        exit 1
    fi
    
    # Check it's not just a placeholder
    if grep -q "Manual Generation Required" "$OUTPUT_DIR/DISAGREEMENT_ANALYSIS.md"; then
        echo "❌ ERROR: DISAGREEMENT_ANALYSIS.md still contains placeholder text"
        echo "   Please replace with actual analysis"
        exit 1
    fi
    
    echo "✅ Disagreement analysis complete (manual generation verified)"
    
    # Check if iteration needed
    if grep -q "DISAGREEMENTS_FOUND: YES" "$OUTPUT_DIR/DISAGREEMENT_ANALYSIS.md"; then
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
    cat "$OUTPUT_DIR/disagreement_check_prompt.txt" | \
    claude --system-prompt "$SYSTEM_PROMPT" -p "$PROMPT_DISAGREEMENT" \
    > "$OUTPUT_DIR/DISAGREEMENT_ANALYSIS.md" 2>&1
    
    # Check if iteration needed
    if grep -q "DISAGREEMENTS_FOUND: YES" "$OUTPUT_DIR/DISAGREEMENT_ANALYSIS.md"; then
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
echo "  • Gemini: $(wc -l < "$OUTPUT_DIR/Gemini_Critique.md") lines"
echo "  • Codex: $(wc -l < "$OUTPUT_DIR/Codex_Critique.md") lines"
echo "  • Grok: $(wc -l < "$OUTPUT_DIR/Grok_Critique.md") lines"
echo "  • Claude: $(wc -l < "$OUTPUT_DIR/Claude_Critique.md") lines"
echo "  • Disagreement Analysis: $(wc -l < "$OUTPUT_DIR/DISAGREEMENT_ANALYSIS.md") lines"
echo ""

if grep -q "DISAGREEMENTS_FOUND: YES" "$OUTPUT_DIR/DISAGREEMENT_ANALYSIS.md"; then
    echo "Next: Run orchestrate_technical_iteration.sh"
else
    echo "Next: Run orchestrate_synthesis.sh"
fi
echo ""

