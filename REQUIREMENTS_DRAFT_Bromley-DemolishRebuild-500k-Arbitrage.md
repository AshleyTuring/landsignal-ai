# Project: Bromley-DemolishRebuild-500k-Arbitrage

**Created:** 2024-12-17  
**Last Updated:** 2024-12-17  
**Status:** ⚠️ Multiple Strategies Tested - No Clear Winner Yet

---

## 📋 QUICK RESUME (Start Here Tomorrow)

### 🔍 CURRENT SITUATION

**8 strategies tested, all with significant issues:**

| Strategy | Result | Key Issue |
|----------|--------|-----------|
| Run down homes + motivated seller | ❌ 0 results | Filters too restrictive |
| Emerging allocations (Croydon) | ❌ Failed | Professionals already involved, complex constraints |
| HMO expired licenses | ⚠️ 5-41 targets | Margins too small (£35k-£80k), regulatory risk |
| Class ZA preset | ❌ Failed | Already converted, company-owned |
| Custom motivation filter | ❌ 0-1 result | Too restrictive, impractical |

### 📊 TESTS COMPLETED:

1. **Test 1-2:** Run down homes + motivated sellers → 0 results
2. **Test 3-4:** Recent planning apps + unaware owner → 0 results  
3. **Test 5:** Emerging allocations → 12 private owner sites found
4. **Test 5 Deep Dive:** Croydon site research → Fatal flaws discovered (developer involved, ransom strip, sophisticated owner)
5. **Test 6a-6e:** HMO expired licenses → 5-41 properties, margins too small (£35k-£80k on £300k+ investment)
6. **Test 7:** Class ZA → All already converted or company-owned
7. **Test 8:** Custom motivation filter → 1 result (26 Herbert Road, RM11 3LD) with red flags

### 🚨 KEY PATTERN DISCOVERED:

**"SearchLand is a Trailing Indicator"**
- Every "obvious" arbitrage gets claimed by professionals first
- By the time it shows in filters, opportunity is gone
- Preset-based approach doesn't work for individual investors

**Examples:**
- Emerging allocations → Developers/PE funds already buying
- Class ZA opportunities → Already converted
- HMO expired → Could work but margins too small
- Recent planning → Already marketed

### 📍 ONE PROPERTY FOUND: 26 Herbert Road, Havering RM11 3LD

**Title:** EGL574296  
**Type:** Private owner, 0.49 acres, 92.64% unconstrained, inactive buildings  
**Red Flags:** Planning permission granted 2017, conditions discharged 2019, certificate 2022, but buildings still "inactive" - suggests stalled development or stale data  
**Status:** Requires deep research before pursuing

### 🤔 DECISION POINT:

**Option A:** Test loosened motivation filter (remove "inactive building", lower thresholds)

**Option B:** Test remaining presets:
- Commercial with expiring leases (153 sites)
- Vacant land in built-up areas (192 sites)  
- 1-2 acres land opportunities (51 sites)

**Option C:** Abandon SearchLand preset approach entirely:
- SearchLand shows what WAS an opportunity (past tense)
- Need offline methods: drive around, door-knock, direct mail
- Or use SearchLand differently: find owners of target properties, contact directly

**Option D:** Accept HMO strategy despite small margins:
- 5 E-rated properties with £35k-£80k profit potential
- Lower than desired but actionable
- Regulatory risk manageable with proper due diligence

### 📂 Key Files:
- This file: Complete test log (8 tests, ~800 lines)
- `HMO_ARBITRAGE_TRACKER.md`: Full HMO deal tracking (if pursuing that route)
- `projects/Brentwood-ClassMA-Arbitrage/ARBITRAGE_OPPORTUNITIES.md`: Arbitrage strategy reference

---

## 1. ORIGINAL REQUIREMENTS

### Client Brief:
Similar to reference case 76722/APP/2024/2583 (Hillingdon):
- Demolish existing building and rebuild
- Capital: £500k
- Target GDV: £1.0m - £1.5m
- Geography: Bromley + surrounding LPAs

### Reference Planning Case:
| Field | Value |
|-------|-------|
| Reference | 76722/APP/2024/2583 |
| Status | Approval |
| LPA | Hillingdon (HILLINGDON WEST 2022) |
| Location | HAMILTON VINE GROVE HILLINGDON UB10 9LW |
| Proposal | Discharge of Conditions for 3 bed detached dwelling with garage following part demolition |
| Agent | mr Dimitar Solenkov, 9 Newling Close London E6 5PW |
| Decided | 16-10-24 |

### Target Geography (17 LPAs):
Bromley, Croydon, Lewisham, Greenwich, Bexley, Southwark, Lambeth, Hillingdon, Ealing, Harrow, Hounslow, Havering, Barking and Dagenham, Redbridge, Enfield, Barnet

---

## 2. STRATEGY PIVOT

### Original Strategy: 
Find run-down homes to demolish and rebuild

### Problem Discovered:
- "Run down homes" preset returns 646 sites
- Adding ANY motivated seller filter returns 0 results
- Static "motivated seller" approach doesn't work in London

### Pivoted Strategy:
**Policy/Allocation Arbitrage** - Buy land in emerging local plan allocations before owners realize value

---

## 3. TESTING LOG (Chronological)

### Test 1: Run Down Homes (Preset)
- **Filter:** Base preset only
- **Result:** 646 sites ✅
- **Metrics:** Plot area 2624m², Developed area 270m², 37% with residential planning

### Test 2: Run Down Homes + Motivated Seller Signals
| Additional Filter | Result |
|-------------------|--------|
| + Sales listing status: Available | **0** ❌ |
| + Building on title is derelict: Yes | **0** ❌ |
| + Building on title is inactive: Yes | **0** ❌ |
| + Latest sold date: <1995-01-01 | **0** ❌ |

**Conclusion:** Adding motivated seller signals returns 0. Approach doesn't work.

### Test 3: Recent Planning Apps (Last 30 Days)
- **Filter:** Last app submitted after 2024-11-17, Freehold, Proposal contains dwelling/residential/flats, 0.25-2 acres
- **Result:** 272 sites ✅
- **Metrics:** 97.4% with residential planning

### Test 4: Recent Planning Apps + Unaware Owner Signals
- **Additional Filters:** Private owner, Latest sold <2015, Not on market, 1 address
- **Result:** 0 sites ❌
- **Conclusion:** "Unaware owner" concept doesn't work via SearchLand

### Test 5: Emerging Sites Without Planning ✅ SUCCESS
- **Filter:** Preset "Emerging sites without planning"
- **Result:** 53 sites
- **Problem:** First result was owned by private equity fund (SOUTHGATE-3 LTD)
- **Solution:** Added `Ownership type: Private owner`
- **Final Result:** **12 sites with Private Ownership** ✅

---

## 4. THE 12 PRIVATE OWNER SITES (Complete Analysis)

### Summary Table

| # | Address | Postcode | Title No. | Acres | Unconstrained | Units | Green Belt | Priority |
|---|---------|----------|-----------|-------|---------------|-------|------------|----------|
| 1 | Land to west of Woodridge Close, Enfield | EN2 8HS | - | 3.55 | 0.83% | 95 | YES | ❌ SKIP |
| 2 | (No address - Cattlegate Rd area) | - | NGL268097 | 2.24 | 0% | 1,000 | YES | ⚠️ RISKY |
| 3 | **68 Bouvier Road, Enfield** | **EN3 5SQ** | - | 3.58 | **94.40%** | 240 | **NO** | ✅ **#2** |
| 4 | **Land Adjoining 14-20, Croydon** | **CR0 8XY** | - | 3.53 | **73.35%** | 123 | **NO** | ✅ **#1** |
| 5 | Cuffley Brook South Of, Enfield | EN2 9JN | - | 3.48 | 0% | 370 | YES | ❌ SKIP |
| 6 | 135 Theobalds Park Road, Enfield | EN2 9BB | - | 3.99 | 0% | 370 | YES | ⚠️ MAYBE |
| 7 | **29b Main Avenue, Enfield** | **EN1 1DJ** | EGL256866 | 7.40 | **38.33%** | 80 | **NO** | ✅ **#3** |
| 8 | (No address - South of M25) | - | EGL246656 | 3.72 | 0% | 440 | YES | ❌ SKIP |
| 9 | Wiffin Scaffolding, Kings Oak Nursery, Tingeys Top Lane, Enfield | EN2 9BJ | EGL165058 | 5.31 | 0% | 700 | YES | ⚠️ MAYBE |
| 10 | Land to west of Strayfield Road, Enfield | EN2 9JQ | - | 1.44 | 0% | 700 | YES | ❌ SKIP |
| 11 | Whitewebbs Park South Of Cuffley Brook, Enfield | EN2 9JN | AGL127297 | 6.19 | 0% | 370 | YES | ❌ SKIP |
| 12 | Land to west of Tingeys Top Lane, Enfield | EN2 9BJ | AGL119917 | 1.06 | 0% | 700 | YES | ❌ SKIP |

---

### TOP 3 PRIORITY SITES (Not Green Belt)

#### #1: Land Adjoining And To The Rear Of 14-20, Croydon, CR0 8XY

| Field | Value |
|-------|-------|
| Postcode | CR0 8XY |
| Area | 3.53 acres |
| Unconstrained | **73.35%** |
| Green Belt | **NO** ✅ |
| Allocation | "Land at Poppy Lane" - 123 units |
| Allocation ID | Site 128 |
| Published | **28/06/2024** (most recent - 6 months ago) |
| Constraints | Article 4 (unclassified), PTAL 1a |
| Planning History | 1 app (TPO tree cutting, rejected) |
| Addresses on Title | **1** ✅ (clean ownership) |

**Why #1:** Single address (simple ownership), most recent allocation, high unconstrained %, NO Green Belt

**Arbitrage Calculation:**
- Current value: 3.53 acres × £75k = ~£265k
- With allocation + planning: 3.53 acres × £700k = ~£2.5m
- Per plot: 123 × £20k = £2.46m
- **Profit potential: £1m+**

---

#### #2: 68 Bouvier Road, Enfield, EN3 5SQ

| Field | Value |
|-------|-------|
| Postcode | EN3 5SQ |
| Area | 3.58 acres |
| Unconstrained | **94.40%** (highest!) |
| Green Belt | **NO** ✅ |
| Allocation | "Hoe, Eastfeld, Cherry and Bouvier Estates" - 240 units |
| Allocation ID | SA urb.08 |
| Published | 19/03/2024 |
| Constraints | Opportunity Area (POSITIVE), PTAL 2-3 |
| Planning History | 2 apps (small extensions only) |
| Addresses on Title | **18** ⚠️ (may indicate complex ownership) |

**Why #2:** Highest unconstrained %, in Opportunity Area (council wants development), NO Green Belt

**⚠️ Warning:** 18 addresses on title - investigate via title deeds

**Arbitrage Calculation:**
- Current: 3.58 acres × £75k = ~£270k
- With allocation: 3.58 acres × £600k = ~£2.15m
- Per plot: 240 × £15k = £3.6m
- **Profit potential: £1m-£2m+**

---

#### #3: 29b Main Avenue, Enfield, EN1 1DJ (Title: EGL256866)

| Field | Value |
|-------|-------|
| Title No. | **EGL256866** |
| Postcode | EN1 1DJ |
| Area | **7.40 acres** (largest site) |
| Unconstrained | **38.33%** |
| Green Belt | **NO** ✅ (Urban) |
| Allocation | "Main Avenue Estate" - 80 units (estate regeneration) |
| Allocation ID | SA urb.17 |
| Published | 19/03/2024 |
| Constraints | Conservation Area, Listed Buildings 50m, TPO, Flood Zone 2/3 |
| Planning History | 3 apps (minor works) |
| Addresses on Title | **21** ⚠️ |
| Overlapping Titles | AGL79721 ⚠️ |

**Why #3:** Largest site, NOT Green Belt, but more constraints

**⚠️ Warning:** Conservation area + listed buildings + overlapping title = more complex

**Arbitrage Calculation:**
- Current: 7.40 acres × £50k = ~£370k (lower due to constraints)
- With allocation: 7.40 acres × £300k = ~£2.2m
- **Profit potential: £500k-£1m**

---

### RISKY SITES (Green Belt - Large Allocations)

| Address | Title No. | Acres | Units | GB Review | Notes |
|---------|-----------|-------|-------|-----------|-------|
| Cattlegate Rd area | NGL268097 | 2.24 | **1,000** | Major | If GB released = £5m-10m+ |
| 135 Theobalds Park Rd, EN2 9BB | - | 3.99 | 370 | **Minor** | Best GB rating - may release |
| Wiffin Scaffolding, EN2 9BJ | EGL165058 | 5.31 | 700 | Moderate | Existing commercial use helps |

---

### SKIP SITES (Too Constrained)

| Address | Why Skip |
|---------|----------|
| Woodridge Close, EN2 8HS | Green Belt + Strong GB review + TPO + 0.83% unconstrained |
| Cuffley Brook, EN2 9JN | Green Belt + Major GB review + Flood zones + 0% |
| EGL246656 (South of M25) | Green Belt + Major GB review + 0% |
| Strayfield Road, EN2 9JQ | Too small (1.44 acres) + Green Belt + 0% |
| Whitewebbs Park (AGL127297), EN2 9JN | Green Belt + **Ancient Woodland** (absolute blocker) |
| Tingeys Top Lane (AGL119917), EN2 9BJ | Too small (1.06 acres) + Green Belt + 0% |

---

## 5. ACTION PLAN

### Immediate Actions (£9 investment):

| Step | Action | Cost |
|------|--------|------|
| 1 | Buy title deeds: Land Adjoining 14-20, Croydon CR0 8XY | £3 |
| 2 | Buy title deeds: 68 Bouvier Road, Enfield EN3 5SQ | £3 |
| 3 | Buy title deeds: 29b Main Avenue, Enfield EN1 1DJ | £3 |

### After Getting Title Deeds:

1. **Identify owners** (name, address from deeds)
2. **Send outreach letter:**
```
"Hi [Owner],

I'm a property investor interested in land in [Area].

I noticed you own the land at [Address]. 
Would you consider selling?

I can offer cash and complete quickly.

[Your contact details]"
```
3. **DO NOT mention the allocation** - that's your information advantage

### Monitoring Actions:

1. **Save SearchLand filter** as "Emerging Allocations - Private Owners"
2. **Monitor Enfield local plan** for Green Belt release decisions
3. **Check monthly** for new emerging allocation sites

---

## 6. OTHER PRESETS TESTED

| Preset | Baseline Count | Test Result | Status |
|--------|----------------|-------------|--------|
| **HMO expired licences** | 331 | ❌ **FAILED** | All 53 filtered results are professional landlords |
| Commercial with expiring leases | 153 | ⏳ Not tested | Next to test |
| Fast food restaurant sites | 56 | ⏳ Not tested | - |

### Test 6: HMO Expired Licenses - FAILED

**Filter Applied:**
```
Preset: HMO expired licences
+ Tenure: is one of [Freehold]
+ HMO License Expiry Date: is before [2024-06-02]
+ Ownership type: is one of [Corporate, Company]
```

**Results:** 53 properties (all corporate/company owned)

**Sample Properties:**
1. **164 Brian Road, Romford** - KUGA PROPERTY LTD
2. **2 Hickling Road, Ilford** - AWACHI LTD  
3. **88 Mayesbrook Road, Ilford** - HH NO. 2 LIMITED (parent: MANIFESTO TECHNOLOGIES)

**Why This Failed:**
- All expired HMO licenses are held by **professional property companies**
- These are sophisticated landlords, not desperate individuals
- Companies either:
  - In process of renewing
  - Strategically selling portfolio
  - Already have advisors/agents
- NOT the "panicked landlord" arbitrage opportunity we hoped for

**Attempted Fix:**
- Tried adding "Company status: not active" → 0 results
- All 53 companies are active (not dissolved/liquidated)

**Conclusion:** Expired HMO licenses are a professional landlord management issue, not a naive seller arbitrage opportunity.

### Test 6b: HMO Expired Licenses - PRIVATE OWNERS ✅ SUCCESS

**Refined Filter:**
```
Preset: HMO expired licences
+ Tenure: is one of [Freehold]
+ Ownership type: is one of [Private owner]
+ HMO License Expiry Date: is before [2024-06-02]
```

**Results:** **276 private owner properties** ✅

**Sample Properties (Promising):**

| Property | Last Sold | Hold Period | HMO | EPC | Opportunity |
|----------|-----------|-------------|-----|-----|-------------|
| 112 Lensbury Way, SE2 9TA | £135k (2003) | 21 years | 6 households | C (valid) | Tired landlord |
| **23 Langdale Crescent, DA7 5DZ** | **£330k (2006)** | **18 years** | **6 households** | **D (expired)** | ✅ **BEST** |
| 76 Glebelands Avenue, IG2 7DL | £122k (1999) | 25 years | Unclear | C (valid) | Very long hold |

**Why This Works:**

1. **Long Hold Periods:** 18-25 years = tired landlords, not flippers
2. **Private Individuals:** Not companies, likely overwhelmed by regulations
3. **Dual Pressure:** Expired license + some have expired EPCs = can't rent
4. **Income Loss:** Losing £1,500-£2,500/month while unable to rent
5. **Renewal Costs:** £1-3k license + £5-10k EPC upgrade = £6-13k barrier

**The Arbitrage:**

**Buy:** At slight premium to historical price (owner feels like they "made money")
- Owner paid £330k in 2006, offer £400k = "profit" to them
- Owner avoids £6-13k renewal costs + hassle

**Fix:** Renew license (£2k) + Upgrade EPC if needed (£8k) = £10k
**Sell/Hold:** Compliant HMO worth £450k-£500k

**Profit:** £40k-£90k per property in 3-6 months

**Recommended Next Filter:**
```
+ Latest sold date: is before [2010-01-01]  ← 14+ year hold
+ EPC rating: is one of [D, E, F, G]  ← Double pressure
+ Number of addresses: is equal to [1]  ← Clean ownership
```

This should narrow to highest-motivation sellers.

**Next Action:** Buy title deeds for top 5 properties (£15), test outreach on best candidate.

### Test 6c: HMO Expired - Refined to 64 Properties ✅

**Further Refined Filter:**
```
+ Latest sold date: is before [01/01/2010]
+ EPC rating: is one of [D, E, F, G]
+ Number of addresses: is equal to [1]
```

**Results:** **64 properties** (down from 276)

**Sample Analysis (Top 3 from 64):**

| Property | Last Sold | Hold | EPC Status | Unconstrained | Est. Profit |
|----------|-----------|------|------------|---------------|-------------|
| **23 Langdale Crescent, DA7** | £330k (2006) | 18y | **D - EXPIRED 2022** ✅ | **100%** ✅ | £50k-£80k |
| 30 Stanley Road, IG1 | £100k (1999) | **25y** | D - Expires Dec 2025 | 59% | £40k-£70k |
| 14 Jarrow Road, RM6 | £125k (2002) | 22y | **E** - Valid 2026 | 0% | £38k-£68k |

**Red Flags Found:**
- 12 Wellington Road already on market for £750k (skip this one)
- Some HMO data inconsistencies (need to verify via title deeds)

**Next Steps:**
1. Sort remaining 59 properties by EPC expiry + hold period
2. Exclude any already on market
3. Buy title deeds for top 10 (£30 total)
4. Send outreach letters
5. Track responses and schedule viewings

**Tracking:** See `HMO_ARBITRAGE_TRACKER.md` for full tracking system.

### Test 6d: HMO Expired - Final Filter (41 Properties) ✅ READY TO EXECUTE

**Final Refined Filter:**
```
Preset: HMO expired licences
+ Tenure: is one of [Freehold]
+ Has an HMO: is true
+ HMO License Expiry Date: is before [06/02/2024]
+ Ownership type: is one of [Private owner]
+ Latest sold date: is before [01/01/2010]
+ EPC rating: is one of [D, E, F, G]
+ Number of addresses: is equal to [1]
+ Sales listing status: doesn't contain [Available, Under Offer, Reserved, Sold Subject to Contract, Sold Subject to Conclusion of Missives]
+ Percentage of plot un-constrained: is greater than [50]
```

**Results:** **41 properties** ✅

**Progression:**
- Started with: 276 (private owners with expired HMO licenses)
- Added hold period + EPC filter: 64
- Excluded already on market: 61
- Added unconstrained filter: **41 final targets**

**Top 2 Immediate Opportunities:**

| Property | Last Sold | Hold | EPC Status | Unconstrained | Est. Profit |
|----------|-----------|------|------------|---------------|-------------|
| **23 Langdale Crescent, DA7 5DZ** | £330k (2006) | 18y | **D - EXPIRED 2022** | **100%** | £50k-£80k |
| **30 Stanley Road, IG1 1RW** | £100k (1999) | **25y** | **D - Expires Dec 2025** | 59% | £40k-£70k |

**Additional Strong Candidates (sample):**

| Property | Last Sold | Hold | Unconstrained | Notes |
|----------|-----------|------|---------------|-------|
| 7 Youngs Road, IG2 7LF | £80.5k (1999) | **25y** | 61% | Very low entry price |
| 95 Aldborough Road South, IG3 8HS | £190k (2003) | 21y | **100%** | Fully unconstrained |

**Key Pattern Observed:**
- Properties showing "No HMOs" in HMO section but "Has HMO" in building details = license expired and removed from register
- This confirms the arbitrage opportunity (owners can't legally rent)

### Test 6e: REFINED TO E-RATED ONLY (5 Properties) ✅ FINAL STRATEGY

**Strategic Decision:** Focus exclusively on E-rated properties (worst EPCs = highest motivation)

**Filter Change:**
```
Changed: EPC rating: is one of [D, E, F, G]
To: EPC rating: is one of [E, F, G]
```

**Results:** 5 properties (all E-rated, no F or G found)

**Why E-rated is superior strategy:**
1. **Higher upgrade costs:** £12k-£18k (vs £8k for D→C) = bigger barrier for owners
2. **More motivation:** E rating = "officially bad" property
3. **Less competition:** Most investors skip E ratings (too much work)
4. **Higher response rate:** 40-50% expected (vs 30% for D-rated)
5. **Focused approach:** 5 properties = manageable, high-quality outreach

**Top 5 E-Rated Properties:**

| # | Address | Title | Hold | EPC | Expires | Unconstrained | Est. Profit |
|---|---------|-------|------|-----|---------|---------------|-------------|
| 1 | 10 Wingate Road, Ilford IG1 2JB | EGL518232 | 17y | **E (50) - Expires May 2026** | ⚠️ 5 MONTHS | 56% | £36k-£66k |
| 2 | 8 Gibson Road, Dagenham RM8 1YE | EGL248861 | **22y** | **E (40)** | 2029 | **100%** | £35k-£60k |
| 3 | 4 Cadogan Gardens, London E18 1LU | EX1259 | 16y | **E (51)** | 2028 | 94% | £50k-£80k |
| 4 | 25 Mannin Road, Romford RM6 4PT | EGL431331 | **20y** | **E (50)** | 2030 | 91% | £40k-£70k |
| 5 | 10 Mayville Road, Ilford IG1 2HR | EGL200515 | 16y | **E (51)** | 2028 | **100%** | £40k-£70k |

**Total Potential Profit (all 5):** £201k-£346k  
**Average per property:** £40k-£69k

**Standout Properties:**
- **#1 (10 Wingate Road):** EPC expires in 5 months - URGENT
- **#2 (8 Gibson Road):** Only £85k purchase price (2002), 22-year hold, 100% unconstrained - BEST VALUE
- **#3 (4 Cadogan Gardens):** South Woodford (E18) - HIGHEST PROFIT POTENTIAL

**Backup Strategy:**
- 36 D-rated properties remain available
- If E-rated don't respond within 4 weeks, expand to D-rated (especially expired/expiring)

**User Feedback - Decision to Pivot:**
- Profit margins too small (£35k-£80k on £300k-£450k investment = 10-18% ROI)
- HMO license renewal risk: councils increasingly restrictive (Article 4, saturation policies)
- Regulatory complexity too high for the return

**Decision:** Pause HMO strategy, test simpler/higher-margin arbitrage opportunities

**Next Tests to Consider:**
1. Commercial with expiring leases (153 sites) - motivation without HMO complexity
2. Class ZA (162 sites) - true form-based arbitrage (permitted development)
3. Small vacant land plots - simpler, less regulatory risk
4. Class Q (203 sites) - agricultural conversion if suitable

**Status:** HMO strategy archived as backup, moving to test other opportunities

---

### Test 7: Class ZA - Permitted Development Rebuild ❌ FAILED

**Why Test Class ZA:**
- True form-based arbitrage (file form → instant uplift)
- Huge margins: Commercial £300k → Residential £600k-£1m = £300k-£500k profit
- Permitted development = lower risk than full planning

**Filter Applied:**
```
Preset: Class ZA
(As provided by SearchLand - detached commercial buildings eligible for demolish/rebuild)
```

**Results:** 161 properties found

**Sample Analysis (3 properties reviewed):**

| Property | Title | Owner | Status | Why Failed |
|----------|-------|-------|--------|------------|
| 16 Church Rise, SE23 2UD | 345580 | WESTWAY ASSETS LTD | **ALREADY CONVERTED** | 5 flats, converted 2006 |
| New Crompton Court, N13 5LB | AGL180588 | ANDORA HOMES LIMITED | **ALREADY CONVERTED** | 22+ flats, converted 2017 |
| Bigley, West Drayton UB7 7HQ | AGL19595 | CAPITAL MOBILE MGT LTD | **GREEN BELT** | 0% unconstrained |

**Key Findings:**
1. ❌ **Already converted:** Properties in preset already have residential planning/conversion
2. ❌ **Company owned:** Professional developers, not private owners
3. ❌ **Green Belt sites:** Some have 0% unconstrained (absolute blockers)
4. ❌ **Same problem as emerging allocations:** Professionals already got them

**Conclusion:** 
- Class ZA preset finds properties that WERE opportunities (past tense)
- By the time they appear in SearchLand, already claimed by developers
- Need to add filters: Private owner, NOT already C3, NOT Green Belt

**Decision:** Abandon preset-based approach, try motivation-based filtering instead

---

### Test 8: Custom Motivation-Based Filter ⚠️ TOO RESTRICTIVE

**Strategic Pivot:** 
Stop filtering by "opportunity type" (Class ZA, HMO, etc.). Instead, filter by **seller motivation signals.**

**Filter Applied:**
```
+ Tenure: is one of [Freehold]
+ Ownership type: is one of [Private owner]
+ Latest sold date: is before [2000-01-01]  ← 25+ year hold
+ Title area (acres): is between [0.1] and [1.0]
+ Percentage of plot un-constrained: is greater than [80]
+ Building on title is inactive: is equal to [Yes]
+ Distance to nearest train station (m): is less than [1000]
```

**Initial Results:** 0 properties (too restrictive)

**Adjusted Filter:** Changed sold date to 2020 (instead of 2000)

**Final Results:** **1 property**

---

### PROPERTY FOUND: 26 Herbert Road, Havering RM11 3LD

**Title:** EGL574296  
**Ownership:** Private owner ✅  
**Area:** 0.49 acres (half acre)  
**Unconstrained:** 92.64% ✅  
**Development:** 2.2% (only 459 sqft on 0.49 acres)  
**Buildings:** 2 ancillary buildings - both marked "Inactive" ✅  
**Train Station:** <1000m ✅  
**EPC:** F (29) - EXPIRED 2020 ⚠️

**Planning History (RED FLAGS):**

| Date | Event | Status |
|------|-------|--------|
| 2017 | Planning permission P1544.17 granted | Approved |
| 2019 | Discharge of conditions (materials, vehicle cleansing, construction) | Discharged |
| 2022 | Certificate of Lawfulness confirming permission "lawfully implemented" | Confirmed |
| 2024 | Buildings still showing as "inactive" | ⚠️ SUSPICIOUS |

**Analysis:**

✅ **Positive Signals:**
- Private owner (not company)
- 0.49 acres (good size for development)
- 92.64% unconstrained (very clean)
- Inactive buildings (not in use)
- Near train station (good location)
- Barely developed (2.2% coverage)
- F-rated EPC expired 2020 (property neglected)

🚨 **Red Flags:**
1. **Development started but stalled:** Permission granted 2017, conditions discharged 2019, certificate obtained 2022, but buildings still "inactive"
2. **Short hold period:** Owner bought 2020 (filter was loosened from 2000), only 4-year hold - NOT a tired long-term owner
3. **Could be stuck developer:** Someone who started development, ran out of money, got stuck
4. **Or data is stale:** Development may be complete but SearchLand not updated

**Possible Scenarios:**
- **Best case:** Development stalled, owner wants out = real opportunity ✅
- **Worst case:** Development complete, data stale = no opportunity ❌
- **Middle:** Development half-done, complicated situation ⚠️

**Estimated Opportunity (IF stalled developer):**
- Buy: £200k-£300k (distressed sale)
- Complete development: £100k-£200k
- GDV: £500k-£700k
- Profit: £100k-£300k (but higher risk)

**Next Steps Needed:**
1. Google Street View check
2. Drive-by viewing
3. Check actual planning permission P1544.17 details
4. Call Havering planning department
5. Buy title deeds (£3) to check for charges/mortgages

**Conclusion:**
- Only 1 result shows how RARE this perfect combination is
- Even when loosened to 2020 (not 2000), still only 1 result
- The 1 result has red flags (active planning history, short hold)
- Filter is **TOO RESTRICTIVE** for practical use

**Key Learning:**
Getting 0-1 results from 17 LPAs means the "perfect storm" is too rare:
- Private owner (OK)
- 25+ year hold (TOO RARE)
- 0.1-1.0 acres (OK)
- 80%+ unconstrained (RESTRICTIVE)
- Inactive building (VERY RARE)
- <1000m from train station (RESTRICTIVE)

**Decision:** Need to loosen filters significantly OR abandon SearchLand preset approach entirely

**Suggested Loosened Filter (not yet tested):**
```
+ Ownership type: is one of [Private owner]
+ Latest sold date: is before [2010-01-01]  ← 14+ years (loosened)
+ Title area (acres): is between [0.1] and [1.0]
+ Percentage of plot un-constrained: is greater than [70]  ← Lowered to 70%
+ Distance to nearest train station (m): is less than [1500]  ← Loosened to 1.5km
(Remove: Inactive building requirement - too rare)
```

**Status:** Awaiting decision on whether to test loosened filter or try different approach

---

**Top 10 Complete (from 41 D-rated - BACKUP POOL):**

| Rank | Address | Title | Hold | EPC | Unconstrained | Est. Profit |
|------|---------|-------|------|-----|---------------|-------------|
| 1 | 23 Langdale Crescent, DA7 5DZ | SGL16277 | 18y | **EXPIRED 2022** | 100% | £50k-£80k |
| 2 | 30 Stanley Road, IG1 1RW | NGL56287 | 25y | **Expires Dec 2025** | 59% | £40k-£70k |
| 3 | 10 Wingate Road, IG1 2JB | EGL518232 | 17y | **E - Expires May 2026** | 56% | £36k-£66k |
| 4 | 4 Cadogan Gardens, E18 1LU | EX1259 | 16y | **E** - Valid 2028 | 94% | £50k-£80k |
| 5 | 120 Kingston Road, IG1 1PE | NGL115873 | 23y | D - Valid 2029 | 92% | £40k-£70k |
| 6 | 164 Dawlish Drive, IG3 9EG | EX5654 | 15y | D - Valid 2033 | 100% | £45k-£75k |
| 7 | 121 Lansdowne Road, IG3 8NQ | EGL76730 | 22y | D - Valid 2028 | 100% | £40k-£70k |
| 8 | 7 Youngs Road, IG2 7LF | NGL20403 | 25y | D - Valid 2028 | 61% | £40k-£60k |
| 9 | 95 Aldborough Road South, IG3 8HS | NGL195926 | 21y | D - Valid 2029 | 100% | £40k-£70k |
| 10 | 95 Gresham Drive, RM6 4TR | EGL84712 | 21y | D - Valid 2033 | 84% | £40k-£65k |

**Total Estimated Profit (if all 10 completed):** £416k-£706k  
**Average per property:** £42k-£71k

**Priority Tiers:**
- **URGENT (1-3):** Expired or expiring EPCs in next 6 months
- **HIGH (4-7):** E ratings, 22+ year holds, 100% unconstrained
- **STRONG (8-10):** 21+ year holds, high unconstrained %

**Next Action:** 
1. ✅ Top 10 identified (complete)
2. 🎯 Buy title deeds for top 10 (£30 total)
3. 📨 Send outreach letters to all 10

---

## 7. KEY LEARNINGS

### What Doesn't Work:
- ❌ "Run down homes" + motivated seller filters = 0 results
- ❌ "Recent planning apps" + unaware owner filters = 0 results
- ❌ "Day-0 planning consent" arbitrage (unrealistic)
- ❌ "HMO expired licenses" - Margins too small (£35k-£80k on £300k+ investment), councils restricting licenses
- ❌ "Class ZA" preset - Already converted properties, company-owned, professionals got them first
- ❌ "Perfect storm" motivation filter - Too restrictive (0-1 results), impractical

### What Works:
- ✅ "Emerging sites without planning" + Private Owner = 12 opportunities
- ✅ Focus on sites NOT in Green Belt for actionable deals
- ✅ Large allocations (100+ units) = higher profit potential
- ⚠️ BUT: Deep research on Croydon site revealed fatal flaws (developer involvement, ransom strip, sophisticated owner)

### Critical Pattern Recognition:

**The "Professional Developer Problem":**
Every "obvious" arbitrage opportunity gets claimed by professionals before individual investors can act:
1. Emerging allocations → Developers/PE funds buying them
2. Class ZA opportunities → Already converted or company-owned
3. HMO expired licenses → Could work but margins too small, regulatory risk high
4. Recent planning approvals → Already marketed by agents

**The "SearchLand is a Trailing Indicator" Problem:**
- By the time opportunities show in SearchLand filters, professionals already know
- Professionals monitor daily, have systems, move faster
- SearchLand shows what WAS an opportunity (past tense)

**What Might Work Instead:**
- Stop filtering by "opportunity type"
- Start filtering by "seller motivation" (long holds, inactive properties, good locations)
- Do own research/due diligence on what the opportunity could be
- Or abandon SearchLand for offline methods (drive around, door-knock, direct mail to owners of target properties)

### Critical Filter Insights:
- Base preset: 53 sites
- With Private Owner filter: 12 sites (23% are real opportunities)
- Without Private Owner: Most sites owned by developers/PE funds who already know value
- **Key insight:** `Ownership type: Private owner` is THE most critical filter
- But even with private owners, need deep research (Croydon example)

### SearchLand Limitations:
- No "Planning status" filter (Approved/Refused/Pending)
- No "Approved in last X days" filter
- No real-time alerts
- Data completeness varies by field
- Can't filter for properties NOT already residential (C3/C4)
- Inactive building filter too rare to be useful
- Perfect combination filters return 0-1 results (impractical)

---

## 8. BASELINE PRESET COUNTS (17 LPAs)

| Preset | Count | Test Status | Result |
|--------|-------|-------------|--------|
| Run down homes | 646 | ✅ Tested | ❌ Doesn't work with motivated seller filters (0 results) |
| **Emerging sites without planning** | **53 (12 private)** | ✅ Tested | ⚠️ **Works but complex** - Found opportunities but deep research revealed fatal flaws |
| HMO expired licences | 331 | ✅ Tested | ❌ Small margins (£35k-£80k), regulatory risk, councils restricting |
| Class ZA | 162 | ✅ Tested | ❌ Already converted, company-owned, professionals got them |
| Custom motivation filter | N/A | ✅ Tested | ❌ Too restrictive (0-1 results), impractical |
| Commercial with expiring leases | 153 | ⏳ Not tested | Consider testing |
| Vacant land in built-up areas | 192 | ⏳ Not tested | Consider testing |
| Unsold homes with poor EPC | 12,379 | ⏳ Not tested | Too broad? |
| Houses with big gardens | 484 | ⏳ Not tested | - |
| Unbroken freeholds | 2,352 | ⏳ Not tested | - |
| Class MA | 2,051 | ⏳ Not tested | - |
| Infill | 7,215 | ⏳ Not tested | - |
| 1-2 acres land opportunities | 51 | ⏳ Not tested | Small pool, worth testing |
| Class Q | 203 | ⏳ Not tested | Rural, niche |

---

## 9. REFERENCE DOCUMENTS

- **Arbitrage Strategy:** `projects/Brentwood-ClassMA-Arbitrage/ARBITRAGE_OPPORTUNITIES.md`
- **SearchLand Filters:** `SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md`
- **Project Script:** `scripts/new_project.sh`

---

---

## 10. DEEP RESEARCH - CROYDON SITE (Site 128)

### Research Date: 2024-12-17
**Source:** SearchLand AI Deep Research

### Fatal Flaws Discovered:

#### 1. Professional Developer Already Involved
- **Regent Land & Development Ltd** is actively promoting this site
- They have Croydon experience (Matthews Yard, Whytecliffe Road, Surrey Street)
- Already spent 2+ years trying to unlock access
- **Conclusion:** This is NOT an "unaware owner" opportunity

#### 2. Access Ransom Strip (Deal Killer)
- Access via **Poppy Lane** (private road)
- Council report (March 2023): "delay regarding securing access"
- Multiple owners on private road can block development
- **Estimated ransom payment: £2.6m** (33% of £7.9m uplift)
- Physical width constraint - road too narrow for 123 homes
- **Conclusion:** Even professionals can't solve this. Binary risk = worthless if access fails.

#### 3. Sophisticated Owner
- **Owner:** Mr. Hyatt (purchased ~2010)
- **Cleared trees in 2010** specifically to prevent TPOs blocking future development
- Likely has option agreement with Regent Land already
- **Conclusion:** Owner knows exactly what they have

#### 4. Active Opposition
- **MORA** (Monks Orchard Residents' Association) has tracked this for 15 years
- Actively participating in Examination in Public
- Site was **Metropolitan Open Land** - major de-designation battle
- CPRE challenging the allocation
- **Conclusion:** Highly controversial, not a quiet flip

#### 5. Technical Constraints
- 50% affordable housing requirement (dilutes GDV)
- Biodiversity Net Gain (10% requirement on greenfield)
- TPO trees with Root Protection Areas
- Flood risk assessment missing from SFRA
- **Realistic units:** 80-90 (not 123)

### Financial Reality Check:

| Item | Amount |
|------|--------|
| Realistic GDV (80 units @ £400k) | £32m |
| Build costs + fees | £25m |
| Ransom strip payment | £2.6m |
| **Net land value** | **£4.4m** |
| Current asking (if available) | £4m-5m+ |
| **Arbitrage margin** | **ZERO or NEGATIVE** |

### Conclusion:
This site represents a "distressed strategic asset" suitable only for specialist strategic land funds with:
- Multi-year hold horizon (3-5 years)
- Litigation budget for ransom negotiations
- CPO expertise if ransom fails
- £5m+ capital to tie up

**NOT suitable for simple arbitrage play.**

---

## 11. WHY "EMERGING ALLOCATIONS" STRATEGY FAILED

### The Theory (Why It Looked Good):
1. Council publishes draft allocation
2. Owner doesn't read council documents
3. You approach owner at "backland" pricing
4. Wait for adoption, get planning, flip at "development site" pricing

### The Reality (Why It Failed):
1. **Allocation = Public Information**
   - Published in local papers, council websites
   - Professional land agents monitor ALL allocations
   - Developers contact owners within WEEKS of publication
   - By the time SearchLand shows it (6+ months later), market knows

2. **"Private Owner" ≠ "Unaware Owner"**
   - Many "private owners" are sophisticated investors
   - They often have advisors, land agents
   - If they own development land, they're tracking local plans
   - The naive farmer/homeowner scenario is rare in London

3. **Complex Sites Don't Make It Through**
   - Simple sites get snapped up fast by professionals
   - Sites still available after 6+ months have problems:
     - Access constraints (private roads, ransom strips)
     - Multiple ownership (18-21 addresses = fragmented)
     - Technical constraints (MOL, conservation areas)
   - These problems destroy the arbitrage margin

4. **Competition is Fierce**
   - Strategic land funds employ professional teams
   - They have CPO expertise, legal budgets, multi-year horizons
   - Individual investors can't compete on complex plays

### Key Insight:
**The arbitrage window for allocations is measured in DAYS not MONTHS.**

Once allocation is published:
- Day 1-7: Professional agents contact all landowners
- Week 2-4: Options/offers made
- Week 4-12: Best sites locked up
- Month 3+: Only problem sites remain (visible in SearchLand)

---

## 12. REVISED APPROACH - SIMPLER ARBITRAGE

### What We Should Look For Instead:

#### Characteristics of Good Arbitrage:
1. ✅ **Event-based trigger** (not policy-based)
   - License expiry, lease expiry, death, divorce, insolvency
   - These create SUDDEN motivation (not gradual)

2. ✅ **Simple ownership** (1 address, 1 owner)
   - No multiple owners to coordinate
   - No fragmented title
   - Clean freehold

3. ✅ **No complex constraints**
   - No private roads or ransom strips
   - No conservation areas or listed buildings
   - Direct road access from public highway

4. ✅ **Small scale** (less competition)
   - 1-5 units, not 100+ units
   - Individual buyer market, not housebuilder scale
   - Under professional's radar (too small to bother)

5. ✅ **Clear value creation**
   - Simple planning application (not multi-year strategic)
   - Established use classes (Class MA, Class Q, etc.)
   - 6-12 month timeline, not 3-5 years

### Recommended Next Tests:

| Preset | Why Better | Expected Count |
|--------|-----------|----------------|
| **HMO expired licences** | Compliance pressure = IMMEDIATE motivation | 331 |
| **Commercial with expiring leases** | Predictable event, 3-6 month window | 153 |
| **Class ZA** (small commercial) | Simple PD right, £100-300k sites | 162 |
| **Vacant land 0.25-1 acre** | Small enough for individuals | ~100 |

### Alternative SearchLand Filters:

Instead of "emerging allocations," try:

```
FILTER 1: Small Vacant Land with Road Access
+ Title area (acres): is between [0.25] and [1.0]
+ Developed area percentage: is less than [5]
+ Nearby adopted roads: is greater than [1]
+ Ownership type: is one of [Private owner]
+ Number of addresses: is equal to [1]
+ NOT in Green Belt
+ NOT in Conservation Area
```

**Why:** Small, simple, clean ownership, direct access

```
FILTER 2: Small Commercial Buildings (Class MA/ZA opportunity)
+ Property classification: contains any [Commercial]
+ Title area (acres): is between [0.1] and [0.5]
+ Building on title is inactive: is equal to [Yes]
+ Ownership type: is one of [Private owner]
+ Use class: contains any [E - Commercial Business and Service]
```

**Why:** Inactive commercial = motivated seller, PD rights clear

---

## 13. RECOMMENDATION

### My Assessment:

**DO NOT pursue "emerging allocations" strategy further.**

Reasons:
1. Croydon site research proves the thesis is flawed
2. By the time SearchLand shows them, professionals already have them
3. Complex sites (the only ones left) have deal-breaking constraints
4. We don't have the expertise/capital for ransom strip negotiations

### Recommended Path Forward:

**OPTION A: Pivot to Simple Arbitrage (Recommended)**

Test these presets in order:
1. **HMO expired licences** (331 sites) - Start here
2. **Commercial with expiring leases** (153 sites)
3. **Class ZA small commercial** (162 sites)

These have:
- Clear motivation triggers
- Simpler ownership
- Smaller scale (less competition)
- Shorter timelines

**OPTION B: Refine Allocation Search (High Risk)**

Create custom filter:
- Allocation published in LAST 30 DAYS (not 6+ months ago)
- Single address only
- No Green Belt
- No Article 4
- Check DAILY for new additions

**Problem:** Requires daily monitoring, still competing with professionals

**OPTION C: Different Market Entirely (Nuclear Option)**

Look outside London:
- Smaller towns (less competition)
- Lower land values (higher % returns)
- Less sophisticated local market

---

**Document Status:** STRATEGY FAILED - PIVOT REQUIRED  
**Last Action:** Deep research on Croydon site - discovered fatal flaws  
**Next Action:** Test HMO Expired Licenses OR create refined allocation filter for daily monitoring
