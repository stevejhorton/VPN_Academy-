---
id: nlyte_dcim
title: Nlyte_DCIM_Physical_Layer_Management
tags: [nlyte, dcim, physical, rack, rma, tower_build, level2]
levels: [level2]
platform: all
status: active
---

# Nlyte_DCIM_Physical_Layer_Management

Nlyte is the Data Center Infrastructure Management (DCIM) system.
It is the authoritative source for physical layer information:
rack diagrams, power allocation, cabling, and physical asset tracking.

---

## When You Touch Nlyte

Nlyte must be updated any time there is a physical change to headend infrastructure:

| Event | Nlyte Action Required |
|-------|----------------------|
| New tower build | Add rack position, power, cabling |
| RMA (hardware replacement) | Update asset, serial number, rack position |
| Hardware move within DC | Update rack diagram and cabling |
| Decommission | Mark asset retired, free rack space |
| New DC site | Full site build in Nlyte |

---

## What Lives in Nlyte

- Rack elevation diagrams (what is in which U position)
- Power circuit assignments
- Cabling documentation (patch panel to switch port)
- Asset serial numbers and warranty status
- Physical IP addressing tied to rack position

---

## What Does NOT Live in Nlyte

- Logical config (that is ASA / FXOS)
- Monitoring (Cacti, GnX, Splunk)
- CMDB CIs (that is ServiceNow / NA)

---

## L2 Responsibility

Nlyte updates are an **L2 SME responsibility**. L1 SMEs should be able to
read Nlyte diagrams but are not expected to make updates.

> Trap Door: Physical changes that are not reflected in Nlyte create
> confusion during RMAs and audits. Update Nlyte before you close the change ticket.

---

## Access
Request Nlyte access through the standard access request process.
Contact your manager or Horton if access is needed for a tower build.
