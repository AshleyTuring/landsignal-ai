# CRITICAL FILTER LEARNING: "Sales Listing Price" Issue

**Date:** 2024-12-04  
**Project:** Brentwood-ClassMA-Arbitrage  
**Status:** IMPORTANT - Read Before Using Sales Listing Price Filter

---

## ❌ The Problem

When filtering by **"Sales listing price"** without proper constraints, SearchLand returns **individual residential addresses for sale**, not entire properties.

### Example Scenario:

**Property:** Large house converted into 6 flats
- **Title:** Freehold with 6 addresses
- **Current situation:** Owner selling 1 flat for £180k
- **Your filter:** "Sales listing price: is less than £200k"
- **Result:** ❌ You get the FLAT listing (£180k for 1 flat), NOT the building

**What you wanted:** The entire 6-flat building for £180k-£200k  
**What you got:** 1 flat inside that building for £180k

---

## ✅ The Solution

**ALWAYS add this filter when using "Sales listing price":**

```
Number of addresses: is equal to 1
```

### Why This Works:

| Filter Combination | What You Get |
|-------------------|--------------|
| ❌ Sales listing price: < £200k | Individual flats, units, or entire properties (MIXED) |
| ✅ Sales listing price: < £200k<br>+ Number of addresses: = 1 | ONLY entire single-dwelling properties |

**Explanation:**
- **"Number of addresses = 1"** means the title has only ONE residential address
- This ensures you're looking at a **single dwelling** (entire house/property)
- NOT a multi-unit building where individual units are being sold

---

## Real Example from Project

### What Happened:

**Approach D: Volume HMO Cashflow Strategy**

**Original filter from ExecutiveSummary.md (lines 525-534):**
```
1. Use class: contains all [C3 - Dwellinghouses]
2. Number of addresses: is equal to 1
3. Property floor area (sqft): is greater than 1500 AND less than 2500
4. Number of bedrooms: is greater than or equal to 4
5. Sales listing price: is less than 200000
6. Energy Performance Certificate (EPC) band: contains any [C, D, E]
7. Tenure: is one of [Freehold]
8. Title size (acres): is greater than 0.1 AND less than 0.5
9. % of title subject to Article 4 Directions: is equal to 0
10. Planning constraints: does not contain [Conservation Area]
```

**Result:** Only 2 properties found

**User's discovery:**
> "they are with a Sales listing Price for the flat not the actual HMO property this meant that we aren't finding properties for sale rather flats within it"

**Analysis:**
- Filter #2 had "Number of addresses: is equal to 1" ✅ (GOOD)
- But SearchLand still matched individual flats for sale
- **Why?** The "Sales listing price" was matching listings for individual flats within larger properties
- The "Number of addresses" filter refers to the TITLE, not the LISTING

---

## Revised Understanding: Two Different Concepts

### 1. **Title-Level Filter: "Number of addresses"**
- Refers to how many residential addresses exist on the LAND REGISTRY TITLE
- Example: Converted house with 6 flats = 6 addresses on the title
- Filter: "Number of addresses: is equal to 1" = Single dwelling titles only

### 2. **Listing-Level Filter: "Sales listing price"**
- Refers to INDIVIDUAL LISTINGS on Rightmove/Zoopla
- Example: 1 flat in a 6-flat building listed for £180k = matches "Sales listing price < £200k"
- **Even if the title has 6 addresses, you get the listing for 1 flat**

### The Conflict:

```
Number of addresses: is equal to 1  ← Looking for single-dwelling TITLES
Sales listing price: is less than 200000  ← Matching individual LISTINGS

Result: SearchLand might show a LISTING for 1 flat, even if it's part of a multi-address title
```

---

## ✅ CORRECTED Filter Strategy

### For Entire Properties Under £200k:

**Option A: Stricter - Ensure Single Dwelling**
```
1. Number of addresses: is equal to 1  ← Single dwelling on title
2. Sales listing currently on the market: is true
3. Sales listing price: is less than 200000
4. Property type: does not contain [Flat]  ← ADDED: Exclude flats explicitly
```

**Option B: Off-Market Approach (More Reliable)**
```
1. Number of addresses: is equal to 1
2. Sales listing currently on the market: is false  ← NOT listed
3. Latest sold price: is less than 180000  ← Use historical price as proxy
4. Property type: does not contain [Flat]
```

**Why Option B is Better:**
- Avoids "Sales listing price" confusion entirely
- Targets off-market properties (less competition)
- Uses historical "Latest sold price" from Land Registry (more reliable)
- Gives you negotiation room on unlisted properties

---

## Key Takeaways

### ❌ DON'T:
1. Use "Sales listing price" alone to find affordable properties
2. Assume "Sales listing price < £200k" returns only entire buildings
3. Mix "Sales listing price" with multi-unit properties

### ✅ DO:
1. **Always add:** "Number of addresses: is equal to 1" when using sales listing filters
2. **Better yet:** Use "Latest sold price" + "Sales listing currently on the market: is false" for off-market
3. **Add:** "Property type: does not contain [Flat]" as extra safety
4. **Verify:** Results manually - check if it's a flat or entire property

---

## Updated Strategy for HMO Search

### Instead of:
```
❌ Sales listing price: is less than 200000
```

### Use one of these:

**Strategy 1: Listed Properties (If you want currently listed)**
```
✅ Number of addresses: is equal to 1
✅ Property type: does not contain [Flat]
✅ Sales listing currently on the market: is true
✅ Sales listing price: is less than 180000  (lower to ensure entire property)
```

**Strategy 2: Off-Market Properties (RECOMMENDED)**
```
✅ Number of addresses: is equal to 1
✅ Property type: does not contain [Flat]
✅ Sales listing currently on the market: is false
✅ Latest sold price: is less than 160000
✅ Ownership type: is one of [Company, Corporate]
```

---

## Add to LEARNINGS_DATABASE.md

**Learning Title:** "Sales Listing Price" Returns Individual Units, Not Entire Properties

**Category:** Filter Behavior - Rightmove Integration

**Issue:**
SearchLand's "Sales listing price" filter matches INDIVIDUAL LISTINGS (flats, units) within properties, not just entire properties. This can return individual flats for sale within multi-unit buildings, even when you want the whole building.

**Solution:**
Always combine "Sales listing price" with:
1. "Number of addresses: is equal to 1" (single dwelling titles)
2. "Property type: does not contain [Flat]" (exclude flats)
3. OR better: Use "Latest sold price" + off-market approach instead

**Impact:** HIGH - Affects all property searches using price filters

**Date Discovered:** 2024-12-04  
**Project:** Brentwood-ClassMA-Arbitrage

---

**Status:** DOCUMENTED  
**Next Action:** Apply this learning to all future filter strategies

