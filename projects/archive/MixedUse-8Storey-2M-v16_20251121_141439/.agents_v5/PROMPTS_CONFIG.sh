#!/bin/bash
# Shared prompts and system prompts for all v5 orchestration scripts

# System Prompt (for Claude CLI --system-prompt flag)
# Overrides default "short and concise" CLI instruction
SYSTEM_PROMPT="You are an expert property development analyst. Always provide full, detailed, comprehensive responses. Follow the prompt instructions exactly. Include all requested sections and details."

# Phase 0: Independent Generation
PROMPT_GENERATION="Generate 1-3 unique property search strategies based on the requirements in the context above."

# Phase 1: Cross-Validation (Critique)
PROMPT_CRITIQUE="Review all approaches for TECHNICAL AND BUSINESS CASE validity. Check: filter existence, syntax correctness, unit accuracy, capital feasibility, ROI calculations, and implementation viability. Preserve strategic diversity."

# Phase 1: Disagreement Analysis
PROMPT_DISAGREEMENT="Analyze critiques for TECHNICAL AND BUSINESS CASE DISAGREEMENTS only. Strategic differences are NOT disagreements."

# Phase 1.5: Technical Iteration
PROMPT_ITERATION="Reconsider your technical AND business case positions based on disagreements. Be evidence-based and precise. Note: For precedent-based approaches, business case is auto-valid (user requested); focus on filter accuracy."

# Phase 2: Synthesis
PROMPT_SYNTHESIS="Synthesize all approaches and critiques. Create validation matrix and extract ready-to-test approaches. Preserve diversity."

# ================================================================================
# LONG CONTEXT PROMPTS (instruction blocks for context files)
# ================================================================================

# Phase 0: Generation Context (appended to shared_context.txt)
CONTEXT_GENERATION="# SearchLand Filter Generation - Independent Approach

## Your Task
Generate 1-3 unique property search strategies based on the requirements below.

## Key Constraints
1. **Work Independently:** Do NOT see other LLM outputs. Generate YOUR unique perspective.
2. **Reference Materials:** See FILTER_PATTERNS and LEARNINGS_DATABASE sections below
3. **Technical Validity:** All filters MUST exist in available filters list (see below)
4. **Capital Feasibility:** Approaches MUST meet budget requirements
5. **Precedent Analysis:** MANDATORY - Generate at least ONE filter approach for EACH planning application provided in requirements

**IMPORTANT:** All reference materials are included in this prompt below. Do NOT attempt to read external files.

## Output Format
For each approach, provide:

### Approach [Letter]: [Name]
**Strategic Pattern:** [Which pattern from FILTER_PATTERNS.md]
**Capital Required:** [Breakdown]
**Expected Results:** [Estimated property count]

**SearchLand AI Prompt:**
\`\`\`
1. [Filter name]: [operator] [value]
2. [Filter name]: [operator] [value]
...
\`\`\`

**Rationale:**
[Why this approach works]

**Strengths:**
- [List]

**Limitations:**
- [List]

**Implementation Strategy:**
[How to execute]

---
"

# Phase 1: Critique Context (appended to critique_context.txt)
CONTEXT_CRITIQUE="# Technical & Business Case Validation Task

## Your Role
Review ALL approaches below for **TECHNICAL AND BUSINESS CASE VALIDITY** (not strategic preference).

## What to Check
1. **Filter Existence:** Do filters exist in AvailableFiltersInSearchLand_ACTUAL.md?
2. **Unit Correctness:** Are units correct (acres vs sqft, metres vs floors)?
3. **Syntax Validity:** Is SearchLand AI syntax correct?
4. **Logical Coherence:** Do filters match stated strategy?
5. **Capital Feasibility:** Does approach meet budget requirements (£200k)?
6. **ROI Calculations:** Are profit targets (£2M) achievable with proposed strategy?
7. **Implementation Viability:** Can the approach be executed as described?
8. **Deal Structure:** Is the proposed deal structure legally/financially sound?

## What NOT to Check
- Strategic preferences (all valid approaches can coexist)
- Priority rankings (your #1 may be another's #5)
- Implementation style (different LLMs have different styles)

## Output Format
For each approach, provide:

### [LLM Name] - Approach [Letter]: [Status]
**Status:** VALID | CONDITIONAL | INVALID
**Reasoning:** [Brief explanation]

**Technical Issues (if any):**
- [List specific problems]

**Suggested Fixes (if CONDITIONAL):**
- [List corrections]

**Strategic Notes (optional):**
- [Any strategic observations - but NOT validity concerns]

---
"

# Phase 1: Disagreement Analysis Context (appended to disagreement_check_prompt.txt)
CONTEXT_DISAGREEMENT="# Disagreement Detection Task

Analyze the 4 critique files and identify TECHNICAL AND BUSINESS CASE DISAGREEMENTS.

## What Counts as Disagreement
- LLM A says filter exists, LLM B says it doesn't (factual dispute)
- LLM A says \"acres\", LLM B says \"sqft\" for same filter (unit dispute)
- LLM A says VALID syntax, LLM B says INVALID syntax (technical dispute)
- LLM A says £200k is sufficient, LLM B says it's not (capital feasibility dispute)
- LLM A says ROI achievable, LLM B says unrealistic (business case dispute)
- LLM A says deal structure works, LLM B says legally/financially flawed (implementation dispute)

## What Does NOT Count
- Priority rankings (A ranks #1, B ranks #3 - both valid)
- Strategic preferences (speed vs certainty - philosophical)
- Implementation styles (different but both correct)

## Special Note on Precedent-Based Approaches
For approaches replicating user-provided planning applications:
- Business case is AUTO-VALID (user requested it)
- Focus validation on: Do filters actually replicate the precedent correctly?
- Multiple valid filter implementations are expected and acceptable

## Output Format
If disagreements exist:

DISAGREEMENTS_FOUND: YES

### Disagreement #1
**Type:** [Filter existence | Units | Syntax | Capital feasibility | ROI | Deal structure]
**Approaches:** [Which approaches affected]
**Positions:**
- LLM A: [Position]
- LLM B: [Position]
- LLM C: [Position]
- LLM D: [Position]

**Impact:** [Critical | Minor]
**Requires iteration:** [YES | NO]

---

If no disagreements:

DISAGREEMENTS_FOUND: NO

All LLMs agree on technical and business case facts. Strategic differences are preserved.
"

# Phase 1.5: Iteration Context (appended to iteration_context.txt)
CONTEXT_ITERATION="# Technical & Business Case Iteration Task

## Context
You previously reviewed approaches and identified technical and business case issues. Other LLMs disagreed with some of your assessments.

## Your Task
**Reconsider your positions** based on the disagreement analysis below. You may:
1. **Maintain your position** (with additional evidence)
2. **Change your position** (if you were mistaken)
3. **Clarify your position** (if misunderstood)

## What to Focus On
- Factual correctness (filter existence, units, syntax)
- Business case viability (capital, ROI, implementation feasibility)
- Evidence-based reasoning (cite sources)
- Technical and financial precision (not strategic preference)

## Output Format
### Updated Assessment (Technical & Business Case)

**Approaches I'm changing my assessment on:**
- Approach [X]: Was [STATUS], now [STATUS] because [evidence]

**Approaches I'm maintaining my assessment on:**
- Approach [Y]: Still [STATUS] because [evidence]

**Clarifications:**
- [Any misunderstandings to clear up]
"

# Phase 2: Synthesis Context (appended to synthesis_context.txt)
CONTEXT_SYNTHESIS="# Synthesis Task

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

\`\`\`markdown
# Approach [Letter]: [Name]

**Status:** VALID | CONDITIONAL
**Original LLM:** [Name]
**Pattern:** [From FILTER_PATTERNS.md]
**Capital Required:** [Breakdown]
**Expected Results:** [Estimated count]

## SearchLand AI Prompt (Copy-Paste Ready)
\`\`\`
1. [Filter name]: [operator] [value]
2. [Filter name]: [operator] [value]
3. [Filter name]: [operator] [value]
...
\`\`\`

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

**Proceed to Stage 4: Refinement & Validation**

See \`04_REFINEMENT/README.md\` for the complete 10-step workflow:

0. Create Executive Summary (this file tracks all refinement steps)
1. Copy SearchLand AI prompt above
2. Paste screenshot of what SearchLand AI actually created
3. Run validation script to check accuracy (compare intended vs actual)
4. Update prompts based on issues + update LEARNINGS_DATABASE.md
5. Document results & property screenshots

Then continue to Stage 5 (Site Validation) and Stage 6 (Deep Research).

**Full workflow documented in project README.md**
\`\`\`
---
"

