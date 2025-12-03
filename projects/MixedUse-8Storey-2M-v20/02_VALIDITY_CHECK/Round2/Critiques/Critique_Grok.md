### Claude - Approach A: VALID
**Status:** VALID  
**Reasoning:** Filters exist in AvailableFiltersInSearchLand_ACTUAL.md (e.g., "Proposal", "Max building height on title (m)", "Distance to nearest Train Station (m)", "Title area (acres)", "Percentage of title covered by Green Belt land"). Units correct (acres, metres). Syntax valid (contains, >=). Business case sound (£2M-£4M profit via optioned sites within £200k capital). Implementation viable (precedent-based replication).  
**Technical Issues (if any):** None.  
**Suggested Fixes (if CONDITIONAL):** N/A  
**Strategic Notes (optional):** Strong precedent diversity; leverages Slough approval for de-risking.

### Claude - Approach B: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filters mostly exist (e.g., "Article 4", "Use class", "Title area (acres)", "Distance to nearest Train Station (m)"), but "Article 4 expiry date" does not (use "Percentage of title covered by Article 4 Directions" proxy). Units correct (acres, metres). Syntax valid. Business case feasible (£2.8M profit achievable with low option fees), but capital depends on negotiating 2.5-3% fees (within £200k total). Implementation viable (regulation-driven).  
**Technical Issues (if any):** Missing "Article 4 expiry date" filter.  
**Suggested Fixes (if CONDITIONAL):** Replace with "Percentage of title covered by Article 4 Directions: is greater than 0" and manual expiry research. Negotiate option fees at 2.5-3% to stay under £200k.  
**Strategic Notes (optional):** Regulation-driven diversity; exploits Article 4 lifts for capital arbitrage.

### Claude - Approach C: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filters exist (e.g., "Planning Status" proxy via "Last application submitted", "Proposal", "Title area (acres)", "Applications in the last 5 years"). Units correct (acres). Syntax valid. Business case sound (£2.17M profit via stalled planning arbitrage within £200k). Implementation viable (time arbitrage).  
**Technical Issues (if any):** "Planning Status: contains 'Approved'" should use "Last application submitted: is after 2020-01-01" + "Proposal: contains 'approved'".  
**Suggested Fixes (if CONDITIONAL):** Update to proxy filters for planning status.  
**Strategic Notes (optional):** Time arbitrage diversity; targets motivated sellers with derisked planning.

### Claude - Approach D: INVALID
**Status:** INVALID  
**Reasoning:** Filters exist (e.g., "Use class", "Title area (acres)", "Property floor area (sqft)"), but legal premise flawed (Class MA PDR does not apply to B2 General Industrial; only E-class per planning law). Units correct (acres, sqft). Syntax valid. Business case invalid (no PDR route to residential). Implementation not viable.  
**Technical Issues (if any):** Legal premise error (B2 ineligible for Class MA).  
**Suggested Fixes (if CONDITIONAL):** N/A (requires retargeting to E(g)(iii) light industrial).  
**Strategic Notes (optional):** PDR diversity attempted but legally unsound.

### Claude - Approach E: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filters exist (e.g., "Use class", "Title area (acres)", "Percentage of title covered by Green Belt land", "Distance to nearest Train Station (m)"), but "Agricultural land value" proxy needed (use "Latest sold date" + low activity). Units correct (acres, metres). Syntax valid. Business case feasible (£2.27M profit via cross-subsidy within £200k, but HA partnerships required). Implementation viable (community-led).  
**Technical Issues (if any):** "Agricultural land value" filter missing.  
**Suggested Fixes (if CONDITIONAL):** Replace with "Latest sold date: is before 2010-01-01" + "Applications in the last 5 years: is less than 1" for low-value proxy. Secure HA partnerships.  
**Strategic Notes (optional):** Community partnerships diversity; low-capital entry on Green Belt exceptions.

### Codex - Approach A: INVALID
**Status:** INVALID  
**Reasoning:** Filters do not exist ("Decision: is one of Approved", "Local Planning Authority: is equal to Slough" absent from AvailableFiltersInSearchLand_ACTUAL.md). Units correct (acres, metres). Syntax invalid (no OR support in single lines). Business case sound (precedent-based), but technical execution impossible. Implementation not viable.  
**Technical Issues (if any):** Non-existent filters; OR syntax unsupported.  
**Suggested Fixes (if CONDITIONAL):** N/A (use proxies like "Proposal: contains 'approved'" + geography via "Neighbouring Local Planning Authorities of").  
**Strategic Notes (optional):** Precedent diversity intended but filter errors invalidate.

### Codex - Approach B: INVALID
**Status:** INVALID  
**Reasoning:** Filters exist (e.g., "Sales listing price", "Sales listing currently on the market", "Use class", "Title area (acres)", "Distance to nearest Train Station (m)", "Developed area percentage"), but OR syntax invalid (SearchLand does not support OR in single lines). Units correct (acres). Business case sound (motivated sellers within £200k). Implementation not viable due to syntax.  
**Technical Issues (if any):** OR syntax unsupported (use "is one of" for enums).  
**Suggested Fixes (if CONDITIONAL):** N/A (rewrite as "Use class: is one of 'E - Commercial, Business and Service', 'Mixed Use', 'Sui Generis'").  
**Strategic Notes (optional):** Low-capital diversity; focuses on on-market motivation.

### Codex - Approach C: INVALID
**Status:** INVALID  
**Reasoning:** Filters exist (e.g., "Ownership type", "Company status", "Use class", "Title area (acres)", "Distance to nearest Train Station (m)", "Sales listing currently on the market", "Sales listing price"), but OR syntax invalid (no OR support). Units correct (acres). Business case sound (distressed motivation within £190k). Implementation not viable due to syntax.  
**Technical Issues (if any):** OR syntax unsupported.  
**Suggested Fixes (if CONDITIONAL):** N/A (rewrite Use class as "is one of").  
**Strategic Notes (optional):** Motivation-led diversity; leverages liquidation for discounts.

### Gemini - Approach A: VALID
**Status:** VALID  
**Reasoning:** Filters exist (e.g., "Max building height on title (m)", "Distance to nearest Train Station (m)", "Title area (acres)", "Use class", "Latest sold date", "Applications in the last 5 years", "Sales listing currently on the market", "Percentage of title covered by Green Belt land"). Units correct (acres, metres). Syntax valid. Business case sound (£65k capital for £2M+ uplift). Implementation viable (option-based intensification).  
**Technical Issues (if any):** None.  
**Suggested Fixes (if CONDITIONAL):** N/A  
**Strategic Notes (optional):** Low-capital diversity; off-market targeting for high-density uplift.

### Gemini - Approach B: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filters exist (e.g., "Ownership type", "Company status", "Sales listing currently on the market", "Sales listing price", "Title area (acres)", "Use class"). Units correct (acres). Syntax valid. Business case feasible but ROI overstated (£2M unrealistic from £150k; reduce to £300k-£500k via planning gain). Implementation viable (liquidation motivation).  
**Technical Issues (if any):** SDLT calculation error (commercial SDLT is 0.5% for £145k = £725, not £2,400).  
**Suggested Fixes (if CONDITIONAL):** Correct SDLT to £725; adjust ROI expectations to £300k-£500k; focus on planning gain, not full build-out.  
**Strategic Notes (optional):** Distress diversity; forced sales for discounted entry.

### Grok - Approach A: CONDITIONAL
**Status:** CONDITIONAL  
**Reasoning:** Filters exist (e.g., "Max building height on title (m)", "Proposal", "Distance to nearest Train Station (m)", "Title area (acres)", "Percentage of title covered by Green Belt land", "Developed area percentage"), but logic contradiction (height <15m + proposal "storey" may exclude tall buildings). Units correct (acres, metres). Syntax valid. Business case sound (£100k-£200k for £2M+). Implementation viable (precedent intensification).  
**Technical Issues (if any):** Filter logic mismatch (height filter may contradict proposal).  
**Suggested Fixes (if CONDITIONAL):** Adjust height to "is greater than 15" or remove if targeting low-rise to tall.  
**Strategic Notes (optional):** Precedent diversity; transport-focused for viability.

### Grok - Approach B: VALID
**Status:** VALID  
**Reasoning:** Filters exist (e.g., "Use class", "Property floor area (sqft)", "Title area (acres)", exclusions for flood zones/AONB/conservation). Units correct (sqft, acres). Syntax valid. Business case sound (£110k-£220k for PDR conversions). Implementation viable (Class MA arbitrage).  
**Technical Issues (if any):** None.  
**Suggested Fixes (if CONDITIONAL):** N/A  
**Strategic Notes (optional):** PDR diversity; regulatory arbitrage for quick conversions.
