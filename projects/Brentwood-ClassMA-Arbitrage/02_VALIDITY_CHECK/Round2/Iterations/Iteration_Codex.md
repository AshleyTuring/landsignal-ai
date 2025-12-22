Approaches I'm changing my assessment on:
- Gemini – Approach A (Class MA Low Capital): Now INVALID because `Sales listing currently on the market` is a boolean that requires `is equal to Yes/No`; bare `Yes` is non-parsable per SearchLand filter list (boolean operators section showing “is equal to Yes” examples). This must be fixed before the query will run.
- Gemini – Approach B (Vacant Commercial Conversion): Now INVALID for the same boolean reason (`Sales listing currently on the market` needs `is equal to No`), plus the applications line should be `Applications in the last 5 years: is less than 1` per the documented numeric operator format. Until those are corrected, the syntax will fail.

Approaches I'm maintaining my assessment on:
- Claude – Approach A (Class MA Arbitrage): Still INVALID syntax because `NOT: Use class contains [C3]` uses a forbidden boolean prefix; the allowed exclusion operator for list filters is `does not contain` (see Filter Operators table). Correct form: `Use class: does not contain [C3 - Dwellinghouses]`.
- Claude – Approach B (Class Q Agricultural): Still INVALID naming because the available filter is `Agricultural land classification` (values Grade 1–5); `Agricultural Land Grade` is not listed in the SearchLand filters and will not parse.
- Claude – Approach D (Volume HMO): Still INVALID value because the constraint is `Article 4` (or `% of title subject to Article 4 Directions`), not `Article 4 Direction - HMO`. Use `Article 4: does not contain [Article 4]` or the percentage filter.
- Business case – Gemini Approach A over-constraint: Still unviable without relaxing filters; stacking on-market + freehold + <£150k + 500–2,000 sqft + other constraints is highly likely to drive 0–5 results. No evidence in the prompt of alternative deal flow (off-market) or price/area flex, so expected volume remains near-zero.

Clarifications:
- Grok – Approach B (Infill Development): I need the actual prompt text to conclusively answer the binary “Use class filter present?” dispute. If `Use class: contains all [C3 - Dwellinghouses]` (or similar) is absent, the approach is incomplete; if it is present, the earlier critique can be relaxed. Please provide the exact filter block to resolve this.
