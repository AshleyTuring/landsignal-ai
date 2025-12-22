### Approach A: MA Distress – Liquidation + Low EPC
**Base Preset:** #32 "Class MA eligible commercial sites"  
**Refinements Applied:** Motivation (liquidation + low EPC) + Scale (2k+ sqft) + Price (£5M-£60M)  
**Strategic Pattern:** Development opportunity (Class MA PD)  
**Capital Required:** £12M-£55M purchase + £200-£350/sqft conversion capex (20k-60k sqft typical)  
**Expected Results:** 15-30 (Zone 1 focus may skew to 10-15)

**SearchLand AI Prompt:**
```
1. Sales listing price: is greater than 5000000
2. Sales listing price: is less than 60000000
3. Property floor area (sqft): is greater than 2000
4. EPC rating: is one of [E, F, G]
5. Company status: is one of [Liquidation, Administration]
6. Latest sold date: is before 2015-01-01
```

**Rationale:** Uses Class MA preset to surface office/retail blocks eligible for PD; layers double distress (insolvency + EPC E-G) and long-hold signal for price tension. Size floor keeps schemes viable for 15-25% margin after luxury spec uplift.  

**Strengths:** Strong motivation stack; PD path reduces planning risk; larger floorplates suit luxury layouts.  
**Limitations:** Liquidation stock in Zone 1 is thin; EPC data gaps possible; some assets may be structurally tired (higher capex).  
**Implementation Strategy:** Run preset, apply filters; segment results by floor area bands (10k/30k/50k sqft) and by sale vs off-market; sanity-check Class MA eligibility (use class E, vacancy, <1,500 sqm prior use limit) before underwriting.

---

### Approach B: Airspace Freehold – Low-Rise Mismatch (Pattern 5A + 23A)
**Base Preset:** #23 "Airspace: Commercial, no resi"  
**Refinements Applied:** Ownership simplicity (<1 leasehold) + Low existing height + Size + Price  
**Strategic Pattern:** Capital-efficient airspace JV / development opportunity  
**Capital Required:** £5M-£40M (freehold) + £150-£250/sqft superstructure/fit-out for new floors  
**Expected Results:** 20-40 (skews to Zone 2; Zone 1 returns likely 8-15)

**SearchLand AI Prompt:**
```
1. Sales listing price: is greater than 5000000
2. Sales listing price: is less than 40000000
3. Number of leaseholds on the freehold: is less than 1
4. Max building height (m): is less than 12
5. Property floor area (sqft): is greater than 2000
6. Tenure: is one of [Freehold]
```

**Rationale:** Targets freehold commercial blocks with flat-roof airspace (preset) where existing massing is below tall-building policy, enabling 1-3 extra storeys. Unbroken title removes leaseholder consent risk; low height gives planning headroom; mid-size keeps buildability and GDV balance.  

**Strengths:** Minimal assembly risk; structural uplift leverages land value; JV/optionable with lower entry.  
**Limitations:** Roof structural capacity unknown (survey needed); some LPAs sensitive to massing; freehold availability limits count.  
**Implementation Strategy:** Pull preset results, filter for 4-8 storey candidates (from height data); prioritize post-1970 concrete frames for load capacity; triage by PTAL/high streets for design acceptability; run structural desktop and rights-to-light quick checks before offers.

---

### Approach C: Brand Covenant Expiry – QSR/Retail Reposition (Pattern 20A)
**Base Preset:** #17 "Commercial with expiring leases"  
**Refinements Applied:** Lease expiry window + Distress (EPC) + Ownership simplicity + Price  
**Strategic Pattern:** Regulation/lease-driven opportunity → reposition to resi/MA or premium retail  
**Capital Required:** £5M-£30M purchase + £120-£220/sqft strip-out/refurb (or £200-£300/sqft for full resi conversion)  
**Expected Results:** 20-50 (higher in Zone 2 high streets)

**SearchLand AI Prompt:**
```
1. Sales listing price: is greater than 5000000
2. Sales listing price: is less than 30000000
3. Lease end date: is before 2027-12-31
4. EPC rating: is one of [E, F, G]
5. Number of leaseholds on the freehold: is less than 1
6. Use class: contains E
```

**Rationale:** Captures QSR/retail blocks approaching covenant expiry where restrictive covenants lapse or renegotiation creates change-of-use leverage. EPC pressure plus income cliff boosts seller motivation; freehold simplification aids swift execution. Works for Class MA (vacancy + E use) or bespoke resi via full planning.  

**Strengths:** Time-bound motivation; covenant fall-away enables alternative use; strong locations (prime retail pitches) convert to high-value resi.  
**Limitations:** Some sites over-rented; potential dilapidations disputes; covenant release may still need negotiation/legal review.  
**Implementation Strategy:** Sort by lease expiry proximity (≤12m first); pull leases for assignment/restriction clauses; check vacancy status for MA eligibility; model dual exits (renewal uplift vs resi conversion) to bid with optionality.

---

If you want an additional Zone 2 HMO conversion play (Pattern 22A: >2,000 sqft houses to 8-12 bed HMOs at 5-8% yields), say so and I’ll add it.
