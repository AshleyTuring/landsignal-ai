# Reusable Filter Strategy Patterns

**Version:** v2.2 (List-Based Filter Syntax Guide Added)  
**Purpose:** Proven filter strategies that can be adapted across projects  
**Scope:** Strategic approaches AND correct syntax for SearchLand filters  
**Usage:** LLMs should reference these patterns when creating divergent approaches

---

## ⚠️ CRITICAL: SearchLand Filter Syntax Guide

**BEFORE using any pattern below, read this syntax guide to avoid invalid filters.**

### Two Types of Filters

#### 1. **List-Based Filters** (Predefined Values)
Filters with checkbox options in UI (Use class, Property type, Ownership type, etc.)

**Available Operators:**
- `contains any` - OR logic (matches if ANY value is present)
- `contains all` - AND logic (requires ALL values)  
- `does not contain` - Exclusion
- `is one of` - Multiple selection (implicit OR)
- `is equal to` - Exact match (single value)

**Syntax Pattern:**
```
[Filter name]: [operator] [value1, value2, value3]
```

**✅ CORRECT Examples:**
```
Use class: contains any [E - Commercial Business and Service, C3 - Dwellinghouses]
Property type: is one of [Commercial, Mixed Use]
Ownership type: is one of [Corporate, Company]
Use class: does not contain [B2 - General industrial]
```

**❌ INVALID Examples (DO NOT USE):**
```
❌ Use class: contains 'E' OR Use class: contains 'C3'
   // SearchLand does NOT support OR operators within a filter line

❌ Property type: 'Commercial' OR 'Residential'
   // No OR operators - use 'is one of' or 'contains any'

❌ Use class: E AND C3
   // No AND operators - use 'contains all' instead

❌ Ownership type: NOT 'Private owner'
   // No NOT operators - use 'does not contain' instead
```

#### 2. **Text/Numeric Filters** (Free Input)
Filters where you type values (Title address, Proposal, Price, Area, etc.)

**Text Operators:** `contains`, `does not contain`, `is equal to`
**Numeric Operators:** `is greater than`, `is less than`, `is equal to`, `AND` (for ranges)

**✅ CORRECT Examples:**
```
Proposal: contains "mixed-use" AND "storey"
Title area (acres): is greater than 0.2 AND less than 2
Price: is less than 500000
Title address: contains "London"
```

### Common List-Based Filters:
- **Use class** - Planning classes (E, C3, B2, etc.)
- **Property type** - Commercial, Residential, Mixed Use, etc.
- **Property classification** - Separate from Use class (don't mix!)
- **Ownership type** - Corporate, Council, Housing Association, Company, Private owner
- **Tenure** - Freehold, Leasehold, etc.
- **Planning constraints** - Green Belt, Conservation Area, etc.
- **PTAL** - 1a, 1b, 2, 3, 4, 5, 6a, 6b

### When in Doubt:
1. Check `AvailableFiltersInSearchLand_ACTUAL.md` - lists all filters with `[LIST-BASED]` tag
2. Check `LEARNINGS_DATABASE.md` - has syntax examples
3. **NEVER use OR/AND/NOT operators within a single filter line**

---

## Pattern Categories

1. **Expired/Stalled Planning Strategies**
2. **Motivated Seller Strategies**
3. **Development Opportunity Strategies**
4. **Low Capital Entry Strategies**
5. **High-Density/Intensification Strategies**
6. **Airspace Development Strategies**
7. **Permitted Development (PDR) Strategies**
8. **Regulation-Driven Strategies**
9. **Green Belt Workaround Strategies** (includes Strategic Land - formerly Pattern 11)
10. **Renewable Energy Strategies**
12. **Commercial Traffic Strategies**
14-21. **New Patterns from Stage 1 Peer Review**
22. **HMO Conversion Strategies** ⭐ NEW (Stage 2)
23. **Unbroken Freehold Titles** ⭐ NEW (Stage 2)

**Advanced Workflow:** Time/Information Arbitrage (relocated from Pattern 13 - HIGHEST ROI per Grok)

---

## 1. Expired/Stalled Planning Strategies

### Pattern A: Old Planning + No Recent Activity
```
Strategy: Find sites with old planning applications and no recent development activity
Indicators:
- Last application submitted: >2-3 years ago
- Applications in last 5 years: <3
- Building on title is inactive: Yes
- Max number of dwellings applied for: >0 (confirms development intent)

Strengths: Targets sites where planning work already done but stalled
Weaknesses: May miss sites with expired planning but recent resubmissions
Capital requirement: Varies (often requires on-market listing filter)
```

### Pattern B: Proposal Keyword + Inactive Building
```
Strategy: Search for specific development types with inactive buildings
Indicators:
- Proposal: contains "[development type]" keywords
- Building on title is inactive: Yes
- Title area: appropriate size for target development

Strengths: More flexible than date-based approaches
Weaknesses: Doesn't confirm planning has actually lapsed
Capital requirement: Add price filters as needed
```

---

## 2. Motivated Seller Strategies

### Pattern A: Long Corporate Hold + Derelict Asset
```
Strategy: Corporate owners holding derelict assets for 5+ years
Indicators:
- Ownership type: Company
- Latest sold date: >5 years ago
- Building on title is derelict: Yes
- Optional: Sales listing currently on the market: Yes

Strengths: Strong motivation signals (asset write-down, non-core holding)
Weaknesses: Limited pool of properties
Capital requirement: Often suitable for low-capital strategies
```

### Pattern B: Long Market Listing + Price Cap
```
Strategy: Properties listed for extended periods with price constraints
Indicators:
- Sales listing currently on the market: Yes
- Sales listing price: <target amount
- Latest sold date: >3-5 years ago (long hold)

Strengths: Active sellers with demonstrated motivation
Weaknesses: Cannot directly filter for "time on market"
Capital requirement: Directly constrained by price filter
```

### Pattern C: Inactive Building + Transport Proximity
```
Strategy: Inactive/derelict properties near transport (redevelopment angle)
Indicators:
- Building on title is inactive OR derelict: Yes
- Distance to nearest Train Station: <500-1000m
- Title area: appropriate size

Strengths: Combines motivation with development rationale
Weaknesses: Transport proximity doesn't guarantee motivation
Capital requirement: Add price filters for low-capital approaches
```

### Pattern D: Liquidation/Administration Sales ⭐ NEW

## Master Strategy Matrix 🎯

Quick reference for pattern selection based on constraints:

| Pattern # | Pattern Name | Capital Required | Risk Level | Timeline | Best For |
|-----------|--------------|------------------|------------|----------|----------|
| 1 | Expired/Stalled Planning | £50k-£200k | Medium | 12-24 months | Planning expertise, opportunistic buyers |
| 2 | Motivated Seller | £100k-£500k | Low-Medium | 6-12 months | Negotiation skills, relationship building |
| 3 | Development Opportunity | £200k-£2M+ | Medium-High | 18-36 months | Development expertise, high-density projects |
| 4 | Low Capital Entry | £10k-£200k | Medium-High | 6-18 months | Limited capital, creative financing |
| 5 | High-Density/Intensification | £500k-£5M+ | High | 24-36 months | Tall building expertise, urban regeneration |
| 6 | Airspace Development | £20k-£300k | Medium-High | 12-24 months | Structural engineering, freeholder negotiation |
| 7 | Permitted Development (PDR) | £50k-£500k | Low-Medium | 6-18 months | Fast execution, regulatory knowledge |
| 8 | Regulation-Driven | £50k-£500k | Low-Medium | 6-12 months | Compliance pressure, distressed assets |
| 9 | Green Belt Workarounds | £50k-£300k | Medium-High | 18-36 months | Planning expertise, grey belt sites |
| 10 | Renewable Energy | £10k-£5M+ | Medium | 12-24 months | Solar/wind/BESS, institutional scale |
| 12 | Commercial Traffic | £200k-£5M | Medium | 12-24 months | Footfall/vehicle data, QSR/retail operators |
| 14 | Legacy Holdings | £50k-£500k | Medium | 12-24 months | Patient capital, relationship-based sourcing |
| 15 | Portfolio Divestment | £100k-£5M+ | Medium | 6-18 months | Professional negotiation, bulk deals |
| 16 | Brownfield Demolition | £100k-£5M | Medium-High | 18-36 months | Site remediation, brownfield redevelopment |
| 17 | Micro-Infill Service Yards | £50k-£200k | Medium | 9-18 months | Low capital, volume strategy, mews development |
| 18 | Nutrient Neutrality | £50k-£200k | Medium | 6-18 months | Environmental expertise, niche geography |
| 19 | Digital Infrastructure | £2M-£20M+ | High | 18-36 months | Institutional scale, data centre campus assembly |
| 20 | Brand Covenant Reposition | £500k-£5M | Medium | 6-18 months | QSR economics, covenant swap arbitrage |
| 21 | Community Asset | £500k-£3M | Medium-High | 12-24 months | JV structures, social value, senior living |
```

```markdown
## Collaborative Round Guide 🔄

Maps patterns to exploration rounds in the v3.2.0 workflow:

### Round 2: Precedent Analysis
**Goal:** Which patterns help replicate successful planning applications?
- Pattern 1: Expired/Stalled Planning (find similar approved schemes)
- Pattern 5: High-Density/Intensification (PTAL matching)
- Pattern 10: Adjacent Development/Assembly (precedent for infill)
- Pattern 12: Strategic-to-Residential Conversion (prior approvals)

**Why these patterns?** These rely on demonstrating that similar developments have been approved nearby or on similar sites. Success depends on finding comparable precedents.

### Round 3: Regulation-Driven
**Goal:** Which patterns exploit regulatory drivers and deadlines?
- Pattern 7: Permitted Development (Class AA, Q, MA, ZA rights)
- Pattern 8: Regulation-Driven Opportunities (Article 4, expiring conditions)
- Pattern 11: Distressed/Non-Performing Assets (enforcement, S215 notices)

**Why these patterns?** These opportunities are created by regulatory changes, deadlines, or enforcement actions that create urgency or unlock new rights.

### Round 4: Structural Arbitrage
**Goal:** Which patterns exploit physical characteristics and constraints?
- Pattern 6: Airspace Development (roof extensions, party wall arbitrage)
- Pattern 9: Green Belt/Strategic Land (boundary anomalies, brownfield)
- Pattern 3: Underutilized/Inefficient Sites (layout inefficiencies)
- Pattern 4: Title/Access Issues (ransom strips, easements)

**Why these patterns?** These exploit physical, spatial, or legal constraints that others overlook or cannot solve. Value creation comes from structural problem-solving.

### Round 5: Behavioral/Motivation
**Goal:** Which patterns exploit seller motivation and market timing?
- Pattern 2: Motivated Seller (estate settlements, divorces, financial distress)
- Pattern 13: Time/Information Arbitrage (Advanced Workflow) (emerging allocations, infrastructure announcements)
- Pattern 11: Distressed/Non-Performing Assets (combined with motivation)

**Why these patterns?** These depend on understanding seller psychology, market inefficiencies, and information asymmetries. Success requires empathy and timing.

### Cross-Round Patterns
Some patterns work across multiple rounds:
- **Pattern 11** (Distressed Assets): Regulation-driven (enforcement) + Behavioral (motivated seller)
- **Pattern 1** (Expired Planning): Precedent Analysis (prior approval) + Behavioral (frustrated owner)
- **Pattern 13** (Time Arbitrage): Regulation-Driven (policy changes) + Behavioral (information gaps)
```

```
Strategy: Companies in liquidation or administration forced to sell assets
Discovered: 2025-11-19 (User: ashsubband)

Indicators:
- Ownership type: Company
- Company status: is one of Liquidation (or In Administration)
- Optional: Building on title is derelict/inactive (double motivation)
- Optional: Title area appropriate for target development

Strengths:
- VERY STRONG motivation (forced sale, legal obligation)
- Liquidators motivated to complete quickly
- Often discounted pricing below market
- Strong buyer negotiating position
- Clear decision-maker (liquidator/administrator)

Weaknesses:
- Limited pool of properties (rare)
- May have complex legal issues
- Other creditors may have claims
- Properties often in poor condition

Capital requirement:
- Often low (distressed pricing)
- Suitable for £50k-£300k range
- Cash buyers preferred (speed advantage)

Proven Performance:
- Highly targeted (typically <10 results per LPA)
- Very strong conversion potential
- Excellent for below-market acquisitions

Example Filter:
1. Ownership type: is equal to Company
2. Company status: is one of Liquidation
3. Title area (acres): is greater than 0.2 AND less than 5
4. Distance to nearest Train Station (m): is less than 1000
5. Optional: Building on title is derelict: Yes

Best For:
- Opportunistic buyers with cash
- Distressed asset specialists
- Below-market acquisition strategies
- Quick turnaround projects

Related Filters:
- "In Administration" also strong signal (though company may trade on)
- "Dissolved" less useful (assets already distributed)
```

---

## 3. Development Opportunity Strategies

### Pattern A: Under-Developed + High Accessibility
```
Strategy: Low-density sites in high-transport-accessibility areas
Indicators:
- Max building height on title: <12m (low current density)
- TFL PTAL: 4, 5, 6a, 6b (London only) OR Distance to Train Station: <500m
- Developed area percentage: <40-50%
- Title area: appropriate for target development

Strengths: Clear redevelopment potential with policy support
Weaknesses: PTAL limited to London; may be expensive acquisitions
Capital requirement: Typically requires higher capital or creative financing
```

### Pattern B: Large Plot + Low Building Density
```
Strategy: Large plots with minimal existing development
Indicators:
- Title area (acres): >0.5
- Developed area percentage: <30%
- Number of buildings on title: 0 or 1
- Planning constraints: minimal

Strengths: Clean slate for development
Weaknesses: May require greenfield development expertise
Capital requirement: Land acquisition costs can be high
```

### Pattern C: Existing Use + Upside Potential
```
Strategy: Properties with established use but intensification potential
Indicators:
- Title area: appropriate size
- Max building height: <current vs target differential
- Use class: target class or compatible
- Percentage of plot un-constrained: >70%

Strengths: Income-generating during planning process
Weaknesses: May require change of use or intensification planning
Capital requirement: Higher due to existing use value
```

---

## 4. Low Capital Entry Strategies

**NOTE:** Enhanced in v2.1 based on Codex review - added concrete filter examples for executability

### Pattern A: Sub-£200k Direct Purchase
```
Strategy: Direct freehold/leasehold purchase under capital limit
Source: User strategy (no direct preset)

Example SearchLand Query:
1. Sales listing price: is less than £200,000
2. Tenure: Freehold
3. Title area (acres): is greater than 0.1 AND less than 0.5
4. Sales listing currently on the market: Yes
5. Use class: Contains "Residential" OR "Mixed"
6. NOT: Flood zone 2, Flood zone 3

Indicators:
- Sales listing price: <£200,000 (adjust to your capital)
- Tenure: Freehold (avoid leasehold complications)
- Title area: 0.1-0.5 acres (adequate size without excess land cost)
- On market: Yes (immediate availability)

Strengths: Direct acquisition within budget, clear pricing
Weaknesses: Very limited supply; may sacrifice quality/location
Capital requirement: Hard cap at budget limit (£10k-£200k typical)
```

### Pattern B: Option Agreement Candidates
```
Strategy: Higher-value sites suitable for option agreements (low upfront capital)
Source: User strategy + Pattern 2 (Motivated Seller) overlap

Example SearchLand Query:
1. Latest sold date: No latest sold date (never sold = inherited/legacy)
2. Ownership type: Private owner OR Company
3. Title area (acres): is greater than 1 AND less than 10
4. Less than 1 application in last 5 years (no recent activity)
5. NOT: Sales listing currently on the market (off-market approach)
6. Freehold tenure

Indicators:
- Latest sold date: >5 years ago OR never sold (motivated seller potential)
- Ownership type: Private owner or Company (institutional negotiation)
- Title area: 1-10 acres (large enough for phased development)
- No recent applications (owner not actively developing)
- OFF-MARKET (no listing price filter - approach directly)

Strengths: Access to better sites with low initial capital (£10k-£50k option fee)
Weaknesses: Requires negotiation skills, legal costs, seller must agree
Capital requirement: £10k-£50k for option + £5k-£15k legals

Strategy Steps:
1. Identify site via filters above
2. Research title owner (Land Registry)
3. Approach with option proposal (planning-contingent)
4. Secure option for 12-24 months
5. Apply for planning or sell option to developer
```

### Pattern C: Derelict Asset Turnaround
```
Strategy: Severely derelict properties with rebuild/redevelopment angle
Source: User strategy + Pattern 2C (Motivated Seller) overlap

Example SearchLand Query:
1. Building on title is derelict: Yes
2. Sales listing price: is less than £150,000 (adjust to budget - acquisition costs)
3. Distance to nearest Train Station: less than 1000m (exit value/marketability)
4. Title area (acres): is greater than 0.05 AND less than 0.25
5. Tenure: Freehold
6. NOT: Conservation area, Listed building (reduces complexity)

Indicators:
- Building derelict: Yes (distressed pricing)
- Listing price: <£150k (allows rebuild budget)
- Transport proximity: <1km train station (residential appeal)
- Title area: 0.05-0.25 acres (adequate but not excessive)
- Avoid conservation/listed (planning complexity)

Strengths: Discounted pricing, high upside potential (buy £100k, rebuild £100k, sell £300k)
Weaknesses: Requires construction expertise, hidden structural issues, planning risk
Capital requirement: 
- Acquisition: £50k-£150k
- Demolition: £10k-£30k
- Rebuild: £100k-£200k
- Total: £160k-£380k (phase if needed)
```

---

## 5. High-Density/Intensification Strategies

### Pattern A: Low-Rise in Tall Building Zone
```
Strategy: Existing low-rise in areas with tall building policy support
Indicators:
- Max building height on title: <12-15m (current low-rise)
- PTAL: 4-6b OR Distance to Train Station: <500m
- Percentage of title covered by Green Belt: 0%
- Local policy: (manual research: tall building zones)

Strengths: Policy support for height, existing access/utilities
Weaknesses: May face local opposition; requires tall building expertise
Capital requirement: Varies; consider airspace strategies
```

### Pattern B: Existing Approval for Height
```
Strategy: Sites with existing planning approval for tall buildings
Indicators:
- Proposal: contains "storey" AND specific height keywords
- Max number of dwellings applied for: >target threshold
- Last application submitted: recent (within 3 years)
- Building on title status: any

Strengths: Planning derisked, faster to implement
Weaknesses: May be priced at post-planning approval value
Capital requirement: Higher acquisition, lower planning risk
```

### Pattern C: Strategic Site Allocation
```
Strategy: Sites allocated for development in local plans
Indicators:
- Site allocation type: [specific allocation]
- Land Availability Assessment (SHLAA): positive
- In adopted settlement OR In emerging settlement: appropriate
- Title area: matches allocation size

Strengths: Policy-backed development rights
Weaknesses: May have Section 106/CIL obligations
Capital requirement: Varies by allocation
```

---

## 6. Airspace Development Strategies

### Pattern A: Flat Roof + Height Headroom
```
Strategy: Existing buildings with flat roofs and height capacity
Indicators:
- A building in the title has flat roof: Yes
- Max building height on title: <15m (headroom for addition)
- Maximum height of roof in the title: specific measurement
- PTAL: 4-6b OR Transport proximity: good

Strengths: Existing structure, utilities, access
Weaknesses: Structural assessment required, freeholder negotiation
Capital requirement: Airspace rights purchase (£20k-£100k) + build costs
```

### Pattern B: Low-Rise Commercial + Residential Overlay
```
Strategy: Low-rise commercial buildings in residential-friendly areas
Indicators:
- Max building height: <10m
- Use class: Commercial/retail
- Distance to nearest residential: nearby
- Transport accessibility: good

Strengths: PDR (Permitted Development Rights) potential for residential above
Weaknesses: Structural capacity unknown, leaseholder issues
Capital requirement: Airspace + conversion costs
```

---

## 7. Permitted Development Rights (PDR) Strategies ⭐ FROM PRESETS

### Pattern A: Class MA (Commercial to Residential)
```
Strategy: Convert Class E commercial to residential (PDR)
Source: SearchLand Presets #4, #32
Discovered: 2025-11-19

Indicators:
- Use class: E, E(a), E(b), E(c), E(d), E(e), E(f), E(g)
- Floor area: >37 sqmt (minimum for MA)
- Class E for at least 2 years (PDR requirement)
- Title no bigger than 4,000 sqmt
- NOT: AONB, Flood zone 3, Conservation area, SSSI
- Built-up areas

Strengths:
- No planning permission needed (PDR)
- Faster than full planning
- SearchLand calculates profit automatically (Preset #4)
- Clear regulatory framework

Weaknesses:
- Limited to Class E uses
- 2-year use requirement
- Size restrictions
- Some areas excluded

Capital requirement:
- Purchase + conversion costs
- Often £100k-£500k total

Profit calculation (Preset #4 logic):
- Assumed rent from Rateable Value (VOA)
- Total building value from business yield
- Residential value from new build sold prices
- Regional building cost comparison

Example Filter:
1. Use class: is one of E, E(a), E(b), E(c)(i), E(c)(ii), E(c)(iii), E(d), E(e), E(f), E(g)(i), E(g)(ii), E(g)(iii)
2. Freehold tenure
3. 100-8,000 sqmt
4. NOT C3 dwellinghouses

Related: Presets #4 (Class MA), #32 (MA eligible sites)
```

### Pattern B: Class Q (Agricultural to Residential)
```
Strategy: Convert agricultural buildings to residential (PDR)
Source: SearchLand Preset #6

Indicators:
- Agricultural use (OS defined)
- Agricultural Land Grade 1/2/3/4/5
- Suitable building structure

Strengths:
- PDR (no planning needed)
- Rural housing opportunity
- Often undervalued assets

Weaknesses:
- Structural requirements strict
- Not all ag buildings qualify
- May need prior approval

Capital requirement: Medium (£50k-£300k typical)

Related: Preset #6 (Class Q)
```

### Pattern C: Class G (Space Above Shops)
```
Strategy: Convert space above shops to 2 flats (PDR)
Source: SearchLand Preset #31

Indicators:
- Use class: E commercial (ground floor)
- 1 or fewer addresses (no existing residential)
- NOT C3/C3A/C3B/C3C/B2
- 250 sqmt or less
- NOT listed buildings or AONB

Strengths:
- Small scale (easier finance)
- PDR (faster than planning)
- High street regeneration angle

Weaknesses:
- Size limited (250 sqmt max)
- Only 2 flats maximum
- Access/fire escape challenges

Capital requirement: Low-Medium (£50k-£200k)

Related: Preset #31 (Class G), Preset #77 (Shops with Tops)
```

### Pattern D: Infill Opportunities
```
Strategy: Add dwelling on existing C3 plot with unused space
Source: SearchLand Preset #8

Pre-calculated by SearchLand:
- Pre-existing C3 usage
- Road access confirmed
- Sufficient space for another house

Strengths:
- SearchLand identifies viable sites
- Existing infrastructure
- Often family/private owners (motivated)

Weaknesses:
- Pre-calculated (less control over criteria)
- May still need planning

Capital requirement: Variable (£50k-£500k)

Related: Preset #8 (Infill), #16 (Big Gardens), #74 (Private C3 1+ acre)
```

---

## 8. Regulation-Driven Opportunities ⭐ FROM PRESETS

### Pattern A: HMO Expired Licenses
```
Strategy: Target HMOs with expired licenses (forced compliance or sale)
Source: SearchLand Preset #12
Discovered: 2025-11-19

Indicators:
- Currently has HMO: Yes
- HMO License Expiry Date: before [current date]
- Freehold tenure

Strengths:
- FORCED action (cannot operate)
- Time-sensitive (urgency)
- Clear motivation signal
- Often tired landlords

Weaknesses:
- Limited pool
- May have compliance issues
- Article 4 areas can't renew

Capital requirement:
- Often discounted (£100k-£400k typical)
- Renewal costs £1k-£3k (owner doesn't want to spend)

Motivation Logic:
Expired = Illegal to operate → Must renew (£££) or sell (motivated)

Example Filter:
1. Freehold tenure
2. Currently has HMO: Yes
3. HMO License Expiry Date: is before [today's date]
4. Optional: NOT Article 4 directions (if buyer wants to renew)

Best For:
- Cash buyers (speed advantage)
- HMO operators (can renew)
- Conversion buyers (change use)

Related: Preset #12, #35 (30+ HMO titles), #47 (HMO opportunities)
See LEARNINGS_DATABASE.md → "HMO License Expiry Date"
```

### Pattern B: Lease Expiry Opportunities
```
Strategy: Commercial properties with expiring leases (income cliff)
Source: SearchLand Presets #17, #41, #46, #66, #68
Discovered: 2025-11-19

Indicators:
- Lease end date: within 6-24 months (sweet spot)
- Commercial use class (B2, B8, E)
- Optional: Last application before [old date] (stale property)

Strengths:
- Predictable motivation timeline
- Owner must decide: New tenant OR Sell
- 6-12 months = peak motivation
- Vacant = strongest signal

Weaknesses:
- May find new tenant (motivation gone)
- Market-dependent

Capital requirement: Variable (£100k-£1M+)

Motivation Timeline:
- 12-24 months: Owner starts thinking
- 6-12 months: Peak motivation
- 0-6 months: Urgent (often vacant)
- Past expiry + vacant = maximum motivation

Example Filters:

High-Footfall Retail (Preset #46):
1. Lease end date: 30/09/2025 to 30/09/2026 (1 year window)
2. 6,000+ average daily footfall
3. E(a) retail use

Commercial Expiring (Preset #17):
1. B2, B8, E, or E(g)(i) use class
2. Lease end date: before 31/12/2026
3. Last application submitted: before 01/09/2020 (stale/unmotivated owner)

Offices No Lease (Preset #68):
1. E(g)(i) offices
2. NOT C3 (conversion opportunity)
3. Lease ended OR no leaseholds (vacant = strongest)
4. 10-30m height (multi-storey potential)

Related: Presets #17, #41, #46, #66, #68, #78
See LEARNINGS_DATABASE.md → "Lease end date"
```

### Pattern C: EPC Compliance Pressure
```
Strategy: Properties with low EPC ratings (cannot rent until improved)
Source: SearchLand Presets #2, #20, #36, #47, #67, #69
Discovered: 2025-11-19

Indicators:
- EPC rating: E, F, G (cannot rent legally)
- Private owner (not professional landlord)
- Long hold period (tired owner)
- No recent sales activity

Regulation:
- Private rented sector: Minimum EPC E since 2020
- Improvement costs: £5k-£50k depending on property
- Owner must: Spend money OR Sell

Strengths:
- Legal pressure (cannot rent)
- Owner may not know regulations
- Improvement ROI often poor (motivates sale)

Weaknesses:
- Very broad (many properties)
- Must combine with other signals
- Some owners will just improve

Capital requirement: Often discounted (£50k-£500k)

Example Filters:

Run Down Homes (Preset #2):
1. EPC: G, E, F, D
2. C3 dwellinghouses only
3. Less than 30% area developed (land value)
4. Detached (improvement potential)
5. Freehold tenure

Unsold Poor EPC (Preset #20):
1. EPC: E, F, G
2. Latest sold date: before 01/07/2004 (20+ year hold!)
3. C3 dwellinghouses
4. Private/company owner

Older Houses with Space (Preset #69):
1. No latest sold date (never sold = inherited?)
2. Less than 1 application in 5 years (no activity)
3. EPC: G, F, E, D
4. 1,000-4,500 sqmt (large plot/infill)
5. Private owner

Best For:
- Refurb specialists
- Infill developers (demolish + rebuild)
- Improvement projects (ECO4 grants)

Related: Presets #2, #20, #36, #47, #67, #69
See LEARNINGS_DATABASE.md → "EPC rating (Low)"
```

---

## 9. Green Belt/Constraint Workarounds ⭐ FROM PRESETS

### Pattern A: Grey Belt Exception
```
Strategy: Previously developed land in Green Belt (exception to protection)
Source: SearchLand Presets #7, #43, #44
Discovered: 2025-11-19

Indicators:
- Green Belt location (1-99% coverage)
- 25%+ area developed OR 10%+ hardstanding (previously developed)
- Within 100m of built-up area (accessibility)
- NOT: Flood zone 2/3, National parks, Conservation area, AONB, SSSI

Strategic Rationale:
- Green Belt protects greenfield, NOT previously developed land
- Hardstanding = concrete/asphalt (demolished buildings, car parks)
- Within 100m built-up = edge location (less "green")
- Planning policy allows redevelopment of previously developed

Strengths:
- Access to Green Belt locations (often cheaper)
- Exception to normal GB restrictions
- Less competition (many avoid GB entirely)

Weaknesses:
- Still needs planning (not automatic)
- Local opposition possible
- Must prove "previously developed"

Capital requirement: Often cheaper than pure urban (£50k-£300k)

Example Filters:

Grey Belt (Preset #7):
1. Freehold tenure
2. More than 25% area developed
3. More than 10% hardstanding (key indicator)
4. Within 100m of built up area
5. NOT: Flood zone 2, Flood zone 3, National parks, Conservation area, etc.
6. 1,000+ sqmt

Grey Belt Low Impact (Preset #44):
1. Green Belt Review score: 1 or 2 (low environmental impact)
2. More than 25% hardstanding
3. Within 100m of built up area
4. NOT: Flood zone 3, Conservation area, AONB

Strategic Insight:
"Previously developed land in Green Belt" = exception
Hardstanding % = proxy for "previously developed"

Related: Presets #7, #43, #44, #45 (GB solar)
See LEARNINGS_DATABASE.md → "Hardstanding percentage"
```

### Pattern B: Edge of Settlement Promotion
```
Strategy: Sites on settlement edges for local plan inclusion
Source: SearchLand Presets #13, #18, #85, #86
Discovered: 2025-11-19

Indicators:
- Within 50-200m of adopted/emerging settlement boundary
- NOT allocated (yet) - promotion opportunity
- NOT SHLAA assessed OR negative (hidden gems)
- Private owner (easier to deal)
- 4,000-40,000 sqmt (1-10 acres)
- Less than 5% developed (undeveloped land)

Strategic Rationale:
- Local authorities review settlement boundaries periodically
- Sites on edges = natural expansion direction
- No SHLAA = no one else promoting (first mover advantage)
- Promote to get allocated in next local plan

Strengths:
- Lower competition (undiscovered)
- Can influence local plan
- Option agreements with minimal capital
- Value jump when allocated

Weaknesses:
- Long timeline (2-5 years for allocation)
- No guarantee of allocation
- Requires planning expertise

Capital requirement: Low for option (£5k-£50k), patient capital

Example Filters:

Edge of Settlement (Preset #18):
1. Freehold tenure
2. Private owner ownership
3. 1,000-8,000 sqmt
4. Less than 5% area developed
5. Less than 1 application in last 5 years (no activity)
6. No latest sold date (never sold = inherited/legacy)
7. 1-10% built up area coverage (edge location)
8. More than 80% un-constrained

Un-Allocated No SHLAA (Preset #85):
1. NOT SHLAA positive/neutral/negative (not assessed!)
2. NOT allocated (any type)
3. Within 50m of settlement boundary
4. Company or private owner
5. 4,000-40,000 sqmt (1-10 acres)

Strategy:
1. Identify edge-of-settlement sites
2. Secure option agreement (low capital)
3. Promote to local authority (planning consultancy)
4. Get allocated in local plan
5. Apply for planning permission
6. Exit to housebuilder

Related: Presets #13, #18, #85, #86
See LEARNINGS_DATABASE.md → "SHLAA Status", "No latest sold date"
```

---


### Pattern C: Emerging Allocations (Strategic Land Promotion)
_Merged from Pattern 11A - both reviewers agreed this belongs under Strategic Land category_

```
```
Strategy: Sites allocated in emerging local plans, no planning yet (first mover)
Source: SearchLand Preset #38
Discovered: 2025-11-19

Indicators:
- Housing allocation (emerging) OR Mixed allocation (emerging)
- Less than 1 max dwellings applied for (NO planning yet)
- 4,000-40,000 sqmt (1-10 acres)
- Less than 3% area developed
- Freehold tenure

Strategic Rationale:
- Emerging allocation = council committed to housing here
- No planning yet = can be FIRST to apply
- First mover advantage: Shape scheme, get allocation certainty
- Value jump when planning granted

Strengths:
- Policy backing (allocated in plan)
- Lower competition (not yet discovered by housebuilders)
- Can secure option before planning (low capital)
- Planning risk reduced (policy support)

Weaknesses:
- Emerging = not yet adopted (could change)
- Still needs planning permission
- Section 106 obligations likely

Capital requirement:
- Option: £10k-£50k
- Planning costs: £50k-£200k
- Exit to housebuilder at planning stage

Strategy:
1. Identify emerging allocations with no planning
2. Secure option agreement with landowner
3. Apply for planning (first in)
4. Sell to housebuilder with consent

Example Filter (Preset #38):
1. Freehold tenure
2. Housing allocation (emerging)
3. Less than 1 max dwellings applied for
4. 4,000-40,000 sqmt
5. Less than 3% area developed

Best For:
- Land promoters
- Option traders
- Planning consultancies

Related: Preset #38, #75 (residential allocations)
See LEARNINGS_DATABASE.md → "SHLAA Status"
```


### Pattern D: Strategic Employment Land
_Merged from Pattern 11B - both reviewers agreed this belongs under Strategic Land category_

```
```
Strategy: Large employment/mixed-use allocations near major roads
Source: SearchLand Preset #26
Discovered: 2025-11-19

Indicators:
- 20,000-200,000 sqmt (5-50 acres)
- Less than 10% developed
- Employment allocation OR Employment allocation (emerging)
- Within 100m of A road OR Within 100m of B road (accessibility)

Strategic Rationale:
- Large strategic sites for employment/logistics
- Major road access = commercial viability
- Local authority allocated = policy support

Strengths:
- Policy-backed
- Commercial buyers (logistics, industrial)
- Large scale (meaningful projects)

Weaknesses:
- High capital required (£1M-£20M)
- Long timelines
- Infrastructure requirements

Capital requirement: Institutional (£1M+ per acre)

Example Filter (Preset #26):
1. 20,000-200,000 sqmt
2. Less than 10% developed
3. Employment allocation or emerging
4. Within 100m of A road OR B road

Related: Preset #26
```


## 10. Renewable Energy Opportunities ⭐ FROM PRESETS

### Pattern A: Solar Ground Mount (Agricultural Land)
```
Strategy: Large-scale solar farms on lower-grade agricultural land
Source: SearchLand Presets #14, #81
Discovered: 2025-11-19

Indicators:
- Freehold tenure
- 40,000+ sqmt (10 acres minimum, typically 20-100 acres)
- Less than 5% area developed (flat, open land)
- Agricultural Grade 3/3a/3b/4 (NOT Grade 1-2 = planning objection)
- Within 2,000m of green rated substation (grid connection)
- 75%+ area un-constrained
- Corporate/company/private owner

Strategic Rationale:
- Solar requires: Large area, flat land, grid connection
- Grade 1-2 = "Best & Most Versatile" (BMV) → planning refusal
- Grade 3b/4 = lower quality → planning easier
- Green rated substation = capacity available NOW

Strengths:
- Proven revenue model (20-25 year offtake agreements)
- Land lease income for farmers (passive income)
- Planning policy support (renewable targets)
- Lower grade land = less objections

Weaknesses:
- Large capital (£500k-£5M+ for development)
- Grid connection costs if >2km
- Planning can still be refused (local opposition)
- Long development timeline (12-24 months)

Capital requirement:
- Option: £10k-£50k
- Development: £500k per acre (equipment + grid)
- Often project-financed

Revenue Model:
- Lease to solar operator: £800-£1,200/acre/year
- Or develop + sell to operator
- 25-year income stream

Example Filter (Preset #14):
1. Freehold tenure
2. 40,000 sqmt or more
3. Less than 5% area developed
4. Within 2,000m of green rated substation ⚠️ CRITICAL
5. Agricultural Grade 3/3a/3b/4
6. Corporate/company/private owner ownership

Related: Presets #14, #45 (GB solar), #81 (solar land search)
See LEARNINGS_DATABASE.md → "Agricultural Land Grade", "Distance to Substation"
```

### Pattern B: Industrial Solar Rooftops
```
Strategy: Target high-energy-use industries for solar installations
Source: SearchLand Presets #34, #49, #71, #73, #83
Discovered: 2025-11-19

Indicators:
- Use class: B2, B8, or E(g)(iii) (industrial/warehouse)
- Freehold tenure
- 1,000+ sqmt building area (large roofs)
- Flat roof preferred (easier install)
- Low EPC optional (high energy use signal)
- 0 leaseholds (owner-occupied = decision maker)
- SIC codes: Target specific industries (paper, poultry, manufacturing)

Strategic Rationale:
- Industrial = high energy bills = strong solar ROI
- Owner-occupied = no landlord/tenant split incentive
- Large roofs = economies of scale
- Flat roof = lower install cost

Strengths:
- Clear ROI for owner (energy savings)
- Long-term stable income (20+ years)
- Owner-occupied = easier to deal
- Large projects = better margins

Weaknesses:
- Structural surveys required
- Some roofs unsuitable (age, condition)
- Capital intensive

Capital requirement:
- £50k-£500k depending on roof size
- Often financed/PPA (Power Purchase Agreement)

Target Industries (SIC Codes):
- Paper/printing: 18110, 58130 (high energy)
- Poultry farms: 01470, 10130 (heating demand)
- Manufacturing: Extensive list (machinery, food, metal)
- Warehousing: B8 (large roofs)

Example Filter (Preset #83 - Manufacturing):
1. Use class: B2, E, or E(g)(iii)
2. 1,000+ sqmt
3. Exactly 1 address (single occupier)
4. SIC codes: [extensive manufacturing list]
5. 0 leaseholds (owner-occupied)
6. Freehold tenure

Example Filter (Preset #34 - Commercial Solar):
1. Use class: B2, B8, or E
2. 500+ sqmt
3. EPC rating: D, E, F, G (high energy use)
4. EPC recommendations: contains "solar"
5. Building has flat roof

Best For:
- Solar companies (outreach to industries)
- Finance providers (PPA/lease models)
- Industrial property investors

Related: Presets #34, #49, #71, #73, #83
See LEARNINGS_DATABASE.md → "SIC Codes"
```

### Pattern C: Battery Storage (BESS) & Hydrogen
```
Strategy: Energy storage near substations (grid balancing)
Source: SearchLand Presets #51 (BESS), #55 (Hydrogen), #52 (Bio-energy)
Discovered: 2025-11-19

BESS (Battery Energy Storage Systems):
- 20,000-400,000 sqmt (large sites)
- Within 2,000m green rated substation
- 75%+ flat terrain (easier construction)
- Agricultural Grade 3/3a/3b/4
- Less than 5% developed

Hydrogen Sites:
- 8,000-20,000 sqmt (smaller than BESS)
- Within 200m of substation (high power demand!)
- >500m from schools/hospitals/care homes/built-up (safety)
- NOT Flood zone 2/3, AONB

Strategic Rationale:
- Grid needs storage (renewable intermittency)
- BESS: Store excess, release at peak (arbitrage)
- Hydrogen: Energy vector for heavy industry/transport
- Government incentives/subsidies available

Strengths:
- Growing market (renewable targets)
- Long-term stable contracts
- Grid-critical infrastructure

Weaknesses:
- Complex technology
- Safety concerns (hydrogen)
- Planning objections possible
- High capital (£5M-£50M+)

Capital requirement: Institutional (£5M+), often project finance

Example Filter - BESS (Preset #51):
1. Freehold tenure
2. 20,000-400,000 sqmt
3. Less than 5% area developed
4. Within 2,000m green rated substation
5. 75%+ flat terrain
6. Agricultural Grade 3/3a/3b/4

Example Filter - Hydrogen (Preset #55):
1. Freehold tenure
2. 8,000-20,000 sqmt
3. Within 200m of substation (VERY close!)
4. >500m from sensitive uses (safety buffer)
5. NOT Flood zone 2/3

Related: Presets #51 (BESS), #52 (bio-energy), #55 (hydrogen), #56 (wind)
See LEARNINGS_DATABASE.md → "Distance to Substation"
```

### Pattern D: Wind Farm Land
```
Strategy: Large agricultural sites for onshore wind
Source: SearchLand Preset #56
Discovered: 2025-11-19

Indicators:
- Freehold tenure
- 20,000-400,000 sqmt (5-100 acres)
- Less than 5% developed
- Within 2,000m green rated substation
- Agricultural Grade 3/3a/3b/4 (NOT 1-2)
- >500m from built-up area (noise/visual impact)
- 75%+ un-constrained

Strategic Rationale:
- Wind requires: Large open area, away from housing, grid connection
- Agricultural land continues farming (turbines on small footprint)
- Planning harder than solar (visual impact, noise)

Strengths:
- High output per turbine
- Land lease income (£5k-£10k per turbine/year)
- Farming continues

Weaknesses:
- Planning very difficult (local opposition)
- Visual impact concerns
- Noise regulations
- Expensive (£2M-£4M per turbine)

Capital requirement: Institutional (£5M+ per project)

Example Filter (Preset #56):
1. Freehold tenure
2. 20,000-400,000 sqmt
3. Less than 5% developed
4. Within 2,000m green rated substation
5. Agricultural Grade 3/3a/3b/4
6. >500m from built up area

Note: Wind planning much harder than solar

Related: Preset #56
```

---

## 12. Commercial Traffic-Dependent ⭐ FROM PRESETS

### Pattern A: High-Footfall Retail Opportunities
```
Strategy: Retail sites with quantified footfall (viability proven)
Source: SearchLand Presets #27, #46
Discovered: 2025-11-19

Indicators:
- Average daily footfall: 800+ (viable), 6,000+ (prime)
- Use class: E(a) retail display
- Lease end date optional (motivation signal)
- 325+ sqmt

Strategic Rationale:
- Footfall = revenue potential (quantified)
- High footfall = supports premium rents
- Expiring leases = motivated landlords

Strengths:
- Data-driven (footfall quantified)
- Commercial viability proven
- High footfall = lower vacancy risk

Weaknesses:
- Competitive (everyone wants high footfall)
- Premium pricing

Capital requirement: £200k-£2M+ depending on location

Footfall Thresholds:
- 800+ = Viable for cafe/restaurant
- 2,000+ = Good retail
- 6,000+ = Prime retail (Preset #46)

Example Filter - Cafe Sites (Preset #27):
1. 800+ average daily footfall
2. E(a) retail display
3. 325+ sqmt
4. Demographics: specific targeting

Example Filter - Prime Retail Expiring (Preset #46):
1. 6,000+ average daily footfall (prime!)
2. Lease end date: 30/09/2025 to 30/09/2026 (motivation)
3. E(a) retail or Retail use class

Best For:
- Retail operators
- Restaurant chains
- Landlords/investors

Related: Presets #27, #46
See LEARNINGS_DATABASE.md → "Footfall / Vehicle Count"
```

### Pattern B: High-Traffic Drive-Thru/EV Sites
```
Strategy: Sites with high vehicle counts for drive-thru, petrol, EV chargers
Source: SearchLand Presets #54, #58, #72, #84
Discovered: 2025-11-19

Indicators:
- Average daily vehicle count: 10,000+ (minimum viable)
- Within 400m of A road
- 1,000-20,000 sqmt
- 30% or less area developed (room for construction)
- For EV: Within 5,000m green rated substation (power supply)

Strategic Rationale:
- Vehicle count = customer volume (quantified)
- 10,000+ vehicles/day = viable for petrol/drive-thru/EV
- Major road proximity = visibility

Strengths:
- Data-driven viability
- Clear revenue model
- Growing markets (especially EV)

Weaknesses:
- Competitive locations
- Planning may be difficult (traffic concerns)

Capital requirement: £500k-£5M depending on use

Vehicle Count Thresholds:
- 10,000+ daily = Minimum viable (Presets #54, #58, #72)
- Higher = better (more customers)

Example Filter - EV Charging (Preset #54):
1. 10,000+ average daily vehicle count
2. Within 400m of A road
3. Within 5,000m green rated substation (power)
4. Car park/petrol station/restaurant use
5. >1,000m from existing EV charger (avoid competition)

Example Filter - Drive-Thru Sites (Preset #58):
1. 10,000+ average daily vehicle count
2. 1,000-20,000 sqmt
3. 30% or less area developed
4. Freehold tenure

Example Filter - Petrol Stations (Preset #72):
1. 15,000-60,000 sqmt
2. 10,000+ average daily vehicle count
3. Demographics: Aged 25-64 (car owners)

Best For:
- QSR chains (McDonald's, KFC - see Presets #50, #64 for brand targeting)
- EV charging operators
- Petrol companies
- Property developers

Related: Presets #54, #58, #72, #84
See LEARNINGS_DATABASE.md → "Footfall / Vehicle Count"
```

### Pattern C: Niche Commercial Markets
```
Strategy: Specific commercial uses with defined criteria
Source: SearchLand Presets (Padel #10/#70, Care Homes #28)
Discovered: 2025-11-19

Padel Courts (Growing Trend):
- 1,500-6,500 sqmt
- 7-15m building height (convert existing buildings)
- Commercial use class (E, B2, B8)
- Within 400m bus OR 800m train OR 5m built-up (accessibility)
- Company/private owner

Care Homes:
- 4,000+ sqmt
- ≤10% developed (room for building)
- Within 500m of hospital
- Demographics: Aged 50-69 nearby
- NOT corporate/council/HA ownership

Strategic Rationale:
- Niche markets have specific requirements
- Less competition than mainstream
- Defined criteria = easier to source

Strengths:
- Clear targeting criteria
- Growing markets (padel, elderly care)
- Less mainstream competition

Weaknesses:
- Niche = smaller pool of buyers
- Specialized knowledge required

Capital requirement: £200k-£2M

Example Filter - Padel (Preset #10):
1. 1,500-6,500 sqmt
2. 7-15m building height
3. E, B2, B8, E(g)(ii), E(g)(iii), or E(d) use class
4. Within 400m bus OR 800m train OR 5m built-up area
5. Company or private owner
6. 75%+ un-constrained

Best For:
- Niche operators
- Trend-followers
- Specialized developers

Related: Presets #10 (padel), #28 (care homes), #70 (padel)
```

---

## Strategy Selection Guide

### When to Use Each Pattern:

**Budget-Driven:**
- <£50k → Option Agreement, Airspace Rights
- £50k-£200k → Sub-£200k Direct, Derelict Turnaround
- £200k-£500k → Under-Developed + Accessibility, Stalled Planning
- >£500k → Existing Approvals, Strategic Allocations

**Risk Tolerance:**
- Low risk → Existing Approvals, Strategic Allocations
- Medium risk → Stalled Planning, Under-Developed Sites
- High risk → Derelict Turnaround, Airspace Development

**Timeline:**
- Fast (<12 months) → Existing Approvals, Option Exercise
- Medium (12-24 months) → Stalled Planning Revival, Turnarounds
- Long (24+ months) → Greenfield Development, Strategic Allocations

**Expertise Required:**
- Low → Sub-£200k Direct Purchase, Simple Turnarounds
- Medium → Stalled Planning, Motivated Sellers
- High → Airspace Development, Tall Buildings, Strategic Sites

---

## Combining Patterns

### Example: "Mixed-Use 8-Storey £2M Profit on £200k Capital"

**Possible Approach Combinations:**

1. **Stalled Planning (Pattern 1A) + Motivated Seller (Pattern 2A)**
   - Find stalled mixed-use planning with corporate seller motivation
   - Low acquisition cost, planning precedent exists
   - Capital: option agreement or distressed purchase

2. **Under-Developed (Pattern 3A) + Airspace (Pattern 6A)**
   - High PTAL, flat roof, existing low-rise
   - Add 4-6 storeys of residential above
   - Capital: airspace rights + construction finance

3. **Derelict Turnaround (Pattern 4C) + Height Intensification (Pattern 5A)**
   - Derelict building in tall building zone
   - Demolish + rebuild to 8 storeys
   - Capital: acquisition + phased construction

**Key Principle:** Test multiple approaches in parallel (divergent generation)

---


---

## 14. Legacy Holdings ⭐ NEW FROM PEER REVIEW

### Pattern 14A: Inherited & Untouched Properties
Strategy: Target properties held for decades without sale, likely inherited by non-professional owners
Source: SearchLand Preset #18, #69
Discovered: 2025-11-20 (Peer Review)

Indicators:
- No latest sold date: Yes
- Ownership type: Private owner
- Less than 1 application in last 5 years: Yes
- EPC rating: E, F, or G (optional)
- Title area (acres): >0.5 (optional)

Strategic Rationale:
- Targets properties held before digital records were common
- Owners often elderly, non-professional, unaware of development potential
- Motivated by estate planning, equity release, or offloading burdensome assets
- Distinct motivation from corporate or regulatory pressure

Strengths:
- Low-volume, high-potential leads
- Excellent for patient, relationship-based sourcing
- Off-market acquisition opportunities
- Below-market pricing potential

Weaknesses:
- Requires significant relationship building
- Low volume of results
- Owners may be difficult to locate
- Time-intensive approach

Capital requirement:
- Varies by site (£50k-£500k typical)
- Option agreements possible with £5k-£20k deposits
- Patient capital required

Strategy:
1. Filter for properties with no latest sold date
2. Layer private owner ownership type
3. Confirm no recent activity (<1 application in 5 years)
4. Optional: Add poor EPC rating for stronger motivation signal
5. Target larger plots (>0.5 acres) for infill potential
6. Approach owners with patient, relationship-based outreach
7. Structure option agreements or below-market direct purchase

---

## 15. Portfolio Divestment ⭐ NEW FROM PEER REVIEW

### Pattern 15A: Large Landlord Problem Assets
Strategy: Identify problematic assets within large professional portfolios
Source: SearchLand Preset #35
Discovered: 2025-11-20 (Peer Review)

Indicators:
- Number of titles owned by company: >30
- Ownership type: Company
- Currently has HMO: Yes
- HMO License Expiry Date: before [current date]

Strategic Rationale:
- Large portfolio holders often willing to divest underperforming assets
- Expired HMO licenses create specific problematic assets within portfolios
- Professional sellers make faster decisions than private individuals
- Opportunity for bulk acquisition of multiple assets

Strengths:
- Professional decision-makers (faster process)
- Clear motivation to divest problematic assets
- Opportunity for bulk deals
- Portfolio holders more sophisticated in negotiations

Weaknesses:
- Requires larger capital than single-asset deals
- Professional sellers less likely to accept below-market pricing
- May require portfolio analysis expertise
- Competition from institutional buyers

Capital requirement:
- £100k-£1M+ per asset
- Bulk deals may require £500k-£5M+

Strategy:
1. Filter for companies owning >30 titles
2. Layer HMO ownership filter
3. Add expired HMO license filter
4. Research portfolio holder's financial position
5. Approach with bulk acquisition proposal
6. Target specific problematic assets within portfolio
7. Structure deal to solve portfolio holder's compliance problem

---

## 16. Brownfield Demolition ⭐ NEW FROM PEER REVIEW

### Pattern 16A: Demolished Industrial Sites
Strategy: Find brownfield sites with hardstanding but no buildings remaining
Source: SearchLand Preset #15
Discovered: 2025-11-20 (Peer Review)

Indicators:
- Developed area percentage: <10%
- Hardstanding percentage: >30%
- Use class: E(g)(iii), B2, or B8
- Title area (acres): 0.25-3

Strategic Rationale:
- Distinct from vacant land (which may be greenfield)
- Distinct from derelict buildings (which require demolition)
- Sites primed for new build with lower site-clearing costs
- Clear "previously developed land" planning argument
- Foundations and infrastructure may remain

Strengths:
- Lower site preparation costs (no demolition needed)
- Strong planning argument (brownfield redevelopment)
- Ready-to-build condition
- Avoided demolition risks and costs

Weaknesses:
- May have contamination issues from previous use
- Ground investigation costs required
- Potential remediation needed
- Limited supply of sites

Capital requirement:
- £100k-£1M for site acquisition
- £20k-£100k for ground investigation and remediation
- Total project: £500k-£5M depending on size

Strategy:
1. Filter for low developed area (<10%)
2. Add high hardstanding filter (>30%) to confirm previous structure
3. Target former industrial use classes (E(g)(iii), B2, B8)
4. Size between 0.25-3 acres for manageable projects
5. Conduct Phase 1 contamination assessment
6. Budget for ground investigation and potential remediation
7. Leverage "previously developed land" status in planning applications

---

## 17. Micro-Infill Service Yards ⭐ NEW FROM PEER REVIEW

### Pattern 17A: Small Garage & Yard Conversions
Strategy: Convert small garages, car parks, and MOT yards adjacent to housing
Source: SearchLand Preset #29, #42
Discovered: 2025-11-20 (Peer Review)

Indicators:
- Use class: Car park, B2, or E(g)(iii) garage
- Title area (sqmt): 300-4,000
- Within 20m of residential use
- Proposal keywords: "garage", "MOT", "tyre" (for precedent)
- Ownership type: Private owner or Company (single title)

Strategic Rationale:
- Small sites ideal for single-plot infill or mews development
- Contiguous to housing provides ready utilities
- Minimal land cost due to small size
- EV charging cluster opportunity
- Low capital entry point

Strengths:
- Very low capital requirement
- Ready utilities from adjacent residential
- Option agreements feasible
- Quick planning turnaround
- 2-8 units achievable per site

Weaknesses:
- Small scale limits profit per deal
- Volume strategy required
- Neighbor objections likely
- Tight sites may have design constraints

Capital requirement:
- £50k-£200k for site acquisition
- £200k-£1M total GDV
- Option deposits: £5k-£20k

Strategy:
1. Filter for car park/garage use classes
2. Size 300-4,000 sqmt (sweet spot for 2-10 units)
3. Within 20m of residential for utilities
4. Search proposal keywords for conversion precedent
5. Target single-title ownership for simpler negotiation
6. Structure low-capital option or overage agreements
7. Consider Class G carve-outs or EV micro-depot alternatives
8. Timeline: 9-18 months, delivering 2-8 units

---

## 18. Nutrient Neutrality ⭐ NEW FROM PEER REVIEW

### Pattern 18A: Nutrient Offset Banking
Strategy: Acquire farmland in nutrient neutrality zones to sell offset credits
Source: SearchLand Preset #39
Discovered: 2025-11-20 (Peer Review)

Indicators:
- Tenure: Freehold
- Site size: >80,000 sqmt
- Habitat type: Cereal crops
- Nutrient neutrality area: Yes
- Agricultural Land Grade: 3b or 4 (NOT Grade 1-2)
- Ownership type: Private owner or Company
- Optional: Within 20km of growth settlements

Strategic Rationale:
- LPAs in Solent, Norfolk, Tees catchments require nutrient credits for residential permissions
- Developers are stuck without offset capacity
- Converting cereal crops reduces phosphate output
- Sell offset capacity to housebuilders at £10k-£40k per dwelling equivalent
- Low capital (options/leases) with high return

Strengths:
- Low capital entry via options or leases
- £10k-£40k per dwelling equivalent revenue
- Developers urgently need credits (motivated buyers)
- 6-18 month timeline
- Can structure long-term lease agreements

Weaknesses:
- Very niche geographic requirement (specific catchments)
- Regulatory framework may change
- Requires environmental expertise
- Conversion/rewilding costs needed
- Market limited to affected areas

Capital requirement:
- £50k-£200k for option agreements or leases
- £20k-£100k for rewilding/conversion works
- £10k-£40k revenue per dwelling equivalent

Strategy:
1. Filter for freehold sites >80,000 sqmt
2. Layer nutrient neutrality area filter
3. Target cereal crops habitat type
4. Avoid Grade 1-2 agricultural land
5. Optional: within 20km of growth settlements
6. Structure option or long-term lease with landowner
7. Pair with stalled residential schemes needing credits
8. Fund rewilding works through developer partnerships

---

## 19. Digital Infrastructure ⭐ NEW FROM PEER REVIEW

### Pattern 19A: Data Centre Campus Assembly
Strategy: Assemble large industrial plots near substations for data centres
Source: SearchLand Preset #53
Discovered: 2025-11-20 (Peer Review)

Indicators:
- Site size: >60,000 sqmt
- Terrain: >99% flat, >70% unconstrained
- Use class: B2 or B8
- Within 2,000m of substation (preferably green-rated)
- Ownership type: Corporate or Private owner

Strategic Rationale:
- Data centres and AI training campuses require large, flat industrial plots
- Must be within 2km of high-capacity substation
- Suitable sites are scarce
- Assembling titles and securing grid queue positions creates outsized land value
- Hyperscaler demand surge (cloud providers)

Strengths:
- Site premiums of £1M-£2M per acre in hot markets
- Strong institutional buyer demand
- Long-term appreciation potential
- Pre-let opportunities to cloud providers

Weaknesses:
- Very large capital requirement (institutional scale)
- 18-36 month promotion cycles
- Grid capacity constraints
- Competition from specialist land promoters
- Planning sensitivities (power consumption, noise)

Capital requirement:
- £2M-£20M+ for site assembly
- Option structures possible to reduce upfront capital
- Institutional backing typically required

Strategy:
1. Filter for sites >60,000 sqmt
2. Layer terrain filters (>99% flat, >70% unconstrained)
3. Target B2/B8 use classes
4. Within 2,000m of substation (prioritize green-rated)
5. Corporate/private ownership for faster negotiation
6. Option land and pre-let to cloud providers
7. Or package for speculative colocation developers
8. Secure grid queue position early
9. Timeline: 18-36 months

---

## 20. Brand Covenant Reposition ⭐ NEW FROM PEER REVIEW

### Pattern 20A: QSR Franchise Network Rebalancing
Strategy: Target brand-specific sites with expiring leases for reposition
Source: SearchLand Preset #50, #64, #46, #58
Discovered: 2025-11-20 (Peer Review)

Indicators:
- Company/tenant name contains: KFC, McDonald's (or target brand)
- Lease end date: within 18 months
- Average daily footfall: >2,000 OR Average daily vehicle count: >10,000
- Site size: 1,000-20,000 sqmt
- Ownership type: Corporate freehold or franchise SPV

Strategic Rationale:
- Franchise networks regularly rebalance estates
- Brand-specific datasets enable targeted acquisition
- Expiring leases create repositioning opportunities
- Sale-leaseback or redevelopment plays when corporate covenants vacate
- Quantified footfall/traffic validates re-letting viability

Strengths:
- Clear motivation signal (lease expiry)
- Quantified demand metrics (footfall/traffic)
- 5-10% yield arbitrage on covenant swaps
- Re-letting to competing brands possible
- Professional decision-makers

Weaknesses:
- Requires understanding of QSR economics
- Brand restrictions may limit use
- Tight timeline pressure
- May require planning for alternative use

Capital requirement:
- £500k-£5M per deal
- Reverse premiums may reduce net outlay
- 6-18 month execution timeline

Strategy:
1. Filter for target brand names (KFC, McDonald's, etc.)
2. Layer lease end date within 18 months
3. Add footfall >2,000/day OR vehicle count >10,000/day
4. Site size 1,000-20,000 sqmt
5. Corporate freehold or franchise SPV ownership
6. Negotiate reverse premium for underperforming stores
7. Redevelop to mixed-use or re-let to competing brands
8. Structure sale-leaseback if appropriate

---

## 21. Community Asset ⭐ NEW FROM PEER REVIEW

### Pattern 21A: Institutional Land Recycling
Strategy: Repurpose under-utilised institutional land for senior living or health hubs
Source: SearchLand Preset #28, #37, #62
Discovered: 2025-11-20 (Peer Review)

Indicators:
- Use class: F1, F2, C2, or E(f)
- Hardstanding percentage: >40%
- Site size: 650-10,300 sqmt
- Within 500m of hospital or major bus routes
- Ownership type: Private trust or non-profit (NOT corporate)
- Less than 1 application in last 5 years (optional)

Strategic Rationale:
- Under-utilised institutional land (schools, community halls, care homes)
- Near hospitals and town centres ideal for senior living or health hubs
- Recycling through JV with councils/trustees
- Community asset transfers before marketing
- Social infrastructure demand growing

Strengths:
- £2M-£10M GDV deal sizes
- Community support for appropriate uses
- JV structures with councils reduce risk
- Growing demand for senior living and health provision
- Planning support where councils target health provision

Weaknesses:
- 12-24 month planning timelines
- Complex stakeholder negotiations (councils, trustees)
- Community consultation requirements
- May require social value commitments
- Restricted use covenants possible

Capital requirement:
- £500k-£3M for site acquisition
- £2M-£10M total GDV
- JV structures may reduce upfront capital

Strategy:
1. Filter for F1, F2, C2, or E(f) use classes
2. Hardstanding >40% indicates existing development
3. Size 650-10,300 sqmt (manageable scale)
4. Within 500m of hospital or major bus routes
5. Private trust or non-profit ownership
6. Optional: no recent planning applications
7. Approach councils/trustees for JV partnerships
8. Structure community asset transfer or forward-fund extra care
9. Co-locate medical hubs where appropriate
10. Timeline: 12-24 months planning


---

# ADVANCED WORKFLOW

_This section contains meta-strategies that sit on top of the filter patterns._

---

## ⭐ HIGHEST ROI STRATEGY (Per Stage 2 Review)

**Pattern 13 (Time/Information Arbitrage)** has been relocated to this Advanced Workflow section because it is a **workflow process** rather than a filter pattern. However, peer reviews confirm it is **one of the HIGHEST ROI strategies**:

- **Grok (Stage 2):** Ranked #1 - "Force multiplier that converts SearchLand's 24-hour refresh into unique deal flow"
- **Codex (Stage 1):** Ranked #3 - "High ROI, needs tooling but strategic advantage"
- **Gemini (Stage 1):** Ranked #2 - "Brilliant concept, A-grade strategic value"

**Strategic Philosophy Difference:**
- **Speed/Timing Lens (Grok):** Time arbitrage = highest priority (be first to act)
- **Certainty Lens (Gemini/Codex):** Regulation-driven = highest priority (predictable triggers)
- **Both valid:** Choose based on your competitive advantage (speed vs. process)

**What Makes This Different:**
This is a **FORCE MULTIPLIER** - it doesn't replace other patterns, it amplifies them. Apply this workflow to ANY pattern you choose (Regulation, Motivated Seller, Planning, etc.) to gain a 24-hour speed advantage over competition.

---

## 13. Time/Information Arbitrage Strategies ⭐ NEW

**Core Concept:** SearchLand refreshes data every 24 hours. Speed advantage = profit advantage.

### Pattern 13A: Real-Time Status Change Monitoring
```
Strategy: Be first to act on planning status changes, new allocations, or lease expiries
Indicators:
- Set up automated daily/weekly exports
- Monitor for status changes (approval, refusal, allocation)
- Contact owners/buyers SAME DAY before agents/competition

Implementation: Requires monitoring system outside SearchLand
- Daily export of target filters
- Compare today vs yesterday (diff analysis)
- Alert on NEW properties or status changes

Why This Works:
- Owner doesn't know market value of fresh consent yet
- Buyers willing to pay premium for pre-market exclusivity
- No agent competition (you're first)
- Time arbitrage = price arbitrage
```

### Pattern 13B: Fresh Planning Consent Alert
```
Strategy: Contact owner same day planning consent granted
Indicators:
- Planning status: Approved (filter)
- Decision date: Last 7 days (custom monitoring)
- Your action: Call owner immediately

Example Script:
"Congratulations on your consent. I have a buyer ready to move. 
Would £580k interest you?" (Owner unaware of £650k market value)

Profit: £70k in 48 hours (user example)

Strengths: Maximum information asymmetry
Weaknesses: Requires daily monitoring, fast response capability
Capital: Option agreement or cash purchase ready
```

### Pattern 13C: Lease Expiry Pre-Contact (90-Day Window)
```
Strategy: Contact owner 90 days before lease expiry (before void period)
Indicators:
- Lease end date: 60-120 days from today
- Use class: Commercial (E, B2, B8)
- Your offer: "Avoid void period, we have buyers ready"

Owner Psychology:
- 90 days out: Starting to worry about vacancy
- 30 days out: Panicking about lost income
- Post-expiry: Maximum pressure (carrying costs, no income)

Profit Source: Buy at "pre-panic" price, sell at market
```

### Pattern 13D: New Allocation Alert (Local Plan)
```
Strategy: Contact owner when site added to local plan allocations
Indicators:
- Housing allocation: Emerging (NEW)
- Applications in last 5 years: 0 (owner unaware)
- Your action: "Your site just got allocated—let's discuss before agent calls"

Example:
Day 1: SearchLand shows site added to emerging allocations
Day 1 (same day): You call owner offering £300k
Owner thinks: "My land was worth £150k yesterday, £300k is amazing!"
Reality: Market value post-allocation = £500k
Your profit: £200k by being first

Strengths: Massive information asymmetry
Weaknesses: Requires immediate action (speed critical)
```

### Pattern 13E: Fast Food Lease Expiry (High Visibility)
```
Strategy: Target high-footfall commercial with expiring leases
Indicators:
- Use class: E (restaurants/retail)
- Lease end date: Last 30 days (just expired)
- Footfall count: >2000/day (high value)
- Your action: Contact landlord (now in void period, cash flow pressure)

Why This Works:
- High footfall = high value but landlord may not realize
- Void period = immediate cash flow pressure
- Can offer "quick sale to avoid prolonged void"

Buyers: Fast food chains, convenience stores (high footfall valuable)
```

### Implementation Requirements

**System Setup:**
1. **Daily Automated Exports**
   - Export target filter results as CSV/JSON
   - Store with timestamp
   - Compare today vs yesterday (diff script)

2. **Alert Triggers**
   - New properties added: Email notification
   - Status changes: SMS + Email
   - Approaching thresholds (e.g., 90 days to lease expiry): Weekly digest

3. **Response Protocol**
   - Same-day contact for fresh consents
   - Script templates for different scenarios
   - Cash/option ready to move fast

**Tools Needed:**
- SearchLand API (or automated export)
- Diff comparison script (Python/Node)
- Email/SMS alerting system
- CRM for tracking contacts

### Capital Strategy

**Speed Capital:**
- Keep £50k-£200k liquid for immediate deployment
- Option agreements (£10k-£50k) for fast control
- Bridging finance arranged in advance (no delays)

**Profit Model:**
- Time arbitrage: Buy at "uninformed" price, sell at "informed" price
- Typical spread: 10-30% (£50k-£200k on £500k deal)
- Volume strategy: 10-20 deals/year = £500k-£2M profit

### Strengths
1. **Information asymmetry:** You know before owner/market
2. **No competition:** Pre-market, no agents, no bidders
3. **Premium pricing:** Buyers pay for exclusivity
4. **Scalable:** Automated monitoring, repeatable process
5. **High ROI:** Low capital, high profit margins

### Weaknesses
1. **Requires daily monitoring:** Labor-intensive or requires automation
2. **Speed critical:** Miss by 1 day = opportunity lost
3. **Competitive advantage erodes:** Once others adopt same strategy
4. **SearchLand dependency:** 24hr refresh only (not real-time)
5. **Execution risk:** Owner may not want to sell, buyer may back out

### Example Deal Flow

**Day 1 Morning:**
- SearchLand export shows planning consent granted yesterday
- Property: 4-unit scheme, Camden, owner-occupied

**Day 1 Afternoon:**
- Call owner: "Congratulations! I have a buyer at £580k, quick completion"
- Owner (unaware of £650k market value): "Yes, that sounds great!"

**Day 2:**
- Option agreement signed (£10k, 30-day exercise)
- Call buyer network: "Fresh consent, Camden, 4 units, £650k"
- Buyer: "Pre-vetted, no competition? Yes."

**Day 3-30:**
- Due diligence, legal, exercise option
- Completion: You buy £580k, sell £650k
- **Net profit: £60k** (after legals/costs)

**Annualized: 10 deals = £600k profit from speed arbitrage alone**

---

**Key Principle:** Test multiple approaches in parallel (divergent generation)

---

## Anti-Patterns (Avoid)

### ❌ Over-Constraining
```
Problem: Combining too many restrictive filters
Example: Applications = 0 AND Price <£200k AND Derelict AND On-market AND PTAL 6a
Result: 0 results (filters compound restrictiveness)
Solution: Test incrementally, use separate filter groups for different approaches
```

### ❌ Geographic Mismatches
```
Problem: Using London-specific filters (PTAL) for UK-wide searches
Example: PTAL filter outside TfL area
Result: 0 results
Solution: Create separate approaches for London vs rest of UK
```

### ❌ Assuming Non-Existent Filters
```
Problem: Designing strategy around filters that don't exist
Example: "Planning Status: Expired" or "Price Reduced"
Result: Cannot implement strategy
Solution: Always check AvailableFiltersInSearchLand_ACTUAL.md first
```

---

## 22. HMO Conversion Strategies ⭐ NEW (Stage 2 - Gemini + Grok)

**Added based on Stage 2 peer review - both Gemini and Grok independently suggested this pattern**

### Pattern 22A: University/Hospital Proximity HMO
```
Strategy: Target properties suitable for HMO conversion near education/healthcare demand
Source: Derived from regulation-driven patterns + market analysis
Proposed by: Gemini + Grok (Stage 2 consensus)

Example SearchLand Query:
1. Existing Use Class: C3 (residential dwelling)
2. Title area (sqm): is greater than 100 AND less than 300
3. Distance to nearest university: less than 1000m
   OR Distance to nearest hospital: less than 1000m
4. Sales listing price: is less than £400,000
5. NOT: Article 4 direction HMO areas (manual check required)
6. Freehold tenure

Indicators:
- Existing C3 residential (avoids commercial complications)
- Size: 100-300 sqm (adequate for 4-6 bedrooms)
- Proximity: <1km to university/hospital (tenant demand)
- Capital: <£400k (allows £50k-£100k conversion costs)
- Freehold: Easier to convert than leasehold

Strategic Rationale:
- Strong rental yields: 5-8% vs. 3-4% standard BTL
- Planning permission often not required (if <7 occupants, no Article 4)
- Professional tenant base (students/NHS staff)
- Lower voids due to institutional demand

Strengths:
- Higher yields than standard residential
- Established demand (universities/hospitals don't relocate)
- Can often convert without planning (check local policy)
- Exit strategy: Hold for yield OR sell to HMO operator

Weaknesses:
- Management intensive (multiple tenants, higher turnover)
- Licensing required in some areas (check LPA HMO licensing)
- Article 4 directions restrict conversions in some zones
- Fire safety/building regs more stringent

Capital requirement:
- Acquisition: £150k-£400k
- Conversion: £50k-£100k (bedrooms, ensuites, fire doors, certification)
- Licensing/legals: £5k-£15k
- Total: £205k-£515k

Planning Check:
- Confirm no Article 4 direction for HMOs in area
- Check if area is "cumulative impact zone" (HMO saturation)
- Verify local HMO licensing requirements
- <7 occupants usually permitted development (sui generis not required)

Exit Strategy:
1. Hold for rental income (5-8% yield)
2. Sell to HMO portfolio investor (premium vs. C3)
3. Convert back to C3 if market changes
```

### Pattern 22B: Transport Hub HMO
```
Strategy: HMO conversion targeting young professionals near transport
Source: User strategy (Stage 2 addition)

Example SearchLand Query:
1. Existing Use Class: C3 (residential)
2. Title area (sqm): is greater than 120 AND less than 250
3. Distance to nearest Train Station: less than 500m
4. PTAL: 4, 5, 6a, or 6b (London only - OR use train station proxy)
5. Sales listing price: is less than £500,000
6. Freehold tenure

Indicators:
- C3 residential baseline
- 120-250 sqm (5-6 bedroom potential)
- <500m train station (commuter appeal)
- High PTAL or transport links
- Freehold preferred

Strategic Rationale:
- Young professional market (stable, higher income)
- Transport proximity = premium rents
- Lower management burden than student HMOs
- Strong capital appreciation in transport zones

Capital requirement:
- Acquisition: £250k-£500k
- Conversion: £60k-£120k
- Total: £310k-£620k
```

---

## 23. Unbroken Freehold Titles ⭐ NEW (Stage 2 - Gemini + Codex)

**Added based on Stage 2 peer review - both Gemini and Codex highlighted title assembly risk**

### Pattern 23A: Single-Title Large Parcels
```
Strategy: Target large development sites held as single freehold title (no assembly risk)
Source: SearchLand Preset #69 + reviewer insight
Proposed by: Gemini + Codex (Stage 2 consensus)

Example SearchLand Query:
1. Freehold tenure: Yes
2. Title area (acres): is greater than 2 AND less than 20
3. Less than 10% area developed (development potential)
4. Ownership type: Private owner OR Company (single negotiation)
5. NOT: Multiple ownerships on site (manual title check)
6. NOT: Ransom strips (manual diligence)

Indicators:
- Freehold: Full control, no lease complications
- Single title: Ideally one title number (check Land Registry)
- Large parcel: 2-20 acres (meaningful development)
- Low development: <10% built (greenfield/brownfield opportunity)
- Single owner: One negotiation vs. multiple landowners

Strategic Rationale:
- **Assembly Risk Elimination:** No ransom strips, access disputes, or holdouts
- **Planning Simplification:** Single title = simpler red line boundary
- **Negotiation Efficiency:** One owner, one deal, one legal process
- **Exit Certainty:** Clean title = easier to sell to housebuilder

Strengths:
- No title assembly complexity (major risk reduction)
- Single negotiation (faster, lower legal costs)
- Planning applications simpler (no multi-owner complications)
- Housebuilders pay premium for clean title

Weaknesses:
- Single large parcels rarer than fragmented sites
- Owner knows site value (less negotiation leverage)
- Higher capital requirement (buying entire parcel)

Capital requirement:
- Varies by site: £500k-£10M+ (often institutional)
- Option agreements possible: £50k-£200k (secure site, lower upfront)
- Consider JV with housebuilder (reduces capital requirement)

Due Diligence Critical:
1. **Title check:** Verify single title number (Land Registry search)
2. **Access:** Confirm no ransom strips or third-party access requirements
3. **Easements:** Check for restrictive covenants or utility easements
4. **Boundaries:** Verify no boundary disputes with neighbors
5. **Planning history:** Check for previous applications/refusals

Strategy:
1. Filter for large freehold parcels
2. Verify single title via Land Registry
3. Check access (no ransom strips)
4. Assess planning potential
5. Negotiate direct OR secure option
6. Exit to housebuilder with planning or at land stage
```

### Pattern 23B: No Lease Complications
```
Strategy: Freehold sites avoiding leasehold complexities
Source: User strategy (Stage 2 addition)

Example SearchLand Query:
1. Freehold tenure: Yes
2. NOT: Leasehold interests on site
3. NOT: Ground rent obligations
4. Title area (acres): is greater than 0.5
5. Ownership type: Private owner (direct negotiation)

Indicators:
- Pure freehold (no leasehold layers)
- No ground rent complications
- No lease expiry issues
- Direct ownership path

Strategic Rationale:
- Leasehold can complicate planning/development
- Freeholder consent often required
- Ground rent obligations reduce value
- Simpler exit to developers

Strengths: Clean ownership, lower legal costs, easier financing
Weaknesses: May miss some opportunities (some leaseholds are viable)
Capital requirement: Varies by site size
```

---

## Version History

### v2.1 (2025-11-20)
- **Stage 2 Peer Review:** Incorporated feedback from Gemini + Codex + Grok (3-LLM review)
- **Pattern 4 Enhanced:** Added concrete filter examples and "Example SearchLand Query" sections (addressed Codex's "limited use" critique)
- **Pattern 13 Elevated:** Added "HIGHEST ROI" callout with Grok's #1 ranking and "force multiplier" emphasis
- **2 New Patterns Added:**
  - Pattern 22: HMO Conversion Strategies (Gemini + Grok consensus)
  - Pattern 23: Unbroken Freehold Titles (Gemini + Codex consensus)
- **Structural Fixes:** Updated cross-references, clarified Pattern 9 sub-pattern attributions
- **System Scalability Validated:** 3-LLM review completed successfully with zero iteration needed

### v2.0 (2025-11-20)
- **Peer Review Integration:** Incorporated feedback from Gemini + Codex reviews
- **8 New Patterns Added:** Patterns 14-21 (Legacy Holdings, Portfolio Divestment, Brownfield Demolition, Micro-Infill Service Yards, Nutrient Neutrality, Digital Infrastructure, Brand Covenant Reposition, Community Asset)
- **Pattern 13 Relocated:** Moved to "Advanced Workflow" section (consensus: it's a workflow, not a filter pattern, but one of the highest ROI strategies)
- **Pattern 11 Merged:** Consolidated into Pattern 9 as sub-patterns C & D (consensus: eliminates redundancy with Pattern 9B)
- **Navigation Added:** Master Strategy Matrix + Collaborative Round Guide
- **Universal Enhancements:** All patterns now have preset references, concrete thresholds, cross-references

### v3.0 (2025-11-19)
- Initial creation for divergent hypothesis testing methodology
- 13 core pattern categories
- Strategy selection guide
- Anti-patterns section

---

**Last Updated:** 2025-11-20  
**System Version:** v2.1 (Stage 2: 3-LLM Peer Review - Gemini, Codex, Grok)  
**Status:** Validated by 4 LLMs total (Claude created, Gemini/Codex/Grok reviewed)  
**Next:** Apply in v5 multi-LLM workflow

