# Multi-LLM Filter Creation Workflow

## Overview

This system uses multiple LLMs (Codex, Gemini, Claude) in an iterative loop to create optimal SearchLand property filters. Each LLM critiques and improves upon the previous output until consensus is reached.

---

## Prerequisites

### Required Files
- `/SearchlandContext/AvailableFiltersInSearchLand.md` - Available filters and parameters
- `/SearchlandContext/PresetFiltersBuiltIntoSearchLand.md` - Example preset filters

### Required Tools
- Anthropic CLI (Claude)
- Gemini CLI
- Codex CLI (OpenAI)
- OpenCode (if available)

### Working Files
- `FilterRequirements.md` - Input (user requirements)
- `FilterIterations.md` - Process tracking
- `FilterResults.md` - Final output

---

## Step-by-Step Workflow

### Step 1: Define Requirements

1. Open `FilterRequirements.md`
2. Fill in all relevant sections based on user needs
3. Choose Type 1 (Profit/Capital) or Type 2 (Planning Application)
4. Add as much context as possible

**Example Type 1:**
```
Target Profit: £2,000,000
Capital Outlay: £200,000
Focus: Mixed-use conversions in London
```

**Example Type 2:**
```
Reference: "Demolition and construction of an 8-storey mixed-use development 
comprising flexible retail (class E) and residential (Class C3) use..."
```

---

### Step 2: Initialize Codex (First Pass)

**Command:**
```bash
# Using Codex CLI
codex chat --model gpt-4 --context SearchlandContext/
```

**Prompt Template:**
```
You are a UK property expert specializing in SearchLand.co.uk filters.

CONTEXT FILES:
- AvailableFiltersInSearchLand.md (available filters)
- PresetFiltersBuiltIntoSearchLand.md (example filters)

REQUIREMENTS:
[Paste content from FilterRequirements.md]

TASK:
Create 1-3 SearchLand filters that meet these requirements.

For each filter provide:
1. Descriptive name
2. Complete filter configuration using available parameters
3. Reasoning for why this meets the requirements
4. Whether it's based on a preset filter or built from scratch

Format your response in a structured way that can be easily copied to FilterIterations.md
```

**Action:**
1. Copy Codex output to `FilterIterations.md` under "Iteration 1 > Codex"
2. Save the file

---

### Step 3: Gemini Critique (Second Pass)

**Command:**
```bash
# Using Gemini CLI
gemini chat --model gemini-pro
```

**Prompt Template:**
```
You are a UK property expert reviewing SearchLand filter designs.

CONTEXT FILES:
- AvailableFiltersInSearchLand.md (available filters)
- PresetFiltersBuiltIntoSearchLand.md (example filters)

ORIGINAL REQUIREMENTS:
[Paste from FilterRequirements.md]

CODEX'S PROPOSED FILTERS:
[Paste from FilterIterations.md - Codex section]

TASK:
Critique and improve Codex's filter designs.

Analyze:
1. Are the filters using the right parameters?
2. Are there better preset filters to base these on?
3. Are criteria too strict or too loose?
4. Are there gaps in the logic?
5. Could the filters be simplified or optimized?

Provide:
- Analysis (strengths, concerns, issues)
- Improved versions of each filter
- Any additional filters that should be considered
- Your reasoning for each change

Format your response for FilterIterations.md
```

**Action:**
1. Copy Gemini output to `FilterIterations.md` under "Iteration 1 > Gemini"
2. Save the file

---

### Step 4: Claude Final Refinement (Third Pass)

**Command:**
```bash
# Using Anthropic CLI
anthropic chat --model claude-sonnet-4
```

**Prompt Template:**
```
You are a UK property expert providing final refinement on SearchLand filters.

CONTEXT FILES:
- AvailableFiltersInSearchLand.md (available filters)
- PresetFiltersBuiltIntoSearchLand.md (example filters)

ORIGINAL REQUIREMENTS:
[Paste from FilterRequirements.md]

CODEX'S INITIAL DESIGN:
[Paste from FilterIterations.md - Codex section]

GEMINI'S CRITIQUE & IMPROVEMENTS:
[Paste from FilterIterations.md - Gemini section]

TASK:
Provide final refinement and determine if consensus is reached.

Evaluate:
1. Are Gemini's improvements valid?
2. Are there any remaining issues?
3. Can the filters be further optimized?
4. Have we reached a good solution?

Provide:
- Analysis of Gemini's changes
- Final refined versions of filters
- Assessment: "CONVERGED" or "NEEDS ITERATION 2"
- Confidence level (High/Medium/Low)
- If not converged, what specific issues remain

Format your response for FilterIterations.md
```

**Action:**
1. Copy Claude output to `FilterIterations.md` under "Iteration 1 > Claude"
2. Check Claude's convergence assessment
3. Save the file

---

### Step 5: Check Convergence

**If Claude says "CONVERGED":**
- Proceed to Step 6 (Create Final Results)

**If Claude says "NEEDS ITERATION 2":**
- Start Iteration 2 in `FilterIterations.md`
- Go back to Codex with:
  - Original requirements
  - Full Iteration 1 conversation
  - Claude's specific concerns to address
- Repeat Steps 2-5 until convergence

**Convergence Criteria:**
- All LLMs agree on the filter approach
- No major concerns outstanding
- Confidence level is High or Medium
- Filters comprehensively address requirements

---

### Step 6: Create Final Results

Once converged, populate `FilterResults.md`:

1. Copy the final agreed filters from last Claude output
2. Format as SearchLand AI prompts (natural language)
3. Add all metadata (justification, expected results, etc.)
4. Include implementation guidance
5. Add geographic refinement suggestions

**Template for SearchLand AI Prompt:**
```
"Find [tenure] properties [size range] with [development status], 
[use class requirements], [ownership type], [constraint requirements], 
[proximity requirements], and [any other key criteria]."
```

Make it natural and conversational - SearchLand's AI will parse it.

---

### Step 7: Implementation

1. Open SearchLand.co.uk
2. Navigate to filter creation/AI interface
3. Paste Filter 1 prompt from `FilterResults.md`
4. Set geographic area (Local Planning Authority or map)
5. Review initial results
6. Adjust if needed using "Recommended Tweaks" from FilterResults
7. Repeat for remaining filters

---

## Tips for Success

### For Better Convergence:
- Be specific in requirements
- Include concrete examples
- Specify priorities clearly
- Mention deal-breakers explicitly

### For Better Filters:
- Start with preset filters when possible (they're battle-tested)
- Don't over-constrain - leave some flexibility
- Consider multiple filter angles on same goal
- Balance precision with result count

### For Efficient Workflow:
- Keep all LLM conversations in same terminal session
- Use copy-paste templates consistently
- Review AvailableFiltersInSearchLand.md first
- Check PresetFiltersBuiltIntoSearchLand.md for similar examples

---

## Troubleshooting

### LLMs Not Converging After 3 Iterations:
- Requirements may be contradictory
- Break into multiple simpler filter sets
- Relax some constraints
- Consult a human expert

### Too Many Results:
- Add more constraints
- Narrow geographic area
- Increase specificity of criteria
- Use stricter thresholds

### Too Few Results:
- Relax some constraints
- Broaden geographic area
- Use "OR" logic instead of "AND"
- Consider multiple separate filters

### LLMs Disagree on Approach:
- Usually Codex = creative, Gemini = practical, Claude = balanced
- If fundamental disagreement, human decision may be needed
- Document the tradeoffs in FilterResults.md

---

## File Management

### After Each Project:
1. Archive completed files:
   ```bash
   mkdir -p archive/YYYY-MM-DD-ProjectName
   cp FilterRequirements.md archive/YYYY-MM-DD-ProjectName/
   cp FilterIterations.md archive/YYYY-MM-DD-ProjectName/
   cp FilterResults.md archive/YYYY-MM-DD-ProjectName/
   ```

2. Clear working files for next project:
   ```bash
   # Reset templates (or use git reset)
   git checkout FilterRequirements.md FilterIterations.md FilterResults.md
   ```

### Version Control:
- Commit after each major iteration
- Tag final results: `git tag -a project-name-final -m "Final filters"`
- Keep SearchlandContext/ files updated as Searchland changes

---

## Quick Reference

| Step | Tool | Input | Output | Next |
|------|------|-------|--------|------|
| 1 | Manual | User needs | FilterRequirements.md | Step 2 |
| 2 | Codex | Requirements + Context | Initial filters | Step 3 |
| 3 | Gemini | Codex output + Requirements | Critique + Improvements | Step 4 |
| 4 | Claude | All previous + Requirements | Final refinement + Convergence | Step 5 |
| 5 | Manual | Check convergence | Decision | Step 6 or Loop |
| 6 | Manual | Final filters | FilterResults.md | Step 7 |
| 7 | Manual | SearchLand AI prompts | Live filters | Done |

---

## Success Metrics

A successful filter creation should result in:
- ✅ 1-3 well-defined filters
- ✅ Clear SearchLand AI prompts
- ✅ Justified design decisions
- ✅ Realistic expected results
- ✅ Implementation guidance
- ✅ LLM consensus achieved
- ✅ Addresses all requirements

---

**Last Updated:** [Date]
**Workflow Version:** 1.0

