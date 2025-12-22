# SearchLand Available Filters

**Source:** Direct from SearchLand interface (HTML parsed)  
 
**IMPORTANT:** ⚠️ CRITICAL: If the constrained value or permitted filter value is not in here you can still use the filter and assume what the filter value could be. This is a living document and will be updated as we use each filter - dont be afraid of using filters. 

---

##  Filter Operators for List-Based Filters

**Many SearchLand filters use predefined value lists (not free text).** These filters have specific operators:

### Available Operators for List-Based Filters:

| Operator | Logic | Example |
|----------|-------|---------|
| **contains any** | OR (implicit) - matches if ANY selected value is present | `Use class: contains any [E, C3]` |
| **contains all** | AND (implicit) - matches only if ALL selected values present | `Use class: contains all [E, C3]` |
| **does not contain** | Exclusion - excludes if value is present | `Use class: does not contain [B2]` |
| **is equal to** | Exact match - only this specific value | `Use class: is equal to [E]` |

### ❌ INVALID Syntax (DO NOT USE):

```
❌ Use class: contains 'E' OR Use class: contains 'Mixed'
❌ Property type: 'Commercial' OR 'Residential'
❌ Use class: E AND C3
```

**You CANNOT use boolean operators (`OR`, `AND`, `NOT`) within a single filter line.**

### ✅ CORRECT Syntax:

```
✅ Use class: contains any [E - Commercial Business and Service, C3 - Dwellinghouses]
✅ Property type: contains any [Commercial, Mixed Use]
✅ Use class: does not contain [B2 - General industrial]
```

### List-Based Filters (Use operators above):
- **Use class** (predefined planning classes)
- **Property type** (Commercial, Residential, Mixed Use, etc.)
- **Property classification** (separate taxonomy from Use class)
- **Tenure** (Freehold, Leasehold, etc.)
- **Ownership type** (Corporate, Individual, etc.)
- Any filter showing checkbox options in the UI

### Text/Numeric Filters (Use comparison operators):
- **Title address:** `contains`, `does not contain` (free text)
- **Proposal:** `contains` (free text keyword search)
- **Title area (acres):** `is greater than`, `is less than`, `is equal to` (numeric)
- **Price:** `is greater than`, `is less than` (numeric)

---

## 🏷️ Sales Listing Status Values (Defined)

**Filter:** `Sales listing status`

**Important:** This filter uses predefined values from Land Registry and agent data. Understanding these statuses is critical for filtering active vs. historical listings.

| Status | Meaning | Legally Binding? | Notes |
|--------|---------|------------------|-------|
| **Available** | Property is actively for sale, open to new offers, and listed publicly. | ❌ No | Best status for finding live opportunities |
| **Under Offer** | An offer has been made and accepted by the seller, but contracts not yet exchanged. | ❌ No | Property still at risk of falling through. Some agents use this interchangeably with "Sold STC" |
| **SSTC** (Sold Subject to Contract) | Most common status in England/Wales. Buyer's offer accepted, but legal contract exchange hasn't taken place yet. | ❌ No | Either party can still withdraw until exchange |
| **SSTCM** (Sold Subject to Conclusion of Missives) | Scottish equivalent of "Sold STC". Offer accepted but formal exchange of legally binding contracts ("conclusion of missives") hasn't happened yet. | ❌ No | Scotland-specific status |
| **Reserved** | Usually seen in new-build developments. Buyer has put down a reservation fee to hold the property while contracts are drawn up. | ❌ No | Not legally binding, but property taken off open market |
| **Invisible** | **Property listing is hidden from public portals/websites** (e.g. withdrawn, archived, or not yet marketed). | ❌ No |  |
| **Sale Completed** | Transaction has been legally finalised, ownership transferred, and confirmed through Land Registry. | ✅ YES | This status comes from Land Registry records (not agents), so it's fully verified. Due to registration delays, this status can lag behind SSTC by weeks/months |

### Usage Examples:

```
✅ Find only active listings:
Sales listing status: contains any [Available]

✅ Find active + under-offer properties (broader search):
Sales listing status: contains any [Available, Under Offer, SSTC]

⚠️ Include off-market opportunities:
Sales listing status: contains any [Available, Under Offer, Invisible]

```

### ⚠️ Notes: "Invisible" Status

Properties with **"Invisible"** status are often:
- Withdrawn from market (seller changed mind)
- Historical listings (sold months/years ago but not yet showing "Sale Completed")
- Off-market opportunities (not publicly advertised)
- Archived listings (agent removed from portals)


---

## Title Basic Information

- Tenure [LIST-BASED] - See "Ownership & Tenure" section below
- Title address
- **Title area (acres)** ⚠️ NOT sqmt - must convert
- Number of addresses
- Ownership type [LIST-BASED] - See "Ownership & Tenure" section below
- Last updated by Land Registry date

## Ownership & Tenure

### Ownership type ✓ [LIST-BASED]
**Operator:** `is one of` (checkbox selection - implicit OR)

**Available Values:**
- Corporate
- Council
- Housing Association
- Company
- Private owner

**Example Usage:**
```
✅ Ownership type: is one of [Corporate, Company]
✅ Ownership type: is one of [Council, Housing Association]
❌ Ownership type: 'Corporate' OR 'Company'  // INVALID - no OR operators
```

### Tenure ✓ [LIST-BASED]
**Operator:** `is one of` (checkbox selection - implicit OR)

**Available Values:**
- Leasehold
- Freehold
- Pending first registration
- Caution against first registration
- Rentcharge

**Example Usage:**
```
✅ Tenure: is one of [Freehold]
✅ Tenure: is one of [Leasehold, Freehold]
❌ Tenure: 'Freehold' OR 'Leasehold'  // INVALID - no OR operators
```

## Property Type

### Property type ✓ [LIST-BASED]
**Operators:** `contains all`, `contains any`, `does not contain`

**Available Values:**
- Detached
- Semi-Detached
- Terraced
- Flat
- Commercial

**Example Usage:**
```
✅ Property type: contains any [Detached, Semi-Detached]
✅ Property type: contains all [Commercial, Flat]
✅ Property type: does not contain [Terraced]
❌ Property type: 'Commercial' OR 'Residential'  // INVALID - no OR operators
```

**Note:** This is different from "Property classification" - both filters exist but serve different purposes.

---

## Title Measurements

- **Title area (acres)** ⚠️ ONLY IN ACRES
- **Developed area (sqft)** ⚠️ NOT sqmt - square FEET
- Developed area percentage
- **Undeveloped area (acres)**
- Percentage of road on title
- Majority of title is road

## Building Measurements

- Max building height on title (m) ✓
- Max number of building floors on title ✓
- Maximum height of roof in the title (m)
- A building in the title has flat roof ✓
- Number of buildings on title
- Property floor area (sqft) ⚠️ Square FEET, not metres

### Building Details (sqft - square FEET)
- Total building sqft on title
- Total domestic sqft on title
- Total non-domestic sqft on title
- Total public building sqft on title
- Total ground floor sqft on title
- Total retail ground floor sqft on title

## Planning Applications

- Proposal ✓ (keyword search)
- No. of applications
- Applications in the last 5 years ✓
- Max number of dwellings applied for ✓
- Last application submitted ✓

⚠️ **CRITICAL MISSING:** No "Planning Status" filter (no Expired/Lapsed option)
⚠️ **WORKAROUND:** Must use date ranges + proposal keywords

## Use Class

### Use class ✓ [LIST-BASED]
**Operators:** `contains any`, `contains all`, `does not contain`, `is equal to`

**Available Values:**
- B2 - General industrial
- B8 - Storage or distribution
- C1 - Hotels
- C2 - Residential institutions
- C2A - Secure Residential Institution
- C3 - Dwellinghouses
- C3(a) - Dwellinghouses
- C3(b) - Dwellinghouses
- C3(c) - Dwellinghouses
- C4 - HMO
- E - Commercial, Business and Service
- E(a) - Display or Retail sale of goods
- E(b) - Sale of food and drink
- E(c)(i) - Financial constants
- E(c)(ii) - Professional constants
- E(c)(iii) - Other commercial constants
- E(d) - Indoor sport
- E(e) - Provision of medical or health constants
- E(f) - Creche, day nursery or day centre
- E(g)(i) - Offices to carry out any operational or administrative functions
- E(g)(ii) - Research and development of products or processes
- E(g)(iii) - Industrial processes
- F1(a) - Provision of education
- F1(b) - Display of works of art
- F1(c) - Museums
- F1(d) - Public libraries
- F1(e) - Public halls
- F1(f) - Public worship or religious instruction
- F1(g) - Law courts
- F2(a) - Shops (mostly) selling essential goods
- F2(b) - Halls or meeting places
- F2(c) - Areas or places for outdoor sport
- F2(d) - Indoor or outdoor swimming pools or skating rinks
- Outside of the defined classes

**Example Usage:**
```
✅ Use class: contains any [E - Commercial Business and Service, C3 - Dwellinghouses]
✅ Use class: does not contain [B2 - General industrial]
❌ Use class: contains 'E' OR Use class: contains 'Mixed'  // INVALID - no OR operators
```

### Property classification ✓ [LIST-BASED]
**Operators:** `contains any`, `contains all`, `does not contain`, `exactly matches`
**Note:** Separate taxonomy from "Use class" - values cannot be mixed between these two filters

**Available Values:** (~500+ values organized in hierarchical categories)

**Major Categories:**
- Commercial (Agricultural, Farm, Fishery, Fish Farming, Fish Hatchery, Fish Processing, Oyster/Mussel Bed, Horticulture, Smallholding, Vineyard, Watercress Bed, Slaughter House/Abattoir, Ancillary Building Commercial, Community Services, Law Court, Prison, HM Detention Centre, HM Prison Service, Secure Residential Accommodation, Public/Village Hall/Other Community Facility, Youth Recreational/Social Club, Public Convenience, Cemetery/Crematorium/Graveyard, Columbarium, Crematorium, Chapel Of Rest, Cemetery, Military Cemetery, Mortuary, Church Hall/Religious Meeting Place/Hall, Community Service Centre/Office, Public Household Waste Recycling Centre (HWRC), Recycling Site, CCTV, Job Centre)
- Education (College, Further Education, Higher Education, Children's Nursery/Crèche, Preparatory/First/Primary/Infant/Junior/Middle School, First School, Infant School, Junior School, Middle School, Non State Primary/Preparatory School, Primary School, Secondary/High School, Non State Secondary School, Secondary School, University, Special Needs Establishment, Other Educational Establishment)
- Hotel/Motel/Boarding/Guest House (Boarding/Guest House/Bed And Breakfast/Youth Hostel, Youth Hostel, Holiday Let/Accommodation/Short-Term Let Other Than CH01, Hotel/Motel)
- Industrial (Factory/Manufacturing, Aircraft Works, Boat Building, Brick Works, Brewery, Cider Manufacture, Chemical Works, Cement Works, Dairy Processing, Distillery, Flour Mill, Food Processing, Glassworks, Manufacturing, Oast House, Oil Refining, Pottery Manufacturing, Paper Mill, Printing Works, Sugar Refinery, Steel Works, Timber Mill, Winery, Shipyard)
- Mineral/Ore Working/Quarry/Mine (Mineral Mining/Active, Mineral Distribution/Storage, Mineral Processing, Oil/Gas Extraction/Active, Mineral Quarrying/Open Extraction/Active)
- Workshop/Light Industrial (Servicing Garage, Warehouse/Store/Storage Depot, Crop Handling/Storage, Postal Sorting/Distribution, Solid Fuel Storage, Timber Storage, Wholesale Distribution, Solid Fuel Distribution, Timber Distribution, Recycling Plant, Incinerator/Waste Transfer Station, Maintenance Depot)
- Leisure (Amusements, Leisure Pier, Holiday/Campsite, Camping, Caravanning, Holiday Accommodation, Holiday Centre, Youth Organisation Camp, Library, Reading Room, Museum/Gallery, Art Centre/Gallery, Aviation Museum, Heritage Centre, Industrial Museum, Military Museum, Maritime Museum, Science Museum, Transport Museum, Indoor/Outdoor Leisure/Sporting Activity/Centre, Athletics Facility, Bowls Facility, Cricket Facility, Curling Facility, Diving/Swimming Facility, Equestrian Sports Facility, Football Facility, Fishing/Angling Facility, Golf Facility/Golf courses, Gliding Facility, Greyhound Racing Facility, Hockey Facility, Horse Racing Facility, Historic Vessel/Aircraft/Vehicle, Activity/Leisure/Sports Centre, Model Sports Facility, Motor Sports Facility, Playing Field, Racquet Sports Facility, Rugby Facility, Recreation Ground, Shinty Facility, Skateboarding Facility, Civilian Firing Facility, Tenpin Bowling Facility, Public Tennis Court, Water Sports Facility, Winter Sports Facility, Wildlife Sports Facility, Cycling Sports Facility, Bingo Hall/Cinema/Conference/Exhibition Centre/Theatre/Concert Hall, Cinema, Entertainment Complex, Conference/Exhibition Centre, Theatre, Zoo/Theme Park, Amusement Park, Aquatic Attraction, Model Village Site, Wildlife/Zoological Park, Beach Hut (Recreational, Non-Residential Use Only), Licensed Private Members' Club, Recreational/Social Club, Arena/Stadium, Stadium, Showground)
- Medical (Dentist, General Practice Surgery/Clinic, Health Centre, Health Care Services, Hospital/Hospice, Hospice, Hospital, Medical/Testing/Research Laboratory, Professional Medical Service, Assessment/Development Services)
- Animal Centre (Cattery/Kennel, Animal Services, Animal Quarantining, Equestrian, Horse Racing/Breeding Stable, Commercial Stabling/Riding, Vet/Animal Medical Treatment, Animal/Bird/Marine Sanctuary, Animal Sanctuary, Marine Sanctuary)
- Office (Office/Work Studio, Embassy/High Commission/Consulate, Film Studio, Central Government Service, Local Government Service)
- Broadcasting (TV/Radio)
- Retail (Bank/Financial Service, Retail Service Agent, Post Office, Market (Indoor/Outdoor), Fish Market, Fruit/Vegetable Market, Livestock Market, Petrol Filling Station, Public House/Bar/Nightclub, Restaurant/Cafeteria, Shop/Showroom, Garden Centre, Other Licensed Premise/Vendor, Fast Food Outlet/Takeaway (Hot/Cold), Automated Teller Machine (ATM))
- Storage Land (General Storage Land, Builders' Yard)
- Transport (Airfield/Airstrip/Airport/Air Transport Infrastructure Facility, Airfield, Air Transport Infrastructure Services, Airport, Air Passenger Terminal, Helicopter Station, Heliport/Helipad, Bus Shelter, Car/Coach/Commercial Vehicle/Taxi Parking/Park And Ride Site, Public Park And Ride, Public Car Parking, Public Coach Parking, Public Commercial Vehicle Parking, Goods Freight Handling/Terminal, Air Freight Terminal, Container Freight, Road Freight Transport, Rail Freight Transport, Marina, Mooring, Railway Asset, Station/Interchange/Terminal/Halt, Bus/Coach Station, Railway Station, Vehicular Rail Terminal, Transport Track/Way, Cliff Railway, Chair Lift/Cable Car/Ski Tow, Monorail, Vehicle Storage, Boat Storage, Bus/Coach Depot, Transport Related Infrastructure, Aqueduct, Lock, Weir, Weighbridge/Load Gauge, Overnight Lorry Park, Harbour/Port/Dock/Dockyard/Slipway/Landing Stage/Pier/Jetty/Pontoon/Terminal/Berthing/Quay, Passenger Ferry Terminal, Non-Tanker Nautical Berthing, Nautical Refuelling Facility, Slipway, Ship Passenger Terminal, Tanker Berthing, Vehicular Ferry Terminal)
- Utility (Electricity Sub-Station, Landfill, Power Station/Energy Production, Electricity Distribution Facility, Electricity Production Facility, Wind Farm, Wind Turbine, Pump House/Pumping Station/Water Tower, Water Controlling/Pumping, Water Distribution/Pumping, Water Quality Monitoring, Water Storage, Waste Water Distribution/Pumping, Telecommunication, Telecommunications Mast, Telephone Exchange, Water/Waste Water/Sewage Treatment Works, Waste Water Treatment, Water Treatment, Gas/Oil Storage/Distribution, Gas Governor, Gas Holder, Oil Terminal, Other Utility Use, Cable Terminal Station, Observatory, Radar Station, Satellite Earth Station, Waste Management, Telephone Box, Other Public Telephones, Dam)
- Emergency/Rescue Service (Police/Transport Police/Station, Police Training, Fire Station, Fire Service Training, Ambulance Station, Air Sea Rescue/Air Ambulance, Lifeboat Services/Station, Coastguard Rescue/Lookout/Station, Mountain Rescue Station, Lighthouse, Police Box/Kiosk)
- Information (Advertising Hoarding, Tourist Information Signage, Visitor Information, Traffic Information Signage)
- Land (Agricultural, Grazing Land, Permanent Crop/Crop Rotation, Orchard, Ancillary Building Land, Aviary/Dovecot/Cage, Bandstand, Pavilion/Changing Room, Sports Viewing Structure, Burial Ground, Historic/Disused Cemetery/Graveyard, Development, Development Site, Commercial Construction Site, Community Construction Site, Residential Construction Site, Transport Construction Site, Forestry, Forest/Arboretum/Pinetum (Managed/Unmanaged), Arboretum, Woodland, Allotment, Amenity, Landscaped Roundabout, Verge/Central Reservation, Natural Central Reservation, Natural Verge, Maintained Amenity Land, Maintained Surfaced Area, Made Central Reservation, Pavement, Open Space, Heath/Moorland, Park, Public Park/Garden, Public Open Space/Nature Reserve, Playground, Play Area, Paddling Pool, Private Park/Garden, Unused Land, Vacant/Derelict Land)
- Water (Lake/Reservoir, Balancing Pond, Buried Reservoir, Named Pond, Dew Pond, Decoy Pond, Static Water, Waterway, Drain, Leats/Races)
- Military (Army, Army Military Storage, Army Military Range, Army Site, Army Military Training, Ancillary Building Military, Military Target, Air Force, Air Force Military Storage, Air Force Military Range, Air Force Site, Air Force Military Training, Defence Estates, Navy, Naval Military Storage, Naval Military Range, Naval Site, Naval Military Training)
- Other (Ordnance Survey Only) (Aid To Navigation, Aid To Aeronautical Navigation, Aeronautical Navigation Beacon/Light, Landing Light, Signal Square, Wind Sock/Wind Tee, Aid To Nautical Navigation, Daymark, Fog Horn Warning, Nautical Navigation Beacon/Light, Aid To Road Navigation, Guide Post, Coastal Protection/Flood Prevention, Boulder Wall/Sea Wall, Flood Gate/Flood Sluice Gate/Flood Valve, Groyne, Rip-Rap, Emergency Support, Beach Office/First Aid Facility, Emergency Telephone (Non Motorway), Fire Alarm Structure/Fire Observation Tower/Fire Beater Facility, Emergency Equipment Point/Emergency Siren/Warning Flag, Lifeguard Facility, Life/Belt/Buoy/Float/Jacket/Safety Rope, Street Furniture, Agricultural Support Objects, Fish Ladder/Lock/Pen/Trap, Livestock Pen/Dip, Currick, Slurry Bed/Pit, Historical Site/Object, Historic Structure/Object, Industrial Support, Adit/Incline/Level, Caisson/Dry Dock/Grid, Channel/Conveyor/Conduit/Pipe, Chimney/Flue, Crane/Hoist/Winch/Material Elevator, Flare Stack, Hopper/Silo/Cistern/Tank, Grab/Skip/Other Industrial Waste Machinery/Discharging, Kiln/Oven/Smelter, Manhole/Shaft, Industrial Overflow/Sluice/Valve/Valve Housing, Cooling Tower, Solar Panel/Waterwheel, Telephone Pole/Post, Electricity Distribution Pole/Pylon, Significant Natural Object, Boundary/Significant/Historic Tree/Pollard, Boundary/Significant Rock/Boulder, Natural Hole (Blow/Shake/Swallow), Ornamental/Cultural Object, Mausoleum/Tomb/Grave, Simple Ornamental Object, Maze, Sport/Leisure Support, Butt/Hide, Gallop/Ride, Miniature Railway, Royal Mail Infrastructure, Postal Box, Postal Delivery Box/Pouch, PO Box, Additional Mail/Packet Addressee, Scientific/Observation Support, Meteorological Station/Equipment, Radar/Satellite Infrastructure, Telescope/Observation Infrastructure/Astronomy, Transport Support, Cattle Grid/Ford, Elevator/Escalator/Steps, Footbridge/Walkway, Pole/Post/Bollard (Restricting Vehicular Access), Subway/Underpass, Customs Inspection Facility, Lay-By, Level Crossing, Mail Pick Up, Railway Pedestrian Crossing, Railway Buffer, Rail Drag, Rail Infrastructure Services, Rail Kilometre Distance Marker, Railway Lighting, Rail Mile Distance Marker, Railway Turntable, Rail Weighbridge, Rail Signalling, Railway Traverse, Goods Tramway, Road Drag, Vehicle Dip, Road Turntable, Road Mile Distance Marker, Road Kilometre Distance Marker, Road Infrastructure Services, Unsupported Site, Cycle Parking Facility, Picnic/Barbeque Site, Travelling Persons Site, Shelter (Not Including Bus Shelter))
- Parent Shell (Property Shell, Street Record)
- Residential (Ancillary Building Residential, Car Park Space, Allocated Parking, Dwelling, Caravan, Detached, Semi-Detached, Terraced, Self Contained Flat (Includes Maisonette/Apartment), House Boat, Sheltered Accommodation, Privately Owned Holiday Caravan/Chalet, Garage, Lock-Up Garage/Garage Court, House In Multiple Occupation, HMO Parent, HMO Bedsit/Other Non Self Contained Accommodation, HMO Not Further Divided, Residential Institution, Care/Nursing Home, Communal Residence, Non-Commercial Lodgings, Religious Community, Residential Education)
- Unclassified (Awaiting Classification, Pending Internal Investigation)
- Dual Use
- Object of Interest (Archaeological Dig Site, Monument, Obelisk/Milestone/Standing Stone, Obelisk, Standing Stone, Memorial/Market Cross, Statue, Castle/Historic Ruin, Other Structure, Boundary Stone, Cascade/Fountain, Permanent Art Display/Sculpture, Windmill (Inactive), Stately Home, Underground Feature, Cave, Pothole/Natural Hole, Other Underground Feature, Cellar, Disused Mine, Mineral Mining/Inactive, Oil And/Gas Extraction/Inactive, Mineral Quarrying And/Open Extraction/Inactive, Well/Spring, Spring, Well, Place Of Worship, Abbey, Cathedral, Church, Chapel, Gurdwara, Kingdom Hall, Lych Gate, Mosque, Minster, Stupa, Synagogue, Temple)

**Example Usage:**
```
✅ Property classification: contains any [Commercial, Residential]
✅ Property classification: contains all [Development Site, Residential Construction Site]
✅ Property classification: does not contain [Military, Prison]
✅ Property classification: exactly matches [Hotel/Motel]
❌ Property classification: 'Commercial' OR 'Residential'  // INVALID - no OR operators
```

**⚠️ CRITICAL:** Do NOT mix "Property classification" values with "Use class" values - they are separate taxonomies.

---

### Building use group ✓ [LIST-BASED]
**Operators:** `contains any`, `contains all`, `does not contain`

**Available Values:** (17 high-level categories)
- Agriculture Or Aquaculture
- Attraction, Sports or Activity
- Commercial Activity: Logistics Or Manufacturing
- Commercial Activity: Other
- Commercial Activity: Retail
- Construction
- Education
- Government Services
- Medical or Emergency Services
- Mixed Use
- Religious Worship and Funeral Services
- Residential Accommodation
- Temporary Or Holiday Accommodation
- Transport
- Unknown
- Utility Or Environmental Protection

**Example Usage:**
```
✅ Building use group: contains any [Mixed Use, Commercial Activity: Other]
✅ Building use group: does not contain [Agriculture Or Aquaculture, Utility Or Environmental Protection]
✅ Building use group: contains all [Residential Accommodation, Mixed Use]
❌ Building use group: 'Mixed Use' OR 'Commercial'  // INVALID - no OR operators
```

**Note:** This is a high-level grouping - less granular than "Use class" but more specific than "Property type".

### Other Use Class Filters:
- VOA entry on the title
- VOA property description

## Constraints

### Planning Constraints

#### Planning constraints ✓ [LIST-BASED]
**Operators:** `contains any`, `contains all`, `does not contain`

**Available Values:** (34 constraint types)
- National Landscapes (AONB)
- Flood Zone 2
- Flood Zone 3
- Housing Zones
- National Parks
- SAC (Special Areas of Conservation)
- CROW (Countryside and Rights of Way)
- Country Parks
- Site Allocations
- World heritage sites
- Local Nature Reserves
- Areas Of Intensification
- SIL (Strategic Industrial Locations)
- LSIS (Locally Significant Industrial Sites)
- Green Belt
- Listed Building(s) in plot
- Listed Building(s) 50m Buffer
- Conservation Area
- Designated Open Space
- Town Center Boundaries
- SSSI (Sites of Special Scientific Interest)
- Parks and Gardens
- Opportunity Areas
- Ancient Woodland
- Central Activities Zone
- RAMSAR (Wetlands)
- Scheduled Monuments
- Battlefields
- National Nature Reserves
- SPA (Special Protection Areas)
- Built up areas
- Nutrient Neutrality
- Tree Preservation Order (TPO)

**Example Usage:**
```
✅ Planning constraints: does not contain [Green Belt, Conservation Area]  // Avoid major blockers
✅ Planning constraints: contains any [Housing Zones, Opportunity Areas]  // Seek policy support
✅ Planning constraints: does not contain [Flood Zone 3, SSSI]  // Exclude flood risk & protected sites
✅ Planning constraints: contains all [Housing Zones, Built up areas]  // Urban housing policy areas
❌ Planning constraints: NOT 'Green Belt'  // INVALID - use 'does not contain'
```

**Strategic Use Cases:**
- **Exclusions (Avoid):** Green Belt, Conservation Area, Listed Building(s) in plot, Flood Zone 3, SSSI, Ancient Woodland
- **Opportunities (Seek):** Housing Zones, Opportunity Areas, Areas Of Intensification, Site Allocations
- **Negotiable:** Flood Zone 2 (mitigation possible), Listed Building(s) 50m Buffer, Town Center Boundaries
- **Policy Support:** Central Activities Zone (London), SIL/LSIS (industrial conversion opportunities)

**Performance/Notes:**
- Fast filter - indexed field
- Use "Percentage of plot un-constrained" to find sites with minimal constraint coverage
- Some constraints are absolute blockers (Green Belt, SSSI), others are negotiable
- "Built up areas" is POSITIVE - indicates urban context (not a constraint to avoid)

#### Other Constraint Filters:
- Percentage of plot un-constrained ✓
- Area of plot un-constrained (acres)
- Contains public rights of way
- Protected from flooding

### Environmental Constraints (all in acres)
- Area of title not covered by Ancient Woodland (acres)
- Area of title not covered by Areas of Outstanding Natural Beauty (acres)
- Area of title not covered by Conservation Areas (acres)
- Area of title not covered by Country Parks (acres)
- Area of title not covered by Flood Zone 2 (acres)
- Area of title not covered by Flood Zone 3 (acres)
- Area of title not covered by Green Belt land (acres)
- Area of title not covered by Local Nature Reserves (acres)
- Area of title not covered by National Nature Reserves (acres)
- Area of title not covered by National Parks (acres)
- Area of title not covered by Ramsar Wetlands (acres)
- Area of title not covered by Registered Battlefields (acres)
- Area of title not covered by Registered Parks and Gardens (acres)
- Area of title not covered by Scheduled Monuments (acres)
- Area of title not covered by Sites of Special Scientific Interest (acres)
- Area of title not covered by Special Areas of Conservation (acres)
- Area of title not covered by Special Protection Areas (acres)
- Area of title not covered by World Heritage Sites (acres)
- Area of title within 50m of a Listed Building (acres)

### Percentage Coverage (%)
- Percentage of title covered by Ancient Woodland
- Percentage of title covered by Areas of Outstanding Natural Beauty (AONB)
- Percentage of title covered by Areas of Tree Preservation Order (TPO)
- Percentage of title covered by Conservation Areas
- Percentage of title covered by Flood Zone 2
- Percentage of title covered by Flood Zone 3
- Percentage of title covered by Green Belt land
- Percentage of title covered by hard standings
- Percentage of title subject to Article 4 Directions

### Other Constraints
- Article 4
- Coal authority constraints
- Surface water flooding risk level
- Surface water flooding risk level (climate change adjusted)
- Agricultural land classification
- Chance of radon gas
- Has safeguarded air space for
- Radar interference development height (m)
- Irreplaceable habitats

## Transport & Proximity

### Transport Accessibility

#### TFL Public Transport Accessibility Level (PTAL) ✓ [LIST-BASED]
**Operators:** `contains any`, `contains all`, `does not contain`, `exactly matches`

**Available Values:**
- 0 (Worst)
- 1a
- 1b
- 2
- 3
- 4
- 5
- 6a
- 6b (Best)

**Example Usage:**
```
✅ PTAL: contains any [6a, 6b (Best)]
✅ PTAL: is greater than or equal to [4]
✅ PTAL: does not contain [0 (Worst), 1a, 1b]
❌ PTAL: '6a' OR '6b'  // INVALID - no OR operators
```

**Note:** Higher PTAL values indicate better public transport accessibility. London-specific metric.

- Nearby adopted roads

### Distance Filters (all in metres)
- Distance to nearest A road (m)
- Distance to nearest B road (m)
- Distance to nearest minor road (m)
- Distance to nearest motorway (m)
- Distance to nearest Train Station (m)
- Distance to nearest Bus Stop (m)
- Distance to nearest Rapid Transit Stop/Station (m)

### Distance to Services
- Distance to nearest hospital (m)
- Distance to nearest school (m)
- Distance to nearest GP (m)
- Distance to nearest care home (m)
- Distance to nearest clinic (m)
- Distance to nearest dentist (m)
- Distance to nearest pharmacy (m)
- Distance to nearest optician (m)
- Distance to nearest social care facility (m)
- Distance to nearest residential address (m)

### Distance to Boundaries/Areas
- Distance to nearest adopted settlement boundary (m)
- Distance to nearest emerging settlement boundary (m)
- Distance to nearest built up area (m)

### Distance to Infrastructure
- Distance to nearest Substation (m)
- Distance to nearest Green Rated Substation (m) ✓
- Distance to nearest Amber Rated Substation (m)
- Distance to nearest Red Rated Substation (m)
- Distance to nearest Power Line (m)
- Distance to nearest EV Chargepoint (m)
- Distance to nearest HMO (m)

## Commercial Sales

- Commercial sales average price
- Number of commercial sales currently on market
- Commercial sales sector
- Commercial sales sub sector

## Commercial Lettings

- Commercial lettings average rent per annum
- Number of commercial lettings currently on market
- Commercial lettings number of leases on title
- Commercial lettings sector
- Commercial lettings sub sector
- Commercial lettings status availability
- Commercial lettings tenant names

## Rightmove Sales Listings

- **Sales listing currently on the market** ✓
- **Sales listing price** ✓
- **Sales listing status** ✓
  - Available
  - Under Offer
  - Reserved
  - Invisible
  - Sold Subject to Contract
  - Sold Subject to Conclusion of Missives
  - Sale Completed
- Sales listing property type
- Sales listing number of bedrooms
- Sales listing number of bathrooms
- Sales listing number of living rooms
- Sales listing year property built
- Sales listing is retirement property
- Sales listing is under auction

⚠️ **MISSING:** "Listed for >12 months" filter NOT available
⚠️ **MISSING:** "Price reduced" filter NOT available
⚠️ **WORKAROUND:** Must use combinations of status and manual screening

## Rightmove Rental Listings

- Rental listing currently on the market
- Rental listing price per month
- Rental listing status
- Rental listing property type
- Rental listing number of bedrooms
- Rental listing number of bathrooms
- Rental listing number of living rooms
- Rental listing year property built
- Rental listing is retirement property

## EPC (Energy Performance Certificate)

- Property floor area (sqft)
- Latest EPC inspection date ✓
- Latest EPC number of habitable rooms
- **EPC rating** ✓
- **Energy efficiency** ✓
- Number of EPC records on title

### EPC Components
- EPC tenure
- EPC main heating fuel
- EPC floor energy efficiency
- EPC walls energy efficiency
- EPC roof energy efficiency
- EPC main heating energy efficiency
- EPC main heating controls energy efficiency
- EPC lighting energy efficiency
- EPC windows energy efficiency
- All EPC recommendations ✓

### EPC Descriptions
- EPC hot water description
- EPC floor description
- EPC windows description
- EPC roof description
- EPC second heat description
- EPC main heating description
- EPC lighting description
- EPC walls description
- EPC main heating controls description

## Company Information

- Company name
- Company Reg No.
- Company Incorporated Overseas
- Country Incorporated
- SIC codes
- Date added to the register
- Ultimate parent company name
- Ultimate parent company number
- Number of directors at company
- Number of titles owned by company
- Number of mortgages charges associated with company
- Company status

## Sold Price (Price Paid Data)

- **Latest sold price** ✓
- **Latest sold date** ✓
- **Latest price per sqmt** ✓
- Avg sold price in last 5 years ✓
- Number of price paid records on title
- Property type
- Contains new build

## Leasehold Information

- Lease start date
- Lease end date ✓
- Lease length (years)
- Number of leaseholds on the freehold ✓
- Maximum leasehold expiry date on freehold

## HMO (House in Multiple Occupation)

- Has an HMO ✓
- HMO License Expiry Date
- HMO License Holder Name
- HMO Maximum Occupancy

## Terrain & Elevation

- Maximum Elevation of Title (m)
- Minimum Elevation of Title (m)
- Average Elevation of Title (m)

### Gradient (%)
- Percentage of Title With Flat Gradient
- Percentage of Title With Gentle Gradient
- Percentage of Title With Moderate Gradient
- Percentage of Title With Steep Gradient
- Percentage of Title With Very Steep Gradient

### Aspect/Direction (%)
- Percentage of Title Facing Northerly
- Percentage of Title Facing North Easterly
- Percentage of Title Facing Easterly
- Percentage of Title Facing South Easterly
- Percentage of Title Facing Southerly
- Percentage of Title Facing South Westerly
- Percentage of Title Facing Westerly
- Percentage of Title Facing North Westerly

## Land Allocation & Policy

- Site allocation type ✓
- Land Availability Assessment (SHLAA) ✓
- In adopted settlement ✓
- In emerging settlement ✓
- Percentage of title in adopted settlement
- Percentage of title in emerging settlement
- Neighbouring Local Planning Authorities of

⚠️ **MISSING:** "Tall Building Policy Zone" NOT a direct filter
⚠️ **MISSING:** "Housing Delivery Test" NOT a filter
⚠️ **WORKAROUND:** Must know geography and filter by authority manually

## Green Belt Review Ratings

- Overall rating of overlapping Green Belt Review
- Setting rating of overlapping Green Belt Review
- Sprawl rating of overlapping Green Belt Review
- Merge rating of overlapping Green Belt Review
- Safeguarding rating of overlapping Green Belt Review
- Regeneration rating of overlapping Green Belt Review

## Building Status

- Building on title is derelict ✓
- Building on title is under construction ✓
- Building on title is inactive ✓
- Building on title has solar panels
- Title has prebuild addresses
- Title has historic addresses
- Title has unoccupied addresses
- Period buildings on title were built

## Demographics (Nearby Area)

- Population density (number of people per km2)
- Percentage of area aged 65 or above
- Percentage of area aged 85 or above
- Median age nearby
- Average household deprivation level nerby
- Typical household size nearby
- Average number of cars or vans per Household
- Mean gross annual household income (unequivalised) (£)
- Mean net annual household income (unequivalised) (£)

### Typical Characteristics
- Most common ethnic group nearby
- Most common country of birth nearby
- Most common religion nearby
- Most common economic activity nearby
- Most common socio-economic classification for area
- Most common number of bedrooms in households nearby
- Typical resident persona for area (high level/mid level/low level)
- Typical length of residence in area
- Typical urban setting description

## Footfall & Traffic

- Average footfall count passing title daily ✓
- Average vehicle count passing title daily ✓

## Environmental Data

### Solar/Energy
- Global Horizontal Irradiation kWh/m2 per year
- Global Tilted Irradiation kWh/m2 per year
- Direct Normal Irradiation kWh/m2 per year
- Diffuse Horizontal Irradiation kWh/m2 per year
- Specific photovoltaic power output kWh/m2 per year
- Optimum Tilt of PV Modules (°)

### Climate
- Air Temperature (°C)

### Natural Environment
- National Character Area
- Neighbouring National Character Areas of
- Operational Catchment Area
- Waterbody Catchment Area
- Local Nature Recovery Strategy Area

### Habitats & Biodiversity
- Habitat type
- Habitat group
- Total number of habitats on title
- Total area habitat units
- Total linear hedgerow units
- Total linear watercourse units

## Care Homes

- Has extra care housing
- Has nursing care home
- Has resident care home
- Has shared lives
- Number of care homes
- Number of active care homes
- Latest overall rating
- Distance to nearest good/outstanding/inadequate/requires improvement elderly care home (m)
- Average minimum fees per week
- Average bedroom occupancy rating nearby

## Class MA Specific

- **Percentage profit (Class MA only)** ✓

## Accommodation

- Accommodation Type
- Main heating type nearby

## Valuation

- Land value
- Land value transaction date
- Sum of all units

---

## CRITICAL FINDINGS (2025-01-19)

### ❌ Filters That DON'T Exist:

1. **"Planning Status: Expired/Lapsed"** - Major issue for Filter 2
2. **"Listed for >12 months"** - Can't directly filter stale listings
3. **"Price reduced"** - Can't directly filter motivated sellers
4. **"Tall Building Policy Zone"** - Must know geography manually
5. **"Housing Delivery Test results"** - Must research separately

### ⚠️ Unit Mismatches:

1. **Title area** = ACRES only (not sqmt)
   - 800 sqmt = 0.198 acres
   - 2,500 sqmt = 0.618 acres

2. **Building areas** = Square FEET (not sqmt)
   - Must convert: 1 sqft = 0.0929 sqm
   - Or: 1 sqm = 10.764 sqft

3. **Distances** = Metres ✓ (correct)
4. **Height** = Metres ✓ (correct)

### ✓ Filters That DO Exist (Good News):

1. Proposal (keyword search) ✓
2. Max building height (m) ✓
3. PTAL levels ✓
4. Last application submitted (date range) ✓
5. Building status (derelict, inactive, construction) ✓
6. Latest sold date ✓
7. EPC ratings ✓
8. Sales listing status ✓
9. Use class ✓
10. Ownership type ✓

---

## Workarounds for Missing Filters:

### For "Expired Planning":
Use combination of:
- Last application submitted: >2 years ago
- Proposal: contains keywords
- Max dwellings applied for: >0
- Building on title is inactive (proxy for stalled development)

### For "Listed >12 months":
- Manual screening required
- OR use "Sales listing status: Available" + old "Latest sold date"
- Imperfect proxy

### For "Tall Building Policy":
- Must research local policies manually
- Filter by specific boroughs/authorities
- Use PTAL as proxy (high PTAL areas more likely to support tall buildings)

### For "Housing Delivery Test":
- Research HDT results separately
- Filter by specific local authorities that failed
- Not directly filterable in SearchLand

---

