# Searchland Preset Filters

All preset filters available in Searchland via the website interface.

---

## 💡 NOTE: Case Study on Preset Refinement

**Observation from MixedUse-8Storey-2M-v22 (Nov 2025):**

In one specific case (Preset #11 "Mixed use search" for small-scale development opportunities in Slough):
- Base preset returned 151 properties (broad search)
- Sample showed mixed results: 1/6 properties matched target profile
- Adding scale, potential, and constraint filters narrowed to 24 properties
- Refined sample: 6/6 properties matched target profile

**Why this happened in that case:**
- Preset found correct USE TYPE (mixed E/C3) but included all scales and constraints
- User's goal was specific: small sites (0.04-0.3 acres), low-rise (<8m), clean planning path
- Refinement filters excluded large institutional sites and over-constrained properties

**If your goal is similar:**
Consider adding filters for scale, development potential, and planning constraints to narrow results.

**If your goal is different:**
- Investment screening: Preset as-is may be sufficient (you want broad results)
- Large-scale projects: Different scale filters needed
- Other use cases: Test and validate for your specific requirements

**See:** `LEARNINGS_DATABASE.md` → "SearchLand Presets - Case Study" for full details and `FILTER_PATTERNS.md` for example refinement approaches.

---

## 1. Unbroken freeholds
Multi-unit freeholds with potential to split or repurpose

Criteria (ALL):
- Freehold tenure
- 3-15 addresses
- Exactly 0 leaseholds on freehold
- Private owner ownership
- Only C3 dwellinghouses
- More than 3 EPC records on title

## 2. Run down homes
Low-EPC single homes with rebuild or improvement potential

Criteria (ALL):
- Freehold tenure
- EPC rating: G, E, F, D
- Only C3 dwellinghouses
- NOT corporate/council/housing association/company ownership
- Less than 30% area developed
- 2,000-4,100 sqmt
- Exactly 1 address
- Only detached

## 3. Unconstrained, up to 5 units
Small undeveloped plots in built-up areas for housing

Criteria (ALL):
- Freehold tenure
- More than 1,000 sqmt
- Less than 8,000 sqmt
- Less than 2% area developed
- More than 90% area un-constrained
- Only built up areas
- NOT council/corporate/housing association/company ownership
- Majority NOT road
- NOT C3 dwellinghouses

## 4. Class MA (pre-configured)
Class MA sites filtered for potential profit based on local values permitted development

Pre-calculated Class MA sites with:
- Floor area > 37 sqmt
- Class E for at least 2 years
- Title no bigger than 4,000 sqmt

Profit calculation based on:
- Assumed rent from Rateable Value (VOA)
- Total building value from estimated business yield
- Residential value from new build sold prices
- Regional building cost comparison
- Only shows profitable opportunities

## 5. 1-2 acres land opportunities
Unconstrained 1–2 acre flat land plots, undeveloped and buildable

Criteria (ALL):
- Freehold tenure
- 0% area developed
- NOT: National landscapes (AONB), Flood zone 2, Flood zone 3, Green belt
- 4,000-8,000 sqmt
- Majority NOT road
- Only built up areas
- Private owner or company ownership
- More than 90% area un-constrained

## 6. Class Q (pre-configured)
Agricultural buildings on Grade 1–5 land eligible for Class Q permitted development

Buildings with:
- Agricultural use (OS defined)
- Agricultural Land Grade 1/2/3/4/5

## 7. Grey Belt
Green Belt sites with hardstanding & development potential

Criteria (ALL):
- Freehold tenure
- NOT: Flood zone 2, Flood zone 3, National parks, SAC, Country parks, World heritage sites, Local nature reserves, SIL, LSIS, Conservation area, Designated open space, Parks and gardens, Ancient woodland, Ramsar, Scheduled monuments, Battlefields, National nature reserves, SPA, National landscapes (AONB)
- More than 1,000 sqmt
- More than 25% area developed
- More than 10% area covered by hard standings
- Within 100m of nearest built up area

## 8. Infill (pre-configured)
C3 sites with road access and space for additional infill homes

Pre-calculated infill sites with:
- Pre-existing C3 usage
- Road access
- Sufficient space for another house on un-developed land

## 9. Vacant land in built-up areas
Undeveloped land plots within built-up areas for development

Criteria (ALL):
- Freehold tenure
- Use class: General storage land, Land, Unused land, or Vacant/derelict land
- Company or private owner ownership
- 500-8,000 sqmt
- Less than 5% area developed
- Built up areas

## 10. Padel opportunities
Land suitable for developing new padel courts

Criteria (ALL):
- Freehold tenure
- 1,500-6,500 sqmt
- Use class: B2, B8, E, E(g)(ii), E(g)(iii), or E(d)
- 7-15m building height
- Company or private owner ownership
- Less than 12,000 sqmt
- NOT C3 dwellinghouses
- More than 75% area un-constrained

Criteria (ANY):
- Within 400m of bus stop
- Within 800m of train station
- Within 5m of built up area

## 11. Mixed use search
Freehold mixed-use properties with commercial & resi units

Criteria (ALL):
- Freehold tenure
- Use class: E, E(a), E(b), E(c)(i), E(c)(ii), E(c)(iii), E(d), E(e), E(f), E(g)(i), E(g)(ii), or E(g)(iii)
- Only C3 dwellinghouses
- Latest sold date after 01/08/2019

## 12. HMO expired licences
Houses in multiple occupation with expired licences

Criteria (ALL):
- Freehold tenure
- Currently has HMO
- HMO License Expiry Date before 06/02/2024

## 13. Edge of settlement sites
Strategic sites on settlement edges of 2 acres or more

Criteria (ALL):
- Freehold tenure
- More than 8,000 sqmt
- Private owner ownership
- Less than 1 max dwelling applications
- NOT: Flood zone 2, Flood zone 3, National landscapes (AONB), Listed building(s) in plot, Conservation area, SSSI, Ancient woodland

Criteria (ANY):
- 1-99% green belt coverage
- 1-99% another constraint coverage

## 14. Land for solar ground mount
Freehold land suitable for ground-mounted solar farms

Criteria (ALL):
- Freehold tenure
- 40,000 sqmt or more
- Less than 5% area developed
- Corporate/company/private owner ownership
- 75% or more area un-constrained
- Within 2,000m of green rated substation
- Agricultural Grade 3/3a/3b/4

## 15. Brownfield - industrial
Freehold brownfield sites 0.25-3 acres for industrial use

Criteria (ALL):
- Freehold tenure
- Use class: E(g)(iii) industrial processes
- 1,000-12,000 sqmt
- Less than 10% area developed
- More than 30% hardstanding

## 16. Houses with big gardens
Homes with big gardens suitable for infill development

Criteria (ALL):
- Freehold tenure
- Only C3 dwellinghouses
- Less than 5% area developed
- Private owner ownership
- 500-8,000 sqmt
- 4 or fewer addresses

## 17. Commercial with expiring leases
Medium commercial sites with leases ending before 2027

Criteria (ALL):
- Use class: B2, B8, E, or E(g)(i)
- 2,000-4,000 sqmt
- Lease end date before 31/12/2026
- Last application submitted before 01/09/2020

## 18. Edge of settlement sites
Plots on settlement edges with potential boundary changes

Criteria (ALL):
- Freehold tenure
- Private owner ownership
- 1,000-8,000 sqmt
- Less than 5% area developed
- Majority NOT road
- NOT listed building(s) in plot
- More than 80% area un-constrained
- Less than 1 application in last 5 years
- Less than 1 leasehold on freehold
- No latest sold date
- NOT: B2, B8, C2, C2A, C3
- 1-10% built up area coverage

## 19. Homes to HMO
Houses for conversion into HMOs for rental or investment

Criteria (ALL):
- Freehold tenure
- Use class: C3 dwellinghouses
- Exactly 1 address
- NOT has HMO
- NOT Article 4 directions
- Company or private owner ownership
- NOT sales listing currently on market

## 20. Unsold homes with poor EPC
Privately owned homes with poor EPC, unsold 20+ years

Criteria (ALL):
- Company or private owner ownership
- Use class: C3 dwellinghouses
- Latest sold date before 01/07/2004
- EPC rating: E, F, G

## 21. 100+ unit in London, high PTAL
Sites with 100 or more residential units and PTAL 5+

Criteria (ALL):
- Freehold tenure
- More than 100 max dwellings applied for
- Only C3 dwellinghouses
- More than 90% area un-constrained
- PTAL: 5, 6a, or 6b

## 22. Airspace: 8 or more addresses
Flats with flat roofs on freehold titles with 8+ units

Criteria (ALL):
- Freehold tenure
- Use class: C3 dwellinghouses
- NOT terraced
- 300 sqmt or more
- 30% or more area developed
- Building has flat roof
- 8 or more addresses

## 23. Airspace: Commercial, no resi
Commercial buildings with flat roofs and no residential use

Criteria (ALL):
- Freehold tenure
- Use class: E, E(a), E(b), E(g)(ii), or E(g)(i)
- NOT terraced
- 300 sqmt or more
- 30% or more area developed
- Building has flat roof
- NOT: C3, C4, C2, C1

## 24. Airspace: Sales listing pre-1990
Flats with flat roofs built before 1990, multiple addresses

Criteria (ALL):
- Freehold tenure
- Use class: C3 dwellinghouses
- NOT terraced
- 300 sqmt or more
- 30% or more area developed
- Building has flat roof
- 8 or more addresses
- Built 1990 or earlier

## 25. Airspace: Unbroken freeholds
Flats with flat roofs on single freehold (no leases)

Criteria (ALL):
- Freehold tenure
- Use class: C3 dwellinghouses
- NOT terraced
- 300 sqmt or more
- 30% or more area developed
- Building has flat roof
- 8 or more addresses
- Less than 1 leasehold on freehold

## 26. Allocated sites, 5-50 acres
Strategic land parcels, 5–50 acres, suitable for development

Criteria (ALL):
- 20,000-200,000 sqmt
- Less than 10% area developed
- Employment allocation or employment allocation (emerging)

Criteria (ANY):
- Within 100m of A road
- Within 100m of B road

## 27. Cafe & restaurant sites
High-footfall sites suitable for cafes and restaurants

Criteria (ALL):
- Leasehold or freehold tenure
- Demographics: White English/Welsh/Scottish/Northern Irish/British or White Other
- More than 325 sqmt
- More than 800 average daily footfall
- Use class: E(a) retail display

## 28. Care home opportunities
Care homes within 500m of a hospital for an older demographic

Criteria (ALL):
- Freehold tenure
- 4,000 sqmt or more
- 10% or less area developed
- Demographics: Aged 50-69
- Within 500m of hospital
- 15% or less area on road
- NOT corporate/council/housing association ownership

## 29. Car Parks
Sites that have a carpark as defined by OS

Criteria (ALL):
- Freehold tenure
- Use class: Car/coach/commercial vehicle/taxi parking, Public car parking, or Car park space
- 1,000-4,000 sqmt
- Less than 5% area developed
- Less than 1 application in last 5 years

## 30. Class A
Houses suitable for extensions or alteration (Class A permitted development)

Criteria (ALL):
- Freehold tenure
- Use class: C3 dwellinghouses
- Only self contained flat (includes maisonette/apartment)
- NOT terraced
- 200 sqmt or more
- 7m or more building height
- 28-40% area developed
- NOT E use classes
- NOT: National landscapes (AONB), Conservation area, Article 4, SSSI, Ancient woodland, Listed buildings, World heritage sites, National parks

## 31. Class G
Space above shops convertible to two flats, permitted development

Criteria (ALL):
- Freehold tenure
- 1 or fewer addresses
- NOT: C3(A), C3, C3(B), C3(C), B2
- Use class: E, E(a), E(b), E(c)(i), E(c)(ii), E(c)(iii), E(d), E(e), E(f), E(g)(i), E(g)(ii), or E(g)(iii)
- 250 sqmt or less
- NOT listed buildings or National landscapes (AONB)

## 32. Class MA eligible commercial sites
Commercial sites in built-up areas eligible for Class MA permitted development

Criteria (ALL):
- Freehold tenure
- Use class: E, E(a), E(b), E(c)(i), E(c)(ii), E(c)(iii), E(d), E(e), E(f), E(g)(i), E(g)(ii), or E(g)(iii)
- 100-8,000 sqmt
- NOT: National landscapes (AONB), Flood zone 3, Conservation area, SSSI, Battlefields, Scheduled monuments, National nature reserves, Ancient woodland
- NOT C3 dwellinghouses

## 33. Class ZA
Small commercial buildings eligible for Class ZA (permitted development) rebuild

Criteria (ALL):
- Freehold tenure
- Only detached
- Use class: E(g)(iii), E(g)(ii), or E(g)(i)
- Less than 1,000 sqmt
- Less than 18m roof height
- NOT: Conservation area, SSSI, Listed building(s) in plot, National landscapes (AONB), National parks, Scheduled monuments, World heritage sites

## 34. Commercial solar rooftops
Commercial buildings with suitable roof space for solar

Criteria (ALL):
- Freehold tenure
- Company/corporate/private owner ownership
- Use class: B2, B8, or E
- More than 500 sqmt
- EPC rating: D, E, F, G
- EPC recommendations contain "solar"
- Building has flat roof

## 35. Companies owning more than 30 titles
Companies holding over 30 freehold titles with HMOs

Criteria (ALL):
- More than 30 titles owned by company
- Freehold tenure
- Has HMO

## 36. ECO4
Private sites with poor EPCs for ECO4 solar installs

Criteria (ALL):
- EPC rating: E, F, G
- More than 5 addresses
- 20% or more area developed
- Private owner ownership
- 1 or more leaseholds on freehold

## 37. Educational sites with parking
Large freehold sites suitable for education with parking space

Criteria (ALL):
- Freehold tenure
- Use class: F2(A), F2(B), F2(C), F2(D), C2, C2A, F1(A), E(f), E(e), or E(g)(i)
- More than 650 sqmt
- More than 40% hardstanding

## 38. Emerging sites without planning
Strategic sites on emerging allocations without planning

Criteria (ALL):
- Freehold tenure
- Housing allocation (emerging)
- Less than 1 max dwellings applied for
- 4,000-40,000 sqmt
- Less than 3% area developed

## 39. Farmland in nutrient neutrality areas
Freehold farmland >8 ha in nutrient neutrality zones

Criteria (ALL):
- Freehold tenure
- More than 80,000 sqmt
- NOT Grade 1 or Grade 2
- Cereal crops habitat type
- Nutrient neutrality area

## 40. Farm titles less than 5 acres
Farm land plots of less than 5 acres

Criteria (ALL):
- Freehold tenure
- Use class: Agricultural or Farm/non-residential associated building
- Less than 20,000 sqmt
- More than 50% area un-constrained

## 41. Fast food restaurant sites
Fast food or café sites with expired leases and undeveloped land

Criteria (ALL):
- Only E(b) sale of food and drink
- Lease end date before 01/01/2023
- Less than 50% area developed

## 42. Garage next to residential
Garages next to homes with potential for residential conversion

Criteria (ALL):
- Freehold tenure
- 300-3,000 sqmt
- Private owner or company ownership
- Majority NOT road
- Use class: B2, E(g)(iii), or E
- Within 20m of residential address

Criteria (ANY - Proposal contains):
- Garage
- MOT
- Tyre

## 43. Green Belt sites with hardstandings
Grey Belt sites, unallocated, 1-10 acres, no SHLAA entry

Criteria (ALL):
- Freehold tenure
- 1,000-10,000 sqmt
- 1% or more green belt coverage
- Green belt

Criteria (ANY):
- Built up areas
- Within 100m of built up area

## 44. Grey Belt – low Green Belt review
Grey Belt sites with low Green Belt impact

Group 1 (ALL):
- Freehold tenure
- NOT: Flood zone 3, National parks, SAC, Country parks, World heritage sites, Local nature reserves, SIL, LSIS, Conservation area, Designated open space, Parks and gardens, Ancient woodland, Ramsar, Scheduled monuments, Battlefields, National nature reserves, SPA, National landscapes (AONB)
- More than 1,000 sqmt
- More than 25% hardstanding
- More than 10% green belt
- Within 100m of built up area

OR Group 2 (ALL):
- Green Belt Review score: 1 or 2
- NOT: Flood zone 3, Conservation area, National landscapes (AONB)
- Within 100m of built up area
- More than 1,000 sqmt
- More than 25% hardstanding
- Less than 20 addresses

## 45. Ground-mounted solar, Greenbelt
Green Belt sites with planning for ground-mounted solar

Criteria (ALL):
- Proposal contains "ground mounted"
- Proposal contains "solar"
- Green belt

## 46. High footfall leases ending soon
High-footfall retail sites with leases expiring within 1 year

Criteria (ALL):
- Lease end date between 30/09/2025 and 30/09/2026
- 6,000 or more average daily footfall
- Use class: E(a) retail or Retail

## 47. HMO opportunities
Houses for HMO conversion for rental or investment

Criteria (ALL):
- Freehold tenure
- 8-12 habitable rooms (latest EPC)
- Only C3 dwellinghouses
- Latest sold date before 30/04/2014
- EPC rating: F, G, D, E
- Less than 1 application in last 5 years
- Within 500m of bus stop
- Within 1,000m of train station

## 48. Industrial buildings
Large industrial and manufacturing sites with freehold ownership

Criteria (ALL):
- Freehold tenure
- Company or private owner ownership
- 5,000 sqmt or more
- Use class: B2, B8, E(g)(i), E(g)(ii), or E(g)(iii)

## 49. Industrial solar opportunities
Freehold industrial sites, owner-occupied, suitable for solar

Criteria (ALL):
- Freehold tenure
- Use class: B2, B8, or E(g)(iii)
- More than 1,000 sqmt
- Less than 1 leasehold on freehold
- Less than 1 commercial lease on title

## 50. KFC locations
KFC locations across the UK, corporate & franchise sites

Criteria (ANY):
- Company name contains "KENTUCKY FRIED CHICKEN (GREAT BRITAIN) LIMITED"
- Title address contains "K F C"
- Title address contains "Kentucky Fried Chicken"
- Company name contains "Clokken Limited"
- Title address contains "KFC"
- Commercial lettings tenant contains "KFC"
- Commercial lettings tenant contains "Kentucky Fried Chicken"

## 51. Land for battery sites (BESS)
Freehold land suitable for BESS development opportunities

Criteria (ALL):
- Freehold tenure
- 20,000-400,000 sqmt
- Less than 5% area developed
- Corporate/company/private owner ownership
- 75% or more area un-constrained
- Within 2,000m of green rated substation
- Agricultural Grade 3/3a/3b/4
- 75% or more flat terrain

## 52. Land for bio-energy sites
Freehold land suitable for bioenergy development

Criteria (ALL):
- Freehold tenure
- Corporate/company/private owner ownership
- NOT: Flood zone 2, Flood zone 3, Built up areas, Housing zones
- Agricultural Grade 3b/4/5/3a
- Within 3,000m of substation
- More than 300m from built up area

## 53. Land for data centers
Private land suitable for new data centre developments

Criteria (ALL):
- Private owner/company/corporate ownership
- More than 60,000 sqmt
- Within 2,000m of substation
- More than 99% flat terrain
- More than 70% area un-constrained
- Use class: B2 or B8

## 54. Land for EV charging
Unconstrained land near busy roads suitable for EV chargers

Criteria (ALL):
- Freehold tenure
- Corporate or company ownership
- Use class: Public car parking, Car park space, Petrol filling station, Fast food outlet/takeaway, or Restaurant/cafeteria
- Majority NOT road
- 10,000 or more average daily vehicle count
- Within 400m of A road
- Within 5,000m of green rated substation
- More than 1,000m from EV chargepoint

## 55. Land for hydrogen sites
Land near substations suitable for hydrogen projects

Criteria (ALL):
- Freehold tenure
- Corporate/company/private owner ownership
- 8,000-20,000 sqmt
- Within 200m of substation
- NOT: Flood zone 2, Flood zone 3, National landscapes (AONB)
- More than 500m from school
- More than 500m from hospital
- More than 500m from care home
- More than 500m from built up area

## 56. Land for onshore wind
Freehold land suitable for onshore wind developments

Criteria (ALL):
- Freehold tenure
- 20,000-400,000 sqmt
- Less than 5% area developed
- Corporate/company/private owner ownership
- 75% or more area un-constrained
- Within 2,000m of green rated substation
- Agricultural Grade 3/3a/3b/4
- More than 500m from built up area

## 57. Land for storage in Green Belt
Green Belt sites suitable for storage unit development

Criteria (ALL):
- Built up areas
- NOT C3 dwellinghouses
- Use class: B2, B8, or Outside defined classes
- 0-20% area developed
- NOT green belt
- 800-6,000 sqmt
- Majority NOT road

## 58. Land suitable for drive-thru
Sites with high traffic, suitable for drive-thru development

Criteria (ALL):
- Freehold tenure
- Private owner/council/company ownership
- 10,000 or more average daily vehicle count
- 1,000-20,000 sqmt
- 30% or less area developed
- 30% or less area on road

## 59. Land without planning (Duplicate entry)
Undeveloped land with no planning applications submitted

Criteria (ALL):
- Freehold tenure
- NOT council/housing association ownership
- 2,000-8,000 sqmt
- 3% or less area developed
- 70% or more area un-constrained
- Less than 1 max dwellings applied for
- 10% or less area on road
- Built up areas

## 60. Land without planning (Duplicate entry)
Undeveloped land with no planning applications submitted

Criteria (ALL):
- Freehold tenure
- NOT council/housing association ownership
- 2,000-8,000 sqmt
- 3% or less area developed
- 70% or more area un-constrained
- Less than 1 max dwellings applied for
- 10% or less area on road
- Built up areas

## 61. Large buildings, EV charger potential
Multi-address freehold buildings suitable for EV installation

Criteria (ALL):
- Freehold tenure
- Only C3 dwellinghouses
- More than 75 addresses
- 40% or more hardstanding

## 62. Large public buildings
Freehold large public buildings over 3,800 m²

Criteria (ALL):
- Freehold tenure
- 20% or less area developed
- 3,800-10,300 sqmt
- Majority NOT road
- Company name NOT contains "countryside"
- Exactly 1 address
- Use class: F1(A), F1(B), F1(C), F1(D), F1(E), F1(F), F1(G), F2(A), F2(B), C1, E, E(f), or E(g)(i)

## 63. Large sites with planning 10-100 units
Residential sites with planning for 10-100 homes

Criteria (ALL):
- Freehold tenure
- More than 8,000 sqmt
- 10-100 max dwellings applied for
- NOT: National landscapes (AONB), Flood zone 2, Flood zone 3, Green belt, Conservation area, SSSI, Ancient woodland
- Less than 5% area developed

Criteria (ANY):
- In adopted settlement
- In emerging settlement

## 64. McDonald's locations
McDonald's locations across the UK, corporate & franchise sites

Criteria (ANY):
- Title address contains "Mcdonalds Restaurants Ltd"
- Company name contains "MCDONALD'S RESTAURANTS LIMITED"

## 65. Mixed use developments
Sites combining residential and commercial uses

Criteria (ALL):
- Freehold tenure
- Only C3 dwellinghouses AND E commercial/business/service
- 500-2,000 sqmt
- NOT corporate/council/housing association ownership
- More than 10 EPC records on title

## 66. Office blocks
Office buildings with leases approaching expiry

Criteria (ALL):
- Use class: E(g)(i), E(g)(ii), E(c)(ii), or E(c)(iii)
- NOT C3 dwellinghouses
- Company or private owner ownership
- Lease end date before 17/01/2026
- NOT E(a) retail

## 67. Offices with low EPC
Office buildings rated D–G on their latest EPC

Criteria (ALL):
- Freehold tenure
- EPC rating: D, E, F, G
- Use class: E commercial/business/service
- Office or office/work studio

## 68. Offices with no C3 and no lease
Office buildings with no residential use and no active lease

Criteria (ALL):
- Freehold tenure
- Use class: E commercial/business/service AND E(g)(i)
- NOT C3 dwellinghouses
- More than 500 sqmt
- 10-30m building height
- 1,000-12,000 sqmt

Criteria (ANY):
- Lease end date on or before 02/05/2025
- Exactly 0 leaseholds on freehold

## 69. Older houses with outdoor space
Older homes with space, no recent sales or planning activity

Criteria (ALL):
- Freehold tenure
- Only C3 dwellinghouses
- Private owner ownership
- 1,000-4,500 sqmt
- Less than 15% area developed
- Majority NOT road
- NOT E commercial/business/service
- NOT listed building(s) in plot
- More than 80% area un-constrained
- Less than 1 application in last 5 years
- EPC rating: G, F, E, D
- Less than 1 leasehold on freehold
- No latest sold date

## 70. Padel opportunities
Land beside commercial sites suitable for new padel courts

Criteria (ALL):
- Freehold tenure
- 1,000-6,000 sqmt
- Use class: F2(C), F2(B), E, E(a), E(d), E(c)(iii), E(g)(iii), or E(g)(ii)
- 5-12m building height
- 10-70% area developed
- Built up areas
- Less than 1 max dwellings applied for
- NOT: C3, C1, C2

Criteria (ANY):
- Within 100m of A road
- Within 100m of bus stop
- Within 100m of rapid transit stop/station

## 71. Paper manufacturers
Freehold paper sites suitable for solar outreach

Criteria (ALL):
- Freehold tenure
- Corporate/company/private owner ownership
- 5,000 sqmt or more
- Exactly 0 leaseholds on freehold
- SIC codes include various paper/printing manufacturing codes (18110, 58130, 58110, 18129, 17120, 17211, 17219, 17290, 17230, 2112)

## 72. Petrol station sites
Freehold sites with high traffic suitable for petrol stations

Criteria (ALL):
- 15,000-60,000 sqmt
- 5-10% area developed
- 10,000 or more average daily vehicle count
- Freehold tenure
- Demographics: Aged 25-64

## 73. Poultry Farms
Poultry farms suitable for solar panel installations

Criteria (ALL):
- Freehold tenure
- SIC codes: 01470 (raising of poultry), 10130 (meat/poultry products), 10120 (processing poultry meat)
- More than 1,000 sqmt
- Private owner or company ownership
- Date added to register before 29/07/2024

## 74. Private C3 homes with 1+ acre land
Private homes with over 1 acre of undeveloped land

Criteria (ALL):
- Freehold tenure
- Private owner ownership
- Use class: C3 dwellinghouses
- More than 4,000 sqmt
- NOT: National landscapes (AONB), Flood zone 2, Flood zone 3, Green belt, Listed building(s) in plot, Conservation area, National nature reserves, Battlefields, Scheduled monuments, Ancient woodland, Parks and gardens, SSSI, Local nature reserves, World heritage sites
- Exactly 1 address
- Built up areas

## 75. Residential allocations
Freehold sites strategically allocated for housing development

Criteria (ALL):
- Freehold tenure
- 4,000-40,000 sqmt
- Private owner ownership
- Site allocation: Housing allocation, Mixed allocation, Housing allocation (emerging), or Mixed allocation (emerging)

## 76. Retail units
Freehold retail spaces suitable for commercial use

Criteria (ALL):
- Freehold tenure
- Use class: E commercial/business/service AND E(a) retail
- 2,000 sqmt or more
- NOT B2 or B8
- NOT green belt
- More than 50% area developed

## 77. Shops with tops
Ground-floor commercial units with potential residential above

Criteria (ALL):
- Freehold tenure
- Less than 4,000 sqmt
- Less than 1 application in last 5 years
- Majority NOT road
- Private owner/company/corporate ownership
- More than 6m building height
- Use class: E, E(a), E(b), or F2(A)

## 78. Single flats with expiring leases
Individual flats with leases ending before 2099

Criteria (ALL):
- NOT council ownership
- Only C3 dwellinghouses
- Lease end date between 03/05/2024 and 31/12/2099
- Exactly 1 address

## 79. Sites within 50m of major roads
Freehold sites near major roads, suitable for development

Criteria (ALL):
- Freehold tenure
- 1,000-8,000 sqmt
- Less than 5% area developed
- Less than 1 leasehold on freehold

Criteria (ANY):
- Within 50m of motorway
- Within 50m of A road

## 80. Small house on agricultural land
Small houses located on agricultural land plots

Criteria (ALL):
- Freehold tenure
- 2,500 sqmt or more
- Agricultural Grade 3/3a/3b/4/5, Non agricultural, or Urban
- 10% or less area developed
- Private owner ownership
- Use class: C3 dwellinghouses
- Built up areas

## 81. Solar land search
Freehold sites suitable for solar farm development

Criteria (ALL):
- Freehold tenure
- 40,000 sqmt or more
- Less than 5% area developed
- Corporate/company/private owner ownership
- 75% or more area un-constrained
- Within 2,000m of green rated substation
- Agricultural Grade 3/3a/3b/4

## 82. Solar lease opportunities
Leasehold sites suitable for solar, ideal for lead gen

Criteria (ALL):
- Leasehold tenure
- Last updated by Land Registry after 01/08/2023
- More than 3,000 sqmt
- Company name NOT contains "king"

Criteria (ANY - Company name contains):
- Solar
- Energy
- Renewable
- Green

## 83. Solar, manufacturing owner-occupier
Freehold industrial sites owned and used by manufacturers

Criteria (ALL):
- More than 1,000 sqmt
- Exactly 1 address
- Use class: B2, E, or E(g)(iii)
- SIC codes include extensive list of manufacturing codes (cement, electrical equipment, motor vehicles, tools, food products, metal products, paper, plastics, machinery, textiles, chemicals, etc.)
- 0 or fewer leaseholds on freehold
- Freehold tenure

## 84. Target EVC sites
Sites suitable for EV charger points

Criteria (ALL):
- 10,000 or more average daily vehicle count
- Within 300m of green rated substation
- 0-16,000 sqmt (specific range)
- Corporate/company/private owner ownership
- More than 809 sqmt

## 85. Un-allocated, no SHLAA, 1-10 acres
Sites with no promotion, near settlements

Criteria (ALL):
- Freehold tenure
- NOT positive/neutral/negative SHLAA assessment
- NOT allocated (any allocation type)
- Company or private owner ownership
- 4,000-40,000 sqmt
- Majority NOT road
- Less than 5% area developed

Criteria (ANY):
- Within 50m of adopted settlement boundary
- Within 50m of emerging settlement boundary

## 86. Un-allocated private sites
Freehold private sites >4,000 sqm near settlement edges

Criteria (ALL):
- Freehold tenure
- Private owner ownership
- More than 4,000 sqmt
- NOT allocated (any allocation type)

Criteria (ANY):
- Within 200m of adopted settlement boundary
- Within 200m of emerging settlement boundary

---

**Total Preset Filters:** 86
