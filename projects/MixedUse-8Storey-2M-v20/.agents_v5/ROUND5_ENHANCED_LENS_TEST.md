# Round 5: Enhanced Strategic Lens Test

**Date:** 2025-11-24  
**Purpose:** Test if concrete pattern examples (v13 style) unlock missing strategies like Airspace Maximizer

---

## 🎯 What Changed from Round 4 → Round 5

### **Round 4 System Prompts (Generic Guidance):**

**Gemini:**
```
Think: Airspace development, Grey Belt workarounds, regulation-driven opportunities.
```

**Problem:** Generic mention, no concrete examples → No Airspace Maximizer generated

---

### **Round 5 System Prompts (Concrete Pattern Examples):**

**Gemini (Strategic & Regulatory):**
```
PRIORITY PATTERNS:
1. Pattern 6A: Airspace Development
   - 'A building in the title has flat roof: Yes'
   - 'Max building height (m): is less than 15'
   - 'Number of leaseholds on the freehold: is less than 1'
   - Capital: £50k-£150k for airspace rights

2. Pattern 8A: HMO License Expiry
   - 'HMO License Expiry Date: is before [date]'
   - 'Currently has HMO: Yes'
   
3. Pattern 4B: Option Agreements
   - 'Latest sold date: is before [10+ years ago]'
   - 'Sales listing currently on the market: No'
```

**Codex (Technical Precision):**
```
PRIORITY PATTERNS:
1. Pattern 23A: Unbroken Freehold Titles
2. Pattern 22A: HMO Conversion
3. Pattern 20A: Brand Covenant Expiry
4. Pattern 5A: Low-Rise in Tall Building Zones
```

**Grok (Speed & Arbitrage):**
```
PRIORITY PATTERNS:
1. Pattern 13A: Fresh Planning Consents (24-48h advantage)
2. Pattern 13B: New SHLAA Allocations
3. Pattern 8A/8B: Deadline-Driven Forced Actions
```

**Claude (Risk Mitigation & Behavioral):**
```
PRIORITY PATTERNS:
1. Pattern 3A: Similar Planning Approvals
2. Pattern 2D: Liquidation/Administration
3. Pattern 2A: Long Hold + Derelict
4. Pattern 14A: Legacy Holdings (Never Sold)
```

---

## 🔬 **Hypothesis:**

Adding **concrete filter examples** to system prompts (like v13's Requirements.md) will:

✅ **Unlock Airspace Maximizer** - Gemini will generate flat roof + height headroom approach  
✅ **Increase pattern diversity** - Each LLM gets specific pattern guidance  
✅ **Improve filter precision** - Concrete examples = more accurate filter usage  

---

## 📊 **What to Look For in Round 5:**

### **From Gemini:**
- [ ] Approach using "A building in the title has flat roof: Yes"
- [ ] Approach using "Number of leaseholds on the freehold: is less than 1"
- [ ] Approach focused on AIRSPACE RIGHTS (not full purchase)
- [ ] HMO License Expiry approach

### **From Codex:**
- [ ] Unbroken freehold approach
- [ ] HMO conversion (floor area focus)
- [ ] Brand covenant or technical niche

### **From Grok:**
- [ ] Fresh planning consent (recent decision date)
- [ ] SHLAA or time-sensitive approach
- [ ] Deadline-driven arbitrage

### **From Claude:**
- [ ] Precedent replication (similar approvals)
- [ ] Liquidation/Administration
- [ ] Never-sold legacy holdings

---

## 🚀 **Run Round 5 Test:**

```bash
cd /home/ashsubband/landsignal/projects/MixedUse-8Storey-2M-v20/.agents_v5
export ITERATION_ROUND=5
./orchestrate_independent.sh
```

**Expected Runtime:** 2-5 minutes

---

## 📋 **Post-Run Analysis:**

After Round 5 completes, compare:

| Strategy | v13 | Round 4 | Round 5 | Status |
|----------|-----|---------|---------|--------|
| **Airspace Maximizer** (flat roof) | ✅ | ❌ | ? | **KEY TEST** |
| HMO License Expiry | ❌ | ✅ | ? | Already unlocked |
| Edge-of-Settlement Land | ❌ | ✅ | ? | Already unlocked |
| Fresh Planning Consents (timing) | ? | ❌ | ? | Grok focus |
| Unbroken Freehold | ? | ❌ | ? | Codex focus |
| Never-Sold Legacy | ? | ❌ | ? | Claude focus |

---

## 🎯 **Success Criteria:**

**PASS:** Gemini generates an approach with:
- "A building in the title has flat roof: Yes" filter
- Focus on airspace rights acquisition (£50k-£150k)
- NOT full property purchase

**BONUS:** Other new patterns appear:
- Fresh planning consents (Grok)
- Unbroken freehold (Codex)
- Never-sold legacy (Claude)

---

## 📈 **Expected Diversity Score Improvement:**

- Round 1-3: 3.9/10
- Round 4: 8.6/10 (+120%)
- Round 5: **9.5/10** (target) if Airspace Maximizer + additional patterns emerge

---

**Next Steps:**
1. ⏳ Run Round 5 test
2. ⏳ Compare with Round 4 and v13
3. ⏳ If successful: Update master templates
4. ⏳ If unsuccessful: Consider adding pattern examples to Requirements.md too

