# 🎯 DESIGN PHILOSOPHY: Independence → Critique → Consensus

**Date:** 2025-11-19  
**Issue:** User identified that "collaborative" prompt is too prescriptive  
**Core Insight:** LLMs should work independently, THEN critique, not "work together"

---

## 🔍 THE PROBLEM WITH "COLLABORATIVE"

### **v4 orchestrate_collaborative.sh (TOO PRESCRIPTIVE):**

```markdown
You are three expert property analysts working TOGETHER...
All three of you collaborate on ALL angles...
Systematically explore strategic angles together...
For each angle, discuss as a group and propose the BEST approach(es)...
```

### **Why This Is Wrong:**

**1. Not Scalable:**
```
"You are three expert property analysts..."
What if we add Grok? GPT-4? Llama? Perplexity?
Need to rewrite prompt for every LLM count change!
```

**2. Prescriptive ("Overbearing"):**
```
Tells LLMs HOW to think ("work together", "discuss as a group")
Forces artificial collaboration
LLMs should decide their own process
```

**3. Forced Consensus:**
```
"propose the BEST approach(es)"
What if there are multiple valid approaches?
Suppresses alternative perspectives
```

**4. Not True Multi-LLM:**
```
Actually just ONE LLM (Claude) reading this prompt
Simulates "three analysts" but it's just one
False impression of collaboration
```

---

## ✅ CORRECT MODEL: Independent → Critique → Consensus

### **User's Proposed Model:**

```
┌──────────────────────────────────────────────────────────────┐
│ PHASE 1: INDEPENDENT GENERATION                              │
├──────────────────────────────────────────────────────────────┤
│ Each LLM works INDEPENDENTLY (no coordination):              │
│                                                               │
│ Gemini:    Generates approaches based on requirements        │
│            (doesn't know what Codex/Claude are doing)        │
│                                                               │
│ Codex:     Generates approaches based on requirements        │
│            (doesn't know what Gemini/Claude are doing)       │
│                                                               │
│ Claude:    Generates approaches based on requirements        │
│            (doesn't know what Gemini/Codex are doing)        │
│                                                               │
│ Grok:      [If added] Generates independently                │
│                                                               │
│ Output: N approaches (one per LLM, completely independent)   │
└──────────────────────────────────────────────────────────────┘
                            ↓
┌──────────────────────────────────────────────────────────────┐
│ PHASE 2: CROSS-CRITIQUE                                      │
├──────────────────────────────────────────────────────────────┤
│ Each LLM reads ALL others' outputs and critiques:            │
│                                                               │
│ Gemini:    Reads Codex + Claude (+ Grok) approaches          │
│            Critiques each for technical validity             │
│            Does NOT say "which is better"                    │
│                                                               │
│ Codex:     Reads Gemini + Claude (+ Grok) approaches         │
│            Critiques each for technical validity             │
│                                                               │
│ Claude:    Reads Gemini + Codex (+ Grok) approaches          │
│            Critiques each for technical validity             │
│                                                               │
│ Grok:      [If added] Reads all others' approaches           │
│                                                               │
│ Output: N×(N-1) critiques (each reviews all others)          │
└──────────────────────────────────────────────────────────────┘
                            ↓
┌──────────────────────────────────────────────────────────────┐
│ PHASE 3: ITERATION (If Technical Disagreements)              │
├──────────────────────────────────────────────────────────────┤
│ Each LLM reconsiders based on others' critiques:             │
│                                                               │
│ IF critiques agree → Skip to Phase 4                         │
│ IF critiques disagree (2-1 split, etc.) → Iterate:          │
│                                                               │
│   Each LLM:                                                   │
│   - Reads critiques from others                              │
│   - Reconsiders: "Did I miss something?"                     │
│   - Updates position OR explains why unchanged               │
│                                                               │
│ Iterate until:                                                │
│   a) Technical consensus reached, OR                          │
│   b) Agree to disagree (multiple valid approaches accepted)  │
│                                                               │
│ Output: Updated critiques with consensus/acceptance          │
└──────────────────────────────────────────────────────────────┘
                            ↓
┌──────────────────────────────────────────────────────────────┐
│ PHASE 4: SYNTHESIS/AGGREGATION                               │
├──────────────────────────────────────────────────────────────┤
│ Aggregate results (could be human or designated LLM):        │
│                                                               │
│ • Collect all VALID approaches (passed critique)             │
│ • Document consensus areas                                   │
│ • Document accepted alternatives (multiple valid approaches) │
│ • Proceed to testing with ALL valid approaches               │
│                                                               │
│ Output: Validation matrix + list of approaches to test       │
└──────────────────────────────────────────────────────────────┘
```

---

## 🎯 KEY PRINCIPLES

### **1. Independence First**
```
✅ DO: "You are an expert analyst. Generate approaches based on requirements."
❌ DON'T: "You are working with Gemini and Codex. Collaborate on approaches."
```

**Why:**
- Scales to any number of LLMs
- Each LLM brings unique perspective
- No artificial constraints

---

### **2. Critique is Technical, Not Preferential**
```
✅ DO: "Check if filters exist, units are correct, syntax is valid."
❌ DON'T: "Which approach is better? Rank them."
```

**Why:**
- Validation ≠ Quality judgment
- Multiple approaches can be valid
- Empirical testing decides quality

---

### **3. Iteration on Facts, Not Opinions**
```
✅ DO: Iterate if: "Gemini says filter exists, Codex says it doesn't"
❌ DON'T: Iterate if: "Gemini prefers approach A, Codex prefers approach B"
```

**Why:**
- Facts can be verified
- Opinions are subjective
- Multiple valid opinions should coexist

---

### **4. Accept Multiple Valid Approaches**
```
✅ DO: "Approaches A, B, and C all technically valid → Test all three"
❌ DON'T: "Force consensus on ONE approach before testing"
```

**Why:**
- Empirical testing reveals what works
- Different approaches work in different contexts
- Diversity is feature, not bug

---

## 📊 COMPARISON: v4 vs Proposed

| Aspect | v4 "Collaborative" | Proposed "Independent→Critique" |
|--------|-------------------|--------------------------------|
| **Generation** | "Work together as group" | Each LLM independent |
| **Scalability** | Hardcoded "three analysts" | Works with N LLMs |
| **Prompt** | Prescriptive (tells HOW) | Minimal (tells WHAT) |
| **Coordination** | Forced collaboration | Natural through critique |
| **Consensus** | Forced before generation | Emerges through iteration |
| **Valid approaches** | Push for "the best" | Accept multiple if valid |
| **LLM diversity** | Simulated (one LLM) | Real (actual different LLMs) |

---

## ✅ FIXES APPLIED

### **For `.system_improvement` (DONE):**

**Before:**
```markdown
## YOUR TASK

You are an expert UK property analyst reviewing Claude's work.

Your job:
1. Critique existing patterns
2. Suggest new patterns
3. Optimize for YOUR usage
```

**After:**
```markdown
## YOUR TASK

You are an expert UK property analyst reviewing Claude's work.

**IMPORTANT:** You are working INDEPENDENTLY. You won't see other 
reviewers' feedback until later. Provide YOUR OWN analysis without 
trying to coordinate or collaborate.

Your job:
1. Critique existing patterns
2. Suggest new patterns
3. Optimize for YOUR usage
```

**Why This Works:**
- ✅ Explicit about independence
- ✅ Scales to any number of reviewers
- ✅ Doesn't prescribe HOW to think
- ✅ Already uses REAL LLM CLIs (gemini/codex/claude)

---

### **For v5 (TO BE BUILT):**

**Don't create "collaborative" prompts. Instead:**

**Phase 1 Prompt (Independent Generation):**
```markdown
# TASK: Generate SearchLand Filter Approaches

You are an expert UK property analyst.

Based on the requirements provided, generate 2-3 distinct filter strategies.

**Work independently** - you won't see what other analysts generate until later.

Use:
- FILTER_PATTERNS.md for inspiration
- AvailableFiltersInSearchLand_ACTUAL.md for real filters
- LEARNINGS_DATABASE.md for known behaviors

Output: 2-3 approaches with filters, rationale, expected results.
```

**Phase 2 Prompt (Cross-Critique):**
```markdown
# TASK: Technical Validation of All Approaches

You are reviewing approaches generated by multiple analysts.

For EACH approach, check TECHNICAL validity ONLY:
- Do filters exist in AvailableFiltersInSearchLand_ACTUAL.md?
- Are units correct (acres/sqft/metres)?
- Is syntax valid per LEARNINGS_DATABASE.md?

DO NOT judge which approach is "better" - that's for empirical testing.

Output: Technical validation (PASS/FAIL) for each approach.
```

**Phase 3 Prompt (Iteration):**
```markdown
# TASK: Reconsider Your Technical Validation

Other analysts have also validated the approaches. Some disagreements exist.

For each disagreement where you're involved:
1. Read the other analyst's position
2. Check AvailableFiltersInSearchLand_ACTUAL.md again
3. Update your position if warranted OR explain why you're confident

Be intellectually honest - if you missed something, acknowledge it.

Output: Updated technical validations.
```

**Phase 4: Aggregation (Simple)**
```markdown
# TASK: Aggregate Validation Results

Compile all technical validations (using updated positions if iteration ran).

For each approach:
- If all say VALID → PROCEED TO TESTING
- If 2+ say INVALID with same reason → REJECT
- If split → Document disagreement, let human decide

Output: Validation matrix with test/reject decisions.
```

---

## 🎓 WHY USER IS RIGHT

### **User's Concerns:**

**1. "What happens if we add Grok?"**
→ Current prompt hardcodes "three analysts" - not scalable

**2. "System is being too overbearing"**
→ Prompt tells LLMs HOW to think ("work together") instead of WHAT to do

**3. "We should not say working together"**
→ Correct - independence first, THEN critique

**4. "Come up with your own then pass to other to critique until consensus"**
→ Exactly right - this is the proper flow

---

## 📋 IMPLEMENTATION FOR v5

### **Orchestration Scripts Should:**

**1. Phase 1: Independent Generation**
```bash
# Run each LLM independently in parallel
gemini -p "$(cat independent_gen_prompt.txt)" > Gemini_Output.md &
codex exec "$(cat independent_gen_prompt.txt)" > Codex_Output.md &
claude < independent_gen_prompt.txt > Claude_Output.md &
# If Grok exists:
# grok -p "$(cat independent_gen_prompt.txt)" > Grok_Output.md &

wait  # Wait for all to complete

# NO communication between LLMs during this phase!
```

**2. Phase 2: Cross-Critique**
```bash
# Create critique context (all outputs)
cat Gemini_Output.md Codex_Output.md Claude_Output.md > all_outputs.txt
cat critique_prompt.txt all_outputs.txt > critique_context.txt

# Each LLM critiques ALL outputs
gemini -p "$(cat critique_context.txt)" > Critique_Gemini.md &
codex exec "$(cat critique_context.txt)" > Critique_Codex.md &
claude < critique_context.txt > Critique_Claude.md &

wait
```

**3. Phase 3: Iteration (If Needed)**
```bash
# Check for disagreements
claude < disagreement_check.txt > disagreement_analysis.md

if grep -q "ITERATE" disagreement_analysis.md; then
    # Create iteration context (all critiques)
    cat Critique_*.md > all_critiques.txt
    cat iteration_prompt.txt all_critiques.txt > iteration_context.txt
    
    # Each LLM reconsiders
    gemini -p "$(cat iteration_context.txt)" > Iteration_Gemini.md &
    codex exec "$(cat iteration_context.txt)" > Iteration_Codex.md &
    claude < iteration_context.txt > Iteration_Claude.md &
    
    wait
fi
```

**4. Phase 4: Aggregation**
```bash
# Simple aggregation (could be human or designated LLM)
cat Critique_*.md Iteration_*.md > final_validation_data.txt
claude < aggregation_prompt.txt > FINAL_ValidationMatrix.md
```

---

## ✅ BENEFITS OF THIS MODEL

### **1. Scalable:**
```
Works with:
- 2 LLMs (Gemini + Codex)
- 3 LLMs (+ Claude)
- 5 LLMs (+ Grok + GPT-4)
- N LLMs (any combination)

Just add another parallel call!
```

### **2. True Diversity:**
```
Each LLM:
- Works independently (no groupthink)
- Brings unique perspective
- Isn't constrained by others' thinking
```

### **3. Natural Consensus:**
```
Consensus emerges through:
- Independent work
- Mutual critique
- Iteration on facts
NOT through forced collaboration
```

### **4. Accepts Multiple Valid Approaches:**
```
If Gemini, Codex, Claude all generate different approaches
AND all are technically valid
→ Test all three!

Empirical data decides, not forced consensus
```

---

## 🚀 READY FOR v5

### **When Building v5:**

1. ✅ Use `.system_improvement` as template (already correct!)
2. ✅ Write independent prompts (not "collaborative")
3. ✅ Use REAL LLM CLIs (gemini/codex/claude, not simulated)
4. ✅ 4-phase flow: Independent → Critique → Iterate → Aggregate
5. ✅ Scale-friendly (easy to add Grok, GPT-4, etc.)

---

## 📊 STATUS

| Component | Independence Model? | Real CLIs? | Scalable? |
|-----------|--------------------|-----------|-----------| 
| **.system_improvement** | ✅ YES (just improved) | ✅ YES | ✅ YES |
| **v4 scripts** | ❌ NO (forced collaboration) | ❌ NO (claude only) | ❌ NO |
| **v5 (planned)** | ✅ YES (will use independent model) | ✅ YES (copy .system_improvement) | ✅ YES |

---

## 🎯 USER'S INSIGHT

**User asked:** "What happens if we add another LLM like Grok?"

**Answer:** With current v4 design → Must rewrite prompts (not scalable)

**With proposed design:** Just add one line:
```bash
grok -p "$(cat independent_gen_prompt.txt)" > Grok_Output.md &
```

**That's it!** No prompt changes, fully scalable.

---

**Status:** Design philosophy clarified and documented ✅  
**Fix applied:** `.system_improvement` now explicit about independence ✅  
**For v5:** Will implement full Independent→Critique→Consensus model ✅

---

**User is correct: The "collaborative" approach was well-intentioned but overbearing. Independence with critique is the right model.**

