# FILTER_PATTERNS.md PEER REVIEW TASK

**Reviewer:** [Gemini / Codex - you are reviewing Claude's work]  
**Date:** 2025-11-19  
**Purpose:** Critique and improve FILTER_PATTERNS.md for better usability

---

## YOUR TASK

You are an expert UK property analyst reviewing Claude's `FILTER_PATTERNS.md` document. This document contains 13 strategic filter patterns derived from analyzing 86 SearchLand preset filters.

**IMPORTANT:** You are working INDEPENDENTLY. You won't see other reviewers' feedback until later. Provide YOUR OWN analysis without trying to coordinate or collaborate.

**Your job:**
1. **Critique existing patterns** - Are they clear? Complete? Useful?
2. **Suggest new patterns** - What did Claude miss?
3. **Optimize for YOUR usage** - How would you structure this for easier application?

---

## CONTEXT

**What is FILTER_PATTERNS.md?**
- 13 reusable filter strategies for property development
- Created by analyzing 86 SearchLand presets (see PRESET_STRATEGY_GUIDE.md)
- Used during collaborative exploration (Round 2-5) to inspire approaches
- Categories: Stalled Planning, Motivated Seller, Development Opportunity, Low Capital Entry, High-Density, Airspace, Permitted Development, Regulation-Driven, Grey Belt, Renewable Energy, Strategic Land, Commercial Traffic, Time Arbitrage

**Why review it?**
- Claude may have missed patterns
- Structure may not be optimal for other LLMs
- Could be clearer/more actionable

---

## YOUR REVIEW STRUCTURE

### PART 1: Critique Existing Patterns (1-13)

For EACH of the 13 patterns, assess:

**Pattern Assessment Template:**
```
## Pattern X: [Name]

**Clarity:** Clear / Somewhat Clear / Unclear  
**Completeness:** Complete / Missing Details / Incomplete  
**Usefulness:** Highly Useful / Useful / Limited Use  

**Strengths:**
- [What's good about this pattern?]

**Weaknesses:**
- [What's missing/unclear/wrong?]

**Suggested Improvements:**
- [Specific changes to make it better]

**Your Usage:** Would you use this pattern? Why/why not?
```

---

### PART 2: New Patterns Claude Missed

**Think about:**
- **Review PresetFiltersBuiltIntoSearchLand.md directly** - Which presets didn't become patterns?
- Combinations of existing patterns that form distinct strategies
- Strategies from presets that weren't elevated to patterns (check all 86!)
- Property development strategies you know but didn't see
- UK-specific opportunities (Article 4 withdrawals, PDR changes, etc.)

**IMPORTANT:** Don't just rely on PRESET_STRATEGY_GUIDE.md (Claude's analysis). Read the raw presets yourself - you may disagree with Claude's categorization or spot patterns Claude missed entirely.

**New Pattern Template:**
```
## NEW PATTERN: [Name]

**Category:** [Suggest category or create new one]

**Strategic Rationale:**
[Why this is a distinct, reusable pattern]

**Key Filters:**
1. [Filter name]: [typical value/operator]
2. [Filter name]: [typical value/operator]
...

**Sourced From:**
- Preset #[X] (if applicable)
- General property knowledge
- Observed gap in current patterns

**Use Cases:**
[When would you apply this pattern?]

**Expected Results:**
[Typical result range]
```

Suggest 3-5 new patterns minimum.

---

### PART 3: Structure & Usability Optimization

**Current Structure Review:**

The current FILTER_PATTERNS.md has:
- 13 patterns across 12 categories
- Each pattern has: Sub-patterns, Key filters, Capital strategy, Risk level, Expected results, Use cases, Known issues

**Questions:**
1. **Is this structure optimal for YOUR workflow?**
   - What would you change?
   - What's missing?
   - What's unnecessary?

2. **Ease of Application:**
   - When you're in "Round 2: Regulation Angle", can you quickly find relevant patterns?
   - Would tags help? (e.g., #LowCapital #HighRisk #Motivation)
   - Would a decision tree help? ("If capital <£50k → see patterns X, Y, Z")

3. **Cross-References:**
   - Are links to presets useful?
   - Should there be links to LEARNINGS_DATABASE.md?
   - Should there be example filters (copy-paste ready)?

**Optimization Suggestions Template:**
```
### Structural Improvement: [Name]

**Current Problem:**
[What's inefficient/unclear about current structure?]

**Proposed Solution:**
[Specific structural change]

**Example:**
[Show before/after or mockup]

**Benefit:**
[How does this help you use the patterns better?]
```

---

### PART 4: Pattern Priority & Real-World Application

**Rank the 13 existing patterns by usefulness:**

| Rank | Pattern # | Pattern Name | Why This Ranking? |
|------|-----------|--------------|-------------------|
| 1 | [#] | [Name] | [Most useful because...] |
| 2 | [#] | [Name] | [Second most useful because...] |
| ... | | | |
| 13 | [#] | [Name] | [Least useful because...] |

**Real-World Test:**
"If you were given the MixedUse-8Storey-2M project requirements RIGHT NOW, which patterns would you reference and why?"

---

### PART 5: Integration with Collaborative Workflow

**Current Usage in v3.2.0:**

In collaborative exploration, agents reference FILTER_PATTERNS.md during:
- Round 2: Regulation/Policy Angle
- Round 3: Structural/Creative Angle
- Round 4: Behavioral/Motivation Angle
- Round 5: Challenge Round

**Questions:**
1. **Are patterns mapped well to rounds?**
   - Pattern 8 (Regulation-Driven) → Round 2 ✅
   - Pattern 6 (Airspace) → Round 3 ✅
   - But which patterns for Round 4 (Behavioral)?

2. **Should there be a "Round Guide"?**
   ```
   ## Round 2: Regulation/Policy - Relevant Patterns
   - Pattern 8A: HMO Expired Licenses
   - Pattern 8B: Lease Expiry
   - Pattern 8C: EPC Compliance
   
   Quick Decision: If capital <£100k → Focus on 8B (options)
   ```

3. **Missing Round-Specific Guidance?**
   - What would help YOU during each round?

---

## DELIVERABLES

Please provide:

1. ✅ **Critique of all 13 patterns** (Part 1)
2. ✅ **3-5 new patterns Claude missed** (Part 2)
3. ✅ **Structure optimization suggestions** (Part 3)
4. ✅ **Pattern usefulness ranking** (Part 4)
5. ✅ **Integration improvements** (Part 5)

---

## OUTPUT FORMAT

```markdown
# FILTER_PATTERNS.md REVIEW - [Gemini/Codex]

**Reviewer:** [Your name]  
**Date:** 2025-11-19  
**Review Completeness:** [X/5 parts completed]

---

## PART 1: CRITIQUE OF EXISTING PATTERNS

[Your detailed critique of each pattern using template above]

---

## PART 2: NEW PATTERNS PROPOSED

[Your 3-5 new patterns using template above]

---

## PART 3: STRUCTURE & USABILITY

[Your optimization suggestions]

---

## PART 4: PATTERN RANKING

[Your ranked table and real-world test]

---

## PART 5: WORKFLOW INTEGRATION

[Your integration improvements]

---

## SUMMARY

**Top 3 Improvements Needed:**
1. [Most critical improvement]
2. [Second most critical]
3. [Third most critical]

**Confidence in Current Patterns:** [High/Medium/Low]

**Would You Use This Document?** [Yes/No/With Changes]

**Overall Grade:** [A/B/C/D/F]
```

---

## REFERENCE FILES (Provided in Context)

- `FILTER_PATTERNS.md` (current version - the file you're reviewing)
- `PresetFiltersBuiltIntoSearchLand.md` ⭐ **THE SOURCE** - All 86 raw presets (review this!)
- `PRESET_STRATEGY_GUIDE.md` (Claude's analysis of the 86 presets)
- `LEARNINGS_DATABASE.md` (SearchLand behaviors)
- `AvailableFiltersInSearchLand_ACTUAL.md` (real filters available)

**CRITICAL:** Review the RAW presets (`PresetFiltersBuiltIntoSearchLand.md`), not just Claude's analysis. You may spot patterns Claude missed or disagree with how Claude categorized them.

---

**BEGIN YOUR REVIEW NOW**

Focus on being critical and constructive. Claude can take it - the goal is a better system for ALL agents to use.

