# 📊 COMPLETE PEER REVIEW WORKFLOW

**How Claude, Gemini, and Codex Collaborate to Improve FILTER_PATTERNS.md**

---

## 🎭 WHO DOES WHAT

| LLM | Role | Phase(s) |
|-----|------|----------|
| **Gemini** | Peer Reviewer #1 | Review, Iteration |
| **Codex** | Peer Reviewer #2 | Review, Iteration |
| **Claude** | Original Author + Synthesizer | Disagreement Check, Synthesis |

**KEY:** Claude created FILTER_PATTERNS.md, Gemini & Codex review it (peer review), then Claude synthesizes their feedback.

---

## 🔄 COMPLETE WORKFLOW (5 Stages)

```
┌─────────────────────────────────────────────────────────────────┐
│ STAGE 0: BACKUP (Automatic)                                    │
│ Script: run_filter_patterns_review.sh                          │
├─────────────────────────────────────────────────────────────────┤
│ • Create timestamped backup of FILTER_PATTERNS.md              │
│ • Store in .system_improvement/FILTER_PATTERNS_BACKUP_*.md     │
│ Output: Backup file                                             │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│ STAGE 1: INITIAL REVIEWS (Parallel)                            │
│ Script: run_filter_patterns_review.sh                          │
├─────────────────────────────────────────────────────────────────┤
│ Gemini Reviews:                     Codex Reviews:              │
│ • Critique 13 patterns              • Critique 13 patterns      │
│ • Suggest 3-5 NEW patterns ⭐       • Suggest 3-5 NEW patterns ⭐│
│ • Rank by usefulness                • Rank by usefulness        │
│ • Propose structure changes         • Propose structure changes │
│                                                                  │
│ Reads:                              Reads:                      │
│ • FILTER_PATTERNS.md                • FILTER_PATTERNS.md        │
│ • Raw 86 presets ⭐                 • Raw 86 presets ⭐         │
│ • PRESET_STRATEGY_GUIDE.md         • PRESET_STRATEGY_GUIDE.md  │
│ • LEARNINGS_DATABASE.md            • LEARNINGS_DATABASE.md     │
│                                                                  │
│ Output: Review_Gemini.md           Output: Review_Codex.md     │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│ STAGE 2: DISAGREEMENT CHECK (Automatic)                        │
│ Script: run_filter_patterns_review.sh                          │
│ Agent: Claude (You)                                             │
├─────────────────────────────────────────────────────────────────┤
│ • Read both reviews                                             │
│ • Check for significant conflicts:                              │
│   - One says "clear", other says "unclear"                      │
│   - Contradictory pattern suggestions                           │
│   - Contradictory structure changes                             │
│                                                                  │
│ Decision:                                                        │
│ • If ≥2 significant disagreements → ITERATE                    │
│ • If <2 disagreements → SKIP TO SYNTHESIS                      │
│                                                                  │
│ Output: DISAGREEMENT_ANALYSIS.md                               │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│ STAGE 2.5: ITERATION (Conditional - If Disagreements)          │
│ Script: run_filter_patterns_review.sh                          │
├─────────────────────────────────────────────────────────────────┤
│ Gemini Reconsiders:                Codex Reconsiders:           │
│ • Reads Codex's review             • Reads Gemini's review      │
│ • Reads disagreement analysis      • Reads disagreement analysis│
│ • Updates position OR              • Updates position OR        │
│   explains why unchanged           │   explains why unchanged    │
│                                                                  │
│ Output: Iteration_Gemini.md       Output: Iteration_Codex.md   │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│ STAGE 3: SYNTHESIS (Claude Integrates Feedback)                │
│ Script: synthesize_filter_patterns_improvements.sh             │
│ Agent: Claude (You)                                             │
├─────────────────────────────────────────────────────────────────┤
│ Claude Reads:                                                   │
│ • Review_Gemini.md (initial critique)                           │
│ • Review_Codex.md (initial critique)                            │
│ • Iteration_Gemini.md (if exists - updated positions)          │
│ • Iteration_Codex.md (if exists - updated positions)           │
│ • FILTER_PATTERNS.md (current version)                          │
│ • Raw 86 presets ⭐ (verify reviewer claims)                   │
│ • PRESET_STRATEGY_GUIDE.md (original analysis)                 │
│                                                                  │
│ Claude Decides:                                                 │
│ • Accept consensus changes (both reviewers agree)               │
│ • Adjudicate conflicts (reviewers still disagree after iter)    │
│ • Verify claims against raw presets                             │
│ • Maintain quality (reject weak suggestions)                    │
│                                                                  │
│ Claude Creates:                                                 │
│ • FILTER_PATTERNS.md v2.0 (improved version)                    │
│ • IMPROVEMENT_DECISIONS.md (rationale for all decisions)        │
│                                                                  │
│ Output: SYNTHESIS_OUTPUT.md (contains both documents)          │
└─────────────────────────────────────────────────────────────────┘
                            ↓
┌─────────────────────────────────────────────────────────────────┐
│ STAGE 4: APPLY IMPROVEMENTS (Manual for Safety)                │
│ Human: User                                                      │
├─────────────────────────────────────────────────────────────────┤
│ 1. Review SYNTHESIS_OUTPUT.md                                  │
│ 2. Extract "FILTER_PATTERNS.md v2.0" section                   │
│ 3. Replace /home/ashsubband/landsignal/FILTER_PATTERNS.md      │
│ 4. Extract "IMPROVEMENT_DECISIONS.md" section                  │
│ 5. Save to .system_improvement/IMPROVEMENT_DECISIONS.md        │
│                                                                  │
│ Why Manual?                                                     │
│ • Human verification ensures quality                            │
│ • Can reject if synthesis went wrong                            │
│ • Quick step (2 minutes)                                        │
│                                                                  │
│ Safety: Backup exists from Stage 0 if rollback needed          │
└─────────────────────────────────────────────────────────────────┘
```

---

## ⏱️ DURATION ESTIMATES

| Stage | Duration | Notes |
|-------|----------|-------|
| **Stage 0: Backup** | <1 sec | Automatic |
| **Stage 1: Reviews** | 5-10 min | Gemini & Codex in parallel |
| **Stage 2: Disagreement Check** | 1-2 min | Claude automated |
| **Stage 2.5: Iteration** | 3-5 min | Only if disagreements (Gemini & Codex in parallel) |
| **Stage 3: Synthesis** | 5-10 min | Claude processes all feedback |
| **Stage 4: Apply** | 2-5 min | Manual extraction & verification |
| **TOTAL** | 16-33 min | Depends on whether iteration runs |

---

## 📁 OUTPUT FILES

### **Always Generated:**
```
.system_improvement/
├── FILTER_PATTERNS_BACKUP_[timestamp].md ⭐ (Stage 0)
├── review_context_full.txt (Stage 1 prep)
├── Review_Gemini.md ⭐ (Stage 1)
├── Review_Codex.md ⭐ (Stage 1)
├── DISAGREEMENT_ANALYSIS.md ⭐ (Stage 2)
└── SYNTHESIS_OUTPUT.md ⭐ (Stage 3)
```

### **Conditionally Generated (if disagreements):**
```
.system_improvement/
├── Iteration_Gemini.md (Stage 2.5)
├── Iteration_Codex.md (Stage 2.5)
└── iteration_*_context.txt (Stage 2.5 prep)
```

### **After Manual Application:**
```
/home/ashsubband/landsignal/
└── FILTER_PATTERNS.md ← UPDATED v2.0

.system_improvement/
└── IMPROVEMENT_DECISIONS.md ← Decision log
```

---

## ✅ NEW STRATEGIES: PART 2 OF REVIEW

**Yes! Reviewers are explicitly asked to suggest NEW patterns:**

**From FILTER_PATTERNS_REVIEW_PROMPT.md - Part 2:**

```markdown
### PART 2: New Patterns Claude Missed

**Think about:**
- Review PresetFiltersBuiltIntoSearchLand.md directly - Which presets didn't become patterns?
- Combinations of existing patterns that form distinct strategies
- Strategies from presets that weren't elevated to patterns (check all 86!)
- Property development strategies you know but didn't see
- UK-specific opportunities (Article 4 withdrawals, PDR changes, etc.)

**New Pattern Template:**
[Structured template for proposing new patterns]

Suggest 3-5 new patterns minimum.
```

**So YES - they WILL develop new strategies! That's a core part of Part 2.**

---

## 🔒 SAFETY FEATURES

### **1. Backup Before Changes**
- ✅ Automatic timestamped backup (Stage 0)
- ✅ Stored in `.system_improvement/` directory
- ✅ Can rollback if needed

### **2. Manual Application**
- ✅ Human reviews synthesis before applying
- ✅ Can reject if synthesis is wrong
- ✅ Full transparency (all decisions documented)

### **3. Version Control in Filename**
- ✅ New version clearly marked "v2.0"
- ✅ IMPROVEMENT_DECISIONS.md documents all changes
- ✅ Can compare before/after

---

## 🎯 DECISION-MAKING FLOW

### **Stage 3 Synthesis Decision Rules:**

```
IF both reviewers suggest same change:
  → Claude ACCEPTS (consensus)

IF one reviewer suggests, other neutral:
  → Claude EVALUATES (verify against presets)
  → Accept if logical, reject if weak

IF reviewers DISAGREE (after iteration):
  → Claude ADJUDICATES
  → Reads raw presets to verify claims
  → Documents rationale for decision

IF suggestion doesn't improve system:
  → Claude REJECTS
  → Documents why in IMPROVEMENT_DECISIONS.md
```

**Key:** Claude uses raw presets to verify all claims - not blind acceptance!

---

## 🔄 COMPARISON TO v3.2.0 COLLABORATIVE SYSTEM

**Same Philosophy Applied:**

| v3.2.0 Filter Generation | FILTER_PATTERNS.md Peer Review |
|--------------------------|--------------------------------|
| Phase 0: Collaborative Exploration | Stage 1: Parallel Reviews |
| Phase 1: Cross-Critique | Stage 2: Disagreement Check |
| Phase 1.5: Iteration | Stage 2.5: Iteration |
| Phase 2: Consensus | Stage 3: Synthesis |
| Phase 3: Testing | Stage 4: Application |

**Consistency:** Iteration, verification, transparency throughout.

---

## 📝 COMMANDS TO RUN

### **Full Workflow:**

```bash
cd /home/ashsubband/landsignal/.system_improvement

# Stages 0-2.5 (automatic)
./run_filter_patterns_review.sh

# Stage 3 (automatic)
./synthesize_filter_patterns_improvements.sh

# Stage 4 (manual)
# 1. Review SYNTHESIS_OUTPUT.md
# 2. Extract and apply improvements
```

---

## ✅ YOUR QUESTIONS ANSWERED

| Question | Answer |
|----------|--------|
| **Where is Claude in the review script?** | Stage 2 (disagreement check) in `run_filter_patterns_review.sh` + Stage 3 (synthesis) in `synthesize_filter_patterns_improvements.sh` |
| **How do final results get written?** | Synthesis creates `SYNTHESIS_OUTPUT.md` → Manual extraction applies to `FILTER_PATTERNS.md` (safety) |
| **Backup created first?** | ✅ YES (Stage 0 - just added!) |
| **New strategies developed?** | ✅ YES (Part 2 of review explicitly asks for 3-5 new patterns minimum) |

---

**Status:** Workflow documented, backup added, all questions answered ✅  
**Ready to run:** Yes! 🚀

