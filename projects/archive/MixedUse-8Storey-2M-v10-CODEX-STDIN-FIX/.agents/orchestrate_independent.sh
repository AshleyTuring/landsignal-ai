#!/bin/bash

# Multi-LLM Independent Generation - v5.0
# Each LLM works independently to generate 1-3 approaches

set -e

# Rate limit flags (set to true if CLI unavailable)
CLAUDE_LIMIT_HIT=true   # Session limit until 3pm
CODEX_LIMIT_HIT=true    # stdin not working reliably with codex exec
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
cat > "$OUTPUT_DIR/shared_context.txt" << 'CONTEXT_EOF'
# SearchLand Filter Generation - Independent Approach

## Your Task
Generate 1-3 unique property search strategies based on the requirements below.

## Key Constraints
1. **Work Independently:** Do NOT see other LLM outputs. Generate YOUR unique perspective.
2. **Reference Materials:** See FILTER_PATTERNS and LEARNINGS_DATABASE sections below
3. **Technical Validity:** All filters MUST exist in available filters list (see below)
4. **Capital Feasibility:** Approaches MUST meet budget requirements
5. **Precedent Analysis:** At least ONE approach should be based on reference planning application(s)

**IMPORTANT:** All reference materials are included in this prompt below. Do NOT attempt to read external files.

## Output Format
For each approach, provide:

### Approach [Letter]: [Name]
**Strategic Pattern:** [Which pattern from FILTER_PATTERNS.md]  
**Capital Required:** [Breakdown]  
**Expected Results:** [Estimated property count]

**SearchLand AI Prompt:**
```
1. [Filter name]: [operator] [value]
2. [Filter name]: [operator] [value]
...
```

**Rationale:**
[Why this approach works]

**Strengths:**
- [List]

**Limitations:**
- [List]

**Implementation Strategy:**
[How to execute]

---

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
    gemini -p "You are an expert property development analyst. Generate 1-3 unique property search strategies based on the requirements. Focus on strategic, high-level patterns and regulatory opportunities." \
    > "$OUTPUT_DIR/Gemini_Approaches.md" 2>&1
    
    echo "✅ Gemini complete"
}

generate_codex() {
    if [ "$CODEX_LIMIT_HIT" = true ]; then
        echo "🔶 Running Codex (direct generation - stdin not working with CLI)..."
        # Codex CLI doesn't reliably read from stdin, so generate manually
        cat "$OUTPUT_DIR/shared_context.txt" > "$OUTPUT_DIR/codex_generation_prompt.txt"
        
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "⏸️  MANUAL GENERATION REQUIRED"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "Assistant needs to generate:"
        echo "  → $OUTPUT_DIR/Codex_Approaches.md"
        echo ""
        echo "Context available at:"
        echo "  → $OUTPUT_DIR/codex_generation_prompt.txt"
        echo ""
        echo "Instruction: Focus on detailed execution, technical precision, and niche opportunities."
        echo ""
        read -p "Press Enter AFTER Codex approaches have been generated..."
        
        # Verify file exists and is not empty
        if [ ! -f "$OUTPUT_DIR/Codex_Approaches.md" ] || [ ! -s "$OUTPUT_DIR/Codex_Approaches.md" ]; then
            echo "❌ ERROR: Codex_Approaches.md not found or empty after manual generation."
            exit 1
        fi
        if grep -q "Manual Generation Required\|OpenAI Codex v0.58.0" "$OUTPUT_DIR/Codex_Approaches.md"; then
            echo "❌ ERROR: Codex_Approaches.md contains placeholder/header content. Please generate real content."
            exit 1
        fi
        echo "✅ Codex approaches manually generated and verified."
    else
        echo "🔶 Running Codex..."
        cat "$OUTPUT_DIR/shared_context.txt" | \
        codex exec --skip-git-repo-check "You are an expert property development analyst. Generate 1-3 unique property search strategies based on the requirements. Focus on detailed execution, technical precision, and niche opportunities." \
        > "$OUTPUT_DIR/Codex_Approaches.md" 2>&1
        
        echo "✅ Codex complete"
    fi
}

generate_grok() {
    echo "🟣 Running Grok..."
    
    cat "$OUTPUT_DIR/shared_context.txt" | \
    opencode run -m opencode/grok-code "You are an expert property development analyst. Generate 1-3 unique property search strategies based on the requirements. Focus on speed/timing advantages and innovative arbitrage opportunities." \
    > "$OUTPUT_DIR/Grok_Approaches.md" 2>&1
    
    echo "✅ Grok complete"
}

generate_claude() {
    if [ "$CLAUDE_LIMIT_HIT" = true ]; then
        echo "🔵 Running Claude (direct generation - CLI unavailable)..."
        
        echo ""
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo "⏸️  MANUAL GENERATION REQUIRED"
        echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
        echo ""
        echo "Claude assistant needs to generate:"
        echo "  → $OUTPUT_DIR/Claude_Approaches.md"
        echo ""
        echo "Context available at:"
        echo "  → $OUTPUT_DIR/shared_context.txt"
        echo ""
        read -p "Press Enter AFTER Claude has generated the file..."
        echo ""
        
        # Verify file was actually created with real content
        if [ ! -f "$OUTPUT_DIR/Claude_Approaches.md" ] || [ ! -s "$OUTPUT_DIR/Claude_Approaches.md" ]; then
            echo "❌ ERROR: Claude_Approaches.md not found or empty"
            echo "   Please generate the file before continuing"
            exit 1
        fi
        
        # Check it's not just a placeholder
        if grep -q "Manual Generation Required" "$OUTPUT_DIR/Claude_Approaches.md"; then
            echo "❌ ERROR: Claude_Approaches.md still contains placeholder text"
            echo "   Please replace with actual approaches"
            exit 1
        fi
        
        echo "✅ Claude complete (manual generation verified)"
    else
        echo "🔵 Running Claude..."
        cat "$OUTPUT_DIR/shared_context.txt" | \
        claude -p "You are an expert property development analyst. Generate 1-3 unique property search strategies based on the requirements. Focus on risk mitigation, precedent analysis, and behavioral signals." \
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

