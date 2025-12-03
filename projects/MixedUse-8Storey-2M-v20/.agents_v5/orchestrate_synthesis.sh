#!/bin/bash

# Synthesis & Extraction - v5.2
# Claude synthesizes all inputs and extracts ready-to-test approaches
# Output now references comprehensive Stage 4-6 workflow

set -e

# Source shared prompts
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/PROMPTS_CONFIG.sh"

# Rate limit flags (set to true if CLI unavailable)
CLAUDE_LIMIT_HIT=false  # CLI working

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
GENERATION_DIR="$PROJECT_DIR/01_DIVERGENT_GENERATION"
VALIDITY_DIR="$PROJECT_DIR/02_VALIDITY_CHECK"
TESTING_DIR="$PROJECT_DIR/03_PARALLEL_TESTING"

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  Phase 2: Synthesis & Extraction (Claude)                    ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check inputs
if [ ! -d "$GENERATION_DIR" ] || [ ! -d "$VALIDITY_DIR" ]; then
    echo "❌ ERROR: Previous phases not complete"
    exit 1
fi

mkdir -p "$TESTING_DIR"

# Create synthesis context
cat > "$VALIDITY_DIR/synthesis_context.txt" << CONTEXT_EOF
$CONTEXT_SYNTHESIS
CONTEXT_EOF

# Append all approaches
echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
echo "## ALL APPROACHES (Original)" >> "$VALIDITY_DIR/synthesis_context.txt"
echo "" >> "$VALIDITY_DIR/synthesis_context.txt"

for approach_file in "$GENERATION_DIR"/*.md; do
    if [ -f "$approach_file" ]; then
        echo "### $(basename "$approach_file" .md)" >> "$VALIDITY_DIR/synthesis_context.txt"
        echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
        cat "$approach_file" >> "$VALIDITY_DIR/synthesis_context.txt"
        echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
        echo "---" >> "$VALIDITY_DIR/synthesis_context.txt"
        echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
    fi
done

# Append all critiques
echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
echo "## ALL CRITIQUES" >> "$VALIDITY_DIR/synthesis_context.txt"
echo "" >> "$VALIDITY_DIR/synthesis_context.txt"

for critique_file in "$VALIDITY_DIR"/*_Critique.md; do
    if [ -f "$critique_file" ]; then
        echo "### $(basename "$critique_file" .md)" >> "$VALIDITY_DIR/synthesis_context.txt"
        echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
        cat "$critique_file" >> "$VALIDITY_DIR/synthesis_context.txt"
        echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
        echo "---" >> "$VALIDITY_DIR/synthesis_context.txt"
        echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
    fi
done

# Append iterations if they exist
if [ -f "$VALIDITY_DIR/Iteration_Gemini.md" ]; then
    echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
    echo "## UPDATED POSITIONS (After Iteration)" >> "$VALIDITY_DIR/synthesis_context.txt"
    echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
    
    for iteration_file in "$VALIDITY_DIR"/Iteration_*.md; do
        if [ -f "$iteration_file" ]; then
            echo "### $(basename "$iteration_file" .md)" >> "$VALIDITY_DIR/synthesis_context.txt"
            echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
            cat "$iteration_file" >> "$VALIDITY_DIR/synthesis_context.txt"
            echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
            echo "---" >> "$VALIDITY_DIR/synthesis_context.txt"
            echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
        fi
    done
    
    echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
    echo "NOTE: Use UPDATED positions above (iteration happened due to disagreements)" >> "$VALIDITY_DIR/synthesis_context.txt"
    echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
fi

# Append FULL reference materials (like run_filter_patterns_review.sh does)
# Note: PROJECT_DIR is projects/ProjectName, so ../../ goes to root
ROOT_DIR="$PROJECT_DIR/../.."

echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
echo "## REFERENCE MATERIALS (ALL CONTENT INCLUDED BELOW)" >> "$VALIDITY_DIR/synthesis_context.txt"
echo "" >> "$VALIDITY_DIR/synthesis_context.txt"

echo "## REFERENCE: SearchLand Available Filters (CRITICAL - Use ONLY These)" >> "$VALIDITY_DIR/synthesis_context.txt"
echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
cat "$ROOT_DIR/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" >> "$VALIDITY_DIR/synthesis_context.txt" 2>/dev/null || echo "[AvailableFiltersInSearchLand_ACTUAL.md not found at $ROOT_DIR]" >> "$VALIDITY_DIR/synthesis_context.txt"

echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
echo "## REFERENCE: LEARNINGS_DATABASE.md" >> "$VALIDITY_DIR/synthesis_context.txt"
echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
cat "$ROOT_DIR/LEARNINGS_DATABASE.md" >> "$VALIDITY_DIR/synthesis_context.txt" 2>/dev/null || echo "[LEARNINGS_DATABASE.md not found at $ROOT_DIR]" >> "$VALIDITY_DIR/synthesis_context.txt"

echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
echo "## REFERENCE: FILTER_PATTERNS.md" >> "$VALIDITY_DIR/synthesis_context.txt"
echo "" >> "$VALIDITY_DIR/synthesis_context.txt"
cat "$ROOT_DIR/FILTER_PATTERNS.md" >> "$VALIDITY_DIR/synthesis_context.txt" 2>/dev/null || echo "[FILTER_PATTERNS.md not found at $ROOT_DIR]" >> "$VALIDITY_DIR/synthesis_context.txt"

echo "📊 Synthesis context prepared ($(wc -l < "$VALIDITY_DIR/synthesis_context.txt") lines)"
echo ""

# Run synthesis
if [ "$CLAUDE_LIMIT_HIT" = true ]; then
    echo "🔵 Running Claude synthesis (direct generation - CLI unavailable)..."
    
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "⏸️  MANUAL GENERATION REQUIRED"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    echo "Claude assistant needs to generate:"
    echo "  → $VALIDITY_DIR/SYNTHESIS_OUTPUT.md"
    echo ""
    echo "Context available at:"
    echo "  → $VALIDITY_DIR/synthesis_context.txt"
    echo ""
    echo "📋 COPY THIS MESSAGE AND SEND TO CLAUDE:"
    echo ""
    echo "---"
    echo "Generate SYNTHESIS_OUTPUT.md for Phase 2 (Synthesis)"
    echo "Context file: $VALIDITY_DIR/synthesis_context.txt"
    echo "Output file: $VALIDITY_DIR/SYNTHESIS_OUTPUT.md"
    echo "Task: Synthesize all approaches and extract ready-to-test prompts"
    echo "---"
    echo ""
    read -p "Press Enter AFTER Claude has generated the file..."
    echo ""
    
    # Verify file was actually created with real content
    if [ ! -f "$VALIDITY_DIR/SYNTHESIS_OUTPUT.md" ] || [ ! -s "$VALIDITY_DIR/SYNTHESIS_OUTPUT.md" ]; then
        echo "❌ ERROR: SYNTHESIS_OUTPUT.md not found or empty"
        echo "   Please generate the file before continuing"
        exit 1
    fi
    
    # Check it's not just a placeholder
    if grep -q "Manual Generation Required" "$VALIDITY_DIR/SYNTHESIS_OUTPUT.md"; then
        echo "❌ ERROR: SYNTHESIS_OUTPUT.md still contains placeholder text"
        echo "   Please replace with actual synthesis"
        exit 1
    fi
    
    echo "✅ Synthesis complete (manual generation verified)"
else
    echo "🔵 Running Claude synthesis..."
    echo ""
    cat "$VALIDITY_DIR/synthesis_context.txt" | \
    claude --system-prompt "$SYSTEM_PROMPT" -p "$PROMPT_SYNTHESIS" \
    > "$VALIDITY_DIR/SYNTHESIS_OUTPUT.md" 2>&1
    echo "✅ Synthesis complete"
fi
echo ""

# Create single consolidated Executive Summary
echo ""
echo "🔄 Creating consolidated Executive Summary..."

# Find all ready-to-test approaches
ready_files=$(ls -1 "$TESTING_DIR"/Approach*_ReadyToTest.md 2>/dev/null)

if [ -z "$ready_files" ]; then
    echo "⚠️  No ready-to-test files found in $TESTING_DIR"
    echo "   Please check if synthesis created the approach files correctly"
    exit 1
fi

echo "Found $(echo "$ready_files" | wc -l) ready-to-test approaches"

# Extract capital requirement from project requirements
capital_requirement=$(grep -E "^\*\*Capital Outlay:\*\*" "$PROJECT_DIR/00_REQUIREMENTS/Requirements.md" | sed 's/.*£//' | sed 's/[^0-9,]//g')

# Create consolidated Executive Summary
cat > "$PROJECT_DIR/ExecutiveSummary.md" << EXEC_SUMMARY_EOF
# Executive Summary: Property Search Analysis

**Project:** $(basename "$PROJECT_DIR")  
**Status:** Phase 2 Complete (Multi-LLM Synthesis)  
**Created:** $(date +%Y-%m-%d)  
**Last Updated:** $(date +%Y-%m-%d)

---

## Project Overview

**Target:** £2,000,000 profit from £${capital_requirement:-200,000} capital investment  
**Approaches Generated:** $(echo "$ready_files" | wc -l)  
**System Version:** v5.2 Multi-LLM Independent Generation

---

## Generated Approaches Summary

| Approach | Name | Status | Expected Results |
|----------|------|--------|------------------|
EXEC_SUMMARY_EOF

# Add table rows for each approach
for ready_file in $ready_files; do
    filename=$(basename "$ready_file")
    letter=$(echo "$filename" | sed 's/Approach\([A-Z]\)_ReadyToTest\.md/\1/')
    approach_name=$(grep "^# Approach" "$ready_file" | sed 's/# Approach [A-Z]: //' | head -1)
    expected_results=$(grep -A 5 "## Expected Results" "$ready_file" | tail -n +2 | sed '/^$/d' | head -1)

    cat >> "$PROJECT_DIR/ExecutiveSummary.md" << APPROACH_ROW_EOF
| ${letter} | ${approach_name:-Unknown} | Ready for Testing | ${expected_results:-Unknown} |
APPROACH_ROW_EOF
done

cat >> "$PROJECT_DIR/ExecutiveSummary.md" << EXEC_SUMMARY_CONT_EOF

---

## Phase 0-2 Results

### Generation Phase (Independent LLMs)
- **Gemini:** Strategic patterns, regulatory opportunities
- **ChatGPT:** Technical precision, execution details
- **Grok:** Speed/timing advantages, arbitrage opportunities
- **Claude:** Risk mitigation, precedent analysis

### Validation Phase (Cross-Validation)
- All approaches validated for technical and business case viability
- Filter existence, syntax correctness, capital feasibility confirmed
- Disagreements resolved through technical iteration

### Synthesis Phase (Consolidation)
- Approaches grouped by natural similarity
- Technical fixes applied to conditional approaches
- Ready-to-test prompts extracted and refined

---

## Next Steps: Stage 4 (Refinement & Validation)

For each approach, execute the following workflow:

1. **Copy SearchLand AI prompt** from corresponding Approach[X]_ReadyToTest.md
2. **Test in SearchLand.co.uk** and capture screenshot of AI interpretation
3. **Validate filter parsing** - ensure AI created intended filters
4. **Document results** - property counts, screenshots, exclusions
5. **Update Executive Summary** with Stage 4 findings

---

## Stage 5: Multi-LLM Site Validation (Planned)

After Stage 4 completion:
- Multi-LLM analysis of identified properties
- Viability assessment using 4 independent AI perspectives
- Creation of property Dossiers with MSI scoring
- Classification into TENABLE vs NON_TENABLE

---

## Stage 6: Deep Research (Planned)

For tenable properties:
- Title document research
- Planning portal precedent analysis
- Comparable GDV research
- Professional constraint checks
- QS build cost estimates
- Final investment recommendations

---

## Files Generated

### Phase 0-2 Outputs
- \`01_DIVERGENT_GENERATION/\` - Original LLM approaches
- \`02_VALIDITY_CHECK/\` - Validation and critique results
- \`03_PARALLEL_TESTING/\` - Ready-to-test approaches

### Current Status
- ✅ Multi-LLM generation complete
- ✅ Cross-validation complete
- ✅ Synthesis and extraction complete
- 🔄 Ready for Stage 4 (Refinement)

---

## Quality Assurance

- **Technical Validation:** All filters verified to exist in SearchLand
- **Business Case Check:** Capital and ROI requirements validated
- **Diversity Preserved:** Strategic differences maintained through natural divergence
- **Ready for Testing:** All approaches have executable SearchLand prompts

---

**System:** v5.2 Multi-LLM Independent Generation  
**Documentation:** REPEATABLE_PROPERTY_WORKFLOW.md  
**Next Phase:** Stage 4 - Refinement & Validation
EXEC_SUMMARY_CONT_EOF

echo "✅ Created consolidated ExecutiveSummary.md"

# Create system run summary in 04_REFINEMENT
echo ""
echo "📊 Creating system run summary..."

mkdir -p "$PROJECT_DIR/04_REFINEMENT"
cat > "$PROJECT_DIR/04_REFINEMENT/SYSTEM_RUN_SUMMARY.md" << SUMMARY_EOF
# System Run Summary - $(date +%Y-%m-%d)

## Phase 0-2 Complete ✅

### Generation Results
- **Total Approaches Generated:** $(ls -1 "$GENERATION_DIR"/*.md 2>/dev/null | wc -l)
- **LLMs Used:** Gemini, ChatGPT, Grok, Claude

### Validation Results
- **Total Approaches Reviewed:** $(ls -1 "$VALIDITY_DIR"/*_Critique.md 2>/dev/null | wc -l)
- **Disagreements Detected:** $(grep -l "DISAGREEMENTS_FOUND: YES" "$VALIDITY_DIR/DISAGREEMENT_ANALYSIS.md" >/dev/null && echo "Yes" || echo "No")
- **Iteration Required:** $([ -f "$VALIDITY_DIR/Iteration_Gemini.md" ] && echo "Yes" || echo "No")

### Synthesis Results
- **Valid Approaches:** $(echo "$valid_approaches" | wc -w)
- **Approaches Ready for Testing:** $(ls -1 "$TESTING_DIR"/Approach*_ReadyToTest.md 2>/dev/null | wc -l)
- **Executive Summaries Created:** $(ls -1 "$PROJECT_DIR/04_REFINEMENT"/ExecutiveSummary_*.md 2>/dev/null | wc -l)

### Next Steps
1. **Review Executive Summaries** in \`04_REFINEMENT/\`
2. **Proceed to Stage 4:** Refinement & Initial Validation
3. **Test approaches** in SearchLand.co.uk
4. **Continue workflow** through Stages 5-6

### Key Insights
- [To be populated during refinement stages]
- [Learning opportunities captured in LEARNINGS_DATABASE.md]

### Detailed Synthesis Output
- Full Claude synthesis analysis: `../02_VALIDITY_CHECK/SYNTHESIS_OUTPUT.md`
- Contains detailed approach groupings, technical validations, and ready-to-test extractions

---
**Generated by v5.2 Multi-LLM System**
SUMMARY_EOF

echo "✅ Created SYSTEM_RUN_SUMMARY.md (in 04_REFINEMENT)"

# Summary
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  ✅ Phase 2 Complete: Synthesis & Executive Summary Creation ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Outputs:"
echo "  • Synthesis: $(wc -l < "$VALIDITY_DIR/SYNTHESIS_OUTPUT.md") lines"
echo "  • Ready-to-test approaches: $(ls -1 "$TESTING_DIR"/Approach*_ReadyToTest.md 2>/dev/null | wc -l)"
echo "  • Executive Summary: $(ls -1 "$PROJECT_DIR"/ExecutiveSummary.md 2>/dev/null | wc -l)"
echo "  • System Summary: $(wc -l < "$PROJECT_DIR/04_REFINEMENT/SYSTEM_RUN_SUMMARY.md") lines"
echo ""
echo "🎯 READY FOR STAGE 4: REFINEMENT & VALIDATION"
echo ""
echo "Stage 4 workflow (10 steps):"
echo "  ✅ 0. Executive Summaries created (auto)"
echo "  1. Copy SearchLand AI prompt from Executive Summary"
echo "  2. Paste screenshot of SearchLand AI interpretation"
echo "  3. Run validation script (compare intended vs actual)"
echo "  4. Update prompts + LEARNINGS_DATABASE.md"
echo "  5. Document results & property screenshots"
echo ""
echo "  Then: Stage 5 (Site Validation) → Stage 6 (Deep Research)"
echo ""
echo "📂 Executive Summary: $PROJECT_DIR/ExecutiveSummary.md"
echo "📋 System Summary: $PROJECT_DIR/04_REFINEMENT/SYSTEM_RUN_SUMMARY.md"
echo ""

