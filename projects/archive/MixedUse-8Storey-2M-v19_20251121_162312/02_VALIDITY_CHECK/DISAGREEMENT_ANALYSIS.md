# DISAGREEMENT ANALYSIS REPORT

After analyzing all four critique files for technical and business case disagreements, I have identified the following:

---

## DISAGREEMENTS_FOUND: YES

---

### Disagreement #1
**Type:** Business Case - Construction Capital Feasibility  
**Approaches:** Grok - Approach B: Derelict Urban Turnaround  
**Positions:**
- **Claude:** Initially marked VALID, then changed to INVALID after further review. "£10M gap cannot be rationalized as 'execution risk'. Approach explicitly describes construction, not planning-only." States the £100k-£150k budget with £30-50k for construction cannot fund an 8-storey build requiring £10M-£15M.
- **Codex:** INVALID. "Construction budget/ROI math is fundamentally wrong—£30k-£50k for 'initial construction' cannot produce or even meaningfully start an 8-storey mixed-use building... orders of magnitude below real-world costs."
- **Gemini:** INVALID. "The proposed capital plan (£100k-£150k total) allocates only £30k-£50k for 'initial construction' to deliver an 8-storey mixed-use building. This budget is unrealistic by orders of magnitude."
- **Grok:** INVALID. "Business case invalid due to unrealistic construction capital (iterations confirm £100k-£150k insufficient for 8-storey build)."

**Impact:** Critical  
**Requires iteration:** NO  
**Note:** This is unanimous agreement that the approach is INVALID, not a disagreement. All LLMs concur the business case fails.

---

### Disagreement #2
**Type:** Planning Law Interpretation / Business Case Validity  
**Approaches:** Grok - Approach C: Permitted Development Mixed-Use Conversion  
**Positions:**
- **Claude:** CONDITIONAL (not INVALID). "Gemini wrong: Class MA Part 20 IS for airspace development. SearchLand has 'Percentage profit (Class MA only)' filter - validates strategy. BUT unit error (sqft vs acres) is CRITICAL."
- **Codex:** INVALID. "Business logic assumes Class MA can add airspace floors, but the prior-approval route only converts existing E-class floor area; new storeys would still need full planning and far more than the £120k-£180k budget."
- **Gemini:** INVALID. "The strategy to use Class MA PDR to create an '8-storey equivalent' is incorrect. Class MA allows for change of use and, under Part 20, upward extensions of typically only two storeys. It cannot be used for large-scale airspace development to achieve an 8-storey height."
- **Grok:** CONDITIONAL. Business case marked "auto-valid as precedent-based." Technical issues noted but no planning law validity challenge.

**Impact:** Critical  
**Requires iteration:** YES  
**Nature of Disagreement:** Claude asserts Class MA Part 20 DOES support airspace development (citing SearchLand's Class MA filter as evidence), while Codex and Gemini assert it only allows change of use + limited upward extension (typically 2 storeys), not large-scale 8-storey development. This is a factual dispute about what Class MA permits under UK planning law.

---

### Disagreement #3
**Type:** Filter Syntax - Price Format  
**Approaches:** Multiple (Codex A, Codex B, Codex C, Grok B, Grok C)  
**Positions:**
- **Claude:** "⚠️ Currency/Date Formats: Acknowledging Uncertainty. Cannot definitively confirm without testing. Codex likely correct on bare integers for prices. Marking affected approaches CONDITIONAL pending Phase 1 testing."
- **Codex:** Definitive. "Filter 10 keeps the `£2,000,000` price format with currency symbol/comma; the documented working syntax uses bare integers (LEARNINGS_DATABASE.md:801-806)." Applied consistently to all approaches.
- **Gemini:** Definitive. "Price filters require bare integers without currency symbols or commas." Applied consistently to all approaches.
- **Grok:** Definitive but cautious. "Sales listing price: is less than £2,000,000 (may require bare integer 2000000)." Uses "may require" language but treats as needing correction.

**Impact:** Minor (affects executability but easily fixable)  
**Requires iteration:** NO  
**Nature of Disagreement:** Claude acknowledges uncertainty and cannot definitively confirm syntax requirements, while other three LLMs assert with confidence that bare integers are required. This is a technical documentation interpretation disagreement, but all agree it needs testing/fixing before execution.

---

### Disagreement #4
**Type:** Filter Existence - Property Classification vs Use Class  
**Approaches:** Gemini - Approach A: Urban Intensification  
**Positions:**
- **Claude:** CONDITIONAL. "Filter 4: ❌ MIXING TWO SEPARATE FILTERS. 'Car park'/'Unused land' are Property Classification, NOT Use Class. Evidence: SearchLand lists these as distinct filters. Fix: Split into two filters."
- **Codex:** CONDITIONAL. "Filter 4 mixes valid strings with an invalid `Car park` value—SearchLand expects the full dropdown text such as `Car/coach/commercial vehicle/taxi parking`, `Public car parking`, or `Car park space`."
- **Gemini:** CONDITIONAL. "Filter 4... incorrectly combines a `Use class` value with `Property classification` values ('Car park', 'Unused land'). These are separate filters in SearchLand."
- **Grok:** CONDITIONAL. "Use class: is one of 'E - Commercial, Business and Service', 'Car park', 'Car/coach/commercial vehicle/taxi parking', 'Unused land' (mixes Use class and Property classification; separate)."

**Impact:** Minor (all agree it's wrong and needs fixing)  
**Requires iteration:** NO  
**Nature of Disagreement:** Not a true disagreement—all four agree the filter mixing is invalid. The subtle difference is Codex suggests the values might work if using full dropdown text, while others say they must be separated into two distinct filters. This is a minor implementation detail disagreement.

---

## SUMMARY

**True Disagreements Requiring Resolution: 2**

1. **Critical**: Grok C planning law validity (Class MA scope for airspace development)
2. **Minor**: Price format syntax certainty level (though all agree testing needed)

**Unanimous Agreements (Not Disagreements):**
- Grok B construction capital is invalid
- Constraint exclusion syntax ("does not contain", "NOT:") is invalid across all approaches
- Date format must be ISO YYYY-MM-DD
- Filter taxonomy mixing (Gemini A) is invalid

**Strategic Differences (Correctly Excluded):**
- Priority rankings vary but no LLM disputes another's ranking
- Testing sequence preferences differ (philosophical, not technical)
- Capital range interpretations vary within acceptable bounds

---

## RECOMMENDATION

**Requires Iteration:** YES, for Grok - Approach C only

**Specific Question for Resolution:**
Does Class MA Permitted Development Right under Part 20 support the creation of 8-storey equivalent airspace development as claimed by Claude, or is it limited to change of use + 2-storey upward extensions as claimed by Codex and Gemini?

**Evidence to Gather:**
1. Official UK Planning Portal guidance on Class MA Part 20 scope
2. SearchLand's "Percentage profit (Class MA only)" filter documentation
3. Case law or precedent examples of Class MA applications for multi-storey airspace

**All Other Approaches:** Can proceed to syntax correction and testing. No blocking disagreements on business case validity or filter existence for the remaining 9 approaches.
