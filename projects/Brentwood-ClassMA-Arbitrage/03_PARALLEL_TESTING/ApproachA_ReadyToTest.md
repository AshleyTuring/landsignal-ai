# **APPROACH A: Class MA Commercial to Residential Arbitrage**

**Status:** ⚠️ CONDITIONAL (5 minute fixes)  
**Original LLM:** Claude  
**Pattern:** Pattern 7A (Permitted Development - Class MA)  
**Capital Required:** £150,000 - £200,000  
**Expected Results:** 20-30 properties

## **SearchLand AI Prompt (Copy-Paste Ready)**

**⚠️ FIXES APPLIED:**
- Line 2: Changed "Freehold tenure" → "Tenure: is one of [Freehold]"
- Line 4: Changed "NOT: Use class contains [C3]" → "Use class: does not contain [C3 - Dwellinghouses]"

```
1. Use class: contains any [E - Commercial Business and Service, E(a), E(b), E(c)(i), E(c)(ii), E(c)(iii), E(d), E(e), E(f), E(g)(i), E(g)(ii), E(g)(iii)]
2. Tenure: is one of [Freehold]
3. Property floor area (sqft): is greater than 2000 AND less than 8000
4. Use class: does not contain [C3 - Dwellinghouses]
5. Developed area percentage: is greater than 30
6. Sales listing price: is less than 200000
7. Planning constraints: does not contain [Green Belt, Conservation Area, Flood Zone 3]
8. Percentage of plot un-constrained: is greater than 60
```

## **Rationale**

Class MA offers fastest path to profit (12-18 months) via permitted development. Preset #4 (Class MA pre-configured) identifies 44 sites in Brentwood. This approach refines with capital and profitability filters:
- **Capital discipline:** £200k price cap ensures acquisition within budget
- **Size optimization:** 2,000-8,000 sqft targets small-medium commercial (offices, retail)
- **Clean planning:** Excludes major constraints to accelerate conversion
- **Profit pre-filtered:** SearchLand calculates local values, filters unprofitable deals

**Profit Mechanism:**
- Acquire: Small office/retail at £150k-£200k
- Convert: Class MA to residential (6-12 months, £30k-£50k costs)
- Value uplift: Commercial £200/sqft → Residential £350-£450/sqft
- Example: 3,000 sqft office @ £150k → 4 x 750 sqft flats @ £350k = £200k profit

## **Strengths**

- ✅ Permitted development = no planning risk
- ✅ SearchLand pre-calculates profit (filters unprofitable deals)
- ✅ 12-18 month timeline (fast turnaround)
- ✅ Phased capital deployment (£160k upfront, rest financed)
- ✅ Freehold tenure = full control + long-term option

## **Limitations**

- ⚠️ Conversion costs £30k-£50k (need bridging loan if >£200k total)
- ⚠️ Market-dependent (if commercial values spike, arbitrage shrinks)
- ⚠️ Quality varies (some sites may have structural issues)

## **Implementation Strategy**

**Phase 1: Initial Search (Week 1)**
1. Select Brentwood LPA in SearchLand UI (manual selection - LPA filter doesn't exist)
2. Paste prompt above, run search
3. Export 20-30 results to spreadsheet

**Phase 2: Quick Filters (Week 1-2)**
1. Eliminate sites with structural red flags (flat roofs, flood risk)
2. Prioritize sites near residential areas (easier conversions)
3. Calculate profit for top 10 sites using SearchLand's GDV estimator

**Phase 3: Site Visits (Week 2-3)**
1. Visit top 5 sites, assess condition
2. Speak to local agents about conversion demand
3. Check planning portal for nearby Class MA applications (precedent)

**Phase 4: Offers (Week 3-4)**
1. Make offers on top 2-3 sites (10-15% below asking)
2. Negotiate subject to survey
3. Secure bridging finance if total cost >£200k

## **Capital Breakdown**

- **Acquisition:** £150,000 - £200,000
- **Legal/Survey:** £3,000 - £5,000
- **Conversion Costs:** £30,000 - £50,000 (financed if needed)
- **Holding Costs:** £5,000 - £10,000 (12 months interest/council tax)
- **Total:** £188,000 - £265,000

**Financing Strategy (if >£200k):**
- Use £200k for acquisition + legals (£153k-£205k)
- Secure bridging loan (70% LTV) for conversion costs (£30k-£50k)
- Refinance on completion (75% LTV residential mortgage)

## **Next Steps**

**Proceed to Stage 4: Refinement & Validation**

1. Copy SearchLand AI prompt above
2. Paste screenshot of what SearchLand AI actually created
3. Run validation script to check accuracy (compare intended vs actual)
4. Update prompts based on issues + update LEARNINGS_DATABASE.md
5. Document results & property screenshots

Then continue to Stage 5 (Site Validation) and Stage 6 (Deep Research).

**Full workflow documented in project README.md**

---

