# Improved LLM Prompts for v5 System

## Issue Summary

**Current Problem:** Claude CLI generates summaries/comparison tables instead of detailed approaches with SearchLand filter prompts.

**Root Cause:** Prompts are too vague and don't explicitly require the output format.

---

## 1. orchestrate_independent.sh (GENERATION)

### Current Prompt (❌ PROBLEM):
```
"You are an expert property development analyst. Generate 1-3 unique property search strategies based on the requirements in the context above."
```

### Improved Prompt (✅ EXPLICIT):
```
"You are an expert property development analyst. Generate 1-3 unique property search strategies based on the requirements in the context above.

CRITICAL OUTPUT FORMAT - Each approach MUST include ALL of these sections:

1. **Approach Name** (e.g., 'Approach A: Stalled Mixed-Use with Corporate Distress')
2. **Strategic Pattern** (reference FILTER_PATTERNS.md)
3. **Capital Required** (breakdown)
4. **Expected Results** (estimated property count)
5. **SearchLand AI Prompt (Copy-Paste Ready):** - THIS IS MANDATORY
   ```
   1. [Filter name]: [operator] [value]
   2. [Filter name]: [operator] [value]
   3. [Filter name]: [operator] [value]
   ...
   ```
6. **Rationale** (why this approach works)
7. **Strengths** (bullet list)
8. **Limitations** (bullet list)
9. **Implementation Strategy** (how to execute)
10. **Capital Breakdown** (detailed table)

DO NOT provide summaries, comparison tables, or strategic advice. Generate FULL DETAILED approaches with executable SearchLand filter prompts."
```

**Key Changes:**
- Explicitly lists all required sections
- Emphasizes SearchLand AI Prompt is MANDATORY
- Shows example format with numbered filters
- Explicitly forbids summaries/comparison tables

---

## 2. orchestrate_crossvalidation.sh (CRITIQUE)

### Current Prompt (⚠️ OKAY BUT COULD BE BETTER):
```
"Review all approaches for TECHNICAL AND BUSINESS CASE validity. Check: filter existence, syntax correctness, unit accuracy, capital feasibility, ROI calculations, and implementation viability. Preserve strategic diversity."
```

### Improved Prompt (✅ MORE EXPLICIT):
```
"Review all approaches for TECHNICAL AND BUSINESS CASE validity.

Check:
- Filter existence (all filters must exist in AvailableFiltersInSearchLand_ACTUAL.md)
- Syntax correctness (operators and format match SearchLand AI requirements)
- Unit accuracy (acres not sqmt, sqft not sqm, metres not feet)
- Capital feasibility (does the approach stay within budget?)
- ROI calculations (are profit estimates realistic?)
- Implementation viability (can this actually be executed?)
- Strategic diversity (do approaches explore different patterns?)

OUTPUT FORMAT:
For each approach, provide:
1. **Approach name and summary**
2. **TECHNICAL VALIDITY:** VALID / CONDITIONAL / INVALID
3. **BUSINESS CASE VALIDITY:** VALID / CONDITIONAL / INVALID
4. **Technical issues found** (list specific filter/syntax/unit errors)
5. **Business case issues found** (list capital/ROI/implementation concerns)
6. **Recommended fixes** (if CONDITIONAL or INVALID)
7. **Strategic assessment** (is this approach unique/valuable?)

Be evidence-based and cite specific line numbers or filter names when identifying issues. Preserve strategic diversity - do not reject approaches just because they differ from your preferred style."
```

**Key Changes:**
- Breaks down validation criteria with examples
- Specifies output format for critique
- Requests evidence-based feedback with citations
- Emphasizes preserving diversity

---

## 3. orchestrate_technical_iteration.sh (ITERATION)

### Current Prompt (✅ ALREADY GOOD):
```
"Reconsider your technical AND business case positions based on disagreements. Be evidence-based and precise. Note: For precedent-based approaches, business case is auto-valid (user requested); focus on filter accuracy."
```

### Improved Prompt (✅ SLIGHTLY ENHANCED):
```
"Reconsider your technical AND business case positions based on the disagreements identified above.

IMPORTANT:
- Be evidence-based - cite specific filters, line numbers, or documentation
- Be precise - if you're changing your position, explain why
- For precedent-based approaches: Business case is auto-valid (user explicitly requested these strategies); focus ONLY on filter accuracy

OUTPUT FORMAT:
1. **Summary of your original position** (1-2 sentences)
2. **Disagreements you're addressing** (list specific points raised by other LLMs)
3. **Your reconsidered position:** VALID / CONDITIONAL / INVALID (state clearly if changed)
4. **Evidence supporting your position** (cite documentation, filter lists, or examples)
5. **Remaining concerns** (if any)

If you maintain your original position, explain why the disagreement doesn't change your assessment."
```

**Key Changes:**
- Adds output format for iteration responses
- Requests summary of original position
- Asks for explicit statement of final position
- Requests evidence citations

---

## 4. orchestrate_synthesis.sh (SYNTHESIS)

### Current Prompt (❌ TOO VAGUE):
```
"Synthesize all approaches and critiques. Create validation matrix and extract ready-to-test approaches. Preserve diversity."
```

### Improved Prompt (✅ COMPREHENSIVE):
```
"Synthesize all approaches, critiques, and iteration feedback (if any) to create a final validation matrix.

YOUR TASKS:

1. **Create FINAL_ValidationMatrix.md** with this structure:

| Approach | Pattern | Capital | Technical | Business Case | Status | Issues | Ready to Test? |
|----------|---------|---------|-----------|---------------|--------|--------|----------------|
| A: Name  | #4, #7  | £180k   | VALID     | VALID         | ✅ READY | None | YES - See file |
| B: Name  | #13     | £200k   | CONDITIONAL | VALID       | ⚠️ FIXES | Unit error (line 23) | After fix |

2. **Extract ready-to-test approaches** to 03_PARALLEL_TESTING/
   - Only extract approaches with status: ✅ READY
   - For each approach, create [ApproachLetter]_ReadyToTest.md
   - Include: Full approach details + SearchLand AI Prompt + Implementation notes

3. **Create SYSTEM_RUN_SUMMARY.md** with:
   - Total approaches generated (by LLM)
   - Total approaches ready to test
   - Total approaches requiring fixes (with list of issues)
   - Strategic diversity assessment (are we testing different patterns?)
   - Recommended testing priority (which approaches to test first and why)

VALIDATION CRITERIA:
- **READY (✅):** All filters exist, syntax correct, units accurate, capital feasible, ROI realistic
- **CONDITIONAL (⚠️):** Minor fixable issues (wrong unit, missing filter, syntax error)
- **INVALID (❌):** Fundamental flaws (impossible filters, budget exceeded, unrealistic ROI)

Preserve strategic diversity - if multiple approaches use the same pattern, flag this but don't eliminate them unless they're duplicate strategies."
```

**Key Changes:**
- Specifies exact structure for validation matrix
- Lists specific tasks (matrix, extraction, summary)
- Defines what "ready to test" means
- Provides validation criteria definitions
- Requests strategic diversity assessment

---

## Testing Plan

1. ✅ Test improved prompts on Claude (me) directly with v13 context
2. ✅ Test improved prompts via Claude CLI
3. Update all 4 orchestration scripts
4. Archive v13 and create v14 with improved prompts
5. Run full system with all 4 LLMs

---

## Expected Outcomes

**With improved prompts:**
- Claude will generate full detailed approaches (not summaries)
- Critiques will be structured and evidence-based
- Synthesis will produce clear validation matrix
- All outputs will be consistent across LLMs

