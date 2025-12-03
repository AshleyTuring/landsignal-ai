# SearchLand AI Implementation Learnings Database

**Purpose:** Universal, reusable knowledge about how SearchLand AI actually implements filters
**Scope:** Technical implementation details, NOT geography-specific results
**Status:** Living document - update after each project discovers new behaviors

---

## ⚠️ CRITICAL: List-Based Filter Operators (MOST COMMON ERROR)

**ISSUE:** LLMs frequently write invalid syntax for filters with predefined value lists (Use class, Property type, etc.)

### The Problem

SearchLand filters with **predefined value lists** (shown as checkboxes in UI) use specific operators:
- `contains any` (OR logic - matches if ANY value is present)
- `contains all` (AND logic - requires ALL values)
- `does not contain` (exclusion)
- `is equal to` (exact match)

**You CANNOT use boolean operators (`OR`, `AND`, `NOT`) within a single filter line.**

### ❌ INVALID Examples (DO NOT USE):

```
❌ Use class: contains 'E' OR Use class: contains 'Mixed'
   // SearchLand does not support OR operators within a filter line

❌ Use class: contains 'E' AND Use class: contains 'C3'
   // SearchLand does not support AND operators within a filter line

❌ Property type: 'Commercial' OR 'Residential'
   // Wrong syntax - no OR operators

❌ Use class: E AND C3
   // Wrong syntax - no AND operators
```

**Why This Fails:**
- SearchLand's AI prompt parser does not recognize `OR`/`AND`/`NOT` as operators
- It treats the entire string as a literal search term
- The filter will return zero results or unexpected matches

### ✅ CORRECT Examples:

```
✅ Use class: contains any [E - Commercial Business and Service, C3 - Dwellinghouses]
   // Correct: Multiple values in single filter with "contains any" operator
   // This matches properties with EITHER E OR C3 (implicit OR)

✅ Use class: contains all [E - Commercial Business and Service, C3 - Dwellinghouses]
   // Correct: Requires BOTH E AND C3 to be present (implicit AND)

✅ Use class: does not contain [B2 - General industrial]
   // Correct: Excludes properties with B2 use class

✅ Property type: contains any [Commercial, Mixed Use, Residential]
   // Correct: Matches any of these property types

✅ Tenure: is equal to [Freehold]
   // Correct: Exact match for single value
```

### List-Based Filters (Use operators above):
- **Use class** - Planning use classes (E, C3, B2, etc.)
- **Property type** - Commercial, Residential, Mixed Use, etc.
- **Property classification** - Separate taxonomy from Use class
- **Tenure** - Freehold, Leasehold, etc.
- **Ownership type** - Corporate, Individual, etc.
- **Any filter showing checkbox options in UI**

### Syntax Pattern:

```
[Filter name]: [operator] [comma-separated list of values in square brackets]
```

**Examples:**
```
Use class: contains any [E, C3, C4]
Property type: does not contain [Agricultural]
Tenure: is equal to [Freehold]
```

### Common Corrections:

| ❌ Incorrect | ✅ Correct |
|-------------|-----------|
| `Use class: contains 'E' OR 'C3'` | `Use class: contains any [E, C3]` |
| `Property type: 'Commercial' OR 'Mixed'` | `Property type: contains any [Commercial, Mixed Use]` |
| `Use class: NOT 'B2'` | `Use class: does not contain [B2]` |
| `Tenure: 'Freehold' OR 'Leasehold'` | `Tenure: contains any [Freehold, Leasehold]` |

---

## Filter Syntax & Boolean Logic

### ✅ What Works

**Text Search - AND Logic:**
```
Proposal: contains "mixed-use" AND "storey"
```
- SearchLand AI supports AND within a single text field
- Case-insensitive matching
- Partial word matching (e.g., "storey" matches "8-storey", "multi-storey")

**Numeric - Compound Ranges:**
```
Title area (acres): is greater than 0.2 AND less than 2
```
- Supports AND for numeric ranges in single filter line
- Creates inclusive lower bound, exclusive upper bound by default

**Enum - Multiple Selection:**
```
TFL Public Transport Accessibility Level (PTAL): is one of 4, 5, 6a, 6b
```
- Accepts comma-separated list for enum fields
- Must use exact values from dropdown (case-sensitive)

### ❌ What Doesn't Work

**OR Logic in Single Filter:**
```
❌ Building on title is derelict: is equal to Yes OR Building on title is inactive: is equal to Yes
```
- SearchLand AI does NOT support OR within a single filter line
- **Workaround:** Create separate filter groups with OR relationship at group level

**Boolean Operators in List-Based Filters:**
```
❌ Use class: contains 'E' OR Use class: contains 'C3'
❌ Property type: 'Commercial' OR 'Residential'
```
- List-based filters do NOT support `OR`, `AND`, `NOT` operators within a single filter line
- **Correct:** `Use class: contains any [E - Commercial Business and Service, C3 - Dwellinghouses]`
- Use `contains any` for OR logic, `contains all` for AND logic

**Non-existent Filters:**
```
❌ Planning Status: is equal to "Expired"
❌ Price reduced: is equal to Yes
❌ Listed for more than 12 months: is equal to Yes
```
- These filters do NOT exist in SearchLand (verified 2025-01-19)
- **Workarounds:** Use proxy combinations (see Filter Patterns section)

---

## Unit Conventions (CRITICAL)

### Area Measurements

**Title Area - ACRES ONLY:**
```
✅ Title area (acres): is greater than 0.2
❌ Title area (sqm): [DOES NOT EXIST]
```

**Building Areas - SQUARE FEET ONLY:**
```
✅ Developed area (sqft): is greater than 10000
❌ Developed area (sqm): [DOES NOT EXIST]
```

**Conversion Reference:**
```
1 acre = 43,560 sqft = 4,047 sqm
0.2 acres = 8,712 sqft = 809 sqm
0.5 acres = 21,780 sqft = 2,023 sqm
1 acre = 43,560 sqft = 4,047 sqm
2 acres = 87,120 sqft = 8,094 sqm

Common building sizes:
8,000 sqft = 743 sqm = 0.18 acres
10,000 sqft = 929 sqm = 0.23 acres
50,000 sqft = 4,645 sqm = 1.15 acres
100,000 sqft = 9,290 sqm = 2.30 acres
```

### Height & Distance - METRES

```
✅ Max building height on title (m): is greater than 15
✅ Distance to nearest Train Station (m): is less than 1000
```

**Height Reference:**
```
Typical storey height: 3-4m per storey
8-storey building: 24-32m (typically 25-30m to roof)
12m max height: ~3-4 storeys
15m max height: ~4-5 storeys
25m max height: ~7-9 storeys
```

---

## Filter Interpretation & Behavior

### "Building on title is inactive"
```
Includes:
- Derelict buildings
- Abandoned structures
- Not currently in use
- May include: Buildings under construction (varies)

Does NOT include:
- Occupied buildings with no recent activity
- Vacant land with no building
```

### "Applications in the last 5 years"
```
Behavior:
- Counts ALL application types (approved, refused, withdrawn, pending)
- Includes amendments to existing permissions
- "= 0" means ZERO applications (very restrictive)

Typical results by strictness:
- "= 0": Extremely restrictive (often 0-5 results per LPA)
- "< 3": Moderately restrictive
- "< 5": Broader search
```

### "Sales listing currently on the market"
```
Shows ONLY:
- Live Rightmove listings
- Current asking prices

Does NOT show:
- Off-market properties
- Withdrawn listings
- Expired listings
- Properties marketed on other platforms only

For off-market opportunities: Use "Latest sold date" filters instead
```

### "Proposal" Text Search
```
Behavior:
- Searches planning application proposal descriptions
- Partial matching (e.g., "mixed" matches "mixed-use")
- Case-insensitive
- Matches across entire proposal text

Best practices:
- Use specific keywords: "storey", "mixed-use", "residential"
- Avoid overly generic terms: "development", "construction"
- Combine multiple keywords with AND for precision
```

### "Latest sold date" vs "Sales listing price"
```
"Latest sold date": 
- Historical transaction data
- Includes off-market sales
- Good proxy for corporate ownership length

"Sales listing price":
- Current market listings ONLY
- Requires "Sales listing currently on the market: is equal to Yes"
- Excludes off-market opportunities
```

### "Ownership type: Company"
```
Behavior:
- Identifies corporate ownership
- Excludes individual/personal ownership
- Good indicator for:
  - Institutional sellers
  - Portfolio divestment opportunities
  - Potentially motivated sellers (if held long-term)
```

### "Company status" ⚠️ STRONG MOTIVATION SIGNAL
```
Discovered: 2025-11-19 (User: ashsubband)

Available values include:
- Active (normal trading company)
- Liquidation ⚠️ VERY STRONG motivation signal
- Dissolved
- In Administration
- [Other statuses - see SearchLand dropdown]

CRITICAL INSIGHT:
"Company status: is one of Liquidation" = FORCED SALE scenario
- Company legally obligated to sell assets
- Liquidator motivated to complete quickly
- Often discounted pricing
- Strong negotiating position for buyer

Usage Example:
1. Ownership type: is equal to Company
2. Company status: is one of Liquidation
3. [Additional filters for property type/size]

Performance:
- Highly targeted (few results)
- Very strong motivation signal (forced sale)
- Excellent for negotiating favorable terms

Combine with:
- Derelict/inactive buildings (double motivation)
- Long hold period (non-core asset)
- Price caps (realistic expectations)

Related: See FILTER_PATTERNS.md → Pattern 2D (Liquidation/Administration Sales)
```

---

## Motivation Signals (from SearchLand Presets Analysis)

### "HMO License Expiry Date" ⚠️ REGULATION-DRIVEN MOTIVATION
```
Discovered: 2025-11-19 (Source: Presets #12, #35, #47)

REGULATION = FORCED ACTION:
- Expired HMO license = illegal to operate
- Owner must: Renew (expensive £1k-£3k + compliance) OR Sell (motivated)
- Renewal requires: Safety certs, planning compliance, local authority approval
- Some areas have Article 4 restrictions (can't renew)

Usage Examples:
Preset #12: HMO Expired Licenses
1. Currently has HMO: Yes
2. HMO License Expiry Date: before [current date]
3. Freehold tenure

Preset #47: HMO Opportunities (conversion)
1. 8-12 habitable rooms
2. C3 dwellinghouses only
3. Latest sold date: before [10+ years ago]
4. Low EPC (motivation signal)

Performance:
- Highly targeted (few properties per LPA)
- Strong motivation (cannot operate legally)
- Time-sensitive (expiry creates urgency)

Combine with:
- Low EPC (needs work anyway)
- Long hold period (tired landlord)
- NOT Article 4 (can renew if they want)

Related: FILTER_PATTERNS.md → Pattern 8A (Regulation-Driven)
```

### "Lease end date" ⚠️ CASH FLOW ENDING = MOTIVATION
```
Discovered: 2025-11-19 (Source: Presets #17, #41, #46, #66, #68, #78)

INCOME CLIFF = SELLER MOTIVATION:
- Lease expiring = no rental income soon
- Owner must: Find new tenant OR Sell
- Shorter timeline = stronger motivation (6-12 months most motivated)

Usage Examples:
Preset #17: Commercial Expiring Leases
1. B2/B8/E use class
2. Lease end date: before 31/12/2026
3. Last application: before 01/09/2020 (stale property)

Preset #46: High Footfall Retail Expiring
1. Lease end date: 30/09/2025 to 30/09/2026 (1 year window)
2. 6,000+ daily footfall (prime location)
3. E(a) retail

Preset #68: Offices No C3 No Lease
1. E(g)(i) offices
2. NOT C3 (can convert)
3. Lease ended OR no leaseholds (vacant)

Performance:
- Moderate targeting (varies by market)
- Timing matters (6-12 months optimal)
- Vacant = strongest signal (already no income)

Combine with:
- Long hold period (owner wants out)
- Low EPC (needs refurb)
- Stale planning (no recent activity)

Related: FILTER_PATTERNS.md → Pattern 8B (Lease Expiry Opportunities)
```

### "EPC rating" (Low) ⚠️ IMPROVEMENT/REGULATION MOTIVATION
```
Discovered: 2025-11-19 (Source: Presets #2, #20, #36, #47, #67, #69)

LOW EPC = FORCED INVESTMENT OR SALE:
- EPC E-G = below regulations (private rented: min E from 2020)
- Cannot legally rent until improved
- Improvement costs: £5k-£50k depending on property
- Owner must: Spend money OR Sell

Usage Examples:
Preset #2: Run Down Homes
1. EPC: G, E, F, D
2. C3 dwellinghouses only
3. Less than 30% developed (land value)
4. Detached (more improvement potential)

Preset #20: Unsold Poor EPC
1. EPC: E, F, G
2. Latest sold date: before 01/07/2004 (20+ year hold!)
3. Private owner

Preset #36: ECO4 Solar Install
1. EPC: E, F, G
2. 5+ addresses (multi-unit)
3. Private owner (eligible for ECO4 grants)

Preset #67: Offices Low EPC
1. EPC: D, E, F, G
2. E commercial use
3. Office type

Performance:
- Very broad (many properties)
- Must combine with other signals
- G/F = strongest motivation (cannot rent)

Combine with:
- Long hold period
- No recent sales
- Private owner (not professional landlord)

Insight: E-G for rental = illegal, D = borderline, improvement required

Related: FILTER_PATTERNS.md → Pattern 8C (EPC Compliance Opportunities)
```

### "No latest sold date" ⚠️ NEVER SOLD = VERY LONG HOLD
```
Discovered: 2025-11-19 (Source: Presets #18, #69)

NEVER SOLD = INHERITED/LEGACY HOLDING:
- Property never transacted in Land Registry records
- Likely: Inherited, family land, very old ownership
- Motivation: Non-professional owner, may not know value, estate planning

Usage Examples:
Preset #18: Edge of Settlement
1. No latest sold date
2. Private owner
3. Edge of settlement (land promotion opportunity)
4. Less than 1 application in 5 years (no activity)

Preset #69: Older Houses Outdoor Space
1. No latest sold date
2. Less than 1 application in 5 years
3. Private owner
4. Low EPC (E, F, G)
5. 1,000-4,500 sqmt (large plot)

Performance:
- Rare signal (only pre-LR computerization or inheritance)
- Very strong for land opportunities
- Often unexpected motivation (estate planning, downsizing)

Combine with:
- Low activity (no planning apps)
- Edge of settlement (promotion opportunity)
- Large plot (infill potential)
- Private owner (not professional)

Insight: These are "hidden gems" - owners may not be actively marketing

Related: FILTER_PATTERNS.md → Pattern 2E (Never-Sold Legacy Holdings)
```

### "Less than 1 application in last 5 years" ⚠️ NO ACTIVITY = STALE
```
Discovered: 2025-11-19 (Source: Presets #18, #29, #47, #69, #77)

NO PLANNING ACTIVITY = STALE/PASSIVE OWNER:
- No planning applications for 5+ years
- Owner not actively developing
- May indicate: Tired landlord, passive holding, wants out

Usage Examples:
Preset #29: Car Parks
1. Less than 1 application in last 5 years
2. Car park use class
3. Less than 5% developed

Preset #77: Shops with Tops
1. Less than 1 application in last 5 years
2. E/E(a)/E(b) commercial ground floor
3. 6m+ building height (airspace potential)

Performance:
- Broad filter (many properties)
- Must combine with other signals
- Indicates passive/unmotivated owner (not developer)

Combine with:
- Long hold period
- Low EPC
- Expired leases
- No recent sales

Opposite: "Applications in last 5 years > 3" = ACTIVE developer (less motivated to sell)

Related: FILTER_PATTERNS.md → Pattern 2F (Stale/Passive Holdings)
```

### "Hardstanding percentage" ⚠️ PROXY FOR "PREVIOUSLY DEVELOPED"
```
Discovered: 2025-11-19 (Source: Presets #7, #15, #37, #43, #44, #61)

HARDSTANDING = BROWNFIELD/GREY BELT EXCEPTION:
- Hard surfaces: Concrete, asphalt, paving
- >10-30% hardstanding = "previously developed land"
- Green Belt exception: Previously developed can be redeveloped
- Planning easier on brownfield than greenfield

Usage Examples:
Preset #7: Grey Belt
1. 25%+ area developed
2. 10%+ hardstanding
3. Green Belt location
4. Within 100m built-up area
→ Exception: Previously developed in Green Belt

Preset #15: Brownfield Industrial
1. 30%+ hardstanding
2. <10% developed (building demolished but base remains)
3. Industrial use

Preset #61: EV Charger Multi-Address
1. 40%+ hardstanding (car parks/driveways)
2. 75+ addresses (flats)

Performance:
- Clever workaround for Green Belt
- Indicates previous use (less "green" objection)
- Often cheaper than pure greenfield

Thresholds:
- 10% = Minimal (edge case)
- 25-30% = Clear previously developed status
- 40%+ = Significant infrastructure (car parks)

Combine with:
- Green Belt location
- Proximity to built-up area
- Low/no building (demolished but base remains)

Related: FILTER_PATTERNS.md → Pattern 9A (Grey Belt Workarounds)
```

### "Agricultural Land Grade" 💡 ENERGY PROJECT SUITABILITY
```
Discovered: 2025-11-19 (Source: Presets #14, #39, #51, #52, #56, #81)

AGRICULTURAL GRADE = ENERGY PROJECT VIABILITY:
- Grade 1-2: Best & Most Versatile (BMV) - avoid (planning objection)
- Grade 3a: BMV - marginal (avoid if possible)
- Grade 3b, 4, 5: Lower quality - PREFERRED for solar/wind
- Non-agricultural/Urban: Also acceptable

Usage Examples:
Preset #14: Solar Ground Mount
1. Agricultural Grade 3/3a/3b/4 (note: excludes Grade 1-2)
2. 40,000+ sqmt (10 acres)
3. Within 2km green rated substation

Preset #39: Nutrient Neutrality Farmland
1. NOT Grade 1 or 2 (avoids BMV objection)
2. 80,000+ sqmt (20 acres)
3. Cereal crops (easy to work with)
4. Nutrient neutrality area (special opportunity)

Performance:
- Grade 3b/4 = optimal for energy projects
- Grade 1-2 = planning refusal risk
- Grade 3a = borderline (case-by-case)

Insight: Solar/wind planners specifically target Grade 3b/4 to avoid BMV objections

Combine with:
- Proximity to substation (< 2km)
- Large acreage (40,000+ sqmt for solar)
- Flat terrain (solar preferred)
- Away from residential (wind)

Related: FILTER_PATTERNS.md → Pattern 10A (Renewable Energy Land)
```

### "SHLAA Status" 💡 STRATEGIC LAND INDICATOR
```
Discovered: 2025-11-19 (Source: Presets #38, #43, #85)

SHLAA = Strategic Housing Land Availability Assessment:
- Positive/Neutral = Local authority identified as developable
- Negative = Identified but rejected
- No SHLAA = Not assessed (hidden opportunity OR too constrained)

Usage Examples:
Preset #38: Emerging Sites No Planning
1. Housing allocation (emerging) - IN LOCAL PLAN
2. <1 max dwellings applied for (no planning yet)
3. 4,000-40,000 sqmt (1-10 acres)
→ Strategy: Get planning before allocation adopted (first mover)

Preset #85: Un-Allocated No SHLAA 1-10 Acres
1. NOT positive/neutral/negative SHLAA (not assessed)
2. NOT allocated (any type)
3. Within 50m settlement boundary
→ Strategy: Promote to local authority (no one else looking)

Performance:
- SHLAA positive = easier planning (authority support)
- No SHLAA + edge of settlement = promotion opportunity
- Negative SHLAA = understand WHY before pursuing

Strategic Insight:
- Un-assessed sites near settlements = hidden gems
- Emerging allocations = get planning before competition

Combine with:
- Edge of settlement proximity
- No recent planning applications
- Private ownership (easier to deal)

Related: FILTER_PATTERNS.md → Pattern 11A (Strategic Land Promotion)
```

### "SIC Codes" 💡 INDUSTRY TARGETING
```
Discovered: 2025-11-19 (Source: Presets #71, #73, #83)

SIC = Standard Industrial Classification:
- UK company registration codes
- Target specific industries for outreach
- Solar/energy particularly effective

Usage Examples:
Preset #71: Paper Manufacturers (Solar Outreach)
1. SIC codes: 18110, 58130, 58110, etc. (paper/printing)
2. 5,000+ sqmt
3. Freehold, no leaseholds
→ Large roofs, high energy use, solar saves money

Preset #73: Poultry Farms (Solar Outreach)
1. SIC codes: 01470 (poultry), 10130, 10120 (processing)
2. Private/company ownership
→ Large barns, steady energy demand

Preset #83: Manufacturing Owner-Occupier (Solar)
1. Extensive list of manufacturing SIC codes
2. B2/E(g)(iii) use class
3. 0 leaseholds (owner-occupied)
→ High energy users, own roof space

Performance:
- Highly targeted industry outreach
- Solar: Target high-energy users with large roofs
- Owner-occupied = decision maker accessible

Strategic Insight:
- Manufacturing = high energy bills = solar ROI compelling
- Owner-occupied (no leaseholds) = easier than landlord/tenant

Target Industries for Solar:
- Paper/printing (high energy)
- Poultry (continuous heating)
- Manufacturing (machinery)
- Warehousing (large roofs)

Combine with:
- Flat roofs (easier solar install)
- Freehold, no leases (owner control)
- Large buildings (economies of scale)

Related: FILTER_PATTERNS.md → Pattern 10B (Industry-Targeted Solar)
```

### "Footfall / Vehicle Count" 💡 COMMERCIAL VIABILITY
```
Discovered: 2025-11-19 (Source: Presets #27, #46, #54, #58, #72, #84)

TRAFFIC = COMMERCIAL REVENUE POTENTIAL:
- High footfall = retail viability
- High vehicle count = drive-thru, petrol station, EV charger viability
- Quantified thresholds from presets

Usage Examples:
Preset #27: Cafe & Restaurant Sites
1. 800+ average daily footfall
2. E(a) retail display use
3. 325+ sqmt

Preset #46: High Footfall Retail Expiring Leases
1. 6,000+ average daily footfall (very high)
2. Lease expiring (motivation)
→ Prime location, landlord motivated

Preset #54: EV Charging Sites
1. 10,000+ average daily vehicle count
2. Within 400m A road
3. Within 5km green rated substation

Preset #72: Petrol Station Sites
1. 10,000+ average daily vehicle count
2. 15,000-60,000 sqmt
3. Aged 25-64 demographics

Performance Thresholds:
- 800+ footfall = viable for cafe
- 6,000+ footfall = prime retail
- 10,000+ vehicles = viable for petrol/EV/drive-thru

Strategic Insight:
- Traffic counts validate commercial viability
- Higher = higher rents/profits possible
- Essential for drive-thru, petrol, EV chargers

Combine with:
- Proximity to major roads
- Commercial use class
- Expiring leases (motivation)
- EV: Proximity to substation

Related: FILTER_PATTERNS.md → Pattern 12A (Traffic-Dependent Commercial)
```

### "Distance to Substation" 💡 ENERGY PROJECT CRITICAL
```
Discovered: 2025-11-19 (Source: Presets #14, #51, #52, #53, #54, #55, #56, #81, #84)

SUBSTATION PROXIMITY = GRID CONNECTION VIABILITY:
- Green rated = capacity available (preferred)
- Amber/Red rated = constrained (avoid or expensive)
- Distance thresholds vary by project type

Usage Examples:
Preset #14: Solar Ground Mount
1. Within 2,000m (2km) green rated substation
2. 40,000+ sqmt land
3. Agricultural Grade 3b/4

Preset #51: BESS (Battery Storage)
1. Within 2,000m green rated substation
2. 20,000-400,000 sqmt

Preset #55: Hydrogen Sites
1. Within 200m of substation (very close!)
2. 8,000-20,000 sqmt
3. Away from sensitive uses (500m+ from schools/hospitals)

Preset #53: Data Centers
1. Within 2,000m substation
2. 60,000+ sqmt
3. Flat terrain

Distance Thresholds by Use:
- Solar/Wind/BESS: <2,000m (2km) acceptable
- Hydrogen: <200m (very close - high power demand)
- EV Chargers: <5,000m (5km) workable
- Data Centers: <2,000m

Insight: "Green rated" substation filter exists and is CRITICAL
- Green = capacity available now
- Connection costs increase exponentially with distance

Combine with:
- Large acreage (energy projects)
- Flat terrain (solar preferred)
- Agricultural Grade 3b/4 (avoid planning objections)
- Away from residential (wind, hydrogen)

Related: FILTER_PATTERNS.md → Pattern 10 (Renewable Energy Opportunities)
```

---

## Date Format Standards

### Accepted Format
```
✅ YYYY-MM-DD (e.g., 2023-01-19)
❌ DD/MM/YYYY
❌ MM/DD/YYYY
```

### Date Operators
```
✅ is before 2023-01-19
✅ is after 2020-01-01
✅ is between 2020-01-01 and 2023-01-01
```

---

## Common Pitfalls & Solutions

### Pitfall #1: Over-Constraining Filters
```
Problem:
- Combining many restrictive filters compounds to zero results
- Example: "Applications = 0" AND "Price < £200k" AND "Inactive" AND "On market"

Solution:
- Test filters incrementally
- Start broad, narrow iteratively
- Consider multiple strategies vs one perfect filter
```

### Pitfall #2: Assuming Unit Availability
```
Problem:
- Assuming sqm filters exist (they don't)
- Using wrong units causes filter failure

Solution:
- ALWAYS check AvailableFiltersInSearchLand_ACTUAL.md
- Use conversion reference above
- Default to acres/sqft/metres
```

### Pitfall #3: Non-Existent Filters
```
Problem:
- Using "Planning Status: Expired" (doesn't exist)
- Using "Price reduced" (doesn't exist)
- Using "Listed >12 months" (doesn't exist)

Solution:
- Use proxy filter combinations
- See FILTER_PATTERNS.md for proven workarounds
```

### Pitfall #4: Misunderstanding PTAL Geography
```
Problem:
- PTAL (Public Transport Accessibility Level) only covers London/TfL area
- Filter returns 0 results outside London

Solution:
- Only use PTAL for London-based searches
- For UK-wide: Use "Distance to nearest Train Station" instead
```

---

## Proxy Filter Strategies

### Expired Planning Permission (No Direct Filter)
```
Proxy Combination:
1. Last application submitted: is before [3+ years ago]
2. Applications in the last 5 years: is less than 3
3. Max number of dwellings applied for: is greater than 0
4. Building on title is inactive: is equal to Yes

Rationale: Targets sites with old planning, no recent activity, inactive status
```

### Motivated Seller (No Direct Filter)
```
Proxy Combination:
1. Latest sold date: is before [5+ years ago] (long hold period)
2. Ownership type: is equal to Company (institutional)
3. Building on title is derelict: is equal to Yes (asset write-down)
4. Sales listing currently on the market: is equal to Yes (active sale)

Rationale: Corporate holding derelict asset for 5+ years likely motivated
```

### Long-Listed Property (No "Listed >12 months" Filter)
```
Proxy Combination:
Not directly achievable in SearchLand
Requires: Manual screening of "Sales listing currently on the market"
Workaround: Use broad filters, export results, screen externally
```

---

## Filter Performance Observations

### Highly Restrictive Filters (Often 0-10 results)
- `Applications in the last 5 years: is equal to 0`
- `Sales listing price: is less than 200000` (UK-wide)
- `Building on title is derelict: is equal to Yes` (combined with price caps)

### Moderately Selective (10-100 results)
- `PTAL: is one of 4, 5, 6a, 6b` (London only)
- `Latest sold date: is before 2020-01-19`
- `Title area (acres): is greater than 0.25 AND less than 2`

### Broad Filters (100+ results)
- `Proposal: contains "mixed-use"`
- `Max building height on title (m): is less than 12`
- `Distance to nearest Train Station (m): is less than 1000`

**Note:** These are general observations. Actual results vary significantly by LPA/geography.

---

## SearchLand AI Parsing Quirks

### Multiple AND Conditions
```
✅ Works: "Title area (acres): is greater than 0.2 AND less than 2"
✅ Works: "Proposal: contains 'mixed' AND 'storey'"
❌ Limited: Cannot chain 3+ AND conditions reliably
```

### Whitespace & Special Characters
```
✅ Handles: Quotes in text search ("mixed-use")
⚠️ Sensitive: Extra whitespace may affect parsing
❌ Avoid: Special regex characters (*, ?, [, ])
```

### Filter Ordering
```
Observation: Filter order doesn't affect results
Best practice: Order logically (most selective first) for readability
```

---

## Version History

### v3.0 (2025-11-19)
- Initial creation with divergent hypothesis testing methodology
- Captured learnings from MixedUse-8Storey-2M projects (v1, v2)
- Documented "Applications in last 5 years = 0" restrictiveness
- Added unit conversion reference
- Documented OR logic limitations

---

## Contributing Guidelines

### ⚠️ THIS IS A LIVING DOCUMENT - UPDATE IT!

**Philosophy:** LEARNINGS_DATABASE.md is **NOT fixed** - it's **cumulative and adaptive**. Every project should add to it.

### When to add entries:

**MUST ADD:**
- ✅ Discovered new SearchLand AI parsing behavior
- ✅ Found filter syntax that works/doesn't work  
- ✅ Identified implementation quirks
- ✅ Discovered new unit conventions
- ✅ Found new motivation signals (e.g., "Company status: Liquidation")
- ✅ Discovered filter value options not previously documented

**When NOT to add entries:**
- ❌ Geography-specific result counts (e.g., "10 results in Slough")
- ❌ Project-specific strategies (goes in FILTER_PATTERNS.md instead)
- ❌ User preferences (goes in project requirements)

### How to Contribute (3 Methods):

**Method 1: During Stage 4 (Learning Capture)**
After parallel testing, review results for universal insights:
1. Did any filter behave unexpectedly?
2. Did we discover new filter values/options?
3. Did we find new motivation signals?
4. Did syntax work differently than documented?

If YES → Update this file immediately

**Method 2: Ad-Hoc Discovery (Like Today!)**
When you discover something useful while exploring SearchLand:
1. Document it in this file under appropriate section
2. Note date discovered and who found it
3. Add example filter usage
4. Link to related FILTER_PATTERNS.md if applicable

**Method 3: User Feedback**
When testing reveals reality differs from documentation:
1. Update incorrect entries
2. Add new sections for missing information
3. Mark outdated info with ⚠️ or remove it

### Format for New Entries:

```markdown
### "Filter Name" ⚠️ OPTIONAL: Flag if critical/new
```
Discovered: YYYY-MM-DD (Source: Project/User name)

Behavior/Insight:
- [What was discovered]
- [Why it matters]
- [How to use it]

Example:
1. [Exact filter usage]

Performance/Notes:
- [Any observations]
```
Related: [Link to FILTER_PATTERNS.md if applicable]
```

### Recent Contributions:

**2025-11-19:**
- ✅ "Company status: Liquidation" as strong motivation signal (User: ashsubband)
  - Added to LEARNINGS_DATABASE (line 192)
  - Added Pattern 2D to FILTER_PATTERNS.md
  - Discovered via real SearchLand exploration

**2025-11-19 (System v3.0 launch):**
- ✅ Initial database population from MixedUse-8Storey-2M projects (v1, v2)
- ✅ "Applications in last 5 years = 0" too restrictive
- ✅ PTAL London-only limitation
- ✅ Unit conversions (acres/sqft not sqm)

---

## Newly Documented Filters (v5.2.3)

### Property Type

**Context:**
- Simple residential/commercial classification (different from "Property classification")
- Only 5 values: Detached, Semi-Detached, Terraced, Flat, Commercial
- Used for basic property type filtering

**Operators:** `contains all`, `contains any`, `does not contain`

**✅ Correct Examples:**
```
Property type: contains any [Detached, Semi-Detached]
Property type: contains all [Commercial, Flat]  // Mixed-use commercial flats
Property type: does not contain [Terraced]
```

**❌ Incorrect Examples:**
```
❌ Property type: 'Commercial' OR 'Residential'
❌ Property type: Detached AND Semi-Detached
```

**Performance/Notes:**
- Fast filter - indexed field
- Do NOT confuse with "Property classification" (which has 500+ values)

---

### Tenure

**Context:**
- Legal ownership structure
- 5 values: Leasehold, Freehold, Pending first registration, Caution against first registration, Rentcharge
- Critical for acquisition strategy (Freehold = full ownership, Leasehold = time-limited)

**Operator:** `is one of` (implicit OR)

**✅ Correct Examples:**
```
Tenure: is one of [Freehold]
Tenure: is one of [Leasehold, Freehold]
Tenure: is one of [Pending first registration]  // Unregistered land - potential opportunity
```

**❌ Incorrect Examples:**
```
❌ Tenure: 'Freehold' OR 'Leasehold'
❌ Tenure: NOT 'Leasehold'
```

**Strategic Use Cases:**
- **Freehold only:** For long-term hold/development (no ground rent complications)
- **Leasehold:** Can indicate motivated sellers (especially short leases <80 years)
- **Pending first registration:** Unregistered land - may have title issues but also opportunities

**Performance/Notes:**
- Fast filter - indexed field
- Combine with "Lease end date" for leasehold properties to find short leases

---

### Property Classification

**Context:**
- Comprehensive taxonomy with ~500+ values across 24 major categories
- Separate from "Use class" (planning) - this is Ordnance Survey classification
- Hierarchical: Commercial > Hotel/Motel > Youth Hostel (example)
- **CRITICAL:** Do NOT mix with "Use class" values

**Operators:** `contains any`, `contains all`, `does not contain`, `exactly matches`

**Major Categories:**
- Commercial, Education, Hotel/Motel, Industrial, Leisure, Medical, Animal Centre, Office, Broadcasting, Retail, Storage Land, Transport, Utility, Emergency/Rescue, Information, Land, Water, Military, Other, Parent Shell, Residential, Unclassified, Dual Use, Object of Interest

**✅ Correct Examples:**
```
Property classification: contains any [Commercial, Residential]
Property classification: contains all [Development Site, Residential Construction Site]
Property classification: does not contain [Military, Prison]
Property classification: exactly matches [Hotel/Motel]
Property classification: contains any [Vacant / Derelict Land, Development Site]  // Opportunity sites
```

**❌ Incorrect Examples:**
```
❌ Property classification: 'Commercial' OR 'Residential'
❌ Property classification: contains any [E - Commercial Business and Service]  // WRONG - that's Use class, not classification
❌ Property classification: Development Site AND Residential  // Use 'contains all' instead
```

**Strategic Use Cases:**
- **Development Site:** Active construction - may indicate market activity
- **Vacant / Derelict Land:** Potential redevelopment opportunities
- **Care / Nursing Home:** For care home conversion strategies
- **Hotel/Motel:** For hotel-to-residential conversions
- **Warehouse / Store / Storage Depot:** For industrial-to-residential conversions

**Performance/Notes:**
- Slower filter due to large value set - use strategically
- More granular than "Property type" but less planning-specific than "Use class"
- Can combine with "Use class" for precision (e.g., Classification: Hotel + Use class: C3 for converted hotels)

---

### PTAL (Public Transport Accessibility Level)

**Context:**
- London-specific metric (Transport for London)
- 9 values: 0 (Worst), 1a, 1b, 2, 3, 4, 5, 6a, 6b (Best)
- Higher = better public transport access = higher land values + planning support for density
- **CRITICAL:** Only available in London - will return zero results elsewhere

**Operators:** `contains any`, `contains all`, `does not contain`, `exactly matches`

**✅ Correct Examples:**
```
PTAL: contains any [6a, 6b (Best)]  // Excellent transport - supports tall buildings
PTAL: contains any [4, 5, 6a, 6b (Best)]  // Good to excellent
PTAL: does not contain [0 (Worst), 1a, 1b]  // Exclude poor transport areas
PTAL: exactly matches [6b (Best)]  // Only the very best
```

**❌ Incorrect Examples:**
```
❌ PTAL: '6a' OR '6b'
❌ PTAL: is greater than 4  // Not a numeric filter - use 'contains any' with list
❌ PTAL: High  // Must use exact values (0, 1a, 1b, 2, 3, 4, 5, 6a, 6b)
```

**Strategic Use Cases:**
- **High-density development:** PTAL 4+ supports planning for tall buildings
- **Residential demand:** PTAL 5+ = premium pricing for car-free living
- **Planning policy:** Many London boroughs require PTAL 3+ for car-free developments
- **Opportunity:** PTAL 2-3 areas with planned transport improvements (check TfL plans)

**Performance/Notes:**
- Fast filter - indexed field
- **London only** - always combine with London geography filters
- Use with "Distance to nearest Train Station" for non-London areas
- PTAL ratings can change - check TfL website for planned improvements

**Related Filters:**
- Distance to nearest Train Station (m) - for non-London areas
- Distance to nearest Bus Stop (m)
- Distance to nearest Rapid Transit Stop/Station (m)

---

### Planning Constraints

**Context:**
- 34 constraint types covering environmental, heritage, policy, and flood risk
- Critical for assessing development viability
- Some are absolute blockers (Green Belt, SSSI), others provide policy support (Housing Zones)
- **IMPORTANT:** "Built up areas" is POSITIVE (urban context), not a constraint to avoid

**Operators:** `contains any`, `contains all`, `does not contain`

**Available Values:** (34 constraints)
- **Absolute Blockers:** Green Belt, Conservation Area, Listed Building(s) in plot, SSSI, Ancient Woodland, World heritage sites, Scheduled Monuments, National Parks, National Landscapes (AONB)
- **Flood Risk:** Flood Zone 2 (negotiable), Flood Zone 3 (major blocker)
- **Policy Support (SEEK):** Housing Zones, Opportunity Areas, Areas Of Intensification, Site Allocations, Built up areas
- **Heritage:** Listed Building(s) 50m Buffer (less restrictive), Parks and Gardens, Battlefields
- **Environmental:** SAC, SPA, RAMSAR, National Nature Reserves, Local Nature Reserves, Country Parks, CROW
- **Urban Planning:** Central Activities Zone (London), SIL, LSIS, Town Center Boundaries, Designated Open Space
- **Other:** Tree Preservation Order (TPO), Nutrient Neutrality

**✅ Correct Examples:**
```
Planning constraints: does not contain [Green Belt, Conservation Area, Flood Zone 3]  // Avoid major blockers
Planning constraints: contains any [Housing Zones, Opportunity Areas]  // Seek policy support
Planning constraints: does not contain [SSSI, Ancient Woodland, Listed Building(s) in plot]  // Exclude protected sites
Planning constraints: contains all [Housing Zones, Built up areas]  // Urban housing policy areas
Planning constraints: does not contain [Green Belt]  // Exclude Green Belt only
Planning constraints: contains any [Site Allocations]  // Sites allocated for development in local plan
```

**❌ Incorrect Examples:**
```
❌ Planning constraints: NOT 'Green Belt'
❌ Planning constraints: 'Green Belt' OR 'Conservation Area'
❌ Planning constraints: does not contain [Built up areas]  // WRONG - Built up areas is GOOD!
```

**Strategic Use Cases:**

1. **Urban Brownfield Opportunities:**
   ```
   Planning constraints: contains all [Built up areas, Housing Zones]
   Planning constraints: does not contain [Green Belt, Conservation Area]
   ```

2. **High-Density Development (London):**
   ```
   Planning constraints: contains any [Central Activities Zone, Opportunity Areas]
   Planning constraints: does not contain [Conservation Area, Listed Building(s) in plot]
   PTAL: contains any [5, 6a, 6b (Best)]
   ```

3. **Avoid All Major Blockers:**
   ```
   Planning constraints: does not contain [Green Belt, Conservation Area, Flood Zone 3, SSSI, Ancient Woodland, Listed Building(s) in plot]
   ```

4. **Industrial Conversion Opportunities:**
   ```
   Planning constraints: contains any [SIL, LSIS]  // Strategic/Locally Significant Industrial - may be released
   Planning constraints: does not contain [Green Belt]
   ```

5. **Flood Risk Mitigation Strategy:**
   ```
   Planning constraints: does not contain [Flood Zone 3]  // Exclude high risk
   Planning constraints: contains any [Flood Zone 2]  // Accept Zone 2 (mitigation possible)
   ```

**Performance/Notes:**
- Fast filter - indexed field
- Use "Percentage of plot un-constrained" to find sites with minimal coverage (e.g., >80%)
- **Critical distinction:** "Built up areas" = urban context (GOOD), NOT a development blocker
- Green Belt = ~13% of England - major constraint but some brownfield exceptions exist
- Conservation Areas = ~2% of England - design restrictions, not necessarily a blocker
- Flood Zone 3 = high risk - insurance issues, planning refusal likely
- Flood Zone 2 = medium risk - mitigation measures required but achievable

**Related Filters:**
- Percentage of plot un-constrained (%) - Find sites with <20% constraint coverage
- Area of plot un-constrained (acres) - Absolute unconstrained area
- Percentage of title covered by Green Belt - Partial coverage may be workable
- Percentage of title covered by Flood Zone 2/3 - Assess flood risk extent

**Common Combinations:**
```
# Clean sites for quick planning
Planning constraints: does not contain [Green Belt, Conservation Area]
Percentage of plot un-constrained: is greater than 80

# Policy-supported urban sites
Planning constraints: contains all [Built up areas, Housing Zones]
Planning constraints: does not contain [Conservation Area]

# Heritage-adjacent (not on-site)
Planning constraints: contains any [Listed Building(s) 50m Buffer]
Planning constraints: does not contain [Listed Building(s) in plot]  // Near but not on
```

---

### Building Use Group

**Context:**
- High-level functional classification - 17 categories
- Less granular than "Use class" (planning), more functional than "Property type"
- Good for broad filtering before applying detailed "Use class" filters
- "Mixed Use" is explicitly listed as a category (unlike in Property type)

**Operators:** `contains any`, `contains all`, `does not contain`

**Available Values:** (17 categories)
- **Commercial:** Commercial Activity: Retail, Commercial Activity: Logistics Or Manufacturing, Commercial Activity: Other
- **Residential:** Residential Accommodation, Temporary Or Holiday Accommodation
- **Public Services:** Education, Government Services, Medical or Emergency Services
- **Infrastructure:** Transport, Utility Or Environmental Protection, Construction
- **Other:** Agriculture Or Aquaculture, Attraction Sports or Activity, Religious Worship and Funeral Services, Mixed Use, Unknown

**✅ Correct Examples:**
```
Building use group: contains any [Mixed Use, Commercial Activity: Other]
Building use group: does not contain [Agriculture Or Aquaculture, Utility Or Environmental Protection]
Building use group: contains any [Residential Accommodation, Temporary Or Holiday Accommodation]  // All residential types
Building use group: contains any [Commercial Activity: Retail]  // Retail focus
Building use group: does not contain [Unknown]  // Exclude unclear properties
```

**❌ Incorrect Examples:**
```
❌ Building use group: 'Mixed Use' OR 'Commercial'
❌ Building use group: NOT 'Agriculture'
❌ Building use group: contains any [C3, E]  // WRONG - those are Use class values, not Building use group
```

**Strategic Use Cases:**

1. **Broad Commercial Search:**
   ```
   Building use group: contains any [Commercial Activity: Retail, Commercial Activity: Other, Commercial Activity: Logistics Or Manufacturing]
   ```

2. **Exclude Non-Development Sites:**
   ```
   Building use group: does not contain [Agriculture Or Aquaculture, Utility Or Environmental Protection, Unknown]
   ```

3. **Mixed-Use Opportunities:**
   ```
   Building use group: contains any [Mixed Use]
   // Then refine with specific Use class filters
   ```

4. **Conversion Opportunities:**
   ```
   Building use group: contains any [Temporary Or Holiday Accommodation]  // Hotels to residential
   Building use group: contains any [Commercial Activity: Logistics Or Manufacturing]  // Industrial to residential
   ```

**Performance/Notes:**
- Fast filter - indexed field
- Good for initial broad filtering, then refine with "Use class"
- "Mixed Use" is explicitly tagged - useful for precedent-based searches
- "Unknown" category exists - may want to exclude or investigate separately
- More intuitive than "Use class" codes but less planning-specific

**Relationship to Other Filters:**
- **Broader than:** Use class (E, C3, B2, etc.)
- **Narrower than:** Property type (Detached, Commercial, etc.)
- **Different from:** Property classification (OS taxonomy)

**Common Combinations:**
```
# Broad commercial search, then refine
Building use group: contains any [Commercial Activity: Retail, Commercial Activity: Other]
Use class: contains any [E - Commercial Business and Service]

# Residential focus with mixed-use
Building use group: contains any [Residential Accommodation, Mixed Use]
Property type: contains any [Flat, Commercial]

# Exclude unsuitable for development
Building use group: does not contain [Agriculture Or Aquaculture, Utility Or Environmental Protection, Unknown]
Planning constraints: does not contain [Green Belt]
```

---

