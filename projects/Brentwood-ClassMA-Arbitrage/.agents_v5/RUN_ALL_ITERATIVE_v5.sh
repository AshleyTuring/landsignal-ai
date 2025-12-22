#!/bin/bash

# Full Iterative Multi-LLM Pipeline - v5.2
# Loops cross-validation → technical iteration until convergence or max rounds
#
# Usage:
#   ./RUN_ALL_ITERATIVE_v5.sh [max_rounds]
#   Default: 3 rounds
#   Example: ./RUN_ALL_ITERATIVE_v5.sh 5

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
VALIDITY_DIR="$PROJECT_DIR/02_VALIDITY_CHECK"

MAX_ROUNDS="${1:-3}"  # Default 3 rounds, can override via argument
ROUND=2  # Starting from Round 2 (Round 1 & 2 already complete)

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  🚀 Multi-LLM Iterative Pipeline v5.2                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Configuration:"
echo "  • Max iteration rounds: $MAX_ROUNDS"
echo "  • Project: $(basename "$PROJECT_DIR")"
echo ""

# ═══════════════════════════════════════════════════════════════════
# Phase 0: Independent Generation (one-off)
# ═══════════════════════════════════════════════════════════════════
# SKIPPED: Already completed manually (Claude had to be regenerated)
# echo ""
# echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
# echo "  Phase 0: Independent Generation"
# echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
# echo ""
# 
# "$SCRIPT_DIR/orchestrate_independent.sh"

# ═══════════════════════════════════════════════════════════════════
# Iterative Loop: Cross-Validation → Technical Iteration
# ═══════════════════════════════════════════════════════════════════
while true; do
  ROUND=$((ROUND + 1))
  export ITERATION_ROUND=$ROUND  # Export for child scripts
  
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  🔁 Iteration Round $ROUND of $MAX_ROUNDS"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""

  # ─────────────────────────────────────────────────────────────────
  # Phase 1: Cross-Validation + Disagreement Analysis
  # ─────────────────────────────────────────────────────────────────
  "$SCRIPT_DIR/orchestrate_crossvalidation.sh"

  # Check if disagreement analysis was created
  ROUND_CRITIQUE_DIR="$VALIDITY_DIR/Round$ROUND/Critiques"
  if [ ! -f "$ROUND_CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md" ]; then
      echo "❌ ERROR: DISAGREEMENT_ANALYSIS.md not found after cross-validation"
      exit 1
  fi

  # Check if disagreements were found
  if ! grep -q "DISAGREEMENTS_FOUND: YES" "$ROUND_CRITIQUE_DIR/DISAGREEMENT_ANALYSIS.md"; then
      echo ""
      echo "✅ No disagreements detected in round $ROUND"
      echo "   All LLMs have converged on technical and business case facts"
      echo ""
      break
  fi

  # Check if we've hit max rounds
  if [ "$ROUND" -ge "$MAX_ROUNDS" ]; then
      echo ""
      echo "⚠️  Reached MAX_ROUNDS=$MAX_ROUNDS but disagreements remain"
      echo "   Proceeding to synthesis with latest positions"
      echo "   (Strategic differences are acceptable and preserved)"
      echo ""
      break
  fi

  # ─────────────────────────────────────────────────────────────────
  # Phase 1.5: Technical Iteration (Update Positions)
  # ─────────────────────────────────────────────────────────────────
  echo ""
  echo "⚠️  Disagreements detected - running technical iteration..."
  echo ""
  
  "$SCRIPT_DIR/orchestrate_technical_iteration.sh"
  
  echo ""
  echo "🔄 Iteration $ROUND complete - looping back to cross-validation..."
  echo ""
done

# ═══════════════════════════════════════════════════════════════════
# Phase 2: Final Synthesis & Extraction
# ═══════════════════════════════════════════════════════════════════
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Phase 2: Final Synthesis"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

"$SCRIPT_DIR/orchestrate_synthesis.sh"

# ═══════════════════════════════════════════════════════════════════
# Summary
# ═══════════════════════════════════════════════════════════════════
echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  🎯 Iterative Pipeline Complete                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Statistics:"
echo "  • Total iteration rounds: $ROUND"
echo "  • Convergence: $(grep -q "DISAGREEMENTS_FOUND: YES" "$VALIDITY_DIR/DISAGREEMENT_ANALYSIS.md" && echo "Partial (max rounds reached)" || echo "Full (no disagreements)")"
echo "  • Ready-to-test approaches: $(ls -1 "$PROJECT_DIR/03_PARALLEL_TESTING"/Approach*_ReadyToTest.md 2>/dev/null | wc -l)"
echo ""
echo "Next Steps:"
echo "  → Review ExecutiveSummary.md"
echo "  → Proceed to Stage 4 (Refinement)"
echo ""

