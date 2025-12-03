**Claude - Approach A: VALID (with caveats)**
**Reasoning:** Filters mostly map to known fields (Proposal text, Use class, acres, height m, station distance, sold date, app count, constraints, building inactivity). Capital need (£60k-£120k) fits option-led strategy; ROI assumes strong planning uplift but still plausible. Syntax uses combined ranges; SearchLand usually parses these, but splitting ranges improves reliability.
**Technical Issues:** None blocking; minor parsing risk on single-line numeric ranges.
**Suggested Fixes:** Split ranges into two lines each (e.g., Title area >0.15 and <1.5; Height <15) to avoid partial parsing.
**Strategic Notes:** Height <15m (~4–5 floors) may under-capture true 8-storey targets; consider raising height limit if precedent allows.

**Claude - Approach B: CONDITIONAL**
**Reasoning:** Filter set aligns with available fields (company status Liquidation/Administration, acres, use class, station distance, constraints, derelict flag, % unconstrained). Capital feasibility shaky: 0.2–2 acre sites within 1.5km of stations rarely clear at £130k-£200k without leverage or auction anomalies. ROI hinges on unusually low entry prices.
**Technical Issues:** None evident; combined range line acceptable.
**Suggested Fixes:** Narrow acreage (e.g., 0.2–0.6) or widen budget/financing assumptions; optionally add “On market: No” to focus on off-market cases where discounts are likelier.
**Strategic Notes:** Distressed stock is thin; expect low volume and heavy DD on liabilities.

**Claude - Approach C: VALID**
**Reasoning:** Filters exist and align (flat roof flag, height m, PTAL, acres, single building, Freehold, % unconstrained, station distance, constraints). Capital stack £130k-£200k for airspace rights + planning is credible. ROI assumes strong airspace premium but consistent with London/SE comps.
**Technical Issues:** None; optional range-splitting for robustness.
**Suggested Fixes:** Split ranges if parser misreads; ensure PTAL is scoped to London geographies to avoid zero results.
**Strategic Notes:** Structural capacity and fire regs are the key viability gate—budget surveys early.

**Claude - Approach D: CONDITIONAL**
**Reasoning:** Budget fits option/promotion model. However, several filters may not exist or be differently named: “Distance to nearest adopted/emerging settlement boundary” and “Developed area percentage” availability is uncertain; “No latest sold date: Yes” works where exposed, but coverage varies. ROI highly speculative (local plan allocation risk, 2–5 yr+ timeline).
**Technical Issues:** Potential non-existent/unsupported filters (settlement boundary distances, developed area %); combined range line should be split.
**Suggested Fixes:** Verify available equivalents (e.g., “Settlement boundary” boolean if present; “Developed area %” if exposed). If absent, replace with proxies: “Built up areas” vs not, “Percentage of plot un-constrained,” “Applications in last 5 years <1,” and manual GIS for edge-of-settlement. Split acreage range into two lines.
**Strategic Notes:** Very long-dated, binary outcomes; diversify sites and lock long option terms.

**Claude - Approach E: CONDITIONAL**
**Reasoning:** Core logic sound (HMO expiry + low EPC + long hold). Feasibility on capital (£160k-£200k) can work in secondary markets. ROI per deal modest but scale-driven. Main risk is data/filter availability: “Currently has HMO,” “HMO License Expiry Date,” and “Article 4 Directions” may not be universally exposed in SearchLand.
**Technical Issues:** Possible missing filters (HMO flags, license expiry, Article 4); range lines could be split.
**Suggested Fixes:** Confirm HMO/licence fields; if absent, proxy with “Use class: contains C4,” “Planning constraints: contains Article 4” to exclude, and overlay council HMO datasets manually. Split acreage and date ranges into separate filters.
**Strategic Notes:** Enforcement varies by council; factor licence reissue risk and EPC upgrade cost spread in margins.
