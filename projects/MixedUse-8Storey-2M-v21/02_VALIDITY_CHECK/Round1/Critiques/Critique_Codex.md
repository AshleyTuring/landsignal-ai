### Claude - Approach A: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Capital fits £60k-£120k. ROI plausible if planning uplift achieved. Filters mostly aligned with strategy, but some likely unsupported and syntax may not parse reliably.  
**Technical Issues (if any):**
- Filter `Building on title is inactive` not in documented set (use `Building on title is derelict` or similar).
- `Proposal: contains "retail" OR "commercial"` may not parse OR; use `contains any [retail, commercial]` or two lines.
- Range lines with `is greater than X AND less than Y` can be partially ignored in complex prompts; split into two lines.
**Suggested Fixes (if CONDITIONAL):**
- Replace inactive filter with available motivation/condition filter.
- Split title area and proposal text filters into separate lines; avoid inline OR.
- After parsing, verify all 10 filters were created; add missing ones manually.
**Strategic Notes (optional):**
- Height <15m targeting intensification is coherent with 8-storey uplift precedent.

---

### Claude - Approach B: VALID
**Status:** VALID  
**Reasoning:** Filters map to documented options (Company status Liquidation/In Administration, derelict, % un-constrained). Budget £130k-£200k fits ceiling. ROI depends on distress discount but commercially feasible. Syntax needs minor range splitting but otherwise sound.  
**Technical Issues (if any):**
- Combined range `Title area... greater than 0.2 AND less than 2` may need splitting for reliability.  
**Suggested Fixes (if CONDITIONAL):**
- N/A  
**Strategic Notes (optional):**
- Very small pool; expect low volume and heavy DD on liabilities.

---

### Claude - Approach C: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Capital fits. Airspace ROI feasible if structure supports. Key filters uncertain or geography-limited (PTAL London-only). Flat-roof detection may not exist in AvailableFilters list.  
**Technical Issues (if any):**
- `A building in the title has flat roof: Yes` likely not an available filter; need alternative (e.g., roof type via classification not present).
- PTAL valid but London-only; outside London returns zero.
- Range lines should be split (`Title area`, `Max building height`).  
**Suggested Fixes (if CONDITIONAL):**
- Replace flat-roof filter with available proxies (e.g., `Building height (floors)`, `Property classification: Flat/Commercial`, manual desk check).
- Scope to London or swap PTAL for `Distance to nearest Train Station (m)` only.
- Split numeric ranges for parsing reliability.
**Strategic Notes (optional):**
- Single-building + freehold logic fits airspace strategy; structural due diligence critical.

---

### Claude - Approach D: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Budget okay, but several filters likely unavailable or mis-specified; long 2-5y promotion timeline acceptable but requires patience. ROI assumes allocations materialize—high uncertainty.  
**Technical Issues (if any):**
- `Less than 1 application in last 5 years: Yes` should be numeric (`Applications in last 5 years: is less than 1`).
- Settlement boundary distance filters may not exist in AvailableFilters; need confirmation/substitutes.
- `Developed area percentage` availability unclear.
- Combined ranges (Title area) need splitting.  
**Suggested Fixes (if CONDITIONAL):**
- Use available proximity proxies (e.g., `Distance to nearest adopted settlement boundary` → if missing, use polygon/ward filters or manual GIS).
- Correct applications filter to numeric comparator.
- Verify availability of developed-area metric; if absent, use `% of plot unconstrained` plus `Building on title is derelict`/`No latest sold date`.
- Split range conditions into separate lines and confirm parsing.  
**Strategic Notes (optional):**
- Option-fee stack across 10 sites must stay within £60k; monitor consultancy fees to keep under £160k.

---

### Claude - Approach E: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Capital fits. Volume target (18-30 deals) stresses data scarcity; HMO licensing datasets and Article 4 coverage may not be available as filters. ROI per deal reasonable if data exists.  
**Technical Issues (if any):**
- `Currently has HMO` and `HMO License Expiry Date` are unlikely in AvailableFilters; may not parse.
- `Planning constraints: does not contain [Article 4 Directions]` may be unsupported; Article 4 often not a listed constraint.
- Range lines (Title area) should be split.  
**Suggested Fixes (if CONDITIONAL):**
- Replace HMO-specific filters with available proxies (e.g., `Use class: contains any [C4]`, `EPC rating`, `Latest sold date`), then verify licensing manually.
- If Article 4 filter missing, remove and screen Article 4 maps separately.
- Split numeric ranges for parsing reliability; verify all filters created before searching.  
**Strategic Notes (optional):**
- Scarcity of expired licenses likely caps volume; adjust deal-count expectations or broaden geography.
