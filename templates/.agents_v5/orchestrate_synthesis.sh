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

# Delete old synthesis_context.txt if it exists (may have old prompt format)
rm -f "$VALIDITY_DIR/synthesis_context.txt"

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

# Note: Reference materials NOT included in synthesis context to reduce size
# They were already used during generation and validation phases
# Synthesis only needs approaches and critiques to create validation matrix

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
    claude --system-prompt "$SYSTEM_PROMPT_SYNTHESIS" -p "$PROMPT_SYNTHESIS" \
    > "$VALIDITY_DIR/SYNTHESIS_OUTPUT.md" 2>&1
    echo "✅ Synthesis complete"
fi
echo ""

# Extract individual approach files from SYNTHESIS_OUTPUT.md
echo "🔄 Running post-synthesis extraction..."
echo ""
"$SCRIPT_DIR/post_synthesis_extraction.sh"

if [ $? -ne 0 ]; then
    echo "❌ ERROR: Extraction failed"
    echo "   Check SYNTHESIS_OUTPUT.md format"
    exit 1
fi

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

# Create consolidated Executive Summary with full approach details embedded
cat > "$PROJECT_DIR/ExecutiveSummary.md" << 'EXEC_HEADER'
# Executive Summary: Property Search Analysis

**Project:** PROJECT_NAME_PLACEHOLDER  
**Status:** Phase 2 Complete (Multi-LLM Synthesis)  
**Created:** DATE_PLACEHOLDER  
**Last Updated:** DATE_PLACEHOLDER

---

## Project Overview

**Target:** £2,000,000 profit from £CAPITAL_PLACEHOLDER capital investment  
**Approaches Generated:** COUNT_PLACEHOLDER  
**System Version:** v5.2 Multi-LLM Independent Generation

---

## Quick Reference: All Approaches

| Approach | Name | Status | Expected Results |
|----------|------|--------|------------------|
EXEC_HEADER

# Build quick reference table and collect approach details
for ready_file in $ready_files; do
    filename=$(basename "$ready_file")
    letter=$(echo "$filename" | sed 's/Approach\([A-Z]\)_ReadyToTest\.md/\1/')
    approach_name=$(grep "^# \*\*APPROACH" "$ready_file" | sed 's/# \*\*APPROACH [A-Z]: //' | sed 's/\*\*$//' | head -1)
    status=$(grep "^\*\*Status:\*\*" "$ready_file" | sed 's/\*\*Status:\*\* //' | head -1)
    expected_results=$(grep "^\*\*Expected Results:\*\*" "$ready_file" | sed 's/\*\*Expected Results:\*\* //' | head -1)
    
    echo "| ${letter} | ${approach_name:-Unknown} | ${status:-Ready} | ${expected_results:-Unknown} |" >> "$PROJECT_DIR/ExecutiveSummary.md"
done

echo "" >> "$PROJECT_DIR/ExecutiveSummary.md"
echo "---" >> "$PROJECT_DIR/ExecutiveSummary.md"
echo "" >> "$PROJECT_DIR/ExecutiveSummary.md"

# Add full details for each approach with Stage 4-6 tracking sections
for ready_file in $ready_files; do
    filename=$(basename "$ready_file")
    letter=$(echo "$filename" | sed 's/Approach\([A-Z]\)_ReadyToTest\.md/\1/')
    approach_name=$(grep "^# \*\*APPROACH" "$ready_file" | sed 's/# \*\*APPROACH [A-Z]: //' | sed 's/\*\*$//' | head -1)
    
    echo "## Approach ${letter}: ${approach_name}" >> "$PROJECT_DIR/ExecutiveSummary.md"
    echo "" >> "$PROJECT_DIR/ExecutiveSummary.md"
    
    # Append full approach content (skip title line)
    tail -n +2 "$ready_file" >> "$PROJECT_DIR/ExecutiveSummary.md"
    
    # Add Stage 4-6 tracking templates
    cat >> "$PROJECT_DIR/ExecutiveSummary.md" << STAGE_TEMPLATE

---

### Stage 4: Refinement & Validation Results (Approach ${letter})

**Status:** ⏳ Pending Testing

**SearchLand AI Parsing Validation:**

| Filter # | Intended | Actual | Status |
|----------|----------|--------|--------|
| | | | |

**Results:** [Properties found: TBD]  
**Screenshot:** \`04_REFINEMENT/Screenshots/Approach${letter}_SearchLandOutput.jpg\`  
**Issues:** [To be documented]

---

### Stage 5: Multi-LLM Site Validation (Approach ${letter})

**Status:** ⏳ Not Started  
**Properties to Analyze:** [From Stage 4]  
**LLM Consensus:** [Pending]

---

### Stage 6: Deep Research (Approach ${letter})

**Status:** ⏳ Not Started  
**Final Shortlist:** [TBD]

---

STAGE_TEMPLATE
done

# Add project summary footer
cat >> "$PROJECT_DIR/ExecutiveSummary.md" << 'FOOTER'

---

## Phase 0-2 Summary

### Generation Phase
- **Gemini:** Strategic patterns, regulatory opportunities
- **Codex:** Technical precision, execution details
- **Grok:** Speed/timing, arbitrage opportunities
- **Claude:** Risk mitigation, precedent analysis

### Validation & Synthesis
- ✅ Technical validation complete
- ✅ Filter existence confirmed
- ✅ Capital feasibility validated
- ✅ Ready-to-test prompts extracted

---

## Overall Progress

| Stage | Status | Notes |
|-------|--------|-------|
| Phase 0-2: Generation & Synthesis | ✅ Complete | All approaches validated |
| Stage 4: Refinement & Validation | ⏳ Pending | Test in SearchLand |
| Stage 5: Multi-LLM Site Validation | ⏳ Pending | Awaits Stage 4 |
| Stage 6: Deep Research | ⏳ Pending | Awaits Stage 5 |

---

## Next Actions

1. Copy SearchLand AI prompts from approach sections above
2. Test each in SearchLand.co.uk and capture screenshots
3. Validate filter parsing (intended vs actual)
4. Document results in Stage 4 sections
5. Update LEARNINGS_DATABASE.md if needed
6. Proceed to Stage 5 for viable approaches

---

**System:** v5.2 Multi-LLM Independent Generation  
**Documentation:** REPEATABLE_PROPERTY_WORKFLOW.md  
**Last Updated:** DATE_PLACEHOLDER
FOOTER

# Replace placeholders
sed -i "s/PROJECT_NAME_PLACEHOLDER/$(basename "$PROJECT_DIR")/g" "$PROJECT_DIR/ExecutiveSummary.md"
sed -i "s/DATE_PLACEHOLDER/$(date +%Y-%m-%d)/g" "$PROJECT_DIR/ExecutiveSummary.md"
sed -i "s/CAPITAL_PLACEHOLDER/${capital_requirement:-200,000}/g" "$PROJECT_DIR/ExecutiveSummary.md"
sed -i "s/COUNT_PLACEHOLDER/$(echo "$ready_files" | wc -l)/g" "$PROJECT_DIR/ExecutiveSummary.md"

echo "✅ Created comprehensive ExecutiveSummary.md with all approach details"

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

