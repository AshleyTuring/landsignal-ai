# Site Validation Criteria

**Project:** [PROJECT_NAME]
**Purpose:** Screen SearchLand results for red flags before deep research

---

## Automatic Rejections (Red Flags)

### Environmental/Planning Constraints:
❌ Flood Zone 3 coverage >50%
❌ Green Belt coverage >50% (unless allocated site)
❌ Ancient Woodland on site
❌ SSSI (Site of Special Scientific Interest) on site
❌ Active Listed Building constraints on development plot
❌ Scheduled Monument on site

### Physical Constraints:
❌ No vehicle access (and cannot be created)
❌ Overhead high-voltage power lines directly across buildable area
❌ Railway line through middle of site
❌ Contaminated land (without viable remediation)

### Legal/Tenure Constraints:
❌ Active leases with >20 years remaining (blocks redevelopment)
❌ Multiple freeholders with no agreement mechanism
❌ Ransom strips blocking access
❌ Section 106 obligations that kill viability

---

## Investigation Required (Amber Flags)

### Planning:
⚠️ TPO (Tree Preservation Orders) affecting >10% of site
⚠️ Conservation Area (need design sensitivity)
⚠️ Article 4 Directions (limits PDR)
⚠️ Previous planning refusals (understand reasons)
⚠️ Local opposition history

### Environmental:
⚠️ Flood Zone 2 (manageable with mitigation)
⚠️ Contaminated land history (needs assessment)
⚠️ Protected species likely (surveys required)
⚠️ Air quality issues

### Access/Infrastructure:
⚠️ Poor road access (narrow lanes, weight restrictions)
⚠️ Substation capacity issues (red/amber rated)
⚠️ Drainage/sewage capacity constraints
⚠️ Proximity to noise sources (railway, motorway, airport)

### Tenure:
⚠️ Leasehold with onerous conditions
⚠️ Multiple titles need assembly
⚠️ Rights of way across site
⚠️ Restrictive covenants

---

## Positive Signals (Green Flags)

### Planning:
✅ Existing planning permission (even if expired)
✅ SHLAA allocation (housing land availability)
✅ Site allocated in local plan
✅ Recent similar approvals in immediate area
✅ Supportive planning policy (tall building zones, densification)
✅ Pre-application advice positive

### Ownership/Motivation:
✅ Corporate ownership (easier negotiation than individual)
✅ Derelict/inactive building (motivated seller signal)
✅ Long hold period (non-core asset)
✅ Listed for sale (active motivation)
✅ Bank/receiver ownership (distressed sale)

### Site Characteristics:
✅ Flat roof (airspace potential)
✅ Good transport links (PTAL 4-6b or <500m train station)
✅ Low current density (redevelopment upside)
✅ Ample plot size (not over-constrained)
✅ Existing utilities on site

### Market:
✅ Strong comparable sales nearby
✅ High rental demand (residential or commercial)
✅ Regeneration area (rising values)
✅ Low supply of similar product

---

## Scoring System

For each property, assign:
- **Red flags:** -10 points each (consider rejection)
- **Amber flags:** -2 points each (needs investigation)
- **Green flags:** +3 points each (positive signal)

**Score Interpretation:**
- **>10 points:** HIGH PRIORITY (few concerns, strong signals)
- **0-10 points:** MEDIUM PRIORITY (balanced, investigate ambers)
- **-5 to 0 points:** LOW PRIORITY (concerns outweigh positives)
- **<-5 points:** REJECT (too many red flags)

---

## Screening Process

### Step 1: Quick Reject (5 min per property)
Scan SearchLand data for automatic rejection criteria
→ Reject immediately if any red flags present (unless exceptional circumstances)

### Step 2: Flag Amber Issues (10 min per property)
Identify all investigation-required items
→ Assign priority based on number/severity of ambers

### Step 3: Score Positives (5 min per property)
Count green flag signals
→ Calculate total score

### Step 4: Rank (5 min total)
Sort properties by score
→ Top 5-10 proceed to deep research

---

## Output Format

Create `ScreeningResults.md`:

| Property | Title No. | Score | Red | Amber | Green | Priority | Notes |
|----------|-----------|-------|-----|-------|-------|----------|-------|
| [Address] | TN123 | +12 | 0 | 2 | 6 | HIGH | Corporate owner, existing planning |
| [Address] | TN456 | +5 | 0 | 4 | 5 | MEDIUM | TPOs, access issues |
| [Address] | TN789 | -3 | 1 | 3 | 2 | LOW | Flood Zone 2, poor access |
| [Address] | TN012 | -15 | 2 | 5 | 1 | REJECT | Green Belt + Listed Building |

---

**Next Step:** Deep research top 5 properties (Stage 6)
