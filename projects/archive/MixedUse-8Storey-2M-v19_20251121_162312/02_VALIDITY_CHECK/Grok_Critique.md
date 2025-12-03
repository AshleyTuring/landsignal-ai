### Claude - Approach A: Precedent-Matched Stalled Planning
**Status:** CONDITIONAL  
**Reasoning:** Filters mostly exist and syntax is largely correct, but constraint exclusion syntax is invalid per LEARNINGS_DATABASE.md, price format may require bare integers, and capital upper bound exceeds +15% budget threshold. Business case auto-valid as precedent-based.  
**Technical Issues:**  
- Planning constraints: does not contain Green Belt land (invalid; use Percentage of title covered by Green Belt land: is equal to 0)  
- Sales listing price: is less than £2,000,000 (may require bare integer 2000000)  
**Suggested Fixes:**  
- Replace constraint filter with percentage-based exclusion  
- Test and adjust price format to bare integer if needed  
**Strategic Notes:**  
- Strong precedent match; target lower capital range for feasibility  

### Claude - Approach B: Airspace Rights
**Status:** VALID  
**Reasoning:** All filters exist, syntax correct, units accurate, capital within budget, ROI achievable via airspace intensification, implementation viable through negotiation.  
**Technical Issues:**  
- None identified  
**Suggested Fixes:**  
- None  
**Strategic Notes:**  
- Lowest capital entry; ideal for constrained budgets  

### Claude - Approach C: Liquidation Distressed Assets
**Status:** CONDITIONAL  
**Reasoning:** Filters exist but constraint syntax invalid, capital upper bound exceeds +15% threshold. Business case auto-valid as precedent-based, but implementation requires specialist surveys.  
**Technical Issues:**  
- Planning constraints: does not contain Flood Zone 3 (invalid; use Percentage of title covered by Flood Zone 3: is equal to 0)  
**Suggested Fixes:**  
- Replace with percentage-based Flood Zone exclusion  
**Strategic Notes:**  
- Highest motivation; variable capital needs careful targeting  

### Codex - Approach A: Crossrail Mixed-Use Precedents
**Status:** CONDITIONAL  
**Reasoning:** Filters exist, but price format may require bare integers and constraint syntax invalid. Business case auto-valid as precedent-based.  
**Technical Issues:**  
- Planning constraints: does not contain Green Belt land (invalid; use percentage = 0)  
- Sales listing price: is less than £2,000,000 (may require 2000000)  
**Suggested Fixes:**  
- Fix constraint syntax; test price format  
**Strategic Notes:**  
- Transport-focused; strong viability near stations  

### Codex - Approach B: High Street Podium Intensification
**Status:** CONDITIONAL  
**Reasoning:** Filters exist but price format, date format, use class abbreviations, and constraint syntax invalid. Business case auto-valid as precedent-based.  
**Technical Issues:**  
- Sales listing price: is less than £1,800,000 (may require 1800000)  
- Latest sold date: is before 01/01/2016 (invalid DD/MM/YYYY; use YYYY-MM-DD)  
- Use class: is one of E, E(a), E(b) (may require full text)  
- Planning constraints: does not contain Green Belt land (invalid; use percentage = 0)  
**Suggested Fixes:**  
- Bare integer price, ISO date, full use class text, percentage exclusions  
**Strategic Notes:**  
- Targets long-held retail; sequencing complexity  

### Codex - Approach C: Stalled Mixed-Use Resubmissions
**Status:** CONDITIONAL  
**Reasoning:** Filters exist but date format and constraint syntax invalid. Business case auto-valid as precedent-based.  
**Technical Issues:**  
- Last application submitted: is before 01/01/2023 (invalid DD/MM/YYYY; use YYYY-MM-DD)  
- Last updated by Land Registry date: is before 01/01/2024 (invalid DD/MM/YYYY; use YYYY-MM-DD)  
- Planning constraints: does not contain Flood Zone 3 (invalid; use percentage = 0)  
**Suggested Fixes:**  
- ISO dates; percentage exclusions  
**Strategic Notes:**  
- Company-owned; resubmission strategy  

### Gemini - Approach A: Urban Intensification via Option Agreement
**Status:** CONDITIONAL  
**Reasoning:** Filters exist but mixes Property classification with Use class (separate filters), constraint syntax invalid, and enum quoting missing. Business case auto-valid as precedent-based.  
**Technical Issues:**  
- Use class: is one of "E - Commercial, Business and Service", "Car park", "Car/coach/commercial vehicle/taxi parking", "Unused land" (mixes Use class and Property classification; separate)  
- NOT: Conservation Areas, Listed Buildings (invalid; use percentage = 0 for each)  
- Ownership type: is one of Company, Private owner (may need quotes)  
**Suggested Fixes:**  
- Split into separate Use class and Property classification filters; use percentage exclusions; add quotes  
**Strategic Notes:**  
- Off-market focus; planning de-risked  

### Gemini - Approach B: Distressed Asset Acquisition (Forced Sale)
**Status:** CONDITIONAL  
**Reasoning:** Filters exist but constraint syntax invalid and enum quoting missing. Business case auto-valid as precedent-based.  
**Technical Issues:**  
- NOT: Green Belt land (invalid; use Percentage of title covered by Green Belt land: is equal to 0)  
- Ownership type: is equal to Company (may need quotes)  
- Company status: is one of Liquidation, In Administration (may need quotes)  
**Suggested Fixes:**  
- Percentage exclusion; add quotes  
**Strategic Notes:**  
- Forced sale motivation; large sites  

### Grok - Approach A: Slough-Style Mixed-Use Intensification
**Status:** VALID  
**Reasoning:** All filters exist, syntax correct, units accurate, capital within budget, ROI achievable, implementation viable.  
**Technical Issues:**  
- None identified  
**Suggested Fixes:**  
- None  
**Strategic Notes:**  
- Direct precedent; inactive sites  

### Grok - Approach B: Derelict Urban Turnaround
**Status:** INVALID  
**Reasoning:** Filters exist but price format may require bare integers; business case invalid due to unrealistic construction capital (iterations confirm £100k-£150k insufficient for 8-storey build).  
**Technical Issues:**  
- Sales listing price: is less than £150,000 (may require 150000)  
**Suggested Fixes:**  
- Bare integer price; clarify strategy as planning-stage exit or adjust capital  
**Strategic Notes:**  
- Distressed assets; but capital non-viable for full build  

### Grok - Approach C: Permitted Development Mixed-Use Conversion
**Status:** CONDITIONAL  
**Reasoning:** Filters exist but title area unit invalid (acres only), price format may require bare integers, use class abbreviations may invalid. Business case auto-valid as precedent-based.  
**Technical Issues:**  
- Title area (sqft): is greater than 100 AND less than 8000 (invalid; use Title area (acres))  
- Sales listing price: is less than £120,000 (may require 120000)  
- Use class: is one of E, E(a), E(b), E(c)(i), E(c)(ii), E(c)(iii), E(d), E(e), E(f), E(g)(i), E(g)(ii), E(g)(iii) (may require full text)  
**Suggested Fixes:**  
- Convert to acres; bare integer price; full use class text  
**Strategic Notes:**  
- PDR pathway; fast execution
