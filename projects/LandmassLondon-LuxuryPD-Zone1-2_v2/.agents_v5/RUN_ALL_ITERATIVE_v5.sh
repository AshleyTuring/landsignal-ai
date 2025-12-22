#!/bin/bash

# Full Iterative Multi-LLM Pipeline - v5.3
# Loops cross-validation → technical iteration until convergence or max rounds
#
# Usage:
#   ./RUN_ALL_ITERATIVE_v5.sh [max_rounds]
#   Default: 1 round (fast mode)
#   Example: ./RUN_ALL_ITERATIVE_v5.sh 3  (thorough mode)
#
# v5.3 Features:
#   - Default 1 iteration (down from 3)
#   - SKIP_VALIDATION=true env var to skip validation entirely
#   - Faster execution for commercial use

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
VALIDITY_DIR="$PROJECT_DIR/02_VALIDITY_CHECK"

# Source config to get SKIP_VALIDATION flag
source "$SCRIPT_DIR/PROMPTS_CONFIG.sh"

MAX_ROUNDS="${1:-1}"  # v5.3: Default 1 round (fast mode), can override via argument
ROUND=0

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  🚀 Multi-LLM Iterative Pipeline v5.3                        ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Configuration:"
echo "  • Max iteration rounds: $MAX_ROUNDS"
echo "  • Skip validation: $SKIP_VALIDATION"
echo "  • Project: $(basename "$PROJECT_DIR")"
echo ""

# ═══════════════════════════════════════════════════════════════════
# Phase 0: Independent Generation (one-off)
# ═══════════════════════════════════════════════════════════════════
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  Phase 0: Independent Generation"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

"$SCRIPT_DIR/orchestrate_independent.sh"

# ═══════════════════════════════════════════════════════════════════
# v5.3: Check if validation should be skipped
# ═══════════════════════════════════════════════════════════════════
if [ "$SKIP_VALIDATION" = "true" ]; then
  echo ""
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "  ⚡ SKIP_VALIDATION=true - Going straight to synthesis"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo ""
  
  "$SCRIPT_DIR/orchestrate_synthesis.sh"
  
  echo ""
  echo "✅ Pipeline complete (Fast Mode: Generation → Synthesis)"
  echo ""
  exit 0
fi

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

