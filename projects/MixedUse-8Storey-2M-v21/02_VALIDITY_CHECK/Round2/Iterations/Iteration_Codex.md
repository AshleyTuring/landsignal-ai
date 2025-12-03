**Approaches I'm changing my assessment on:**
- Claude – Approach A (Precedent Replication, Slough): Was CONDITIONAL, now INVALID because Filter 2 uses an inline `OR` (`Proposal: contains "retail" OR "commercial"`), which is explicitly disallowed—list filters must use `contains any [value1, value2]` per Available Filters guidance (no boolean operators inside a single filter line).
- Claude – Approach D (Legacy Holdings + Edge of Settlement): Was CONDITIONAL assuming “No latest sold date: Yes” existed; still CONDITIONAL but now flagged as undocumented/untested. Evidence: not listed in AvailableFiltersInSearchLand_ACTUAL; only seen in presets, so it’s an unconfirmed field—needs live UI test or proxy (e.g., low applications + old transactions).
- Claude – Approach C (Airspace Rights): Was CONDITIONAL due to suspected missing “flat roof” filter; still CONDITIONAL but filter existence concern removed. Evidence: “A building in the title has flat roof” is documented in AvailableFilters; remaining technical caveat is PTAL being London-only—must geo-scope to London or swap to distance-to-station outside London.
- Grok – Approach A (Slough Mixed-Use Precedent Replication): Was CONDITIONAL without capital critique; still CONDITIONAL but now flagged for capital structure inconsistency (options at £10k–£20k vs £150k acquisition). Business case stays auto-valid (precedent-based per instruction), but execution needs a single, coherent route (option-led or acquisition-led).

**Approaches I'm maintaining my assessment on:**
- Grok – Approach C (HMO License Deadline): Still VALID; EPC filter syntax with brackets (`EPC rating: is one of [E, F, G]`) is correct for a list enum—Gemini’s “missing brackets” concern appears to be a misread.
- Codex – Approach A (Slough Intensification): Still INVALID; `Decision: is equal to Approved`/planning-status filter does not exist in AvailableFilters, so the prompt is unexecutable until the filter is replaced with supported planning proxies (date ranges + proposal keywords).

**Clarifications:**
- Precedent-based approaches: business case is auto-valid; only technical/filter accuracy is assessed. For Grok A, clarify capital path but keep business case accepted per instruction.
- OR usage inside a single filter line is never valid in SearchLand; must use list operators like `contains any` or `is one of` with brackets.
