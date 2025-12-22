**Claude - Approach A: Class MA Arbitrage: CONDITIONAL**  
Reasoning: Filters mostly valid but exclusion syntax is wrong, and total project cost can exceed £200k without bridging/phasing.  
Technical Issues:  
- `NOT: Use class contains [C3]` is invalid; use `Use class: does not contain [C3 - Dwellinghouses]`.  
- Tenure line should use `Tenure: is one of [Freehold]`.  
- Capital stack totals £195k-£270k; needs explicit finance or scope reduction to keep within £200k.  
Suggested Fixes: Correct the syntax above and state bridging/ staged capex or tighten size/price to stay within £200k.

**Claude - Approach B: Class Q Agricultural Conversion: CONDITIONAL**  
Reasoning: Strategy feasible with bridging, but key filters are misnamed.  
Technical Issues:  
- `Agricultural Land Grade` should be `Agricultural land classification` (values Grade 1-5).  
- Boolean should read `Building on title is derelict: is not equal to Yes`.  
Suggested Fixes: Rename the filters as above; keep bridging/JV financing explicit to cover £100k-£150k conversion beyond cash.

**Claude - Approach C: Mixed-Use Airspace: CONDITIONAL**  
Reasoning: Financing approach is viable, but two filters are invalid.  
Technical Issues:  
- Flat roof filter should be `A building in the title has flat roof: Yes`.  
- `Addresses: is less than 8` is invalid; correct to `Number of addresses: is less than 8`.  
Suggested Fixes: Fix filter names; keep dev finance noted for £600k-£800k build since user capital only covers £50k-£105k.

**Claude - Approach D: Volume HMO Opportunities: CONDITIONAL**  
Reasoning: HMO plan workable, but one filter value is invalid and first deal exceeds cash unless financed.  
Technical Issues:  
- `Planning constraints: does not contain [Article 4 Direction - HMO]` is not a valid constraint value; use `Article 4: does not contain [Article 4]` or `Percentage of title subject to Article 4 Directions: is less than 1`.  
- Per-property total £217k-£286k > £200k; needs explicit bridging/refinance on deal 1.  
Suggested Fixes: Correct Article 4 filter; state financing for any spend over £200k.

**Codex - Approach A: MA Freehold Micro-Conversions: INVALID**  
Reasoning: Uses non-existent filters, so the prompt won’t run as written.  
Technical Issues:  
- `Local planning authority` filter does not exist.  
- `Preset: equals Class MA eligible commercial sites` is not a valid filter.  
- No price filter; capital exposure uncontrolled.  
Suggested Fixes: Drop preset/local authority lines; add `Sales listing price` or GDV/area proxy to cap cost; rebase on actual filters (Use class E list + Freehold + size/height).

**Codex - Approach B: Large Low-EPC Houses to HMO: INVALID**  
Reasoning: Multiple invalid filters prevent execution.  
Technical Issues:  
- `Local planning authority` and `Preset` filters do not exist.  
- `Addresses` should be `Number of addresses`.  
- `Article 4 HMO` is not a valid filter/value; use `Article 4`/percentage coverage.  
Suggested Fixes: Replace invalid filters with existing ones; add acquisition price cap to enforce £140k-£190k budget.

**Gemini - Approach A: Class MA Arbitrage (Low Capital): CONDITIONAL**  
Reasoning: Filters exist but syntax and constraint stack risk zero results.  
Technical Issues:  
- Boolean should be `Sales listing currently on the market: is equal to Yes`.  
- Very tight stack (500-2,000 sqft, <£150k, on-market, freehold) may return zero.  
Suggested Fixes: Fix boolean syntax; consider easing price/size or dropping on-market requirement to get viable volume.

**Gemini - Approach B: Vacant Commercial Conversion: CONDITIONAL**  
Reasoning: Sound off-market strategy; minor syntax issues.  
Technical Issues:  
- Boolean should be `Sales listing currently on the market: is equal to No`.  
- Applications filter should be `Applications in the last 5 years: is less than 1`.  
Suggested Fixes: Correct booleans; otherwise technically and financially coherent within £200k.

**Grok - Approach A: Class MA Conversion: CONDITIONAL**  
Reasoning: Filters valid, but no acquisition price cap—results may exceed £200k.  
Technical Issues:  
- Missing `Sales listing price`/GDV proxy to enforce capital feasibility.  
Suggested Fixes: Add price cap (e.g., `< £200,000`) or floor-area/GDV guardrail; otherwise syntax is fine.

**Grok - Approach B: Infill Development: CONDITIONAL**  
Reasoning: Technically coherent, but capital control and use-class specificity for infill are light.  
Technical Issues:  
- No price cap; sites may exceed £150k target.  
Suggested Fixes: Add `Sales listing price: is less than 150000` (or similar) and keep Use class C3; consider `Applications in the last 5 years: <1` to reinforce “stale” owners if desired.

**Grok - Approach C: Grey Belt Workaround: CONDITIONAL**  
Reasoning: Concept viable; one filter misnamed and no price control.  
Technical Issues:  
- `Hardstanding percentage` is invalid; correct to `Percentage of title covered by hard standings: is greater than 25`.  
- No price cap risks breaching £200k.  
Suggested Fixes: Rename hardstanding filter and add a sales price or size/value proxy to enforce budget.

Next steps: apply the noted filter fixes and add explicit capital controls/finance notes, then rerun each search to confirm result counts and feasibility.
