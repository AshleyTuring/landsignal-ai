#!/bin/bash

# TARGETED ENHANCEMENT: Apply peer review improvements to FILTER_PATTERNS.md
# Strategy: Surgical edits rather than full regeneration

set -e

PROJECT_ROOT="/home/ashsubband/landsignal"
WORK_DIR="$PROJECT_ROOT/.system_improvement"

cd "$WORK_DIR"

echo "============================================"
echo "TARGETED ENHANCEMENT: FILTER_PATTERNS.md v2.0"
echo "============================================"
echo ""

# ============================================
# STEP 1: Extract 8 new patterns from reviews
# ============================================
echo "STEP 1: Extracting 8 new patterns from peer reviews..."

# Create context for extraction
cat > extract_new_patterns_prompt.txt << 'EOF'
# EXTRACTION TASK: New Patterns from Peer Reviews

You are extracting NEW PATTERNS that Gemini and Codex proposed in their reviews.

## YOUR TASK

Extract the following 8 new patterns from the review files. For each pattern, output in this EXACT format:

```
## [NUMBER]. [PATTERN NAME] ⭐ NEW FROM PEER REVIEW

### Pattern [NUMBER][LETTER]: [Sub-Pattern Name]
```
Strategy: [Brief description]
Source: SearchLand Preset #[number(s)]
Discovered: 2025-11-20 (Peer Review)

Indicators:
- [Filter 1]
- [Filter 2]
- [etc.]

Strategic Rationale:
- [Why this works]
- [Market insight]

Strengths:
- [Advantage 1]
- [Advantage 2]

Weaknesses:
- [Limitation 1]
- [Limitation 2]

Capital requirement:
- [Range and breakdown]

Strategy:
1. [Step 1]
2. [Step 2]
3. [Step 3]
```

## PATTERNS TO EXTRACT

**From Gemini's review (Part 2 - New Patterns section):**
1. Legacy Holdings
2. Portfolio Divestment
3. Brownfield Demolition

**From Codex's review (Part 2 - New Patterns section):**
4. Micro-Infill Service Yards
5. Nutrient Neutrality
6. Digital Infrastructure
7. Brand Covenant Reposition
8. Community Asset

## NUMBER THESE AS PATTERNS 14-21

Pattern 14: Legacy Holdings (Gemini)
Pattern 15: Portfolio Divestment (Gemini)
Pattern 16: Brownfield Demolition (Gemini)
Pattern 17: Micro-Infill Service Yards (Codex)
Pattern 18: Nutrient Neutrality (Codex)
Pattern 19: Digital Infrastructure (Codex)
Pattern 20: Brand Covenant Reposition (Codex)
Pattern 21: Community Asset (Codex)

## OUTPUT FORMAT

Output ONLY the 8 formatted pattern sections, ready to paste into FILTER_PATTERNS.md.
Do NOT add commentary, explanations, or summaries.
Output the patterns in order (14-21).
EOF

echo "Running extraction via Claude CLI..."
cat Review_Gemini.md Review_Codex.md | claude < extract_new_patterns_prompt.txt > NEW_PATTERNS_14-21.md 2>&1

echo "✓ Extracted 8 new patterns to NEW_PATTERNS_14-21.md"
echo ""

# ============================================
# STEP 2: Create Master Strategy Matrix
# ============================================
echo "STEP 2: Creating Master Strategy Matrix..."

cat > create_matrix_prompt.txt << 'EOF'
# CREATE MASTER STRATEGY MATRIX

Based on the peer reviews and existing FILTER_PATTERNS.md, create a "Master Strategy Matrix" table.

## FORMAT

```markdown
## Master Strategy Matrix 🎯

Quick reference for pattern selection based on constraints:

| Pattern # | Pattern Name | Capital Required | Risk Level | Timeline | Best For |
|-----------|--------------|------------------|------------|----------|----------|
| 1 | Expired/Stalled Planning | £50k-£200k | Medium | 12-24 months | Planning expertise |
| 2 | Motivated Seller | £100k-£500k | Low-Medium | 6-12 months | Negotiation skills |
| ... | ... | ... | ... | ... | ... |
```

## PATTERNS TO INCLUDE (12 core + 8 new = 20 total)

**Core Patterns (1-12):** Note that Pattern 11 has been merged into Pattern 9, so there are only 12 core patterns (1-10, 12, plus Pattern 9 now contains former Pattern 11 content). Pattern 13 moved to Advanced Workflow.

**New Patterns (14-21):** From peer review

## OUTPUT

Output ONLY the markdown table, ready to insert into FILTER_PATTERNS.md.
Include all 20 patterns (1-10, 12, 14-21).
EOF

cat "$PROJECT_ROOT/FILTER_PATTERNS.md" Review_Gemini.md Review_Codex.md | claude < create_matrix_prompt.txt > MASTER_STRATEGY_MATRIX.md 2>&1

echo "✓ Created Master Strategy Matrix"
echo ""

# ============================================
# STEP 3: Create Collaborative Round Guide
# ============================================
echo "STEP 3: Creating Collaborative Round Guide..."

cat > create_round_guide_prompt.txt << 'EOF'
# CREATE COLLABORATIVE ROUND GUIDE

Create a guide that maps patterns to the v3.2.0 collaborative exploration rounds.

## FORMAT

```markdown
## Collaborative Round Guide 🔄

Maps patterns to exploration rounds in the v3.2.0 workflow:

### Round 2: Precedent Analysis
**Goal:** Which patterns help replicate successful planning applications?
- Pattern 1: Expired/Stalled Planning (find similar approved schemes)
- Pattern 5: High-Density/Intensification (PTAL matching)
- [etc.]

### Round 3: Regulation-Driven
**Goal:** Which patterns exploit regulatory drivers and deadlines?
- Pattern 7: Permitted Development
- Pattern 8: Regulation-Driven Opportunities
- [etc.]

### Round 4: Structural Arbitrage
**Goal:** Which patterns exploit physical characteristics and constraints?
- Pattern 6: Airspace Development
- Pattern 9: Green Belt/Strategic Land
- [etc.]

### Round 5: Behavioral/Motivation
**Goal:** Which patterns exploit seller motivation and market timing?
- Pattern 2: Motivated Seller
- Pattern 13: Time/Information Arbitrage (Advanced Workflow)
- [etc.]
```

## OUTPUT

Output ONLY the round guide section, ready to insert into FILTER_PATTERNS.md.
EOF

cat "$PROJECT_ROOT/FILTER_PATTERNS.md" Review_Gemini.md Review_Codex.md | claude < create_round_guide_prompt.txt > COLLABORATIVE_ROUND_GUIDE.md 2>&1

echo "✓ Created Collaborative Round Guide"
echo ""

# ============================================
# STEP 4: Extract Pattern 13 content (for relocation)
# ============================================
echo "STEP 4: Extracting Pattern 13 for relocation..."

grep -A 200 "^## 13\. Time/Information Arbitrage" "$PROJECT_ROOT/FILTER_PATTERNS.md" | \
  sed '/^## [0-9]/q' | head -n -1 > PATTERN_13_CONTENT.md

echo "✓ Extracted Pattern 13 content"
echo ""

# ============================================
# STEP 5: Extract Pattern 11 content (for merge)
# ============================================
echo "STEP 5: Extracting Pattern 11 for merge into Pattern 9..."

grep -A 200 "^## 11\. Strategic Land" "$PROJECT_ROOT/FILTER_PATTERNS.md" | \
  sed '/^## [0-9]/q' | head -n -1 > PATTERN_11_CONTENT.md

echo "✓ Extracted Pattern 11 content"
echo ""

# ============================================
# SUMMARY
# ============================================
echo "============================================"
echo "EXTRACTION COMPLETE"
echo "============================================"
echo ""
echo "Files created:"
echo "  1. NEW_PATTERNS_14-21.md (8 new patterns)"
echo "  2. MASTER_STRATEGY_MATRIX.md (navigation table)"
echo "  3. COLLABORATIVE_ROUND_GUIDE.md (round mapping)"
echo "  4. PATTERN_13_CONTENT.md (for relocation to Advanced Workflow)"
echo "  5. PATTERN_11_CONTENT.md (for merge into Pattern 9)"
echo ""
echo "Next: I will manually assemble these into FILTER_PATTERNS_v2.0.md"
echo ""

# Count extracted content
echo "Line counts:"
wc -l NEW_PATTERNS_14-21.md MASTER_STRATEGY_MATRIX.md COLLABORATIVE_ROUND_GUIDE.md PATTERN_13_CONTENT.md PATTERN_11_CONTENT.md 2>/dev/null || echo "Some files may still be generating..."
echo ""

