**Claude - Approach A: INVALID**  
**Status:** INVALID  
**Reasoning:** Relies on non-existent filters (`Planning Status`, `Development Type`, `Number of Storeys`, `Site Area`) and PTAL outside London; core query won’t run.  
**Technical Issues:**  
- `Planning Status`, `Development Type`, `Number of Storeys`, `Site Area` not in available filters; should use `Proposal`, `Max number of building floors on title`, `Title area (acres)`.  
- PTAL only valid in London; Slough needs distance-to-station.  
**Suggested Fixes (if CONDITIONAL):**  
- Swap to `Proposal: contains "mixed use"` and height via `Max number of building floors on title`/`Max building height on title (m)`; use `Distance to nearest Train Station (m)` instead of PTAL; replace status filter with `Last application submitted` window.

**Claude - Approach B: INVALID**  
**Status:** INVALID  
**Reasoning:** No filter for Article 4 expiry; capital plan for buying/converting three offices far exceeds £200k unless external finance (not provided).  
**Technical Issues:**  
- Only `Article 4` coverage exists—no expiry/relaxation date filter.  
- No filters provided to capture expiry proxy.  
**Suggested Fixes (if CONDITIONAL):**  
- Use `Percentage of title covered by Article 4 Directions` plus manual expiry research; restructure to options/promotion and model capex within £200k or add external finance/JV plan.

**Claude - Approach C: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Concept (stalled approvals) is viable, but relies on unstated filters for approval year and implementation status; capital structure for three sites not shown.  
**Technical Issues:**  
- Needs proxies for “approved 2022-2023” (`Last application submitted` date) and low activity (`Applications in the last 5 years`).  
- No way to filter “unimplemented”; must add manual check.  
**Suggested Fixes:**  
- Use `Last application submitted: is between 2022-01-01 and 2023-12-31` + `Applications in the last 5 years: is less than 2`; add capital plan (options/exclusivity) showing spend ≤£200k.

**Claude - Approach D: INVALID**  
**Status:** INVALID  
**Reasoning:** Class MA PDR does not allow B2 (general industrial) to C3; legal premise fails.  
**Technical Issues:**  
- Targeting B2 for PDR is incorrect; only Class E (including E(g)(iii) light industrial) qualifies.  
**Suggested Fixes (if CONDITIONAL):**  
- Retarget to E(g)(iii)/broader Class E stock and include 2-year qualifying use check.

**Claude - Approach E: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Green Belt exception route is plausible but depends on HA partnership and land-price negotiation; no filter for “agricultural value.”  
**Technical Issues:**  
- Must use `Percentage of title covered by Green Belt land` plus hardstanding/built-up proximity proxies; cannot filter by £/acre.  
**Suggested Fixes:**  
- Add filters: `Percentage of title covered by Green Belt land: is greater than 0`, `Percentage of title covered by hard standings: is greater than 10`, `Distance to nearest built up area (m): is less than 100`; include HA LOI and budgeting showing sub-£200k option/promotion costs.

---

**Codex - Approach A: INVALID**  
**Status:** INVALID  
**Reasoning:** Uses non-existent `Local Planning Authority` and `Decision` filters; rest of query cannot run.  
**Technical Issues:**  
- No `Local Planning Authority` filter; no `Decision/Approved` filter.  
**Suggested Fixes (if CONDITIONAL):**  
- Replace with geography via map/`Distance to nearest Train Station (m)` + `Title area (acres)`; use `Proposal: contains "mixed use"` and `Last application submitted` recency proxies.

**Codex - Approach B: INVALID**  
**Status:** INVALID  
**Reasoning:** OR syntax unsupported; “Use class: contains” wrong operator; `Building on title is inactive` filter not available; business case for £2M on a £200k purchase not evidenced.  
**Technical Issues:**  
- `Use class: contains "E" OR ...` invalid; must use `Use class: is one of ...`.  
- `Building on title is inactive` not in available list.  
- Chained ANDs on flood zones may exceed parser limits.  
**Suggested Fixes (if CONDITIONAL):**  
- Use separate lines: `Use class: is one of "E - Commercial, Business and Service", "Mixed use"`; drop inactive filter or swap to `Ownership type`/`Latest sold date` motivation proxies; reset ROI to planning-gain level or add funding plan.

**Codex - Approach C: INVALID**  
**Status:** INVALID  
**Reasoning:** Same OR syntax fault, and `Building on title is derelict` filter not in available list; £400k price ceiling conflicts with £200k capital unless clear option/JV shown.  
**Technical Issues:**  
- `Use class: contains ... OR ...` invalid; wrong operator.  
- `Building on title is derelict` not an available filter.  
**Suggested Fixes (if CONDITIONAL):**  
- Use `Use class: is one of "E - Commercial, Business and Service", "Mixed use"`; replace derelict with available motivation filters (`Latest sold date`, `Applications in the last 5 years`, `Sales listing status`); show option/assignation structure to stay within budget.

---

**Gemini - Approach A: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Filters are valid (“Max building height on title (m)”, acreage, use class, station distance) and units correct, but ROI of £2M on £65k spend is unsubstantiated and depends entirely on negotiating options/off-market owners.  
**Technical Issues:**  
- None material (ensure `Use class` values match enum names).  
**Suggested Fixes:**  
- Add capital plan showing number of options within £200k and exit via planning gain; clarify expected GDV/uplift per site.

**Gemini - Approach B: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Filters exist and syntax is fine, but £150k distressed purchase + £35k fees cannot by itself yield £2M without external build finance; business case needs planning-gain/flip route.  
**Technical Issues:**  
- None.  
**Suggested Fixes:**  
- Frame as planning-gain flip (consented resale) with target uplift £300k-£500k; if build-out assumed, add funding stack beyond £200k.

---

**Grok - Approach A: VALID**  
**Status:** VALID  
**Reasoning:** All filters exist (`Proposal`, `Max building height on title (m)`, `Title area (acres)`, `Developed area %`, station distance, Green Belt %); syntax and units are correct, and option-based capital plan fits £200k for planning-gain resale.  
**Technical Issues:**  
- None blocking; ensure “mixed-use” and “storey” keyword combo doesn’t over-constrain results.  
**Strategic Notes:**  
- Strong precedent-led intensification angle complements other regulatory/distress plays.

**Grok - Approach B: CONDITIONAL**  
**Status:** CONDITIONAL  
**Reasoning:** Filters and exclusions align with Class MA targeting, but legal requirement for 2-year Class E use not captured; capital range tops £200k; ROI depends on local values.  
**Technical Issues:**  
- Add qualifying-use check; verify `Use class` values match enum names (`E`, `E(a)`, etc.).  
**Suggested Fixes:**  
- Include `Latest sold date`/lease data to evidence 2-year use; cap acquisition+works to stay ≤£200k; model conversion uplift to confirm ROI.
