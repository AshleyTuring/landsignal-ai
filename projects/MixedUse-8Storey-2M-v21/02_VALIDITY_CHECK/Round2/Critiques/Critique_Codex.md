**Approach A (Claude) - Status: CONDITIONAL**  
Reasoning: Filters look syntactically coherent and budget (£60k–£120k) fits the £200k cap, but I can’t verify filter availability because `AvailableFiltersInSearchLand_ACTUAL.md` isn’t present. ROI (£700k–£1.1M per planning uplift) is aggressive and assumes strong precedent transfer.  
Technical Issues:  
- Range filters rely on single-line AND (title area, proposal keywords); these can be flaky in long prompts.  
- “Building on title is inactive” and “Max building height on title (m)” need confirmation against actual filter list.  
Suggested Fixes:  
- Split the range lines into two filters each for reliability.  
- Cross-check the two filters above against the live filter list before running.  
Strategic Notes:  
- Planning-only exit is viable but sensitive to local precedent; add a fallback value-add path if precedent doesn’t translate.

**Approach B (Claude) - Status: CONDITIONAL**  
Reasoning: Capital stack (£130k–£200k) fits; syntax is clean. Profit (£100k–£450k) plausible if liquidation discounts hold. Supply risk (few liquidation cases) could limit hitting target volume.  
Technical Issues:  
- Need to confirm availability of “Company status: Liquidation/In Administration” and “Building on title is derelict” without the missing filter list.  
Suggested Fixes:  
- Validate those two filters in SearchLand; if absent, replace with Companies House status + manual derelict tag proxy (e.g., “Building on title is inactive/void”).  
Strategic Notes:  
- Add a fast flip fallback (sell as-is at modest margin) to protect downside if planning uplift is slow.

**Approach C (Claude) - Status: CONDITIONAL**  
Reasoning: Budget fits; airspace strategy feasible. PTAL + transport focus matches density goals. Profit (£450k–£850k) depends on strong buyer appetite for consented airspace.  
Technical Issues:  
- PTAL only works in London; ensure geography is constrained.  
- “Flat roof” and “Max building height on title (m)” need confirmation; risk of non-existent filters.  
Suggested Fixes:  
- Geo-limit to London when using PTAL; outside London, swap PTAL for “Distance to Train/Bus/Rapid Transit”.  
- Verify flat-roof/height filters; if missing, use roof-type tags or manual desktop checks.  
Strategic Notes:  
- Add structural capacity pre-check (engineer desktop review) before paying for surveys to de-risk spend.

**Approach D (Claude) - Status: CONDITIONAL**  
Reasoning: Option-led promotion fits budget (£80k–£160k) but very long timeline (2–5 years). ROI plausible if allocation achieved.  
Technical Issues:  
- Filters like “Distance to adopted/emerging settlement boundary” and “Developed area percentage” may not exist; EPC on large titles may be sparse.  
Suggested Fixes:  
- Verify boundary/density filters; if absent, use planning layer overlays (built-up area, housing zones) plus manual GIS checks.  
- If EPC coverage is thin, use “No latest sold date” + low application count + land use to proxy legacy holdings.  
Strategic Notes:  
- Expect low hit rate; run a larger initial pool and stage-gate spend post-call-for-sites submissions.

**Approach E (Claude) - Status: INVALID**  
Reasoning: Core filters (“Currently has HMO”, “HMO License Expiry Date”, “Article 4 Directions”) are unlikely to exist in the standard filter set; without them the search isn’t actionable. Volume requirement (18–30 deals) also strains supply.  
Technical Issues:  
- HMO licensing datasets and expiry dates not confirmed available; Article 4 may be a constraint layer, not a direct filter.  
Suggested Fixes:  
- If platform supports HMO data: confirm exact field names; otherwise pivot to proxies (Use class C4, Council tax banding anomalies, historic planning for HMOs) and manually check Article 4 maps.  
Strategic Notes:  
- Consider shrinking volume target or pairing with another approach to reach £2M.

**Global Note:** `AvailableFiltersInSearchLand_ACTUAL.md` was not found, so filter existence checks are inferred from prior patterns; please validate key filters in the UI before running. Next steps: 1) open the live filter list to confirm the flagged filters; 2) split range filters into separate lines for reliability; 3) align geography (PTAL) and data coverage (HMO/licensing) before execution.
