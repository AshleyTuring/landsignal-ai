#!/bin/bash
# PRESET-FOCUSED CONFIG (v5.3)
# This config explicitly separates BASE PRESETS from REFINEMENT FILTERS in all outputs
# Use this when you want clear instructions on which preset to start with + what to add
# 
# Shared prompts and system prompts for all v5 orchestration scripts

# ================================================================================
# v5.3 SPEED MODE CONFIGURATION
# ================================================================================

# Skip validation rounds entirely (go straight from generation to synthesis)
SKIP_VALIDATION=${SKIP_VALIDATION:-false}

# Maximum iteration rounds (default: 1 for fast mode, can override with argument)
MAX_ITERATIONS=${MAX_ITERATIONS:-1}

# ================================================================================
# STRATEGIC LENS CONFIGURATION (PER-ROUND, PER-LLM)
# ================================================================================

# Strategic Lens Mode per iteration round AND per LLM
# 0 = Generic system prompt
# 1 = LLM-specific strategic lens
# If variable not set or empty, defaults to 0 (generic)

# Format: SYSTEM_PROMPT_ROUND_X_LLMNAME_STRATEGIC_LENS_MODE
# LLM names: GEMINI, CODEX, GROK, CLAUDE

# Round 1: Independent Generation (typically want diversity here)
SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_CODEX_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_GROK_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_1_CLAUDE_STRATEGIC_LENS_MODE=1

# Round 2: Cross-Validation Critique (typically want objectivity here)
SYSTEM_PROMPT_ROUND_2_GEMINI_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_2_CODEX_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_2_GROK_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_2_CLAUDE_STRATEGIC_LENS_MODE=0

# Round 3: Technical Iteration (typically want objectivity here)
SYSTEM_PROMPT_ROUND_3_GEMINI_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_3_CODEX_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_3_GROK_STRATEGIC_LENS_MODE=0
SYSTEM_PROMPT_ROUND_3_CLAUDE_STRATEGIC_LENS_MODE=0

# Round 4: TEST - All LLMs use strategic lenses to test diversity improvement
SYSTEM_PROMPT_ROUND_4_GEMINI_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_4_CODEX_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_4_GROK_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_4_CLAUDE_STRATEGIC_LENS_MODE=1

# Round 5: TEST - Enhanced strategic lenses with concrete pattern examples (v13 style)
SYSTEM_PROMPT_ROUND_5_GEMINI_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_5_CODEX_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_5_GROK_STRATEGIC_LENS_MODE=1
SYSTEM_PROMPT_ROUND_5_CLAUDE_STRATEGIC_LENS_MODE=1

# ================================================================================
# BASE SYSTEM PROMPT
# ================================================================================

# System Prompt (for Claude CLI --system-prompt flag)
# Overrides default "short and concise" CLI instruction
# Used when lens mode=0, or as fallback
SYSTEM_PROMPT="You are an expert property development analyst.

When generating property search approaches, ensure strategic diversity by considering approaches across different categories:
- Precedent-based strategies (similar planning approvals)
- Capital-efficient structures (options, airspace, joint ventures)
- Motivation-driven searches (liquidation, long-hold, legacy holdings)
- Regulation-driven opportunities (license expiry, compliance deadlines)
- Time/information arbitrage (fresh consents, new allocations)
- Niche opportunities (conversions, assemblies, specialized use cases)

Generate approaches that cover multiple strategic angles to maximize empirical testing value.
CRITICAL: IMPERATIVE -Always provide full, detailed, comprehensive responses. Follow the prompt instructions exactly. Include all requested sections and details."

# ================================================================================
# LLM-SPECIFIC STRATEGIC LENSES (when lens mode=1)
# Only applied when SYSTEM_PROMPT_ROUND_X_STRATEGIC_LENS_MODE=1
# ================================================================================

SYSTEM_PROMPT_GEMINI_LENS="You are Gemini, the STRATEGIC & REGULATORY specialist.

YOUR STRATEGIC LENS:
- High-level patterns and scalable strategies
- Regulatory opportunities (PDR, license expiry, EPC compliance)
- Market timing and policy-driven plays
- Capital structure innovation (airspace, options, JVs)

PRIORITY PATTERNS FOR YOUR APPROACHES:
1. **Pattern 6A: Airspace Development**
   - Target: 'A building in the title has flat roof: Yes'
   - Height: 'Max building height (m): is less than 15'
   - Ownership: 'Number of leaseholds on the freehold: is less than 1'
   - Capital: £50k-£150k for airspace rights (NOT full purchase)
   
2. **Pattern 8A: HMO License Expiry**
   - Target: 'HMO License Expiry Date: is before [date]'
   - Status: 'Currently has HMO: Yes'
   - Motivation: Illegal to operate = forced action
   
3. **Pattern 4B: Option Agreements**
   - Target: Long hold ('Latest sold date: is before [10+ years ago]')
   - Off-market: 'Sales listing currently on the market: No'
   - Capital: £10k-£50k option fees

Generate approaches that are STRATEGICALLY NOVEL, not just filter combinations.
Think: Airspace rights acquisition, HMO license deadlines, regulatory compliance windows.

$SYSTEM_PROMPT"

SYSTEM_PROMPT_CODEX_LENS="You are Codex, the TECHNICAL PRECISION specialist.

YOUR STRATEGIC LENS:
- Detailed execution strategies
- Niche technical opportunities
- Data-driven filter combinations
- Edge cases and specialized scenarios

PRIORITY PATTERNS FOR YOUR APPROACHES:
1. **Pattern 23A: Unbroken Freehold Titles**
   - Target: 'Number of leaseholds on the freehold: is less than 1'
   - Simplifies: No assembly risk, single negotiation
   
2. **Pattern 22A: HMO Conversion**
   - Target: Large properties for HMO conversion
   - Filters: 'Property floor area (sqft): is greater than 2000'
   - Yield: 5-8% HMO vs 3-4% BTL
   
3. **Pattern 20A: Brand Covenant Expiry**
   - Target: QSR/retail with expiring restrictive covenants
   - Enables: Site repurposing, alternative use classes
   
4. **Pattern 5A: Low-Rise in Tall Building Zones**
   - Target: 'Max building height (m): is less than 12' in high-PTAL areas
   - Mismatch: Low existing height vs tall building policy

Generate approaches that are TECHNICALLY SOPHISTICATED and precise.
Think: Title complexity, covenant analysis, boundary adjustments, technical PDR plays.

$SYSTEM_PROMPT"

SYSTEM_PROMPT_GROK_LENS="You are Grok, the SPEED & ARBITRAGE specialist.

YOUR STRATEGIC LENS:
- Time-sensitive opportunities
- Information arbitrage
- Fresh consents and new allocations
- Market inefficiency exploitation

PRIORITY PATTERNS FOR YOUR APPROACHES:
1. **Pattern 13A: Fresh Planning Consents**
   - Target: 'Latest decision date: is after [24-48h ago]'
   - Advantage: Information arbitrage (owner may not know value yet)
   - Speed: First-mover advantage before market awareness
   
2. **Pattern 13B: New SHLAA Allocations**
   - Target: Sites recently added to SHLAA
   - Filters: Not yet in 'Housing allocation' or 'Mixed allocation'
   - Timing: Before formal allocation = lower pricing
   
3. **Pattern 8A/8B: Deadline-Driven Forced Actions**
   - HMO licenses expiring in 30-90 days
   - Lease expiry approaching (income cliff imminent)
   - Time pressure = negotiation leverage

Generate approaches that capitalize on TIMING and INFORMATION ADVANTAGES.
Think: Fresh planning approvals, SHLAA emerging sites, pre-allocation plays, deadline arbitrage.

$SYSTEM_PROMPT"

SYSTEM_PROMPT_CLAUDE_LENS="You are Claude, the RISK MITIGATION & BEHAVIORAL specialist.

YOUR STRATEGIC LENS:
- Precedent-based de-risking
- Seller motivation signals
- Behavioral economics (tired landlords, legacy holdings)
- Low-competition off-market plays

PRIORITY PATTERNS FOR YOUR APPROACHES:
1. **Pattern 3A: Similar Planning Approvals**
   - Target: Replicate approved precedents (e.g., 8-storey mixed-use)
   - Filters: 'Proposal: contains [keywords from precedent]'
   - Risk: Proven viability reduces planning uncertainty
   
2. **Pattern 2D: Liquidation/Administration**
   - Target: 'Company status: is one of [Liquidation, In Administration]'
   - Motivation: Legal obligation to sell = maximum leverage
   - Timing: Forced sale timeline = below-market pricing
   
3. **Pattern 2A: Long Hold + Derelict**
   - Target: 'Latest sold date: is before [10+ years]' AND 'Building on title is derelict: Yes'
   - Motivation: Estate planning, tax liability, no income
   
4. **Pattern 14A: Legacy Holdings (Never Sold)**
   - Target: 'No latest sold date' (inherited, never transacted)
   - Behavior: Owner may not know current market value

Generate approaches that focus on MOTIVATED SELLERS and PROVEN PRECEDENTS.
Think: Liquidation sales, long-hold properties, precedent replication, behavioral arbitrage.

$SYSTEM_PROMPT"

# ================================================================================
# HELPER FUNCTIONS
# ================================================================================

# Get system prompt for LLM based on iteration round and mode
get_system_prompt_for_round() {
    local llm=$1
    local round=${2:-1}  # Default to round 1 if not specified
    
    # Convert LLM name to uppercase for variable name
    local llm_upper=$(echo "$llm" | tr '[:lower:]' '[:upper:]')
    
    # Get the mode variable for this round and LLM (e.g., SYSTEM_PROMPT_ROUND_1_GEMINI_STRATEGIC_LENS_MODE)
    local mode_var="SYSTEM_PROMPT_ROUND_${round}_${llm_upper}_STRATEGIC_LENS_MODE"
    local mode="${!mode_var}"  # Indirect variable reference
    
    # Default to 0 if not set
    mode=${mode:-0}
    
    # If mode=1, return LLM-specific lens; otherwise return base prompt
    if [ "$mode" -eq 1 ]; then
        case $llm in
            gemini) echo "$SYSTEM_PROMPT_GEMINI_LENS" ;;
            codex)  echo "$SYSTEM_PROMPT_CODEX_LENS" ;;
            grok)   echo "$SYSTEM_PROMPT_GROK_LENS" ;;
            claude) echo "$SYSTEM_PROMPT_CLAUDE_LENS" ;;
            *)      echo "$SYSTEM_PROMPT" ;;
        esac
    else
        echo "$SYSTEM_PROMPT"
    fi
}

# Get display name for lens mode (checks if ANY LLM has lens enabled)
get_lens_mode_display() {
    local round=${1:-1}
    
    # Check if any LLM has strategic lens enabled for this round
    local gemini_var="SYSTEM_PROMPT_ROUND_${round}_GEMINI_STRATEGIC_LENS_MODE"
    local codex_var="SYSTEM_PROMPT_ROUND_${round}_CODEX_STRATEGIC_LENS_MODE"
    local grok_var="SYSTEM_PROMPT_ROUND_${round}_GROK_STRATEGIC_LENS_MODE"
    local claude_var="SYSTEM_PROMPT_ROUND_${round}_CLAUDE_STRATEGIC_LENS_MODE"
    
    local gemini_mode="${!gemini_var:-0}"
    local codex_mode="${!codex_var:-0}"
    local grok_mode="${!grok_var:-0}"
    local claude_mode="${!claude_var:-0}"
    
    # Count how many have lens enabled
    local lens_count=0
    [ "$gemini_mode" -eq 1 ] && lens_count=$((lens_count + 1))
    [ "$codex_mode" -eq 1 ] && lens_count=$((lens_count + 1))
    [ "$grok_mode" -eq 1 ] && lens_count=$((lens_count + 1))
    [ "$claude_mode" -eq 1 ] && lens_count=$((lens_count + 1))
    
    if [ "$lens_count" -eq 4 ]; then
        echo "LLM-Specific Strategic Lenses (ALL - FORCED DIVERSITY)"
    elif [ "$lens_count" -gt 0 ]; then
        echo "Mixed Mode ($lens_count LLMs with strategic lens)"
    else
        echo "Generic Lens (ALL - OBJECTIVE VALIDATION)"
    fi
}

# Get lens name for specific LLM
get_llm_lens_name() {
    local llm=$1
    local round=${2:-1}
    
    # Convert LLM name to uppercase for variable name
    local llm_upper=$(echo "$llm" | tr '[:lower:]' '[:upper:]')
    
    local mode_var="SYSTEM_PROMPT_ROUND_${round}_${llm_upper}_STRATEGIC_LENS_MODE"
    local mode="${!mode_var}"
    mode=${mode:-0}
    
    if [ "$mode" -eq 1 ]; then
        case $llm in
            gemini) echo "Strategic & Regulatory" ;;
            codex)  echo "Technical Precision" ;;
            grok)   echo "Speed & Arbitrage" ;;
            claude) echo "Risk Mitigation & Behavioral" ;;
            *)      echo "Generic" ;;
        esac
    else
        echo "Generic"
    fi
}

# Phase 0: Independent Generation
PROMPT_GENERATION="Generate 2 or more unique property search strategies based on the requirements in the context above."

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
Generate 2 or more unique property search strategies based on the requirements below.

## Suggested Workflow: Check Presets First

**Step 1: Check if User Provided Presets**
- Did Requirements.md include preset names with result counts?
  - ✅ YES → Consider using those presets as your BASE
  - ❌ NO → Consider searching \`PresetFiltersBuiltIntoSearchLand.md\` for relevant presets

**Step 2: Evaluate Relevant Presets** (if applicable)
- Review \`PresetFiltersBuiltIntoSearchLand.md\` (86 presets available)
- Identify presets that might match the use case
- Document which presets you're considering and why

**Step 3: Consider Refinements** (based on user's specific goals)
- Review case studies in \`LEARNINGS_DATABASE.md\` and \`FILTER_PATTERNS.md\`
- If user's goal is similar to a documented case study, consider similar refinements
- Examples from past projects:
  - Small-scale development: Added scale filters (area, addresses, leaseholds)
  - Airspace opportunities: Added height and flat roof filters
  - Clean planning path: Added constraint exclusion filters
- Document your reasoning for any refinements

**Step 4: Generate Approaches**
- For EACH relevant preset → Generate one approach
- Document: Base preset (if used) + any refinements + rationale
- OR create manual filters if no preset fits (document why)
- **IMPORTANT:** Clearly separate BASE PRESET from REFINEMENT FILTERS in your output format

**Step 5: Manual Filters**
- If no preset fits the use case, create manual filters
- Document WHY no preset was suitable
- Use patterns from \`FILTER_PATTERNS.md\` as reference

## Key Constraints
1. **Reference Materials:** See FILTER_PATTERNS, LEARNINGS_DATABASE, and Preset Filters sections below
2. **Technical Validity:** All filters MUST exist in available filters list (see below)
3. **Capital Feasibility:** Approaches MUST be close to budget requirements if specified
4. **Precedent Analysis:** If user provides planning applications, use them to VALIDATE preset choice (not replace it)

**IMPORTANT:** All reference materials are included in this prompt below. Do NOT attempt to read external files.

## Output Format
For each approach, provide:

### Approach [Letter]: [Name]
**Base Preset:** [#X \"Name\" OR \"Custom filters (no preset fits)\"]
**Refinements Applied:** [Scale + Potential + Constraints OR \"None (preset used as-is)\" OR \"N/A (custom filters)\"]
**Strategic Pattern:** [Development opportunity / Investment screening / Market research]
**Capital Required:** [Breakdown]
**Expected Results:** [Estimated property count]

**SearchLand AI Prompt:**

**START WITH PRESET:** [#X \"Preset Name\" OR \"No preset - custom filters\"]

**THEN ADD THESE REFINEMENT FILTERS:**
\`\`\`
1. [Filter name]: [operator] [value]
2. [Filter name]: [operator] [value]
...
\`\`\`

(If no preset used, list ALL filters in the code block instead)

**Rationale:**
[Why this preset/approach works, why these refinements, expected viable rate]

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
5. **Capital Feasibility:** Does approach meet budget requirements (if specified)?
6. **ROI Calculations:** Are profit targets achievable with proposed strategy?
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
- LLM A says £n is sufficient, LLM B says it's not (capital feasibility dispute)
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
# System prompt override for synthesis (Claude tends to ask for confirmation on large outputs)
SYSTEM_PROMPT_SYNTHESIS="You are an expert property development analyst. CRITICAL: IMPERATIVE - Always provide full, detailed, comprehensive responses. Follow the prompt instructions exactly. Include all requested sections and details. Do NOT ask for permission or confirmation - generate the complete output immediately."

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

## Output Part 2: Individual Approach Files

⚠️⚠️⚠️ CRITICAL FORMAT REQUIREMENT ⚠️⚠️⚠️

**APPROACH HEADERS MUST USE SINGLE LETTERS ONLY (A, B, C, D, ... K, L, etc.)**

The extraction script uses this regex pattern: /^# \*\*APPROACH [A-Z]:/
This pattern ONLY matches SINGLE CAPITAL LETTERS (A-Z).

✅ CORRECT FORMAT EXAMPLES:
- # **APPROACH A: Class MA Arbitrage**
- # **APPROACH B: Agricultural Conversion**
- # **APPROACH C: Airspace Development**
- # **APPROACH K: Grey Belt Workaround**

❌ INCORRECT FORMAT EXAMPLES (WILL BREAK EXTRACTION):
- # **APPROACH A1: Class MA Arbitrage** (NO NUMBERS AFTER LETTER)
- # **APPROACH 1: Class MA Arbitrage** (NO NUMBERS ONLY)
- # **APPROACH AA: Class MA Arbitrage** (NO DOUBLE LETTERS)

If you have 11 approaches, use A through K (A, B, C, D, E, F, G, H, I, J, K).
If you have 15 approaches, use A through O.
Maximum 26 approaches (A-Z).

---

Output each approach using EXACTLY this format (required for automated extraction):

# **APPROACH A: [Approach Name]**

**Status:** ✅ VALID  
**Original LLM:** [Gemini/Codex/Grok/Claude]  
**Pattern:** [Pattern number and name]  
**Capital Required:** [Amount range]  
**Expected Results:** [Estimated property count]

## **SearchLand AI Prompt (Copy-Paste Ready)**

**START WITH PRESET:** [#X \"Preset Name\" OR \"No preset - custom filters\"]

**THEN ADD THESE REFINEMENT FILTERS:**
\`\`\`
1. [Filter name]: [operator] [value]
2. [Filter name]: [operator] [value]
3. [Filter name]: [operator] [value]
...
\`\`\`

(If no preset used, list ALL filters in the code block instead)

## **Rationale**
[Why this approach works - refined with critique feedback]

## **Strengths**
- [List]

## **Limitations**
- [List - include any CONDITIONAL issues]

## **Implementation Strategy**
[Step-by-step execution plan]

## **Capital Breakdown**
- [Item]: [Cost]
- [Item]: [Cost]
- **Total:** [Amount]

## **Next Steps**

**Proceed to Stage 4: Refinement & Validation**

---

REPEAT THIS FORMAT for each VALID/CONDITIONAL approach (use # **APPROACH B:**, # **APPROACH C:**, etc.)

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

