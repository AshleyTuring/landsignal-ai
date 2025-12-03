# System Improvement Workflow

**Purpose:** Peer review and improve core system documents (FILTER_PATTERNS.md, LEARNINGS_DATABASE.md, etc.)  
**Method:** Multi-LLM collaborative review and synthesis

---

## 📁 Directory Contents

```
.system_improvement/
├── README.md (this file)
├── FILTER_PATTERNS_REVIEW_PROMPT.md (review instructions for Gemini/Codex)
├── run_filter_patterns_review.sh (runs Gemini & Codex reviews)
├── synthesize_filter_patterns_improvements.sh (Claude integrates feedback)
├── review_context_full.txt (generated - full review context)
├── Review_Gemini.md (generated - Gemini's review)
├── Review_Codex.md (generated - Codex's review)
├── SYNTHESIS_OUTPUT.md (generated - Claude's synthesis)
└── IMPROVEMENT_DECISIONS.md (generated - decision log)
```

---

## 🚀 WORKFLOW: FILTER_PATTERNS.md Peer Review

### **Step 1: Run Peer Reviews** (5-10 min)

```bash
cd /home/ashsubband/landsignal/.system_improvement
./run_filter_patterns_review.sh
```

**What happens:**
- Creates review context (combines prompt + FILTER_PATTERNS + **raw 86 presets** + preset analysis + learnings)
- Launches Gemini review (parallel)
- Launches Codex review (parallel)
- Outputs: `Review_Gemini.md` and `Review_Codex.md`
- **Checks for disagreements** (automatically)
- **If significant disagreements found:** Runs iteration phase
  - Both reviewers reconsider positions
  - Read each other's feedback
  - Update positions or explain why unchanged
  - Outputs: `Iteration_Gemini.md` and `Iteration_Codex.md`

**Expected:**
- Gemini & Codex critique all 13 patterns
- Suggest 3-5 new patterns each
- Propose structure improvements
- Rank patterns by usefulness
- **If they disagree:** Iteration resolves conflicts

---

### **Step 2: Synthesize Improvements** (5-10 min)

```bash
./synthesize_filter_patterns_improvements.sh
```

**What happens:**
- Claude (assistant) reviews both peer reviews
- Makes decisions on what to accept/reject
- Creates improved FILTER_PATTERNS.md v2.0
- Documents all decisions in IMPROVEMENT_DECISIONS.md
- Outputs: `SYNTHESIS_OUTPUT.md`

**Expected:**
- New/improved patterns integrated
- Structure optimized for all agents
- Decision rationale documented

---

### **Step 3: Apply Improvements** (Manual - 2 min)

1. Review `SYNTHESIS_OUTPUT.md`
2. Extract "FILTER_PATTERNS.md v2.0" section
3. Replace `/home/ashsubband/landsignal/FILTER_PATTERNS.md`
4. Extract "IMPROVEMENT_DECISIONS.md" section
5. Save to `.system_improvement/IMPROVEMENT_DECISIONS.md`

---

### **Step 4: Verify & Test** (5 min)

1. Read improved FILTER_PATTERNS.md
2. Check cross-references still work
3. Update any templates that reference patterns
4. Update orchestration scripts if needed

---

## 📊 SUCCESS METRICS

**Good Review:**
- ✅ Gemini & Codex provide specific, actionable feedback
- ✅ At least 2-3 new patterns suggested (if gaps exist)
- ✅ Structure improvements proposed
- ✅ Honest critique (not just "looks good!")

**Good Synthesis:**
- ✅ Claude accepts consensus changes
- ✅ Claude explains rejected feedback
- ✅ v2.0 is measurably better than v1.0
- ✅ All agents can use improved version

---

## 🔄 FUTURE USE

**This workflow can be applied to:**
- LEARNINGS_DATABASE.md (peer review implementation learnings)
- PRESET_STRATEGY_GUIDE.md (review preset analysis)
- Requirements template (optimize for agent usage)
- Any other core system document

**To adapt for other documents:**
1. Copy `FILTER_PATTERNS_REVIEW_PROMPT.md`
2. Modify for new document (change specifics, keep structure)
3. Update `run_*_review.sh` with new file paths
4. Run same 4-step workflow

---

## ⚠️ IMPORTANT NOTES

### **Why Peer Review?**
- Claude created FILTER_PATTERNS.md alone
- Other LLMs (Gemini, Codex) will USE it in collaborative exploration
- They may see gaps, inefficiencies, or improvements Claude missed
- Multi-perspective = better system

### **Why Synthesis (Not Democracy)?**
- Not all suggestions are good (maintain quality)
- Trade-offs exist (simplifying for one may complicate for another)
- Claude (as author) understands original intent and can judge fit
- Transparency: All decisions documented with rationale

### **Why Manual Extraction?**
- Parsing markdown from LLM output is error-prone
- Human verification ensures quality
- Quick step (2 minutes)
- Future: Could automate with better parsing

---

## 📝 CHANGELOG

**2025-11-19:**
- Created peer review workflow for FILTER_PATTERNS.md
- Established 4-step process (Review → Synthesize → Apply → Verify)
- Built reusable framework for future document improvements

---

## 🎯 NEXT STEPS (After FILTER_PATTERNS.md Review)

Once FILTER_PATTERNS.md v2.0 is complete:

1. ✅ Update 04_REFINEMENT Process (document 3-stage workflow)
2. ✅ Create Executive Summary template
3. ✅ Create Dossier template
4. ✅ Add "Based On" references to templates
5. ✅ Archive MixedUse-8Storey-2M-v4
6. ✅ Run system v5 with all improvements

---

**Status:** Step 1 (Peer Review) ready to run  
**Command:** `./run_filter_patterns_review.sh`

