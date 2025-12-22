# Motivated Seller Strategy - Brentwood HMO Project

**Date:** 2024-12-04  
**Project:** Brentwood-ClassMA-Arbitrage  
**Status:** Strategy Pivot - Phase 1

---

## Background

### What Went Wrong
1. **Incorrect Preset Counts**: Requirements.md showed "HMO expired licences: 0 sites" but actual SearchLand shows **6 sites**
2. **Wrong Filter Results**: Approach D filters (Volume HMO) returned only 2 results - individual **flats for sale within HMOs**, not the actual HMO properties
3. **Wrong Target**: Filters were finding residential units inside HMOs, not the HMO buildings themselves

### New Strategy
Find actual HMO properties (or HMO-convertible properties) owned by **motivated sellers**, then layer on financial/physical criteria.

---

## Part 1: Motivated Seller Filter Matrix

All filters sourced from `AvailableFiltersInSearchLand_ACTUAL.md`

### 🔴 TIER 1: High-Signal Motivation Filters

| Filter Name | Operator | Value/Range | Motivation Signal | Strength |
|-------------|----------|-------------|-------------------|----------|
| **HMO License Expiry Date** | is before | 06/02/2024 | License expired = compliance pressure, potential fines | ⭐⭐⭐⭐⭐ |
| **Lease end date** | is before | 2027-12-31 | Lease expiring = tenant leaving, income loss | ⭐⭐⭐⭐⭐ |
| **Company status** | contains any | [In liquidation, Dissolved, Administration] | Financial distress = forced sale | ⭐⭐⭐⭐⭐ |
| **Building on title is derelict** | is | true | Abandoned = maintenance burden, no income | ⭐⭐⭐⭐ |
| **Building on title is inactive** | is | true | Non-operational = holding costs without income | ⭐⭐⭐⭐ |

### 🟡 TIER 2: Medium-Signal Motivation Filters

| Filter Name | Operator | Value/Range | Motivation Signal | Strength |
|-------------|----------|-------------|-------------------|----------|
| **EPC rating** | is one of | [E, F, G] | Poor EPC = forced upgrade by 2025 (PRS regulations) | ⭐⭐⭐⭐ |
| **Latest sold date** | is before | 2015-01-01 | Held >10 years = potential to cash out, inheritance | ⭐⭐⭐ |
| **Latest EPC inspection date** | is before | 2020-01-01 | Old EPC = needs renewal, may reveal poor rating | ⭐⭐⭐ |
| **Sales listing status** | contains any | [Available] | Actively listed = seller already motivated | ⭐⭐⭐ |
| **Applications in the last 5 years** | is greater than | 1 | Planning activity = potential stalled project | ⭐⭐⭐ |
| **Number of mortgages charges** | is greater than | 2 | Multiple charges = high leverage, potential distress | ⭐⭐⭐ |
| **Commercial lettings status** | contains any | [Vacant, Available] | Vacant commercial = no rental income | ⭐⭐⭐ |

### 🟢 TIER 3: Soft-Signal Motivation Filters

| Filter Name | Operator | Value/Range | Motivation Signal | Strength |
|-------------|----------|-------------|-------------------|----------|
| **Ownership type** | is one of | [Company, Corporate] | Corporate ownership = more transactional | ⭐⭐ |
| **Number of directors at company** | is less than | 2 | Single director = personal decision, potential exit | ⭐⭐ |
| **Tenure** | is one of | [Freehold] | Freehold = full control, easier to sell | ⭐⭐ |
| **Property type** | contains any | [Mixed Use, Commercial] | Commercial in residential area = potential conversion arbitrage | ⭐⭐ |
| **Use class** | contains any | [E, B2, B8] | Commercial use in residential zone = redevelopment opportunity | ⭐⭐ |

---

## Part 2: HMO Preset Analysis & Modification Strategy

### Current HMO Presets (from user's screenshots)

#### Preset 1: "HMO opportunities" 
- **Result Count:** 267 sites in Brentwood LPA (+ 5 other LPAs)
- **Description:** "Houses for HMO conversion for rental or investment"
- **Filters (visible):**
  ```
  1. Tenure: is one of [Freehold]
  2. Latest EPC number of habitable rooms: is between 8 and 12
  3. Use class: contains all [C3 - Dwellinghouses]
  4. Latest sold date: is before 11/12/2015
  5. EPC rating: is one of [F, G, D, E]
  6. Applications in the last 5 years: is less than 1
  7. Distance to nearest Bus Stop (m): is less than 500
  8. Distance to nearest Train Station (m): is less than 1000
  ```
  - **Result:** 341 Opportunities found

#### Preset 2: "HMO expired licences"
- **Result Count:** 6 sites in Brentwood LPA (+ 5 other LPAs)
- **Description:** "Houses in multiple occupation with expired licences"
- **Filters (visible):**
  ```
  1. Tenure: is one of [Freehold]
  2. Has an HMO: is true
  3. HMO License Expiry Date: is before 06/02/2024
  ```
  - **Result:** 6 Opportunities found

#### Preset 3: "Homes to HMO"
- **Result Count:** 66,138 sites (user noted this)
- **Description:** "Houses for conversion into HMOs for rental or investment"
- **Status:** Too broad - needs significant refinement

### ❌ Problem with "HMO opportunities" (267 results)
- Filters for **C3 - Dwellinghouses** (residential homes)
- Returns **individual flats/units for sale WITHIN existing HMOs**
- Does NOT return the actual HMO property/building itself
- This is why you got "2 results with Sales listing Price for the flat not the actual HMO property"

---

## Part 3: REVISED Testing Sequence (Based on All 4 HMO Presets)

### Priority Matrix: Which Preset to Test First?

| Preset | Results | Motivation Signal | Off-Market | Priority |
|--------|---------|-------------------|------------|----------|
| **HMO expired licences** | 6 | ⭐⭐⭐⭐⭐ (license expired) | Unknown | **#1** |
| **Homes to HMO** | 66,138 | ⭐ (base - needs motivation layers) | ✅ Off-market | **#2** |
| **HMO opportunities** | 341 total | ⭐⭐⭐ (long hold + poor EPC) | Mixed | **#3** |
| ~~**Companies owning 30+ titles**~~ | ~~11~~ | ❌ FAILED | N/A | **ABANDONED** |

**⚠️ Strategy A (Companies 30+ titles) ABANDONED** - See `STRATEGY_A_PROBLEM_ANALYSIS.md`
- Returns banks/investment funds (freehold owners), NOT HMO operators
- Example: Gatehouse Bank PLC owns freeholds, "Amjam Properties" operates HMOs as leaseholder
- No profit path: Buying freehold gives you ground rent (£500/yr), not HMO income (£24k/yr)
- Not motivated to sell individual properties

---

### ❌ Strategy A: Portfolio Landlord Bulk Purchase (ABANDONED - See STRATEGY_A_PROBLEM_ANALYSIS.md)

**Why Abandoned:**
- Preset returns FREEHOLD owners (banks, investment funds), not HMO operators
- Example: Gatehouse Bank PLC owns freeholds, leaseholders operate HMOs
- No profit path: Buying freehold = £500/yr ground rent, NOT £24k/yr HMO income
- Institutions not motivated to sell individual properties

**Original Strategy (Flawed):**

**Why This is #1:**
- 11 results = manageable to manually assess ALL
- Companies with 30+ HMO titles = professional landlords
- Potential for BULK purchase (multiple HMOs from one seller)
- Could negotiate package deal: Buy 2-3 HMOs for £200k total
- Lower acquisition cost per unit in bulk

**Step 1: Test "Companies owning more than 30 titles" preset AS-IS**

**Base Preset:**
```
1. Number of titles owned by company: is greater than 30
2. Tenure: is one of [Freehold]
3. Has an HMO: is true
```
**Expected:** 11 results across 6 LPAs
**Action:** Document ALL 11 companies + their HMO portfolios

**Step 2: Layer motivation filters (Test separately)**

**Test A1: Add EPC compliance pressure**
```
4. EPC rating: is one of [E, F, G]
```
**Expected:** 3-7 results  
**Signal:** Portfolio landlord facing £10k-£50k+ EPC upgrade costs across portfolio

**Test A2: Add expired licenses**
```
4. HMO License Expiry Date: is before 06/02/2024
```
**Expected:** 1-4 results (JACKPOT if any)  
**Signal:** Portfolio landlord with compliance issues = very motivated

**Test A3: Add high leverage**
```
4. Number of mortgages charges associated with company: is greater than 10
```
**Expected:** 2-5 results  
**Signal:** High debt = potential distress sale of non-core assets

**Test A4: Widen net (more titles)**
```
1. Number of titles owned by company: is greater than 20 (instead of 30)
```
**Expected:** 20-40 results  
**Signal:** Smaller landlords may be more motivated to exit

---

### 🎯 Strategy B: Expired License Direct Approach

**Step 1: Test "HMO expired licences" preset (6 results) - SECOND PRIORITY**

**Base Preset:**
```
1. Tenure: is one of [Freehold]
2. Has an HMO: is true
3. HMO License Expiry Date: is before 06/02/2024
```
**Expected:** 6 results across 6 LPAs
**Action:** Document ALL 6 properties - these are your hottest leads

**Step 2: Layer additional motivation (Test separately)**

**Test B1: Add EPC pressure (double whammy)**
```
4. EPC rating: is one of [E, F, G]
```
**Expected:** 2-4 results  
**Signal:** Expired license + Poor EPC = forced to spend £5k-£15k to reopen OR sell

**Test B2: Add company ownership**
```
4. Ownership type: is one of [Company, Corporate]
```
**Expected:** 2-4 results  
**Signal:** Corporate owner more likely to sell vs. renew (less emotional attachment)

**Test B3: Add off-market status**
```
4. Sales listing currently on the market: is false
```
**Expected:** 4-6 results (most won't be listed)  
**Signal:** Off-market = you'll be first to approach with offer

**Test B4: Check if in portfolio**
```
4. Number of titles owned by company: is greater than 5
```
**Expected:** 2-4 results  
**Signal:** Portfolio landlord may sell non-performing asset to keep better ones

---

### 🎯 Strategy C: Systematic Filter Layering on "Homes to HMO" (THIRD PRIORITY)

**Why This Strategy is Important:**
- Base preset: 66,138 results (off-market C3 homes, no HMO, no Article 4)
- Already has GREAT base filters ✅
- Need to systematically add motivated seller filters to narrow down
- Test each filter addition to see impact

**Current "Homes to HMO" preset (GOOD BASE):**
```
1. Tenure: is one of [Freehold]
2. Use class: contains any [C3 - Dwellinghouses]
3. Number of addresses: is equal to 1  ← Single dwelling ✅
4. Has an HMO: is false  ← Not already HMO ✅
5. Article 4: doesn't contain [Unspecified Article 4 Directions, Article 4(1)...]  ← Can convert ✅
6. Ownership type: is one of [Company, Private owner]
7. Sales listing currently on the market: is false  ← Off-market ✅
```

**Result:** 66,138 properties (too many - need to narrow)

---

### Systematic Filter Addition Tests

**Test C1: Add Tier 1 Motivation - Long Hold Period**
```
BASE PRESET (1-7) +
8. Latest sold date: is before 2015-01-01  ← Held 10+ years
```
**Expected:** 8,000-15,000 results  
**Signal:** Long-term owner = potential to exit

**Test C2: Add Tier 2 Motivation - Poor EPC (Compliance Pressure)**
```
BASE PRESET (1-7) +
8. Latest sold date: is before 2015-01-01
9. EPC rating: is one of [E, F, G]  ← PRS regulations deadline
```
**Expected:** 2,000-5,000 results  
**Signal:** Must upgrade by 2025 or sell

**Test C3: Add Corporate Ownership (More Transactional)**
```
BASE PRESET (1-7) +
8. Latest sold date: is before 2015-01-01
9. EPC rating: is one of [E, F, G]
10. Ownership type: is one of [Company, Corporate]  ← CHANGE from [Company, Private owner]
```
**Expected:** 500-1,500 results  
**Signal:** Corporate owner + EPC issue = sell non-core asset

**Test C4: Add Physical Constraints (HMO Viable Size)**
```
BASE PRESET (1-7) +
8. Latest sold date: is before 2015-01-01
9. EPC rating: is one of [E, F, G]
10. Ownership type: is one of [Company, Corporate]
11. Property floor area (sqft): is greater than 1500 AND less than 2500
12. Latest EPC number of habitable rooms: is between 6 and 12
```
**Expected:** 150-400 results  
**Signal:** Right size for HMO conversion

**Test C5: Add Transport Access (HMO Rental Demand)**
```
BASE PRESET (1-7) +
8. Latest sold date: is before 2015-01-01
9. EPC rating: is one of [E, F, G]
10. Ownership type: is one of [Company, Corporate]
11. Property floor area (sqft): is greater than 1500 AND less than 2500
12. Latest EPC number of habitable rooms: is between 6 and 12
13. Distance to nearest Bus Stop (m): is less than 500
14. Distance to nearest Train Station (m): is less than 1000
```
**Expected:** 80-200 results  
**Signal:** All criteria met - NOW manageable

**Test C6: Add Affordable Purchase Price (Budget Constraint)**
```
BASE PRESET (1-7) +
8. Latest sold date: is before 2015-01-01
9. EPC rating: is one of [E, F, G]
10. Ownership type: is one of [Company, Corporate]
11. Property floor area (sqft): is greater than 1500 AND less than 2500
12. Latest EPC number of habitable rooms: is between 6 and 12
13. Distance to nearest Bus Stop (m): is less than 500
14. Distance to nearest Train Station (m): is less than 1000
15. Latest sold price: is less than 160000  ← Proxy for current value
```
**Expected:** 20-60 results ✅ PERFECT  
**Budget:** £150k-£160k purchase + £30k-£35k conversion = £180k-£195k

---

### Test C7: Alternative - Add High Leverage (Financial Distress)
```
BASE PRESET (1-7) +
8. Latest sold date: is before 2015-01-01
9. EPC rating: is one of [E, F, G]
10. Number of mortgages charges associated with company: is greater than 3
11. Property floor area (sqft): is greater than 1500 AND less than 2500
12. Distance to nearest Train Station (m): is less than 1000
```
**Expected:** 30-80 results  
**Signal:** High leverage + EPC deadline = forced sale

---

### Strategy C Summary

**Approach:** Start with 66,138, narrow systematically by testing each filter addition

**Recommended sequence:**
1. Test C1 (long hold) → see how many results
2. Test C2 (+ poor EPC) → see how many results
3. Test C3 (+ corporate) → see how many results
4. Test C4 (+ size) → see how many results
5. Test C5 (+ transport) → see how many results
6. Test C6 (+ price) → target 20-60 final results

**Why This Works:**
- Systematic narrowing shows which filters are most effective
- Can stop at any stage if results are manageable (e.g., 50-100 at Test C5)
- Each filter adds motivation signal
- Final list = highly motivated sellers with viable conversion properties

**⚠️ Budget Note:** Requires £30k-£40k conversion capital = £190k-£200k total (TIGHT but doable)

---

### 🎯 Strategy D: Affordable C3 Conversion Candidates (Active Market)

**Step 3: Use "HMO opportunities" preset (341 total) + FIX THE PRICE FILTER - THIRD PRIORITY**

**✅ Preset itself is GOOD:** Targets C3 homes suitable for HMO conversion

**Current preset (works fine):**
```
1. Tenure: is one of [Freehold]
2. Latest EPC number of habitable rooms: is between 8 and 12
3. Use class: contains all [C3 - Dwellinghouses]
4. Latest sold date: is before 11/12/2015
5. EPC rating: is one of [F, G, D, E]
6. Applications in the last 5 years: is less than 1
7. Distance to nearest Bus Stop (m): is less than 500
8. Distance to nearest Train Station (m): is less than 1000
```
**Result:** 341 opportunities (C3 homes held long-term, good transport, ready to convert)

**❌ Problem When You Added:**
```
Sales listing price: is less than 200000
```
**Result:** Only 2 properties - both were **individual flats for sale**, not entire properties

**✅ Solution: Add "Number of addresses" Filter**

**Test D1: Listed Properties Under £200k (ENTIRE buildings, not flats)**
```
BASE PRESET (1-8 above) +
9. Number of addresses: is equal to 1  ← CRITICAL: Ensures whole property, not flat
10. Sales listing currently on the market: is true
11. Sales listing price: is less than 180000  ← Lower to leave conversion budget
```
**Expected:** 5-15 results  
**Why:** Single address = you're buying entire property, not a flat within it  
**Budget:** £180k purchase + £20k-£30k conversion = £200k-£210k (TIGHT)

**Test D2: Off-Market Properties (Better Pricing Potential)**
```
BASE PRESET (1-8 above) +
9. Number of addresses: is equal to 1  ← CRITICAL
10. Sales listing currently on the market: is false  ← Off-market
11. Latest sold price: is less than 160000  ← Use historical price as proxy
12. Ownership type: is one of [Company, Corporate]  ← More motivated
13. Property floor area (sqft): is greater than 1500 AND less than 2500  ← Right size
```
**Expected:** 15-30 results  
**Why:** Company-owned, long-hold, off-market = room to negotiate  
**Budget:** £150k-£160k purchase + £30k-£35k conversion = £180k-£195k ✅

**Test D3: Existing HMOs (If conversion too expensive)**
```
1. Tenure: is one of [Freehold]
2. Has an HMO: is true  ← Target existing HMOs
3. Number of addresses: is equal to 1  ← Single title
4. Latest sold date: is before 11/12/2015
5. EPC rating: is one of [E, F, G]  ← Worst ratings = motivated
6. Distance to nearest Bus Stop (m): is less than 500
7. Distance to nearest Train Station (m): is less than 1000
8. Sales listing currently on the market: is false  ← Off-market
9. Ownership type: is one of [Company, Corporate]
```
**Expected:** 3-10 results  
**Why:** Existing HMOs = no conversion needed, just relicense + refurb  
**Budget:** £170k-£190k purchase + £10k refurb/license = £180k-£200k ✅

---

### 🎯 Strategy E: Commercial-to-HMO Conversion (HIGH RISK, HIGH REWARD)

**Step 4: Test "Commercial with expiring leases" preset (6 results) - IF STRATEGIES A-D FAIL**

**Why Low Priority:**
- Only 6 results = limited options
- Commercial conversion = MORE expensive than HMO conversion
- Requires planning permission (not always granted)
- Capital intensive: £200k purchase + £50k-£100k conversion = £250k-£300k (WAY OVER BUDGET)

**Base Preset (from Requirements.md):**
```
1. Lease end date: is before 2027-12-31
2. Property type: contains any [Commercial, Mixed Use]
3. Tenure: is one of [Freehold, Leasehold]
```

**Add filters to find viable conversions:**

**Test E1: Add size + location constraints**
```
4. Property floor area (sqft): is greater than 1200 AND less than 2500
5. Distance to nearest residential address (m): is less than 100
6. Use class: contains any [E - Commercial Business and Service]
7. Building on title is inactive: is true
```
**Expected:** 1-3 results  
**Signal:** Small inactive commercial in residential area = conversion candidate

**Test E2: Add financial constraints (unlikely to work)**
```
8. Latest sold price: is less than 150000
```
**Expected:** 0-1 results  
**Reality:** Commercial with conversion potential rarely sells <£150k

**⚠️ VERDICT:** Skip Strategy E unless Strategies A-D return <3 viable properties

---

## Part 4: Capital Breakdown & Expected Returns

### Target Economics (from Requirements.md)
- **Capital Available:** £200,000
- **Target Profit:** £150,000+ (minimum)
- **ROI Required:** 75%+ (£150k profit / £200k capital)
- **Strategy:** Single deal focus (volume acceptable but each deal must hit £150k+ profit)

---

### Deal Structure 1: Existing HMO Purchase (Lower Risk)

**Scenario:** Buy underperforming HMO from motivated seller

**Acquisition:**
- Purchase price: £180,000 (below market due to motivation)
- Stamp duty: £5,000 (3% on £180k)
- Legal fees: £2,000
- Survey: £1,000
- **Total acquisition:** £188,000

**Improvement:**
- Relicense: £1,000
- Basic refurb (paint, clean, minor repairs): £5,000
- Fire safety upgrades (if needed): £3,000
- **Total improvement:** £9,000

**Total Investment:** £197,000 (£3k buffer)

**Exit Strategy 1: Refinance**
- Current GDV: £180k (unmotivated seller price)
- Post-refurb GDV: £250k-£280k (licensed, compliant HMO)
- Refinance at 75% LTV: £187k-£210k
- **Profit on refinance:** £0-£13k (not enough)
- **Cashflow improvement:** £1,200-£2,000/month (better rental optimization)

**Exit Strategy 2: Sell**
- Market value: £280k-£320k (licensed, refurbished HMO)
- Sale costs: £5k
- Net proceeds: £275k-£315k
- **Profit:** £78k-£118k (SHORT OF £150k TARGET)

**⚠️ VERDICT:** Single existing HMO unlikely to hit £150k profit target

---

### Deal Structure 2: Bulk Purchase from Portfolio Landlord (BEST OPTION)

**Scenario:** Buy 2-3 HMOs from company with 30+ titles (Strategy A)

**Acquisition:**
- Buy 2 HMOs at £90k each = £180k (bulk discount: 20% below market)
- Market value individually: £110k-£120k each
- Stamp duty: £5,000
- Legal fees: £3,000 (bulk rate)
- Survey: £1,500
- **Total acquisition:** £189,500

**Improvement:**
- Relicense both: £2,000
- Basic refurb: £6,000 (£3k each)
- Fire safety: £2,000
- **Total improvement:** £10,000

**Total Investment:** £199,500

**Exit Strategy 1: Refinance Both**
- GDV per property: £120k-£140k (licensed, refurbished)
- Total GDV: £240k-£280k
- Refinance at 75% LTV: £180k-£210k
- **Cash extracted:** £0-£10k (not enough)
- **Cashflow:** £2,000-£3,000/month combined

**Exit Strategy 2: Sell Both**
- Market value: £130k-£150k each
- Total: £260k-£300k
- Sale costs: £8k
- Net proceeds: £252k-£292k
- **Profit:** £52k-£92k (STILL SHORT)

**Exit Strategy 3: HYBRID (Sell 1, Keep 1)**
- Sell HMO 1: £140k (£40k profit after costs)
- Refinance HMO 2 at £140k: £105k (75% LTV)
- **Cash back:** £40k + £105k = £145k (£54k profit + £105k equity)
- Keep HMO 2 for cashflow: £1,200-£1,500/month

**⚠️ VERDICT:** Bulk purchase still SHORT of £150k target unless properties severely undervalued

---

### Deal Structure 3: HMO + Commercial Conversion (HIGH RISK)

**Scenario:** Buy expired license HMO + small commercial for conversion

**Acquisition:**
- HMO (expired license): £140k (distressed)
- Small commercial (E class): £50k
- Stamp duty: £6,000
- Legal: £3,000
- **Total acquisition:** £199,000

**Improvement:**
- HMO relicense: £1,000 (can't invest more - budget blown)

**⚠️ VERDICT:** Over budget, no room for improvement capital

---

### Deal Structure 4: Single Distressed HMO Conversion (MOST VIABLE)

**Scenario:** Buy LARGE C3 dwelling from motivated seller, convert to HMO

**Acquisition:**
- Large C3 home (6+ beds): £150,000 (motivated seller: company, long hold, poor EPC)
- Market value: £180k-£200k (normal conditions)
- Stamp duty: £4,500
- Legal: £2,000
- Survey: £1,000
- **Total acquisition:** £157,500

**Improvement:**
- HMO conversion (compartmentalization, ensuite, fire safety): £35,000
- License: £1,500
- **Total improvement:** £36,500

**Total Investment:** £194,000 (£6k buffer)

**Exit Strategy 1: Refinance**
- GDV: £280k-£320k (licensed HMO in Essex commuter belt)
- Refinance at 75% LTV: £210k-£240k
- **Cash extracted:** £16k-£46k (£210k-£194k)
- **Equity locked in:** £70k-£126k
- **Cashflow:** £2,000-£2,500/month

**Exit Strategy 2: Sell**
- Market value: £300k-£340k
- Sale costs: £8k
- Net proceeds: £292k-£332k
- **Profit:** £98k-£138k (CLOSE but still short)

**Exit Strategy 3: REFINANCE + SELL LATER (18-24 months)**
- Refinance immediately: £210k (extract £16k)
- Hold for 2 years: Build cashflow £48k-£60k
- Market appreciation: 5-10% = £15k-£34k
- Sell at £315k-£370k
- **Total profit:** £16k (refi) + £48k (cashflow) + £105k-£168k (sale) = **£169k-£232k**

**✅ VERDICT:** This hits £150k+ profit target IF market cooperates

---

### Critical Success Factors for £150k+ Profit

**Must Have ALL of:**
1. **20-30% purchase discount** (motivated seller)
2. **High conversion uplift** (£150k C3 → £300k+ HMO)
3. **Strong rental market** (£2,000-£2,500/month HMO rent)
4. **Capital efficiency** (max £194k all-in)
5. **2-year hold** (refinance + cashflow + appreciation)

**OR:**

1. **Bulk purchase** (2-3 properties at 30-40% discount)
2. **Quick flip** (light refurb + relicense + sell within 6 months)

**Reality Check:**
Single-deal £150k profit in current market = **VERY CHALLENGING** with £200k capital
- May need to accept £100k-£130k profit
- OR extend to 2-year hold + cashflow + appreciation
- OR pivot to bulk purchases (need exceptional deal sourcing)

---

## Part 5: Fallback Strategy (If Motivated Filters Return 0)

If adding motivated seller filters reduces results to **0**, use this approach:

### Step 1: Find Properties That FIT (ignore motivation for now)
Use physical/financial criteria only:

```
1. Tenure: is one of [Freehold]
2. Property floor area (sqft): is greater than 1500 AND less than 2500
3. Number of bedrooms: is greater than or equal to 4
4. Title area (acres): is greater than 0.1 AND less than 0.5
5. Distance to nearest Bus Stop (m): is less than 500
6. Distance to nearest Train Station (m): is less than 1000
7. Planning constraints: does not contain [Conservation Area, Listed Building(s) in plot]
8. Use class: contains any [C3 - Dwellinghouses, E - Commercial Business and Service]
```

Expected: 50-150 results

### Step 2: Manually Assess Seller Motivation Index

For each property, score motivation (1-10):

**High Motivation (7-10):**
- Expired HMO license
- Company in liquidation
- Property vacant/derelict
- EPC rating E, F, or G (PRS deadline pressure)
- Held >10 years
- Multiple mortgage charges

**Medium Motivation (4-6):**
- Listed for >6 months (manual check)
- Corporate ownership
- Mixed use in residential area
- Recent planning applications (stalled project)

**Low Motivation (1-3):**
- Recently purchased (<5 years)
- Private owner
- Good EPC (A, B, C)
- Active business/rental

### Step 3: Target Top 20% by Motivation Score

Manually shortlist properties with motivation score ≥7, then run financial analysis.

---

## Part 5: Key Questions & Data Gaps

### ✅ ANSWERS RECEIVED - Strategy Updated

1. **Company Status Filter Values:**
   - ⚠️ **NOT DEFINED** in AvailableFiltersInSearchLand_ACTUAL.md
   - Filter exists but specific values (liquidation, administration, dissolved, active, dormant) not documented
   - **Strategy:** Use as backup filter - test manually in SearchLand UI if needed
   - **Alternative:** Use "Number of mortgages charges" and "Number of directors" as proxies for company distress

2. **Other HMO Presets:** ✅ CONFIRMED - 4 Total HMO Presets

   **Preset 1: "HMO expired licences" (6 results)**
   ```
   - Tenure: is one of [Freehold]
   - Has an HMO: is true
   - HMO License Expiry Date: is before 06/02/2024
   ```

   **Preset 2: "HMO opportunities" (267 results in 6 LPAs, 341 total)**
   ```
   - Tenure: is one of [Freehold]
   - Latest EPC number of habitable rooms: is between 8 and 12
   - Use class: contains all [C3 - Dwellinghouses]
   - Latest sold date: is before 11/12/2015
   - EPC rating: is one of [F, G, D, E]
   - Applications in the last 5 years: is less than 1
   - Distance to nearest Bus Stop (m): is less than 500
   - Distance to nearest Train Station (m): is less than 1000
   ```

   **Preset 3: "Homes to HMO" (66,138 results total)**
   ```
   - Tenure: is one of [Freehold]
   - Use class: contains any [C3 - Dwellinghouses]
   - Number of addresses: is equal to 1
   - Has an HMO: is false
   - Article 4: doesn't contain [Unspecified Article 4 Directions, Article 4(1) affecting other build...]
   - Ownership type: is one of [Company, Private owner]
   - Sales listing currently on the market: is false
   ```
   **Result:** 66,138 opportunities (TOO BROAD - needs heavy refinement)
   **Key insight:** Targets C3 homes NOT listed (off-market), no Article 4 restrictions

   **Preset 4: "Companies owning more than 30 titles" (11 results)**
   ```
   - Number of titles owned by company: is greater than 30
   - Tenure: is one of [Freehold]
   - Has an HMO: is true
   ```
   **Result:** 11 opportunities across 6 LPAs
   **Key insight:** Portfolio landlords with HMOs - potential bulk sale opportunities

3. **Geographic Scope:** ✅ ALL 6 LPAs (Brentwood, Basildon, Rochford, Chelmsford, Epping Forest, Harlow)
   - User will handle LPA filtering in SearchLand UI
   - No need to include LPA in filter strategies

4. **Capital Allocation:** ✅ SINGLE DEAL FOCUS
   - **Capital:** £200,000 (all-in)
   - **Target Profit:** £150,000+ (minimum per deal)
   - **Strategy:** Volume strategy "acceptable" but each deal must hit £150k+ profit
   - **Implication:** Focus on high-margin single opportunities, not portfolio plays

5. **Sales Listing Filter:** ✅ OFF-MARKET PRIORITY
   - **Open to:** Off-market approaches (letter campaigns, direct outreach)
   - **Target:** Properties with motivation signals but NOT listed
   - **Strategy:** Use "Sales listing currently on the market: is false" as PRIMARY filter
   - **Rationale:** Less competition, better negotiation position

---

## Part 6: UPDATED Recommended Next Actions (Priority Order)

### 🔴 PRIORITY 1: Expired License Direct Approach (Strategy B)

**Action 2: Test "HMO expired licences" preset (6 results)**

**Why Second:**
- Highest single motivation signal (⭐⭐⭐⭐⭐)
- Only 6 results = can assess all immediately
- Owners facing fines/legal pressure
- Off-market potential (may not be listed yet)

**Steps:**
1. Run preset as-is (all 6 LPAs)
2. Document all 6 properties:
   - Address, ownership type, company name
   - Current EPC rating
   - Last sold date
   - Estimated GDV
   - License expiry date
3. Cross-reference with "Companies 30+ titles" list
4. Prioritize: Corporate owned > Individual owned
5. Draft direct approach (offer to take problem off their hands)

**Test variations:**
- Test B1: Add "EPC rating: is one of [E, F, G]" (double whammy)
- Test B2: Add "Ownership type: is one of [Company, Corporate]"
- Test B3: Add "Sales listing currently on the market: is false"

---

### 🟢 PRIORITY 3: Listed/Off-Market Conversion Candidates (Strategy D)

**Action 4: Use "HMO opportunities" preset with CORRECTED price filter**

**Why Fourth:**
- Preset targets C3 homes good for conversion
- Need to add "Number of addresses = 1" when filtering by price
- Can test both listed and off-market approaches

**Option D1: Listed Properties Under £180k**
```
BASE "HMO opportunities" preset +
  - Number of addresses: is equal to 1  ← CRITICAL
  - Property type: does not contain [Flat]  ← Safety
  - Sales listing currently on the market: is true
  - Sales listing price: is less than 180000
```
Expected: 5-15 properties

**Option D2: Off-Market Corporate Properties (BETTER)**
```
BASE "HMO opportunities" preset +
  - Number of addresses: is equal to 1  ← CRITICAL
  - Property type: does not contain [Flat]
  - Sales listing currently on the market: is false  ← Off-market
  - Latest sold price: is less than 160000
  - Ownership type: is one of [Company, Corporate]
```
Expected: 15-30 properties

---

### 🟡 PRIORITY 2: Systematic "Homes to HMO" Filter Layering (Strategy C)

**Action 3: Start with "Homes to HMO" preset (66,138) and systematically narrow**

**Why Third:**
- Preset already has EXCELLENT base filters (off-market, C3, single dwelling, no Article 4)
- Just needs motivated seller signals layered on
- Systematic testing shows which filters are most effective
- Off-market = less competition

**Systematic Testing Approach:**

**Step 1: Test Long Hold (C1)**
```
BASE PRESET + Latest sold date: is before 2015-01-01
```
Run → Document result count → Continue if <10,000

**Step 2: Test Poor EPC (C2)**
```
BASE + Long hold + EPC rating: is one of [E, F, G]
```
Run → Document result count → Continue if <5,000

**Step 3: Test Corporate Ownership (C3)**
```
BASE + Long hold + Poor EPC + Ownership type: is one of [Company, Corporate]
```
Run → Document result count → Continue if <1,500

**Step 4: Test Physical Size (C4)**
```
BASE + C3 filters + Property floor area: 1500-2500 sqft
                  + Latest EPC habitable rooms: 6-12
```
Run → Document result count → Continue if <400

**Step 5: Test Transport Access (C5)**
```
BASE + C4 filters + Distance to Bus Stop: < 500m
                  + Distance to Train Station: < 1000m
```
Run → Document result count → Continue if <200

**Step 6: Test Affordable Price (C6)**
```
BASE + C5 filters + Latest sold price: < £160k
```
Run → **TARGET: 20-60 results** ✅

**Key Advantage:**
- Each test shows EXACTLY how much each filter narrows results
- Can stop at any stage if results are manageable
- Learn which motivation signals are most common
- Final 20-60 properties = highest motivation + conversion viable

**Budget Reality:**
- £150k-£160k purchase + £30k-£35k conversion = £180k-£195k ✅ DOABLE

---

### 🔴 IMMEDIATE TASKS (Do Today - 2 Hours)

**Task 1: Run Strategy A (Companies 30+ titles)** - 10 minutes
- Takes 5 minutes in SearchLand
- Document all 11 companies immediately
- **This is your BEST shot at £150k+ profit (bulk purchase)**

**Task 2: Run Strategy B (Expired licenses)** - 10 minutes
- Takes 5 minutes
- Document all 6 properties
- Highest motivation signal = easiest negotiation

**Task 3: Cross-reference A + B** - 20 minutes
- Check if any of the 6 expired license HMOs are owned by the 11 portfolio companies
- **If yes = JACKPOT** (portfolio landlord with compliance problems)

**Task 3: Run Strategy C - Systematic Narrowing** - 30 minutes
- Start with "Homes to HMO" preset (66,138)
- Add filters ONE AT A TIME:
  - Test C1: + "Latest sold date: before 2015" → record count
  - Test C2: + "EPC rating: E, F, G" → record count
  - Test C3: + "Ownership: Company/Corporate" → record count
  - Test C4: + "Floor area: 1500-2500 sqft" + "Rooms: 6-12" → record count
  - Test C5: + Transport access → record count
  - Test C6: + "Latest sold price < £160k" → record count
- **Document how each filter narrows results**
- This teaches you which motivation signals are most effective

**Task 4: Draft outreach strategy** - 60 minutes
- Write letter template for expired license owners
- Write letter template for off-market C3 conversion targets
- Prepare to move FAST (these deals won't last)

---

### ⏰ Timeline for Week 1

**Day 1 (Today - 2-3 hours):**
- ✅ Run Strategy B (Expired licenses) → 6 results
- ✅ Analyze all 6 for ownership, motivation, profit potential
- ✅ Run Strategy C (Systematic "Homes to HMO" narrowing) → Test C1-C6, record counts
- ✅ Document all findings
- ✅ Shortlist top 5-10 opportunities

**Day 2 (Tomorrow - 2 hours):**
- Analyze Strategy C results (which filters were most effective?)
- Draft outreach letters (2 templates: expired license, off-market C3)
- Research property owners (Companies House for corporate owners)
- Prepare offers (£150k-£180k per property)

**Days 3-5 (This Week):**
- Send outreach letters (15-20 letters to Strategy B & C targets)
- Follow up with phone calls
- Schedule viewings for top 5-8 properties
- Make offers on 2-4 properties

**End of Week 1 Goals:**
- Identified 10-20 highly motivated sellers across 2 strategies (B & C)
- Sent 15-20 outreach letters
- Scheduled 3-5 viewings
- Learned which motivation filters are most effective (from Strategy C testing)
- **Target:** 1 offer accepted

---

## Part 7: Updated Success Criteria & Deal Structure

### Target Outcomes (End of Week 1):

**Minimum Viable:**
- 5-10 highly motivated sellers identified
- 15+ outreach letters sent
- 3-5 viewings scheduled
- 1-2 offers prepared

**Target:**
- 1 offer accepted (£160k-£180k purchase)
- OR bulk purchase negotiation in progress (2-3 HMOs for £200k)
- OR exclusive negotiation with portfolio landlord

**Stretch:**
- Deal under contract
- Due diligence underway (survey, legal, license check)
- Exit strategy confirmed (refinance vs. sell vs. hold)

---

### Optimal Deal Structures (Based on Part 4 Analysis)

**BEST: Bulk Purchase from Portfolio Landlord**
- Buy 2 HMOs at £90k each = £180k (bulk discount)
- Minimal refurb: £10k-£15k
- Total: £190k-£195k
- Exit: Sell both at £130k-£150k each = £260k-£300k
- **Profit:** £65k-£105k (SHORT of £150k target but manageable)

**ALTERNATIVE: Single Distressed HMO + 2-Year Hold**
- Purchase: £150k (motivated seller)
- Conversion: £35k
- Total: £185k-£195k
- Refinance Year 1: £210k (extract £15k-£25k)
- Cashflow Years 1-2: £48k-£60k
- Market appreciation: £15k-£34k
- Sell Year 3: £315k-£370k
- **Total profit:** £140k-£200k (HITS TARGET if patient)

**HYBRID: Refinance + Hold Strategy**
- Purchase + improve: £194k
- Refinance at 75% LTV: £210k-£240k
- Cash extracted: £16k-£46k
- Hold for cashflow: £2,000-£2,500/month
- Build equity + wait for market cycle

---

### Critical Realizations from Analysis

**1. Single-Deal £150k Profit is VERY CHALLENGING**
- Requires 20-30% purchase discount AND high conversion uplift
- OR requires 2-year hold + cashflow + appreciation
- May need to accept £100k-£130k profit on first deal

**2. Bulk Purchase = Best Path Forward**
- Strategy A (Companies 30+ titles) offers best opportunity
- Portfolio landlords more likely to discount for bulk sale
- Lower per-unit acquisition cost
- Faster execution (single negotiation vs. multiple)

**3. Off-Market is CRITICAL**
- Less competition = better negotiation
- "Sales listing currently on the market: is false" should be PRIMARY filter
- Direct outreach > waiting for listings

**4. HMO Conversion Exceeds Budget**
- £150k-£160k purchase + £30k-£40k conversion = £190k-£200k
- No buffer for surprises
- Only pursue if EXCEPTIONAL opportunity (e.g., £140k purchase, £25k conversion)

**5. Time Horizon Matters**
- 6-12 month flip: £80k-£120k profit (likely)
- 2-year hold: £140k-£200k profit (achievable)
- Need to set realistic expectations

---

## Part 8: Filter Combinations to Avoid

### ❌ Don't Combine These (Will Return 0 Results):

1. **"Has an HMO: is true" + "Use class: contains all [C3 - Dwellinghouses]"**
   - Contradiction: HMOs are C4, not C3
   
2. **"HMO License Expiry Date: is before [date]" + "Has an HMO: is false"**
   - Only HMOs have license expiry dates

3. **"Building on title is derelict: is true" + "Has an HMO: is true"**
   - Derelict buildings unlikely to have active HMO licenses

4. **"Sales listing price: is less than 200000" + "Number of addresses: is greater than 10"**
   - Large HMOs (10+ units) rarely sell for <£200k

### ⚠️ Use Caution (May Over-Narrow):

1. **Multiple Tier 1 filters combined**
   - Example: Expired license + Liquidation + Derelict
   - Risk: 0 results (too many hard requirements)
   - Strategy: Test separately, then combine best 2

2. **"Latest sold date: is before 2015-01-01" + "Has an HMO: is true"**
   - May exclude recently converted HMOs
   - Alternative: Use "is before 2018-01-01" (wider net)

---

## Part 9: Key Discovery - "Sales Listing Price" Filter Problem

### ❌ Critical Issue Identified

**Preset:** "HMO opportunities" (341 total results) - preset itself is FINE

**What Went Wrong:**
When you ADDED the filter:
```
Sales listing price: is less than 200000
```

**Expected Result:**
- Entire properties/buildings for sale under £200k
- Properties you could purchase as whole units

**Actual Result:**
- Only 2 results
- Both were **individual residential addresses (flats) for sale WITHIN larger properties**
- NOT the whole property/building itself

**Why This Happened:**

SearchLand's "Sales listing price" filter matches against **INDIVIDUAL LISTINGS**, not entire properties:

1. **Multi-unit property** (e.g., converted house with 6 flats)
   - Title has 6 addresses
   - Owner selling 1 flat for £180k (individual listing)
   - Filter matches: ✅ "Sales listing price < £200k"
   - **BUT you get the FLAT listing, not the building**

2. **Entire property** for sale
   - Title has 1 address (single dwelling)
   - Owner selling whole property for £180k
   - Filter matches: ✅ "Sales listing price < £200k"
   - **You get the whole property ✅**

**Evidence from User:**
> "We set the Sales price <= 200k it found residential addresses for sale not the actual property... they are with a Sales listing Price for the flat not the actual HMO property"

### ✅ Solution: Use "Number of addresses" Filter

**To find ENTIRE properties for sale (not individual flats):**

**CRITICAL ADDITION:**
```
Number of addresses: is equal to 1
```

**Why This Works:**
- Properties with 1 address = single dwelling title (you buy the whole thing)
- Properties with 6+ addresses = multi-unit buildings (you might buy just 1 flat)

**Revised Filter Strategy:**

**Original "HMO opportunities" preset:**
```
1. Tenure: is one of [Freehold]
2. Latest EPC number of habitable rooms: is between 8 and 12
3. Use class: contains all [C3 - Dwellinghouses]
4. Latest sold date: is before 11/12/2015
5. EPC rating: is one of [F, G, D, E]
6. Applications in the last 5 years: is less than 1
7. Distance to nearest Bus Stop (m): is less than 500
8. Distance to nearest Train Station (m): is less than 1000
```

**Add these filters to find AFFORDABLE ENTIRE PROPERTIES:**
```
9. Number of addresses: is equal to 1  ← CRITICAL FIX
10. Sales listing currently on the market: is true (optional - if you want listed only)
11. Sales listing price: is less than 200000
```

**Expected Result:** 5-15 ENTIRE C3 properties for sale under £200k (not flats)

---

### Alternative: Target Properties NOT Currently Listed (Off-Market)

If adding price filter returns too few results, use OFF-MARKET approach:

```
9. Number of addresses: is equal to 1  ← Still critical
10. Sales listing currently on the market: is false  ← Off-market
11. Latest sold price: is less than 180000  ← Use historical price as proxy
12. Ownership type: is one of [Company, Corporate]  ← Motivated sellers
```

**Expected Result:** 20-50 off-market conversion candidates

**Why This Works:**
- "Number of addresses = 1" ensures you're looking at entire properties
- "Latest sold price < £180k" finds properties purchased affordably (likely still affordable)
- Company ownership + long hold (2015) = potential motivation
- Off-market = less competition, room to negotiate

This discovery explains why Approach D filters failed and provides the correct fix.

---

## Part 10: Executive Summary & Action Plan

### What We Know

**Problem:**
- Original Approach D (Volume HMO) failed because filters returned flats, not buildings
- Need to find ACTUAL HMO properties or convertible homes
- Must achieve £150k+ profit with £200k capital (very challenging)

**Available HMO Presets:**
1. **HMO expired licences** (6 results) → ⭐⭐⭐⭐⭐ HIGHEST motivation signal
2. **Homes to HMO** (66,138 results) → ✅ EXCELLENT base (off-market, C3, single dwelling, no Article 4) - needs motivation layers
3. **HMO opportunities** (341 results) → ✅ GOOD but needs "Number of addresses = 1" filter when adding price
4. ~~**Companies owning 30+ titles** (11 results)~~ → ❌ ABANDONED (returns banks/funds, not HMO operators)

**User Requirements:**
- Capital: £200,000 (all-in)
- Target profit: £150,000+ per deal
- Geography: All 6 LPAs (Brentwood, Basildon, Rochford, Chelmsford, Epping Forest, Harlow)
- Open to: Off-market approaches, motivated sellers

---

### Recommended Strategy (Priority Order)

**🥇 PRIORITY 1: Expired License Direct Approach (Strategy B)**
- Test "HMO expired licences" preset (6 results)
- Target owners facing compliance pressure/fines
- Off-market direct approach
- Expected profit: £80k-£120k per property

**🥈 PRIORITY 2: Systematic "Homes to HMO" Narrowing (Strategy C)**
- Start with 66,138 results (off-market C3 homes)
- Systematically add motivated seller filters (long hold, poor EPC, corporate, etc.)
- Test each addition to see impact on results
- Target: Narrow to 20-60 highly motivated properties
- Expected profit: £80k-£130k per property (with conversion)

**🥉 PRIORITY 3: Listed/Off-Market via "HMO opportunities" (Strategy D)**
- Use "HMO opportunities" preset with corrected price filter
- Add "Number of addresses = 1" + "Property type ≠ Flat"
- Test both listed and off-market approaches
- Expected: 5-30 results

---

### Reality Check: £150k Profit Target

**Honest Assessment:**
- Single HMO purchase = £80k-£130k profit (likely)
- Bulk purchase = £70k-£100k profit (achievable)
- **To hit £150k: Need 2-year hold + cashflow + market appreciation**

**Options:**
1. **Accept lower profit** (£100k-£130k) for faster execution
2. **Extend timeline** (2-year hold to capture cashflow + appreciation)
3. **Pursue bulk purchase** (2-3 properties for volume strategy)
4. **Wait for exceptional deal** (30%+ discount + high conversion uplift)

---

### Immediate Action Plan (Start Today)

**Next 2-3 Hours:**
1. ✅ Run "HMO expired licences" preset → document 6 properties
2. ✅ Analyze all 6 properties for profit potential
3. ✅ Run "Homes to HMO" systematic narrowing → test C1-C6, record each count
4. ✅ Analyze which motivation filters work best (from Strategy C)
5. ✅ Draft outreach letters (2 templates: expired license, off-market C3)

**This Week:**
- Send 15-20 outreach letters (Strategies B & C)
- Research property owners on Companies House (if corporate)
- Schedule 3-5 viewings
- Prepare offers (£150k-£180k range)

**Success Metrics:**
- Identified 10-20 highly motivated sellers
- Learned which filters narrow most effectively (Strategy C)
- 1 offer accepted by end of Week 1

---

## Status: READY TO EXECUTE ✅

**All analysis complete. All filters documented. All strategies prioritized.**

### User Should Now:

1. **Run Strategy A** (Companies 30+ titles) - 5 minutes
2. **Run Strategy B** (Expired licenses) - 5 minutes
3. **Report back results** for next iteration
4. **Document findings** in project folder

### What This Document Provides:

✅ Complete motivated seller filter matrix (3 tiers)  
✅ All 4 HMO presets analyzed  
✅ 5 testing strategies prioritized  
✅ Capital breakdown showing £150k profit is challenging  
✅ Immediate action plan with timeline  
✅ Reality check on profit expectations  
✅ Off-market approach strategy  

---

**Document Version:** 2.0 - Complete Strategy Pivot  
**Date Updated:** 2024-12-04  
**Status:** Ready for execution  
**Next Review:** After Strategies A & B results received

