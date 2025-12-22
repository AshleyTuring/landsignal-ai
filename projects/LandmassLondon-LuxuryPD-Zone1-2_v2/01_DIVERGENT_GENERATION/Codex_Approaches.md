**Approach A: Class MA – Liquidation, Low EPC, Unbroken Freeholds (Zone 1 price band)**
**Base Preset:** #32 "Class MA eligible commercial sites"  
**Refinements Applied:** Size + Motivation + Title simplicity  
**Strategic Pattern:** Development opportunity (PD conversion)  
**Capital Required:** £15M-£35M acquisition; £150-£220/sqft fit-out; £0.8M-£1.2M fees/contingency  
**Expected Results:** 8-20 properties (Zone 1 LPAs after user geography filter)

**SearchLand AI Prompt:**
**START WITH PRESET:** #32 "Class MA eligible commercial sites"  
**THEN ADD THESE REFINEMENT FILTERS:**
```
1. Property floor area (sqft): is greater than 2000
2. Sales listing price: is between 10000000 and 60000000
3. EPC rating: is one of [E, F, G]
4. Company status: is one of [Liquidation, Administration]
5. Number of leaseholds on the freehold: is less than 1
```

**Rationale:** Targets PD-eligible commercial blocks large enough for 15-60 luxury units; combines distress (liquidation + EPC E-G) with title simplicity (Pattern 23A) to avoid assembly risk. Price band aligned to Zone 1 budgets; PD path and unbroken freehold support faster completion and margin creation via refurbishment uplift.  
**Strengths:** PD route reduces planning risk; double-motivation stack (EPC + liquidation) for discount; clean titles accelerate execution.  
**Limitations:** Liquidation stock may have data gaps; EPC E-G may imply higher MEP capex; PD prior approval still needs transport/daylight checks.  
**Implementation Strategy:** Run preset with filters, export liquidation cases, triage for unbroken titles and vacancy; model GDV at £2k-£4k/sqft with 20-25% gross margin target, stress-test for MEES upgrade costs.

---

**Approach B: Airspace – Low-Rise in Tall Building Zones, Unbroken Freeholds (Zone 1-2)**
**Base Preset:** #23 "Airspace: Commercial, no resi"  
**Refinements Applied:** Height mismatch + Title simplicity + Capacity  
**Strategic Pattern:** Development opportunity (airspace uplift)  
**Capital Required:** £5M-£15M airspace/freehold; £180-£250/sqft shell & core for additional floors; £0.5M-£1M fees/contingency  
**Expected Results:** 10-30 properties (Zone 1-2 LPAs after user geography filter)

**SearchLand AI Prompt:**
**START WITH PRESET:** #23 "Airspace: Commercial, no resi"  
**THEN ADD THESE REFINEMENT FILTERS:**
```
1. Max building height (m): is less than 12
2. Property floor area (sqft): is greater than 2000
3. Number of leaseholds on the freehold: is less than 1
4. Sales listing price: is between 5000000 and 20000000
```

**Rationale:** Uses Pattern 5A (low-rise in tall zones) to find under-built commercial blocks with flat roofs; unbroken freehold (Pattern 23A) removes rooftop negotiation risk. Smaller ticket (<£20M) aligns to Zone 2/edge Zone 1; airspace adds 1-3 floors where policy supports height.  
**Strengths:** Lower capital vs full acquisition; planning precedent in tall zones improves approval odds; title simplicity reduces timeline risk.  
**Limitations:** Structural capacity and rights of light are gating; some stock may be conservation-adjacent; lender appetite for airspace can vary.  
**Implementation Strategy:** Run preset with height cap and title filter, prioritize post-1970 frames with flat roofs; commission structural desktop + Daylight/Sunlight/ROOFL analysis early; model £1k-£2k/sqft exits for new floors and target 20%+ blended margin.

---

**Approach C: Brand Covenant Expiry – QSR/Retail with Lease Cliffs (Zone 2, MA or ZA)**
**Base Preset:** #17 "Commercial with expiring leases"  
**Refinements Applied:** Use-type focus + Size + Motivation  
**Strategic Pattern:** Development opportunity (lease event-driven repurpose; Pattern 20A)  
**Capital Required:** £7M-£18M acquisition; £140-£210/sqft strip/refit or shell for MA/ZA; £0.6M-£1.0M fees/contingency  
**Expected Results:** 15-40 properties (Zone 2 LPAs after user geography filter)

**SearchLand AI Prompt:**
**START WITH PRESET:** #17 "Commercial with expiring leases"  
**THEN ADD THESE REFINEMENT FILTERS:**
```
1. Use class: is one of [E(b), E]
2. Lease end date: is before 2027-12-31
3. Property floor area (sqft): is greater than 5000
4. Sales listing price: is between 5000000 and 20000000
```

**Rationale:** Targets QSR/retail/office hybrids with imminent lease expiry (income cliff) to unlock MA or ZA rebuild. E(b)/E captures branded units; expiring covenant increases negotiation leverage and allows repurposing to luxury resi. Size >5k sqft delivers 20-40 units in Zone 2 at £1k-£2k/sqft GDV.  
**Strengths:** Time-based motivation without heavy distress stigma; branded units often over-rented → rebase and repurpose; dual PD paths (MA or ZA) improve optionality.  
**Limitations:** Some leases may have renewal rights; residual contamination (kitchens) to check; signage/rights must be cleared.  
**Implementation Strategy:** Pull expiring leases list, segment by brand; approach landlords pre-expiry for option/conditional contracts; run dual appraisal (retain shell vs ZA uplift) and pursue prior approval early; target 18-25% margin via lease-event discount + change-of-use value jump.

---

Technical next steps (optional):
1) Run these prompts in SearchLand with Zone 1/2 LPAs applied manually.  
2) Export top 20 per approach; score on title cleanliness, lease pressure, EPC cost, structural capacity.  
3) Desktop feasibilities with £/sqft benchmarks (Zone 1: £2k-£4k; Zone 2: £1k-£2k) and capex sensitivities.
