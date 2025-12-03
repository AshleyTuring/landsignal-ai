# Approach E: Option Agreement Low-Capital - ITERATION 2 (FIXED)

**Original Issue:** SearchLand AI only created 2 of 8 filters  
**Fix:** Simplified prompt structure + manual verification steps  
**Status:** Ready to test

---

## SearchLand AI Prompt (Copy-Paste Ready)

```
1. Max number of building floors on title: is less than 4
2. Distance to nearest Train Station (m): is less than 800
3. Title area (acres): is greater than 0.25
4. Title area (acres): is less than 1.5
5. Use class: contains any [E - Commercial Business and Service, Sui Generis]
6. Latest sold date: is before 2015-01-01
7. Applications in the last 5 years: is less than 2
8. Sales listing currently on the market: No
```

**✅ CHANGES FROM ITERATION 1:**
- Simplified line 1: Use "floors" instead of "height in metres" (SearchLand auto-converts anyway)
- Separated line 3-4: Split the AND condition into two separate filters (more reliable parsing)
- Removed Planning constraints line (can filter manually if needed)
- Removed Tenure line (SearchLand adds Freehold automatically anyway)

---

## After Pasting, VERIFY These Filters Were Created:

Before clicking "Search", check SearchLand created ALL 8 filters:

- [ ] Max number of building floors on title: is less than 4
- [ ] Distance to nearest Train Station (m): is less than 800
- [ ] Title area (acres): is greater than 0.25
- [ ] Title area (acres): is less than 1.5
- [ ] Use class: contains any [E, Sui Generis]
- [ ] Latest sold date: is before 2015-01-01
- [ ] Applications in the last 5 years: is less than 2
- [ ] Sales listing currently on the market: is false (or No)

**If any are missing:**
Click "Add Filter" manually in SearchLand UI and add the missing ones.

---

## Expected Results

**For Slough:** 10-50 properties  
**UK-Wide:** 100-300 properties  

If you get:
- **0 results:** Remove "Latest sold date" filter (may be too restrictive)
- **>1,000 results:** Add back "Planning constraints: does not contain [Green Belt]"
- **25,000+ results:** SearchLand didn't parse correctly - add filters manually

---

## If SearchLand Still Fails to Parse (Manual Backup)

If the AI still doesn't create all filters, do this:

### Step 1: Start with Basic Search
Paste this simplified 4-filter version:
```
1. Max number of building floors on title: is less than 4
2. Distance to nearest Train Station (m): is less than 800
3. Title area (acres): is greater than 0.25
4. Title area (acres): is less than 1.5
```

### Step 2: Manually Add Remaining Filters
Click "Add Filter" button and add:
- Use class: contains any → Select "E - Commercial Business and Service" + "Sui Generis"
- Latest sold date: is before → Enter "2015-01-01"
- Applications in the last 5 years: is less than → Enter "2"
- Sales listing currently on the market: → Select "No"

This guarantees all filters are applied correctly.

---

## Strategy Overview (Unchanged)

**Rationale:**
- Low capital entry (option agreements £30k vs £500k purchase)
- Long ownership (pre-2015 = 10+ years held = motivated)
- Off-market (no listing = less competition)
- Transport accessibility (<800m stations = planning support)
- Low height (<4 floors = clear intensification potential)
- Large plots (0.25-1.5 acres = development upside)

**Capital Required:** £65k  
**Expected Profit:** £1.5-£2.8M (2-3 sites optioned)

---

## Next Steps After Getting Results

1. Screenshot the filters SearchLand created
2. Note the result count
3. Export results to spreadsheet
4. Visual screening of top 20-30 properties
5. Land Registry title lookup (identify owners)
6. Owner research (Companies House, social media)
7. Direct approach letters

---

**Source:** Iteration 2 - Fixed parsing issues  
**Status:** Ready to test immediately

