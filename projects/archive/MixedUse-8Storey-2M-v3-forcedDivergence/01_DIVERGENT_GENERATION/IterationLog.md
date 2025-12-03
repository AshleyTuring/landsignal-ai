# Divergent Approach Generation Log

**Project:** MixedUse-8Storey-2M-v3  
**Date:** 2025-11-19  
**System Version:** 3.1 (Divergent + Preset Analysis)

---

## Generation Process

### Claude Approaches ✅ COMPLETE
**Generated:** 2025-11-19
- **Approach E:** Corporate Distress Combo - `ApproachE_Claude_CorporateDistressCombo.md`
  - **Strategy:** Liquidation + Lease Expiry (double motivation)
  - **Source:** Pattern 2D (User discovery) + Pattern 8B (Preset #17, #66, #68)
  - **Innovation:** Combines two strong motivation signals (never combined in presets)
  
- **Approach F:** Commercial Airspace Conversion - `ApproachF_Claude_AirspaceConversion.md`
  - **Strategy:** Flat roof commercial buildings, add 4-6 storeys residential
  - **Source:** Pattern 6A (FILTER_PATTERNS) + Presets #22-#25
  - **Capital Model:** Airspace rights £80k-£150k (not freehold purchase)

**Key Insights:**
- Approach E = Regulation-driven (VERY targeted, strong motivation)
- Approach F = Infrastructure-based (Moderate targeting, capital efficient)
- Completely different strategies (regulation vs airspace vs stalled planning)

---

### Gemini Approaches ⏳ PENDING
**To Generate:** 2025-11-19

**Suggested Strategies (for DIVERSITY):**

**Approach A: Stalled Planning Proxy**
- Use Pattern 1A (Stalled Planning) with improved proxy filters
- "Applications in last 5 years: is less than 3" (not "= 0")
- Combine with "Proposal contains mixed-use AND storey"
- Add motivation: "Building on title is inactive: Yes"

**Approach B: EPC Compliance Pressure**
- Use Pattern 8C (EPC Compliance) - NEW from presets!
- "EPC rating: is one of E, F, G" (cannot rent since 2020)
- "No latest sold date" OR "Latest sold date before 2010" (long hold)
- "Less than 1 application in last 5 years" (passive owner)
- Target: Private owners (not professional landlords)

**Prompt for Gemini:**
```bash
cat projects/MixedUse-8Storey-2M-v3/00_REQUIREMENTS/Requirements.md \
    SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md \
    FILTER_PATTERNS.md \
    PRESET_STRATEGY_GUIDE.md | \
gemini -p "Generate 2 DISTINCT filter strategies for the requirements.

CRITICAL:
- Be DIFFERENT from Claude's approaches (no liquidation, no airspace)
- Consider: Stalled planning (Pattern 1A), EPC compliance (Pattern 8C), 
  Grey Belt (Pattern 9A), Strategic land (Pattern 11A)
- Output STRUCTURED format (numbered list with exact filter names)
- Each approach in separate section with strategic rationale

Use LEARNINGS_DATABASE and PRESET_STRATEGY_GUIDE insights."
```

---

### Codex Approaches ⏳ PENDING
**To Generate:** 2025-11-19

**Suggested Strategies (for DIVERSITY):**

**Approach C: Grey Belt Exception**
- Use Pattern 9A (Grey Belt) - NEW from presets!
- Target: Previously developed land in Green Belt
- "Percentage of title covered by hardstanding: is greater than 25"
- "Green belt" OR "Percentage of title covered by Green Belt land: is greater than 10"
- "Within 100m of built up area"
- Innovation: Access Green Belt locations (cheaper, less competition)

**Approach D: Emerging Allocation First-Mover**
- Use Pattern 11A (Strategic Land) - NEW from presets!
- "Housing allocation (emerging)" OR "Mixed allocation (emerging)"
- "Less than 1 max dwellings applied for" (no planning yet)
- "4,000-40,000 sqmt" (1-10 acres)
- Strategy: Be first to apply for planning on allocated sites

**Prompt for Codex:**
```bash
cat projects/MixedUse-8Storey-2M-v3/00_REQUIREMENTS/Requirements.md \
    SearchlandContext/AvailableFiltersInSearchLand_ACTUAL.md \
    FILTER_PATTERNS.md \
    PRESET_STRATEGY_GUIDE.md > /tmp/codex_divergent.txt

echo "Generate 2 DISTINCT filter strategies for the requirements.

CRITICAL:
- Be DIFFERENT from Claude (no liquidation/airspace) and Gemini (no stalled/EPC)
- Consider: Grey Belt (Pattern 9A), Strategic land (Pattern 11A), 
  High PTAL redevelopment, Renewable energy pivot
- Output STRUCTURED format (numbered list with exact filter names)
- Each approach in separate section

Use PRESET insights and LEARNINGS." >> /tmp/codex_divergent.txt

codex exec --skip-git-repo-check "$(cat /tmp/codex_divergent.txt)"
```

---

## Diversity Analysis

**Target: 4-6 DIFFERENT strategic approaches**

### Approaches Generated So Far:

| Approach | Strategy Type | Source | Capital Model | Targeting |
|----------|---------------|--------|---------------|-----------|
| **E (Claude)** | Regulation-Driven | Pattern 2D + 8B, User discovery | Distressed purchase/option | Very narrow |
| **F (Claude)** | Airspace Development | Pattern 6A, Presets #22-25 | Airspace rights | Moderate |
| **A (Gemini)** | TBD - Suggest: Stalled Planning | Pattern 1A | Option/purchase | Narrow |
| **B (Gemini)** | TBD - Suggest: EPC Compliance | Pattern 8C, Presets | Purchase | Moderate |
| **C (Codex)** | TBD - Suggest: Grey Belt | Pattern 9A, Presets #7,44 | Purchase | Moderate |
| **D (Codex)** | TBD - Suggest: Strategic Land | Pattern 11A, Preset #38 | Option | Narrow |

### Diversity Checklist:
- [✅] Regulation-driven (Approach E - liquidation/lease)
- [✅] Airspace/Infrastructure (Approach F - flat roofs)
- [⏳] Stalled Planning (Approach A - suggested for Gemini)
- [⏳] EPC Compliance (Approach B - suggested for Gemini)
- [⏳] Green Belt Workaround (Approach C - suggested for Codex)
- [⏳] Strategic Land (Approach D - suggested for Codex)

**Good Diversity:** ✅ Multiple categories, different capital models, different motivations

---

## Key Innovations This Round

### Using v3.1 Preset Knowledge:

**Approach E Innovations:**
- **First time combining** liquidation + lease expiry (not in any preset)
- Uses user discovery (Company status: Liquidation)
- Uses preset insight (Lease end date from #17, #66, #68)
- Double motivation = novel targeting

**Approach F Innovations:**
- Capital-efficient model (airspace £80k-150k vs freehold £500k+)
- Direct application of Presets #22-#25 (airspace)
- Multiple property strategy within £200k budget
- Recycling capital model (3x £60k profits → £180k to reinvest)

**System Improvements vs v2:**
- Detailed capital breakdowns (learned from v2 errors)
- Multiple exit scenarios (flip, JV, develop)
- Explicit profit projections with calculations
- Risk mitigation strategies
- Implementation notes (timelines, deal structures)

---

## Next Steps

1. **Complete Generation:** Run Gemini and Codex (4 more approaches)
2. **Stage 2:** Validity Check (all 6 approaches)
   - Technical validation only (not quality)
   - Use `02_VALIDITY_CHECK/ValidationMatrix.md`
3. **Stage 3:** Parallel Testing (all valid approaches)
   - Test in SearchLand AI
   - Document results per geography
4. **Stage 4:** Learning Capture
   - Extract universal insights
   - Update LEARNINGS_DATABASE if new discoveries

---

**Status:** 2/6 approaches complete (Claude done, awaiting Gemini & Codex)  
**Quality:** High - comprehensive detail, clear rationales, validated sources  
**Diversity:** Good - very different strategies (regulation vs infrastructure)  
**Next:** User to generate Gemini & Codex approaches OR proceed to validation
