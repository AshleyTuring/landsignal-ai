**Approaches I'm changing my assessment on:**
- Claude Approach A (Slough precedent replication): Was ⚠️ CONDITIONAL; now ❌ INVALID technically because Filters 8-9 use boolean free-text “Yes”/“No” instead of `is equal to Yes/No`, and Filter 2 needs `contains any [...]` (no inline OR). Business case auto-valid per precedent rule; blocked on syntax.
- Gemini Approach C (EPC Arbitrage): Was ⚠️ CONDITIONAL; now ❌ INVALID for business alignment because user asked for development-type outcomes and this requires ~60–80 small trades to reach £2M. Technically fine, but strategy is a different business model, so reject rather than defer.
- Claude Approach D (High-PTAL London): Was ⚠️ CONDITIONAL; now ❌ INVALID on capital feasibility. Base equity need (~£225k) exceeds the hard £200k cap; JV restructuring is speculative and not within stated constraint, so treat as budget breach.

**Approaches I'm maintaining my assessment on:**
- Codex Approach A/C and Grok Approach A (property type “Mixed Use”): Still ❌ INVALID technically; `Property type` only accepts [Detached, Semi-Detached, Terraced, Flat, Commercial]. No business case change.
- Codex Approach C (Brand Covenant Expiry): Still ❌ INVALID technically; `Title area (sqft)` not a filter—must be acres. Business case not considered until units fixed.
- Claude Approach C (Legacy Holdings Conversion): Still ❌ INVALID technically until “Latest sold date” is converted to a real filter (e.g., `is before 1980-01-01` or `is blank` if supported). Business case unchanged.
- Grok Approach B (Derelict Turnaround): Still ⚠️ CONDITIONAL business case—volume of 3–5 sites needed to hit £2M; filters are technically sound.

**Clarifications:**
- Boolean filters must use operators (`is equal to Yes/No`); plain “Yes/No” text is invalid—this affected Claude A Filters 8-9 and similar boolean lines elsewhere.
- OR syntax inside a single list filter line is unsupported; use `contains any [...]` instead.
- For precedent-based approaches the business case is accepted; only syntax/validity gates apply.
