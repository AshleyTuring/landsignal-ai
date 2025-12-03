#!/bin/bash

# Multi-Agent Collaborative Exploration System
# Phase 0: All agents analyze planning application and explore strategic angles together

set -e

PROJECT_DIR="/home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v4"
AGENTS_DIR="$PROJECT_DIR/.agents"
CONTEXT_DIR="/home/ashsubband/landsignal"

echo "╔═══════════════════════════════════════════════════════════════════╗"
echo "║     Multi-Agent Collaborative Exploration v3.2                   ║"
echo "║        All Agents Systematically Explore Strategic Angles        ║"
echo "╚═══════════════════════════════════════════════════════════════════╝"
echo ""

# Create collaborative exploration context
create_collaborative_context() {
    echo "Creating collaborative exploration context..."
    
    cat > "$AGENTS_DIR/collaborative_context.txt" << 'COLLAB_PROMPT'
# COLLABORATIVE STRATEGIC EXPLORATION

You are three expert property analysts working TOGETHER to create SearchLand filter strategies.

**IMPORTANT:** You are NOT working independently with assigned "personas." All three of you collaborate on ALL angles.

## YOUR TASK

Systematically explore strategic angles together. For each angle, discuss as a group and propose the BEST approach(es).

---

## ROUND 1: PRECEDENT ANALYSIS 🎯 (MANDATORY)

**Analyze the provided planning application(s) together:**

### Discussion Questions:
1. What factors made this approvable?
   - Height/scale characteristics?
   - Transport/accessibility?
   - Policy support indicators?
   - Site characteristics?
   - Use class mix?

2. How should we filter for these factors in SearchLand?
   - Agree on core factors first
   - Then discuss implementation options
   - If someone proposes a variation, include it

3. Are there multiple valid implementations?
   - Official metrics (PTAL, zones) vs proxies (distance)?
   - London-specific vs UK-wide?
   - Tight targeting vs broader search?

### Output Format:
```
PRECEDENT APPROACHES:

Approach 1: [Name] (Consensus / Proposed by: X)
Filters:
1. [Filter name]: [operator] [value]
2. ...

Rationale: [Why this replicates success]
Expected results: [X-Y properties per geography]

[If variations proposed:]

Approach 2: [Name - Variation] (Proposed by: X, supported by: Y)
Filters:
1. [Filter name]: [operator] [value]
2. ...

Rationale: [Why this variation worth testing]
Expected results: [X-Y properties]
```

**Rules:**
- MUST produce at least 1 precedent approach
- Can produce up to 3 if genuine variations exist
- Use structured format (numbered filters with exact names)
- Reference AvailableFiltersInSearchLand_ACTUAL.md for real filters

---

## ROUND 2: REGULATION/POLICY ANGLE 📋

**Explore regulatory pressures and policy-driven opportunities:**

### Discussion:
- What compliance deadlines create forced action?
  - EPC ratings (E-G cannot let)?
  - HMO licenses expiring?
  - Lease end dates (income cliff)?
  - Building regs compliance?
  
- What policy changes create opportunity?
  - Permitted development rights?
  - Use class changes?
  - Allocation changes?

### Group Decision:
- Are there strong regulation-based strategies?
- If YES: Propose 1-2 approaches
- If NO: Skip this round (say "No compelling regulation angles found")

### Output Format:
```
REGULATION APPROACHES: [X approaches OR "None - skipping"]

[If approaches exist:]

Approach X: [Name]
Filters: [Structured list]
Rationale: [Regulatory pressure creates motivation]
Expected results: [X-Y properties]
```

---

## ROUND 3: STRUCTURAL/CREATIVE ANGLE 🏗️

**Explore creative deal structures and workarounds:**

### Discussion:
- Airspace rights (flat roofs, add storeys)?
- Option agreements (low capital control)?
- Grey Belt exceptions (previously developed)?
- Emerging allocations (first-mover)?
- Creative financing structures?

### Group Decision:
- Which structural plays are compelling?
- Propose best 1-2 approaches
- Or skip if no strong ideas

### Output Format:
```
STRUCTURAL APPROACHES: [X approaches OR "None - skipping"]

[If approaches exist:]

Approach X: [Name]
Filters: [Structured list]
Rationale: [Why this structural play works]
Capital model: [How £200k enables this]
Expected results: [X-Y properties]
```

---

## ROUND 4: BEHAVIORAL/MOTIVATION ANGLE 🧠

**Explore seller psychology and motivation signals:**

### Discussion:
- Corporate distress (liquidation, administration)?
- Long holds (inactive, stale ownership)?
- Company status changes?
- Combined motivation signals?
- Time arbitrage (fresh events)?

### Group Decision:
- Which motivation signals are strong?
- Propose best 1-2 approaches
- Or skip if covered in other rounds

### Output Format:
```
BEHAVIORAL APPROACHES: [X approaches OR "None - skipping"]

[If approaches exist:]

Approach X: [Name]
Filters: [Structured list]
Rationale: [Psychology/motivation rationale]
Expected results: [X-Y properties]
```

---

## ROUND 5: CHALLENGE ROUND 🚀

**Propose something DIFFERENT from Rounds 1-4:**

### Purpose:
Force exploration beyond obvious angles. Think:
- Unconventional combinations?
- Contrarian approaches?
- Time-based strategies?
- Geographic arbitrage?
- Something totally different?

### Rules:
- MUST be distinct from Rounds 1-4
- Can be speculative/risky
- Forces thinking beyond comfort zone

### Output Format:
```
CHALLENGE APPROACHES: [1-2 approaches OR "No distinct challenge angles"]

[If approaches exist:]

Approach X: [Name]
Filters: [Structured list]
Rationale: [Why this is different/valuable]
Note: [This is experimental/high-risk/contrarian because...]
Expected results: [X-Y properties]
```

---

## FINAL SUMMARY

After all rounds, provide:

```
TOTAL APPROACHES: [Count across all rounds]

ROUND BREAKDOWN:
- Precedent: [X approaches]
- Regulation: [X approaches or skipped]
- Structural: [X approaches or skipped]
- Behavioral: [X approaches or skipped]
- Challenge: [X approaches or skipped]

DIVERSITY CHECK:
[Brief statement on whether approaches cover different strategic angles]

RECOMMENDED TESTING PRIORITY:
1. [Approach name] - [Why test first]
2. [Approach name] - [Why test second]
...
```

---

## CRITICAL RULES

1. **Natural Collaboration:** All agents contribute to all rounds. No forced personas.

2. **Honest Assessment:** If a round has no compelling approaches, skip it. Don't force weak ideas.

3. **Best Ideas Win:** Agree on strong approaches, note who proposed variations if they add value.

4. **Structured Output:** Every approach uses numbered filter format (copy-paste ready for SearchLand).

5. **Reference Knowledge:**
   - AvailableFiltersInSearchLand_ACTUAL.md (real filters)
   - FILTER_PATTERNS.md (strategic patterns)
   - PRESET_STRATEGY_GUIDE.md (86 expert presets)
   - LEARNINGS_DATABASE.md (16+ motivation signals)

---

BEGIN COLLABORATIVE EXPLORATION NOW:

COLLAB_PROMPT

    # Append all context
    cat "$PROJECT_DIR/00_REQUIREMENTS/Requirements.md" \
        "$CONTEXT_DIR/SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md" \
        "$CONTEXT_DIR/FILTER_PATTERNS.md" \
        "$CONTEXT_DIR/PRESET_STRATEGY_GUIDE.md" \
        "$CONTEXT_DIR/LEARNINGS_DATABASE.md" >> "$AGENTS_DIR/collaborative_context.txt"
    
    echo "✅ Collaborative context created ($(wc -l < $AGENTS_DIR/collaborative_context.txt) lines)"
}

# Run collaborative exploration
run_collaborative_exploration() {
    echo ""
    echo "🤖 Running collaborative exploration..."
    echo "   All agents working together on systematic angle exploration..."
    echo ""
    
    cat "$AGENTS_DIR/collaborative_context.txt" | \
    claude > "$PROJECT_DIR/01_DIVERGENT_GENERATION/CollaborativeExploration_Output.md" 2>&1
    
    echo "✅ Collaborative exploration complete"
}

echo "═══════════════════════════════════════════════════════════════════"
echo "📦 PHASE 0: Creating Collaborative Context"
echo "═══════════════════════════════════════════════════════════════════"
create_collaborative_context

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "🤝 PHASE 0: COLLABORATIVE EXPLORATION"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "All agents exploring strategic angles together:"
echo "  • Round 1: Precedent Analysis (mandatory)"
echo "  • Round 2: Regulation/Policy Angle"
echo "  • Round 3: Structural/Creative Angle"
echo "  • Round 4: Behavioral/Motivation Angle"
echo "  • Round 5: Challenge Round (force diversity)"
echo ""

run_collaborative_exploration

echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "✅ PHASE 0 COMPLETE: Collaborative Exploration"
echo "═══════════════════════════════════════════════════════════════════"
echo ""
echo "📊 Output:"
ls -lh "$PROJECT_DIR/01_DIVERGENT_GENERATION/CollaborativeExploration_Output.md" | awk '{print "   •", $9, "-", $5}'
echo ""
echo "Expected: 4-10 approaches across 5 strategic angles"
echo ""
echo "═══════════════════════════════════════════════════════════════════"
echo "⏭️  NEXT: Parse approaches and proceed to validation"
echo "═══════════════════════════════════════════════════════════════════"
echo ""

