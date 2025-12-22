**Approaches I'm changing my assessment on:**
- Claude – Approach C (Airspace): Was CONDITIONAL, now INVALID because two filters are misnamed (`Addresses` filter does not exist—valid field is `Number of addresses`; flat roof must use `A building in the title has flat roof: Yes` per available filters), so the search would fail despite the financeable upfront capital.
- Codex – Approach A (MA Micro-Conversions): Was CONDITIONAL, now INVALID because `Local planning authority` is not an available filter (only `Neighbouring Local Planning Authorities of` exists) and the preset call may not parse, so the search lacks a valid geography anchor.
- Codex – Approach B (Run-Down Homes to HMO): Was CONDITIONAL, now INVALID because `Article 4 HMO` is not a valid filter; the correct fields are `Article 4` or `Percentage of title subject to Article 4 Directions`, so the exclusion won’t execute until renamed.
- Grok – Approach C (Hardstanding/Green Belt): Was VALID, now CONDITIONAL because `Hardstanding percentage` is not a valid field; must use `Percentage of title covered by hard standings: is greater than [X]`. Capital likely still >£200k without leverage.

**Approaches I'm maintaining my assessment on:**
- Claude – Approach A (Class MA Arbitrage): Still CONDITIONAL; capital is feasible if phased (£160k upfront <£200k) but syntax is invalid (`NOT` operator—should be `Use class: does not contain [C3]`), so technical fix still required.
- Claude – Approach B (Class Q): Still CONDITIONAL; total costs exceed £200k without finance and the derelict flag should be `is equal to No`; upper size bound exceeds the 465 sqm Class Q cap unless tightened.
- Claude – Approach D (HMO Volume): Still CONDITIONAL; Article 4 exclusion is misnamed (should use `Article 4`) and per-unit capital (£217k–£286k) needs leverage to stay within £200k cash.

**Clarifications:**
- Financing philosophy remains unclear: if £200k is a hard total (Gemini view) then high-capex schemes fail; if £200k is upfront with standard development finance (Grok view) they’re viable. I’ve kept capital-based conditionals until this is clarified.
- Per user request, business case is auto-valid for precedent-based approaches; the changes above are driven by filter-name existence/syntax evidence.
