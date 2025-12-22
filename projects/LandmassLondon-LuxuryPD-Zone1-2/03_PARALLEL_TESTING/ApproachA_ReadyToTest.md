# **APPROACH A: Class MA Premium Liquidation**

**Status:** ✅ VALID  
**Original LLM:** Claude  
**Pattern:** Pattern 2D (Liquidation/Administration forced sale) + Class MA PDR  
**Capital Required:** £10M-£50M  
**Expected Results:** 5-15 properties (Zone 1-2, highly targeted)

## **SearchLand AI Prompt (Copy-Paste Ready)**

```
1. Use class: contains any [E - Commercial Business and Service, E(a), E(b), E(c)(i), E(c)(ii), E(c)(iii), E(d), E(e), E(f), E(g)(i), E(g)(ii), E(g)(iii)]
2. Tenure: is one of [Freehold]
3. Property floor area (sqft): is greater than 10000 AND less than 150000
4. Ownership type: is equal to [Company]
5. Company status: is one of [Liquidation, In Administration]
6. Building on title is derelict: Yes OR Building on title is inactive: Yes
7. NOT Use class: contains [C3 - Dwellinghouses]
8. NOT Planning constraints: contains any [Flood Zone 3, SSSI, Ancient Woodland]
9. Distance to nearest Train Station (m): is less than 800
10. PTAL: contains any [4, 5, 6a, 6b (Best)]
```

## **Rationale**
Class MA permitted development route provides 56-day approval vs 8-12 months traditional planning. Liquidation/Administration status creates **forced sale** context (Pattern 2D) - strongest motivation signal with legal obligation to divest. Derelict/inactive filters add secondary motivation (non-performing asset). Size range (10k-150k sqft) targets £10M-£40M Zone 1-2 commercial values. PTAL 4+ ensures premium residential location post-conversion. <800m train station reinforces luxury positioning.

## **Strengths**
- **Maximum seller motivation:** Legal obligation to sell (liquidators/administrators)
- **PDR speed advantage:** 56-day approval vs 8-12 months traditional planning
- **Below-market pricing:** 15-25% discount typical in forced sales
- **Cash buyer advantage:** Liquidators prioritize speed and certainty
- **Premium locations:** PTAL 4+ + train proximity = luxury residential demand

## **Limitations**
- **Very limited pool:** Corporate liquidations rare in Zone 1-2
- **Building condition risk:** Deferred maintenance common in distressed assets
- **Class MA restrictions:** 2-year prior use requirement, size limits (<1,500 sqm)
- **Competition:** Other cash buyers target liquidation sales

## **Implementation Strategy**
1. **Week 1:** Run filter across Westminster, City of London, Camden, K&C (Zone 1 LPAs)
2. **Week 2:** Expand to Tower Hamlets, Southwark, Islington, Hackney if <5 results
3. **Week 3:** Prioritize properties with triple motivation (liquidation + derelict + EPC E-G)
4. **Week 4:** Land Registry search for liquidator/administrator contact details
5. **Month 2:** Approach with fast-track acquisition proposal (cash, no financing contingency)
6. **Due diligence:** Building survey (£10k-£30k), Class MA eligibility confirmation, GDV assessment
7. **Timeline:** 30-90 days acquisition, 12-18 months conversion, 24-30 months total ROI

## **Capital Breakdown**
- **Acquisition:** £8M-£40M (liquidation discount 15-25% below market)
- **Building survey:** £10k-£30k
- **Class MA prior approval:** £5k-£15k
- **Conversion costs:** £150-£200/sqft (luxury spec, 10k-150k sqft = £1.5M-£30M)
- **Contingency (10%):** £1M-£7M
- **Total:** £10M-£50M

## **Next Steps**

**Proceed to Stage 4: Refinement & Validation**

1. Copy SearchLand AI prompt above
2. Paste screenshot of what SearchLand AI actually created
3. Run validation script to check accuracy (compare intended vs actual)
4. Update prompts based on issues + update LEARNINGS_DATABASE.md
5. Document results & property screenshots

Then continue to Stage 5 (Site Validation) and Stage 6 (Deep Research).

**Full workflow documented in project README.md**

---

