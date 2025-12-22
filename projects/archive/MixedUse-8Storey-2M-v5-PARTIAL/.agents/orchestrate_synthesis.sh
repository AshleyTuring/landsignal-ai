#!/bin/bash

# Synthesis & Extraction - v5.0
# Claude synthesizes all inputs and extracts ready-to-test approaches

set -e

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
cat > "$VALIDITY_DIR/synthesis_context.txt" << 'SYNTHESIS_EOF'
# Synthesis Task

## Your Role
You are the neutral synthesizer. Read all approaches and all critiques, then:

1. **Group Similar Approaches:** Identify natural convergence (LLMs proposing similar strategies)
2. **Preserve Distinct Approaches:** Identify genuinely different strategies worth testing
3. **Apply Critiques:** Use technical feedback to refine approaches
4. **Create Validation Matrix:** Mark each approach VALID/CONDITIONAL/INVALID
5. **Extract Ready-to-Test:** Create clean, executable prompts for SearchLand AI

## Key Principles
- **Preserve diversity:** Don't force convergence - multiple valid approaches can coexist
- **Apply technical fixes:** Use critique feedback to improve approaches
- **Be pragmatic:** CONDITIONAL approaches (minor issues) are still testable
- **Group smartly:** Similar approaches = natural consensus (not forced)

## Output Part 1: Validation Matrix

Create a table:

| Approach | Original LLM | Pattern Used | Status | Notes |
|----------|-------------|--------------|--------|-------|
| A | Gemini | Pattern X | VALID | Ready to test |
| B | Codex | Pattern Y | CONDITIONAL | Needs unit fix |
| C | Grok | Pattern Z | INVALID | Filter doesn't exist |
| ... | ... | ... | ... | ... |

**Groupings (if applicable):**
- Approaches [A, D, G] are similar (precedent-based) - recommend testing as variants
- Approaches [B, E] both use Pattern X - recommend testing Approach B only (more refined)

---

## Output Part 2: Extraction Files

For each VALID or CONDITIONAL approach, create:

### File: ApproachX_ReadyToTest.md

```markdown
# Approach [Letter]: [Name]

**Status:** VALID | CONDITIONAL  
**Original LLM:** [Name]  
**Pattern:** [From FILTER_PATTERNS.md]  
**Capital Required:** [Breakdown]  
**Expected Results:** [Estimated count]

## SearchLand AI Prompt (Copy-Paste Ready)
```
1. [Filter name]: [operator] [value]
2. [Filter name]: [operator] [value]
3. [Filter name]: [operator] [value]
...
```

## Rationale
[Why this approach works - refined with critique feedback]

## Strengths
- [List]

## Limitations
- [List - include any CONDITIONAL issues]

## Implementation Strategy
[Step-by-step execution plan]

## Capital Breakdown
- [Item]: [Cost]
- [Item]: [Cost]
- **Total:** [Amount]

## Next Steps
1. Copy SearchLand AI prompt above
2. Run in SearchLand.co.uk
3. Document result count in 04_REFINEMENT
4. If 0 results: Review limitations and adjust
5. If results: Proceed to site validation
```
---

SYNTHESIS_EOF

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

# Run synthesis
echo "🔵 Running Claude synthesis..."
echo ""

cat "$VALIDITY_DIR/synthesis_context.txt" | \
claude -p "Synthesize all approaches and critiques. Create validation matrix and extract ready-to-test approaches. Preserve diversity." \
> "$VALIDITY_DIR/SYNTHESIS_OUTPUT.md" 2>&1

echo "✅ Synthesis complete"
echo ""

# Summary
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║  ✅ Phase 2 Complete: Synthesis                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Output:"
echo "  • Synthesis: $(wc -l < "$VALIDITY_DIR/SYNTHESIS_OUTPUT.md") lines"
echo ""
echo "⚠️  MANUAL STEP REQUIRED:"
echo ""
echo "1. Review $VALIDITY_DIR/SYNTHESIS_OUTPUT.md"
echo "2. Extract validation matrix to: $VALIDITY_DIR/FINAL_ValidationMatrix.md"
echo "3. Create approach files in: $TESTING_DIR/"
echo "   • ApproachA_ReadyToTest.md"
echo "   • ApproachB_ReadyToTest.md"
echo "   • ... (for each VALID/CONDITIONAL approach)"
echo ""
echo "After extraction, create $PROJECT_DIR/SYSTEM_RUN_SUMMARY.md with:"
echo "  • Total approaches generated"
echo "  • Valid/Conditional/Invalid counts"
echo "  • Key insights"
echo "  • Next steps"
echo ""

