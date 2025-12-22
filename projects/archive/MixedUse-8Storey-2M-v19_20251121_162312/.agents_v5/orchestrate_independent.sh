#!/bin/bash

# Multi-LLM Independent Generation - v5.2
# Each LLM works independently to generate 1-3 approaches

set -e

# Source shared prompts
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/PROMPTS_CONFIG.sh"

# Rate limit flags (set to true if CLI unavailable)
CLAUDE_LIMIT_HIT=false  # CLI working
CODEX_LIMIT_HIT=false   # Codex uses file path (not stdin)
GROK_LIMIT_HIT=false
GEMINI_LIMIT_HIT=false

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REQUIREMENTS="$PROJECT_DIR/00_REQUIREMENTS/Requirements.md"
OUTPUT_DIR="$PROJECT_DIR/01_DIVERGENT_GENERATION"

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  Phase 0: Independent Generation (4 LLMs in parallel)        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check requirements exist
if [ ! -f "$REQUIREMENTS" ]; then
    echo "❌ ERROR: Requirements.md not found at $REQUIREMENTS"
    exit 1
fi

mkdir -p "$OUTPUT_DIR"

# Create shared context for all LLMs
cat > "$OUTPUT_DIR/shared_context.txt" << CONTEXT_EOF
$CONTEXT_GENERATION
CONTEXT_EOF

# Append requirements
echo "" >> "$OUTPUT_DIR/shared_context.txt"
echo "## PROJECT REQUIREMENTS" >> "$OUTPUT_DIR/shared_context.txt"
echo "" >> "$OUTPUT_DIR/shared_context.txt"
cat "$REQUIREMENTS" >> "$OUTPUT_DIR/shared_context.txt"

# Append FULL reference materials (like run_filter_patterns_review.sh does)
# Note: PROJECT_DIR is projects/ProjectName, so ../../ goes to root
ROOT_DIR="$PROJECT_DIR/../.."

echo "" >> "$OUTPUT_DIR/shared_context.txt"
echo "## REFERENCE MATERIALS (ALL CONTENT INCLUDED BELOW)" >> "$OUTPUT_DIR/shared_context.txt"
echo "" >> "$OUTPUT_DIR/shared_context.txt"

echo "## REFERENCE: FILTER_PATTERNS.md" >> "$OUTPUT_DIR/shared_context.txt"
echo "" >> "$OUTPUT_DIR/shared_context.txt"
cat "$ROOT_DIR/FILTER_PATTERNS.md" >> "$OUTPUT_DIR/shared_context.txt" 2>/dev/null || echo "[FILTER_PATTERNS.md not found at $ROOT_DIR]" >> "$OUTPUT_DIR/shared_context.txt"

echo "" >> "$OUTPUT_DIR/shared_context.txt"
echo "## REFERENCE: LEARNINGS_DATABASE.md" >> "$OUTPUT_DIR/shared_context.txt"
echo "" >> "$OUTPUT_DIR/shared_context.txt"
cat "$ROOT_DIR/LEARNINGS_DATABASE.md" >> "$OUTPUT_DIR/shared_context.txt" 2>/dev/null || echo "[LEARNINGS_DATABASE.md not found at $ROOT_DIR]" >> "$OUTPUT_DIR/shared_context.txt"

echo "" >> "$OUTPUT_DIR/shared_context.txt"
echo "## REFERENCE: SearchLand Available Filters (CRITICAL - Use ONLY These)" >> "$OUTPUT_DIR/shared_context.txt"
echo "" >> "$OUTPUT_DIR/shared_context.txt"
cat "$ROOT_DIR/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" >> "$OUTPUT_DIR/shared_context.txt" 2>/dev/null || echo "[AvailableFiltersInSearchLand_ACTUAL.md not found at $ROOT_DIR]" >> "$OUTPUT_DIR/shared_context.txt"

echo "" >> "$OUTPUT_DIR/shared_context.txt"
echo "## REFERENCE: Preset Filters (86 Expert Examples)" >> "$OUTPUT_DIR/shared_context.txt"
echo "" >> "$OUTPUT_DIR/shared_context.txt"
cat "$ROOT_DIR/SearchlandContext/PresetFiltersBuiltIntoSearchLand.md" >> "$OUTPUT_DIR/shared_context.txt" 2>/dev/null || echo "[PresetFiltersBuiltIntoSearchLand.md not found at $ROOT_DIR]" >> "$OUTPUT_DIR/shared_context.txt"

echo "" >> "$OUTPUT_DIR/shared_context.txt"
echo "## REFERENCE: Preset Strategy Guide" >> "$OUTPUT_DIR/shared_context.txt"
echo "" >> "$OUTPUT_DIR/shared_context.txt"
cat "$ROOT_DIR/PRESET_STRATEGY_GUIDE.md" >> "$OUTPUT_DIR/shared_context.txt" 2>/dev/null || echo "[PRESET_STRATEGY_GUIDE.md not found at $ROOT_DIR]" >> "$OUTPUT_DIR/shared_context.txt"

# Generate approaches with each LLM in parallel
generate_gemini() {
    echo "🔷 Running Gemini..."
    
    cat "$OUTPUT_DIR/shared_context.txt" | \
    gemini -p "$PROMPT_GENERATION" \
    > "$OUTPUT_DIR/Gemini_Approaches.md" 2>&1
    
    echo "✅ Gemini complete"
}

generate_codex() {
    echo "🔶 Running Codex..."
    
    # Codex doesn't read stdin - must give it file path
    codex exec --skip-git-repo-check "Read the file at $OUTPUT_DIR/shared_context.txt and $PROMPT_GENERATION You are an expert property development analyst." \
    > "$OUTPUT_DIR/Codex_Approaches.md" 2>/dev/null
    
    echo "✅ Codex complete"
}

generate_grok() {
    echo "🟣 Running Grok..."
    
    cat "$OUTPUT_DIR/shared_context.txt" | \
    opencode run -m opencode/grok-code "$PROMPT_GENERATION" \
    > "$OUTPUT_DIR/Grok_Approaches.md" 2>&1
    
    echo "✅ Grok complete"
}

generate_claude() {
    if [ "$CLAUDE_LIMIT_HIT" = true ]; then
        echo "🔵 Claude generation (assistant mode)..."
        
        # Check if file already exists (from previous run or pre-generated)
        if [ -f "$OUTPUT_DIR/Claude_Approaches.md" ] && [ -s "$OUTPUT_DIR/Claude_Approaches.md" ]; then
            echo "✅ Claude file already exists, validating..."
            
            # Check it's not just a placeholder
            if grep -q "Manual Generation Required" "$OUTPUT_DIR/Claude_Approaches.md"; then
                echo "❌ ERROR: Claude_Approaches.md contains placeholder text"
                echo "   Please replace with actual approaches"
                exit 1
            fi
            
            echo "✅ Claude complete (file validated)"
        else
            # File doesn't exist - need to generate it
            echo ""
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo "⏸️  CLAUDE GENERATION REQUIRED"
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo ""
            echo "📋 COPY THIS MESSAGE AND SEND TO CLAUDE:"
            echo ""
            echo "---"
            echo "Generate Claude_Approaches.md for Phase 0 (Independent Generation)"
            echo "Context file: $OUTPUT_DIR/shared_context.txt"
            echo "Output file: $OUTPUT_DIR/Claude_Approaches.md"
            echo "Task: Generate 2 or more property search filter strategies"
            echo "---"
            echo ""
            echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
            echo ""
            read -p "Press Enter AFTER Claude has generated the file..."
            echo ""
            
            # Verify file was created
            if [ ! -f "$OUTPUT_DIR/Claude_Approaches.md" ] || [ ! -s "$OUTPUT_DIR/Claude_Approaches.md" ]; then
                echo "❌ ERROR: Claude_Approaches.md not found or empty"
                exit 1
            fi
            
            # Check it's not just a placeholder
            if grep -q "Manual Generation Required" "$OUTPUT_DIR/Claude_Approaches.md"; then
                echo "❌ ERROR: Claude_Approaches.md contains placeholder text"
                exit 1
            fi
            
            echo "✅ Claude complete (file validated)"
        fi
    else
        echo "🔵 Running Claude..."
        cat "$OUTPUT_DIR/shared_context.txt" | \
        claude --system-prompt "$SYSTEM_PROMPT" -p "$PROMPT_GENERATION" \
        > "$OUTPUT_DIR/Claude_Approaches.md" 2>&1
        echo "✅ Claude complete"
    fi
}

# Run all in parallel
generate_gemini &
PID_GEMINI=$!

generate_codex &
PID_CODEX=$!

generate_grok &
PID_GROK=$!

generate_claude &
PID_CLAUDE=$!

# Wait for all to complete
echo "⏳ Waiting for all LLMs to complete..."
echo "   • Gemini (PID $PID_GEMINI)"
echo "   • Codex (PID $PID_CODEX)"
echo "   • Grok (PID $PID_GROK)"
echo "   • Claude (PID $PID_CLAUDE)"
echo ""

wait $PID_GEMINI
wait $PID_CODEX
wait $PID_GROK
wait $PID_CLAUDE

# Summary
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  ✅ Phase 0 Complete: Independent Generation                 ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Outputs:"
echo "  • Gemini: $(wc -l < "$OUTPUT_DIR/Gemini_Approaches.md") lines"
echo "  • Codex: $(wc -l < "$OUTPUT_DIR/Codex_Approaches.md") lines"
echo "  • Grok: $(wc -l < "$OUTPUT_DIR/Grok_Approaches.md") lines"
echo "  • Claude: $(wc -l < "$OUTPUT_DIR/Claude_Approaches.md") lines"
echo ""
echo "Next: Run orchestrate_crossvalidation.sh"
echo ""

