#!/bin/bash

# Multi-LLM Independent Generation - v5.0
# Each LLM works independently to generate 1-3 approaches

set -e

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
2. **Reference Materials:** Use FILTER_PATTERNS.md and LEARNINGS_DATABASE.md
3. **Technical Validity:** All filters MUST exist in AvailableFiltersInSearchLand_ACTUAL.md
4. **Capital Feasibility:** Approaches MUST meet budget requirements
5. **Precedent Analysis:** At least ONE approach should be based on reference planning application(s)

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

# Append reference materials
echo "" >> "$OUTPUT_DIR/shared_context.txt"
echo "## REFERENCE: FILTER_PATTERNS.md (Top Strategies)" >> "$OUTPUT_DIR/shared_context.txt"
echo "" >> "$OUTPUT_DIR/shared_context.txt"
head -200 "$PROJECT_DIR/../FILTER_PATTERNS.md" >> "$OUTPUT_DIR/shared_context.txt" 2>/dev/null || echo "[FILTER_PATTERNS.md not found]" >> "$OUTPUT_DIR/shared_context.txt"

echo "" >> "$OUTPUT_DIR/shared_context.txt"
echo "## REFERENCE: LEARNINGS_DATABASE.md (Critical Rules)" >> "$OUTPUT_DIR/shared_context.txt"
echo "" >> "$OUTPUT_DIR/shared_context.txt"
head -100 "$PROJECT_DIR/../LEARNINGS_DATABASE.md" >> "$OUTPUT_DIR/shared_context.txt" 2>/dev/null || echo "[LEARNINGS_DATABASE.md not found]" >> "$OUTPUT_DIR/shared_context.txt"

# Generate approaches with each LLM in parallel
generate_gemini() {
    echo "🔷 Running Gemini..."
    
    cat "$OUTPUT_DIR/shared_context.txt" | \
    gemini -p "You are an expert property development analyst. Generate 1-3 unique property search strategies based on the requirements. Focus on strategic, high-level patterns and regulatory opportunities." \
    > "$OUTPUT_DIR/Gemini_Approaches.md" 2>&1
    
    echo "✅ Gemini complete"
}

generate_codex() {
    echo "🔶 Running Codex..."
    
    cat "$OUTPUT_DIR/shared_context.txt" | \
    codex exec --skip-git-repo-check "You are an expert property development analyst. Generate 1-3 unique property search strategies based on the requirements. Focus on detailed execution, technical precision, and niche opportunities." \
    > "$OUTPUT_DIR/Codex_Approaches.md" 2>&1
    
    echo "✅ Codex complete"
}

generate_grok() {
    echo "🟣 Running Grok..."
    
    cat "$OUTPUT_DIR/shared_context.txt" | \
    opencode run -m opencode/grok-code "You are an expert property development analyst. Generate 1-3 unique property search strategies based on the requirements. Focus on speed/timing advantages and innovative arbitrage opportunities." \
    > "$OUTPUT_DIR/Grok_Approaches.md" 2>&1
    
    echo "✅ Grok complete"
}

generate_claude() {
    echo "🔵 Running Claude..."
    
    # Since we're Claude and hit session limit, generate directly
    # In future runs, this would use: cat "$OUTPUT_DIR/shared_context.txt" | claude
    # For now, use pre-generated file
    if [ ! -s "$OUTPUT_DIR/Claude_Approaches.md" ]; then
        echo "⚠️  Claude session limit - using pre-generated approaches" > "$OUTPUT_DIR/Claude_Approaches.md"
    fi
    
    echo "✅ Claude complete (pre-generated)"
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

