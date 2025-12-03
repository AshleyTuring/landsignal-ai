#!/bin/bash

# Multi-LLM Orchestration Master Script - v5.0
# Runs all phases in sequence

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║     Multi-LLM Property Search System v5.0                    ║"
echo "║     4 LLMs: Gemini, Codex, Grok, Claude                     ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "This will run the complete multi-LLM workflow:"
echo ""
echo "  Phase 0: Independent Generation (4 LLMs in parallel)"
echo "  Phase 1: Cross-Validation (4 LLMs in parallel)"
echo "  Phase 1.5: Technical Iteration (if disagreements)"
echo "  Phase 2: Synthesis & Extraction (Claude)"
echo ""
echo "Estimated time: 15-25 minutes"
echo ""
read -p "Press Enter to start, or Ctrl+C to cancel..."
echo ""

# Track start time
START_TIME=$(date +%s)

# Phase 0: Independent Generation
echo "═══════════════════════════════════════════════════════════════"
echo "Starting Phase 0: Independent Generation"
echo "═══════════════════════════════════════════════════════════════"
echo ""

bash "$SCRIPT_DIR/orchestrate_independent.sh"

if [ $? -ne 0 ]; then
    echo "❌ Phase 0 failed. Aborting."
    exit 1
fi

# Phase 1: Cross-Validation
echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "Starting Phase 1: Cross-Validation"
echo "═══════════════════════════════════════════════════════════════"
echo ""

bash "$SCRIPT_DIR/orchestrate_crossvalidation.sh"

if [ $? -ne 0 ]; then
    echo "❌ Phase 1 failed. Aborting."
    exit 1
fi

# Phase 1.5: Technical Iteration (conditional)
echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "Checking for Phase 1.5: Technical Iteration"
echo "═══════════════════════════════════════════════════════════════"
echo ""

VALIDITY_DIR="$(cd "$SCRIPT_DIR/.." && pwd)/02_VALIDITY_CHECK"

if [ -f "$VALIDITY_DIR/DISAGREEMENT_ANALYSIS.md" ] && grep -q "TECHNICAL_DISAGREEMENTS: YES" "$VALIDITY_DIR/DISAGREEMENT_ANALYSIS.md"; then
    echo "⚠️  Technical disagreements detected - running iteration"
    echo ""
    
    bash "$SCRIPT_DIR/orchestrate_technical_iteration.sh"
    
    if [ $? -ne 0 ]; then
        echo "❌ Phase 1.5 failed. Aborting."
        exit 1
    fi
else
    echo "✅ No technical disagreements - skipping iteration"
    echo ""
fi

# Phase 2: Synthesis
echo ""
echo "═══════════════════════════════════════════════════════════════"
echo "Starting Phase 2: Synthesis & Extraction"
echo "═══════════════════════════════════════════════════════════════"
echo ""

bash "$SCRIPT_DIR/orchestrate_synthesis.sh"

if [ $? -ne 0 ]; then
    echo "❌ Phase 2 failed. Aborting."
    exit 1
fi

# Track end time
END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
MINUTES=$((DURATION / 60))
SECONDS=$((DURATION % 60))

# Final summary
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                                                              ║"
echo "║     ✅ ALL PHASES COMPLETE                                   ║"
echo "║                                                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Total runtime: ${MINUTES}m ${SECONDS}s"
echo ""
echo "📊 Results:"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
GENERATION_DIR="$PROJECT_DIR/01_DIVERGENT_GENERATION"
VALIDITY_DIR="$PROJECT_DIR/02_VALIDITY_CHECK"

echo "  • Generated approaches: $(find "$GENERATION_DIR" -name "*.md" -type f | wc -l) files"
echo "  • Critiques completed: $(find "$VALIDITY_DIR" -name "*_Critique.md" -type f | wc -l) files"
echo "  • Synthesis output: $VALIDITY_DIR/SYNTHESIS_OUTPUT.md"
echo ""
echo "📋 Next Steps:"
echo ""
echo "1. Review synthesis output:"
echo "   cat $VALIDITY_DIR/SYNTHESIS_OUTPUT.md"
echo ""
echo "2. Extract validation matrix:"
echo "   • Create $VALIDITY_DIR/FINAL_ValidationMatrix.md"
echo "   • List all approaches with VALID/CONDITIONAL/INVALID status"
echo ""
echo "3. Extract ready-to-test approaches:"
echo "   • Create $PROJECT_DIR/03_PARALLEL_TESTING/ApproachX_ReadyToTest.md"
echo "   • For each VALID or CONDITIONAL approach"
echo "   • Include copy-paste ready SearchLand AI prompts"
echo ""
echo "4. Create system summary:"
echo "   • Create $PROJECT_DIR/SYSTEM_RUN_SUMMARY.md"
echo "   • Document total approaches, validity counts, key insights"
echo ""
echo "5. Begin testing:"
echo "   • Copy prompts to SearchLand.co.uk"
echo "   • Document results in 04_REFINEMENT/"
echo ""
echo "═══════════════════════════════════════════════════════════════"
echo ""

