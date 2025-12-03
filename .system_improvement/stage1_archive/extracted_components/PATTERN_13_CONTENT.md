## 13. Time/Information Arbitrage Strategies ⭐ NEW

**Core Concept:** SearchLand refreshes data every 24 hours. Speed advantage = profit advantage.

### Pattern 13A: Real-Time Status Change Monitoring
```
Strategy: Be first to act on planning status changes, new allocations, or lease expiries
Indicators:
- Set up automated daily/weekly exports
- Monitor for status changes (approval, refusal, allocation)
- Contact owners/buyers SAME DAY before agents/competition

Implementation: Requires monitoring system outside SearchLand
- Daily export of target filters
- Compare today vs yesterday (diff analysis)
- Alert on NEW properties or status changes

Why This Works:
- Owner doesn't know market value of fresh consent yet
- Buyers willing to pay premium for pre-market exclusivity
- No agent competition (you're first)
- Time arbitrage = price arbitrage
```

### Pattern 13B: Fresh Planning Consent Alert
```
Strategy: Contact owner same day planning consent granted
Indicators:
- Planning status: Approved (filter)
- Decision date: Last 7 days (custom monitoring)
- Your action: Call owner immediately

Example Script:
"Congratulations on your consent. I have a buyer ready to move. 
Would £580k interest you?" (Owner unaware of £650k market value)

Profit: £70k in 48 hours (user example)

Strengths: Maximum information asymmetry
Weaknesses: Requires daily monitoring, fast response capability
Capital: Option agreement or cash purchase ready
```

### Pattern 13C: Lease Expiry Pre-Contact (90-Day Window)
```
Strategy: Contact owner 90 days before lease expiry (before void period)
Indicators:
- Lease end date: 60-120 days from today
- Use class: Commercial (E, B2, B8)
- Your offer: "Avoid void period, we have buyers ready"

Owner Psychology:
- 90 days out: Starting to worry about vacancy
- 30 days out: Panicking about lost income
- Post-expiry: Maximum pressure (carrying costs, no income)

Profit Source: Buy at "pre-panic" price, sell at market
```

### Pattern 13D: New Allocation Alert (Local Plan)
```
Strategy: Contact owner when site added to local plan allocations
Indicators:
- Housing allocation: Emerging (NEW)
- Applications in last 5 years: 0 (owner unaware)
- Your action: "Your site just got allocated—let's discuss before agent calls"

Example:
Day 1: SearchLand shows site added to emerging allocations
Day 1 (same day): You call owner offering £300k
Owner thinks: "My land was worth £150k yesterday, £300k is amazing!"
Reality: Market value post-allocation = £500k
Your profit: £200k by being first

Strengths: Massive information asymmetry
Weaknesses: Requires immediate action (speed critical)
```

### Pattern 13E: Fast Food Lease Expiry (High Visibility)
```
Strategy: Target high-footfall commercial with expiring leases
Indicators:
- Use class: E (restaurants/retail)
- Lease end date: Last 30 days (just expired)
- Footfall count: >2000/day (high value)
- Your action: Contact landlord (now in void period, cash flow pressure)

Why This Works:
- High footfall = high value but landlord may not realize
- Void period = immediate cash flow pressure
- Can offer "quick sale to avoid prolonged void"

Buyers: Fast food chains, convenience stores (high footfall valuable)
```

### Implementation Requirements

**System Setup:**
1. **Daily Automated Exports**
   - Export target filter results as CSV/JSON
   - Store with timestamp
   - Compare today vs yesterday (diff script)

2. **Alert Triggers**
   - New properties added: Email notification
   - Status changes: SMS + Email
   - Approaching thresholds (e.g., 90 days to lease expiry): Weekly digest

3. **Response Protocol**
   - Same-day contact for fresh consents
   - Script templates for different scenarios
   - Cash/option ready to move fast

**Tools Needed:**
- SearchLand API (or automated export)
- Diff comparison script (Python/Node)
- Email/SMS alerting system
- CRM for tracking contacts

### Capital Strategy

**Speed Capital:**
- Keep £50k-£200k liquid for immediate deployment
- Option agreements (£10k-£50k) for fast control
- Bridging finance arranged in advance (no delays)

**Profit Model:**
- Time arbitrage: Buy at "uninformed" price, sell at "informed" price
- Typical spread: 10-30% (£50k-£200k on £500k deal)
- Volume strategy: 10-20 deals/year = £500k-£2M profit

### Strengths
1. **Information asymmetry:** You know before owner/market
2. **No competition:** Pre-market, no agents, no bidders
3. **Premium pricing:** Buyers pay for exclusivity
4. **Scalable:** Automated monitoring, repeatable process
5. **High ROI:** Low capital, high profit margins

### Weaknesses
1. **Requires daily monitoring:** Labor-intensive or requires automation
2. **Speed critical:** Miss by 1 day = opportunity lost
3. **Competitive advantage erodes:** Once others adopt same strategy
4. **SearchLand dependency:** 24hr refresh only (not real-time)
5. **Execution risk:** Owner may not want to sell, buyer may back out

### Example Deal Flow

**Day 1 Morning:**
- SearchLand export shows planning consent granted yesterday
- Property: 4-unit scheme, Camden, owner-occupied

**Day 1 Afternoon:**
- Call owner: "Congratulations! I have a buyer at £580k, quick completion"
- Owner (unaware of £650k market value): "Yes, that sounds great!"

**Day 2:**
- Option agreement signed (£10k, 30-day exercise)
- Call buyer network: "Fresh consent, Camden, 4 units, £650k"
- Buyer: "Pre-vetted, no competition? Yes."

**Day 3-30:**
- Due diligence, legal, exercise option
- Completion: You buy £580k, sell £650k
- **Net profit: £60k** (after legals/costs)

**Annualized: 10 deals = £600k profit from speed arbitrage alone**

---

**Key Principle:** Test multiple approaches in parallel (divergent generation)

---

## Anti-Patterns (Avoid)

### ❌ Over-Constraining
```
Problem: Combining too many restrictive filters
Example: Applications = 0 AND Price <£200k AND Derelict AND On-market AND PTAL 6a
Result: 0 results (filters compound restrictiveness)
Solution: Test incrementally, use separate filter groups for different approaches
```

### ❌ Geographic Mismatches
```
Problem: Using London-specific filters (PTAL) for UK-wide searches
Example: PTAL filter outside TfL area
Result: 0 results
Solution: Create separate approaches for London vs rest of UK
```

### ❌ Assuming Non-Existent Filters
```
Problem: Designing strategy around filters that don't exist
Example: "Planning Status: Expired" or "Price Reduced"
Result: Cannot implement strategy
Solution: Always check AvailableFiltersInSearchLand_ACTUAL.md first
```

---

## Version History

### v3.0 (2025-11-19)
- Initial creation for divergent hypothesis testing methodology
- 6 core pattern categories with 2-3 patterns each
- Strategy selection guide
- Anti-patterns section

---

**Last Updated:** 2025-11-19
**System Version:** v3.0
**Next:** Use these patterns as inspiration for divergent approach generation

