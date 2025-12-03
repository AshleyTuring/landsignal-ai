#!/bin/bash

# Multi-Agent Filter Extraction - Create Testing-Ready Documents
# Automatically extracts validated approaches into user-friendly format

set -e

PROJECT_DIR="/home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v4"
AGENTS_DIR="$PROJECT_DIR/.agents"

echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║          Multi-Agent Extraction System v3.1                      ║"
echo "║         Creating Testing-Ready Documents                         ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""

# Create extraction context
create_extraction_context() {
    echo "Creating extraction context..."
    
    cat > "$AGENTS_DIR/extraction_context.txt" << 'EXTRACTION_PROMPT'
# EXTRACTION TASK: Create Testing-Ready Documents

You are extracting validated filter approaches into user-friendly testing documents.

## YOUR TASK
For EACH VALID approach from the validation matrix, create a standalone document with:

### Required Sections:
1. **SearchLand AI Prompt** - The exact filter criteria (numbered list, copy-paste ready)
2. **Justification** - Why this strategy works (150-200 words)
3. **Key Criteria** - Main filters explained (bullet points)
4. **Strengths** - 5+ advantages
5. **Limitations** - 5+ risks with mitigations
6. **Implementation Strategy** - Capital deployment, profit pathway, timeline

### Output Format:
Create separate markdown files named:
- ApproachA_ReadyToTest.md
- ApproachC_ReadyToTest.md
(etc. for all VALID approaches)

### Instructions:
- Extract from the original approach files (AgentGemini_Output.md, etc.)
- Use clear formatting with headers and bullet points
- Make SearchLand AI Prompt section VERY clear (users will copy-paste)
- Keep justification concise but compelling
- Include expected result counts
- Add testing notes at the end

---

EXTRACTION_PROMPT

    # Append validation matrix and approaches
    cat "$PROJECT_DIR/02_VALIDITY_CHECK/FINAL_ValidationMatrix.md" \
        "$PROJECT_DIR/01_DIVERGENT_GENERATION/AgentGemini_Output.md" \
        "$PROJECT_DIR/01_DIVERGENT_GENERATION/AgentCodex_Output.md" \
        "$PROJECT_DIR/01_DIVERGENT_GENERATION/AgentClaude_Output.md" >> "$AGENTS_DIR/extraction_context.txt"
    
    echo "✅ Extraction context created ($(wc -l < $AGENTS_DIR/extraction_context.txt) lines)"
}

# Run extraction
run_extraction() {
    echo ""
    echo "🤖 Running extraction for VALID approaches..."
    echo "   Creating testing-ready documents..."
    
    cat "$AGENTS_DIR/extraction_context.txt" | \
    claude > "$PROJECT_DIR/03_PARALLEL_TESTING/AUTO_ExtractionOutput.md" 2>&1
    
    echo "✅ Extraction complete"
}

echo "═══════════════════════════════════════════════════════════════════"
echo "📦 STAGE 7: Preparing Extraction Context"
echo "═══════════════════════════════════════════════════════════════════"
create_extraction_context

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "📝 STAGE 8: Creating Testing Documents"
echo "═══════════════════════════════════════════════════════════════════"

run_extraction

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "✅ EXTRACTION COMPLETE!"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "📊 Output:"
ls -lh "$PROJECT_DIR/03_PARALLEL_TESTING/AUTO_ExtractionOutput.md" | awk '{print "   •", $9, "-", $5}'
echo ""
echo "Testing-ready documents created for all VALID approaches"
echo ""

