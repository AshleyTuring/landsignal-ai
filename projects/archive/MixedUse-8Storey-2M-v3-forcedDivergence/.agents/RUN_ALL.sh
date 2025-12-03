#!/bin/bash

# Master Orchestrator - Runs entire multi-agent workflow
# Phase 1: Divergent Generation (parallel)
# Phase 2: Cross-Critique (parallel)
# Phase 3: Consensus Synthesis

set -e

AGENTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo ""
echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║                                                                   ║"
echo "║        Multi-Agent Filter Generation System v3.2                 ║"
echo "║                                                                   ║"
echo "║  Phase 0: Collaborative Exploration (systematic angles)          ║"
echo "║  Phase 1: Cross-Critique (technical validation)                  ║"
echo "║  Phase 1.5: Iteration (resolve technical disagreements)          ║"
echo "║  Phase 2: Consensus (final validation matrix)                    ║"
echo "║                                                                   ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""
echo "⏱️  Estimated Time: 5-10 minutes (Claude API calls)"
echo ""
read -p "Press ENTER to start..." 

echo ""
echo "════════════════════════════════════════════════════════════════════"
echo "                  PHASE 0: COLLABORATIVE EXPLORATION                "
echo "════════════════════════════════════════════════════════════════════"
echo ""

"$AGENTS_DIR/orchestrate_collaborative.sh"

echo ""
echo "════════════════════════════════════════════════════════════════════"
echo "                    PHASE 1: CROSS-CRITIQUE                         "
echo "════════════════════════════════════════════════════════════════════"
echo ""

"$AGENTS_DIR/orchestrate_critique.sh"

echo ""
echo "════════════════════════════════════════════════════════════════════"
echo "                PHASE 1.5: ITERATION (IF NEEDED)                    "
echo "════════════════════════════════════════════════════════════════════"
echo ""
echo "Checking for technical disagreements..."
echo ""

"$AGENTS_DIR/orchestrate_iteration.sh"

echo ""
echo "════════════════════════════════════════════════════════════════════"
echo "                    PHASE 2: CONSENSUS SYNTHESIS                    "
echo "════════════════════════════════════════════════════════════════════"
echo ""

"$AGENTS_DIR/orchestrate_consensus.sh"

echo ""
echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║                                                                   ║"
echo "║                    🎉 ALL PHASES COMPLETE! 🎉                    ║"
echo "║                                                                   ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""
echo "📊 OUTPUTS:"
echo ""
echo "Collaborative Exploration (4-10 approaches across 5 angles):"
echo "  • ../01_DIVERGENT_GENERATION/CollaborativeExploration_Output.md ⭐"
echo ""
echo "Cross-Critiques (technical validation reports):"
echo "  • ../02_VALIDITY_CHECK/Critique_Gemini.md"
echo "  • ../02_VALIDITY_CHECK/Critique_Codex.md"
echo "  • ../02_VALIDITY_CHECK/Critique_Claude.md"
echo ""
echo "Final Validation Matrix:"
echo "  • ../02_VALIDITY_CHECK/FINAL_ValidationMatrix.md ⭐"
echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "⏭️  NEXT STEPS:"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "1. Review FINAL_ValidationMatrix.md to see which approaches are valid"
echo "2. Copy filters from VALID approaches into SearchLand"
echo "3. Test in parallel across geographies (Slough, Birmingham, Manchester)"
echo "4. Document results in 03_PARALLEL_TESTING/"
echo "5. Update LEARNINGS_DATABASE.md with discoveries"
echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo ""

