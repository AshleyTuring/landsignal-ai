# **APPROACH E: Class MA Broad Distress**

**Status:** ✅ VALID  
**Original LLM:** Codex  
**Pattern:** Pattern 2D (Liquidation) + Pattern 8C (EPC compliance) + Class MA PDR  
**Capital Required:** £12M-£55M  
**Expected Results:** 15-30 properties (Zone 1, may skew to 10-15 with price refinement)

## **SearchLand AI Prompt (Copy-Paste Ready)**

```
1. Sales listing price: is greater than 5000000
2. Sales listing price: is less than 60000000
3. Property floor area (sqft): is greater than 2000
4. EPC rating: is one of [E, F, G]
5. Company status: is one of [Liquidation, Administration]
6. Latest sold date: is before 2015-01-01
```

## **Rationale**
Uses Class MA preset foundation (Preset #32) to surface office/retail blocks eligible for PDR. Layers **double distress**: insolvency (liquidation/administration) + EPC E-G. Long-hold signal (sold before 2015) adds price tension. 2k+ sqft floor (lower than Approach A's 10k) captures smaller opportunities. Broader filters than Approach A = higher volume but requires more screening.

## **Strengths**
- **Strong motivation stack:** Liquidation + poor EPC + long hold
- **PDR route:** Reduces planning risk (56-day approval)
- **Broader size range:** 2k+ sqft captures smaller opportunities (£5M-£20M range)
- **Higher volume:** Less restrictive filters = more properties to screen

## **Limitations**
- **Requires Class MA preset:** Must apply Preset #32 first, then add filters (two-step process)
- **Smaller floorplates:** 2k sqft properties may have limited conversion potential
- **EPC data gaps:** Poor EPC properties may have data quality issues
- **Tired assets:** Liquidation properties often have deferred maintenance (higher capex risk)

## **Implementation Strategy**
1. **Step 1:** Apply SearchLand Preset #32 "Class MA eligible commercial sites"
2. **Step 2:** Add filters above to preset results
3. **Week 1:** Screen by floor area bands: 2k-10k sqft (smaller), 10k-30k sqft (mid), 30k+ sqft (large)
4. **Week 2:** Prioritize liquidation status (strongest motivation) + EPC F-G (worst ratings)
5. **Month 2:** Contact liquidators/administrators directly (Land Registry for contact details)
6. **Due diligence:** Class MA eligibility confirmation (E use class, vacancy, size limits), building survey, GDV assessment
7. **Timeline:** 30-90 days acquisition, 12-18 months conversion, 24-30 months total ROI

## **Capital Breakdown**
- **Acquisition:** £5M-£55M (£5M-£20M for smaller properties, £20M-£55M for larger)
- **Building survey:** £5k-£30k
- **Class MA prior approval:** £5k-£15k
- **Conversion costs:** £200-£350/sqft (luxury spec, 2k-60k sqft = £400k-£21M)
- **Contingency (10%):** £1M-£9M
- **Total:** £12M-£55M

## **Next Steps**

**Proceed to Stage 4: Refinement & Validation**

1. Apply SearchLand Preset #32 first
2. Copy filters above as refinements
3. Segment results by floor area (2k-10k, 10k-30k, 30k+)
4. Document which size bands yield best margins in LEARNINGS_DATABASE.md

---

