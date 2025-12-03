Claude - Approach A: CONDITIONAL  
Reasoning: Strategy coherent but filters shown use non-existent names (“Planning Status”, “Development Type”, “Number of Storeys”, “Site Area”) and no full prompt provided. ROI assumes £1.5M uplift per site without showing disposal/development costs.  
Technical Issues: Uses invalid/ambiguous filters; unit for site area should be `Title area (acres)`; height should use `Max building height on title (m)` or `Max number of building floors on title`; no decision/status constraint to ensure approvals.  
Suggested Fixes: Rewrite prompt with real filters (`Decision: is one of [Approved]`, `Proposal: contains "mixed use"`, `Max building height on title (m): is greater than 18`, `Title area (acres): ...`, `Distance to nearest Train Station (m): ...`); model profit net of planning/selling costs to prove £2M target.

Claude - Approach B: CONDITIONAL  
Reasoning: Article 4 expiry cannot be filtered directly in SearchLand; capital/ROI path plausible only if expiry geographies are pre-known.  
Technical Issues: No valid filters provided; Article 4 expiry data not available as a filter.  
Suggested Fixes: Use proxy (manual list of Article 4 boroughs with planned expiry → filter by LPA + `Use class: contains any [E - Commercial, Office subclasses]` + `Sales listing price`/`Ownership type`) and document manual overlay requirement; evidence ROI with comparables.

Claude - Approach C: CONDITIONAL  
Reasoning: Stalled approvals concept workable but filters missing and no proof of £2M uplift across 3 sites.  
Technical Issues: No decision/date/activity filters; no capital allocation to acquire/option approved sites.  
Suggested Fixes: Use `Decision: is one of [Approved]`, `Latest application submitted: is before 2023-01-01`, `Applications in the last 5 years: is less than 2`, `Building on title is inactive: is equal to Yes`; show option/JV structure to stay ≤£200k and profit assumptions.

Claude - Approach D: CONDITIONAL  
Reasoning: PDR conversion viable but Class MA has strict criteria not reflected.  
Technical Issues: No actual prompt; must limit floor area (<1,500 sqm ≈ 16,145 sqft), show 2-year E-class use, and avoid constraints (Article 4, flood, conservation).  
Suggested Fixes: Add filters (`Use class: contains any [E - Commercial, Business and Service]`, `Property floor area (sqft): is less than 16145`, `Latest sold date: is before 2022-07-31`, `Planning constraints: does not contain [Conservation Area, Flood Zone 3]`); include cost-to-convert and resale assumptions to reach £3M-£4M total.

Claude - Approach E: CONDITIONAL  
Reasoning: Green Belt exception sites possible but very high planning risk; capital and ROI depend on HA partnership not evidenced.  
Technical Issues: No filters; must explicitly include Green Belt not exclude; land/affordable delivery costs likely exceed stated £10k-£20k/acre assumption.  
Suggested Fixes: Use `Planning constraints: contains any [Green Belt]`, `Title area (acres): is less than 2`, `Percentage of plot un-constrained: is greater than 70`; model HA/JV cashflows and planning costs to show £2.27M is achievable; include contingency for refusal.

Codex - Approach A: CONDITIONAL  
Reasoning: Precedent match sound; prompt close but some filter names/operators off and ROI to £2M not demonstrated.  
Technical Issues: Should use `Max building height on title (m)`; `Conservation area` likely needs `Planning constraints: does not contain [Conservation Area]`; AND in height line may fail parser; lacks GDV/exit math.  
Suggested Fixes: Correct filter names/operators (`Decision: is one of [Approved]`, `Proposal: contains "mixed use"`, `Max building height on title (m): is greater than 18`, `Distance to nearest Train Station (m): is less than 800`, `Planning constraints: does not contain [Conservation Area]`); add profit model showing path to £2M with 2-3 options.

Codex - Approach B: CONDITIONAL  
Reasoning: Low-cap direct purchase matches £200k cap, but syntax errors and ROI from £150k sites to £2M not evidenced.  
Technical Issues: `Use class: contains "E" OR ...` invalid; Tenure needs `is one of [Freehold]`; flood filters should use `Planning constraints` or `% of title covered by Flood Zone`; `Applications in last 5 years` operator should be `is less than`; no build/exit costs.  
Suggested Fixes: `Use class: contains any [E - Commercial, Business and Service, Mixed Use]`; `Sales listing currently on the market: is equal to Yes`; `Planning constraints: does not contain [Flood Zone 2, Flood Zone 3]`; add financial model showing uplift route (PD/extension) to justify £2M.

Codex - Approach C: CONDITIONAL  
Reasoning: Distress plus mixed-use viable; syntax and capital structure need tightening.  
Technical Issues: `Use class: contains "E" OR "Mixed"` invalid; `Ownership type` operator should be `is one of [Company]`; Conservation filter may need `Planning constraints`; £400k price cap exceeds £200k capital unless financing/JV detailed.  
Suggested Fixes: `Use class: contains any [E - Commercial, Business and Service, Mixed Use]`; `Ownership type: is one of [Company]`; `Sales listing price: is less than 400000` (no £ symbol); add explicit funding plan (option/assign/JV) and profit math to hit £2M.

Gemini - Approach A: CONDITIONAL  
Reasoning: Low-rise to high-density via option works; operators off and capital (£65k) omits full planning budget; ROI not shown.  
Technical Issues: `Use class: is one of ...` should be `contains any`; need to state 8-storey target via height/floor filters; lack of planning/consultant costs beyond £65k.  
Suggested Fixes: `Use class: contains any [E - Commercial, Business and Service, Sui Generis]`; keep `Max building height on title (m): is less than 12`; add `Planning constraints: does not contain [Conservation Area, Flood Zone 3]`; include full planning/design budget and exit value to evidence £2M.

Gemini - Approach B: CONDITIONAL  
Reasoning: Distress purchase plausible but syntax errors and missing viability checks; 0.2+ acre liquidations under £150k rare.  
Technical Issues: `Ownership type: is equal to Company` should be `is one of`; `Use class: is not one of "C3..."` should be `does not contain [C3 - Dwellinghouses]`; no constraint/condition filters; no proof capital covers capex.  
Suggested Fixes: Correct operators; add `Building on title is derelict: is equal to Yes`, `Planning constraints: does not contain [Flood Zone 3, Conservation Area]`, `Distance to nearest Train Station (m): is less than 1200`; show financing/exit to reach target ROI.

Grok - Approach A: CONDITIONAL  
Reasoning: Intensification precedent idea works but prompt misses planning status and uses large plot sizes likely above £200k without option clarity.  
Technical Issues: No approval filter (`Decision`), no constraint exclusion beyond Green Belt, title area up to 5 acres conflicts with capital; developed area >40% contradicts “low-rise” goal.  
Suggested Fixes: Add `Decision: is one of [Approved]` or `Proposal year before 2023`; tighten plot band (e.g., `Title area (acres): is less than 1`); use `Max number of building floors on title: is less than 3`; ensure option/JV structure fits £200k.

Grok - Approach B: INVALID  
Reasoning: Class MA PDR conversion intent good, but filter syntax is not SearchLand-valid and omits mandatory PDR criteria; cap may exceed £200k.  
Technical Issues: Uses “NOT”/inline negations (unsupported); `Use class: is one of E, E(a)...` invalid formatting; must include 2-year E-class use and 1,500 sqm (16,145 sqft) cap; flood/AONB exclusions need proper `Planning constraints` syntax.  
Suggested Fixes: Rewrite prompt:  
- `Use class: contains any [E - Commercial, Business and Service]`  
- `Property floor area (sqft): is less than 16145`  
- `Latest sold date: is before 2022-07-31` (2-year use)  
- `Planning constraints: does not contain [Flood Zone 2, Flood Zone 3, Areas of Outstanding Natural Beauty, Conservation Area, Sites of Special Scientific Interest]`  
- `Title area (acres): is less than 0.99`  
Add cost/exit model to stay within £200k and show profit.
