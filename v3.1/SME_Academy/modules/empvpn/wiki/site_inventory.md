---
id: site_inventory
title: Global_Headend_Site_Inventory
tags: [sites, headends, topology, 41xx, 42xx, global]
levels: [level1, level2]
platform: all
status: active
---

# Global_Headend_Site_Inventory

Approximately 60 headends across 32 countries supporting 500k+ endpoints.

> This page reflects platform type and site codes. For IP addressing, rack diagrams,
> and physical layout see Nlyte (DCIM). For headend-specific configs see Blade Runner output.

---

## 42xx Sites (ASA Only)

| Site Code | Location | Platform | Notes |
|-----------|----------|----------|-------|
| TN231 AirPark | Nashville, TN | 42xx | Primary US DC |
| PH550 | Manila, Philippines | 42xx | APAC anchor |
| II771 | India | 42xx | City TBD — update this |
| CA777 | Los Angeles, CA | 4225 x2 | Coming soon |

---

## 41xx Sites (FXOS + ASA)

All remaining ~56 sites globally run 41xx series hardware.
See Nlyte for individual site rack diagrams and addressing.

---

## Adding a New Site

New site additions require:
1. Nlyte updated with rack, power, and cabling diagrams
2. This inventory page updated via PR
3. Tower build runbook executed (see `tower_build_41xx` or `tower_build_42xx`)
4. CIs registered in NA, GnX, Cacti, and Splunk
5. Pool ranges added to proxy PAC

---

## Related
- `platform_41xx_vs_42xx` — Platform differences
- `nlyte_dcim` — Physical layer management
- `tower_build_41xx` — 41xx build runbook (L2)
- `tower_build_42xx` — 42xx build runbook (L2)
