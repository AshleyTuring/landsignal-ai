**Approaches I'm changing my assessment on:**
- Codex Approach B (HMO, Article 4): Was “needs filter verification,” now “filter exists but rename” because SearchLand’s reference list includes `Article 4` and `Percentage of title subject to Article 4 Directions` (see constraint list ~lines 580–600). Use `Planning constraints: does not contain [Article 4]` or the percentage metric instead of “Article 4 Direction: …”. Business case remains conditional on throughput/leverage.
- Claude Approach D (High-PTAL London): Was “conditional if JV,” now “fails stated £200k equity cap unless JV explicitly allowed.” The equity need was £225k+, so it breaches the budget; only becomes conditional if the user pre-approves JV/co-invest to bridge the gap.

**Approaches I'm maintaining my assessment on:**
- Codex Approach A: Still INVALID on filters because `Property type` cannot include “Mixed Use” (allowed values are Detached/Semi-Detached/Terraced/Flat/Commercial) and `Use class: contains all [E, C3]` is overly strict for single-class titles.
- Codex Approach C: Still INVALID due to `Title area (sqft)` (units must be acres), invalid property type value, and unverified footfall/lease-end filter names; prompt is not executable as written.
- Codex Approach B (HMO strategy fit): Still CONDITIONAL for business case—yield/room-by-room plays can reach £2M only via multiple conversions with financing cycles. Not rejecting it outright; it just requires volume beyond single-asset capital.
- Gemini Approach C (EPC arbitrage): Still CONDITIONAL—small per-asset gains demand high volume; feasible with leverage/rapid recycling, but not a single-deal £2M win.

**Clarifications:**
- Article 4 filter existence: It is available in SearchLand under constraints (`Article 4`; `Percentage of title subject to Article 4 Directions`). Gemini’s “non-existent” call is incorrect; the issue is naming the filter correctly.
- Budget rule: I’m treating the £200k equity cap as hard unless the user authorizes JV/partner funding; otherwise any plan requiring >£200k equity is invalid on capital fit.
