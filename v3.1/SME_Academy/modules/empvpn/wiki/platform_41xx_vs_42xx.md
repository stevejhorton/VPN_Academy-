---
id: platform_41xx_vs_42xx
title: Platform_Guide_41xx_vs_42xx
tags: [firepower, 41xx, 42xx, fxos, asa, platform, tower_build]
levels: [level1, level2]
platform: all
status: active
---

# Platform_Guide_41xx_vs_42xx

Understanding which platform you are working on is the first thing you determine
before touching any headend. The procedures, diagnostic paths, and upgrade sequences
are meaningfully different between the two series.

---

## 41xx Series (4115, 4125)

**Architecture: Dual OS**

| Layer | Component | Notes |
|-------|-----------|-------|
| Host OS | FXOS | Physical hardware management, NTP authority, chassis health |
| Guest OS | ASA (virtual) | VPN service, ACLs, tunnel groups, group policies |

### Key Operational Facts

- **NTP**: ASA inherits time from FXOS. Do NOT look for NTP config in ASA on a 41xx.
  If time is wrong, go to FXOS first. Always.
- **Upgrades**: Two upgrade paths to manage — FXOS bundle AND ASA image. Order matters.
- **Console access**: FXOS console → then connect to ASA module from within FXOS.
- **Troubleshooting**: Many symptoms that look like ASA problems originate in FXOS.
  Check FXOS health before assuming ASA fault.
- **Complexity**: Higher. More moving parts. More trap doors.

### Sites Running 41xx
All global sites NOT listed in the 42xx section below.

---

## 42xx Series (4215, 4225)

**Architecture: ASA Only**

| Layer | Component | Notes |
|-------|-----------|-------|
| Single OS | ASA | Direct management, no FXOS layer |

### Key Operational Facts

- **NTP**: Configured and managed directly in ASA. `show ntp status` is authoritative.
- **Upgrades**: Single image upgrade. Cleaner process.
- **Console access**: Direct to ASA.
- **Troubleshooting**: What you see is what you get. No FXOS layer to chase.
- **Complexity**: Lower. Preferred platform for new tower builds where available.

### Sites Running 42xx

| Site Code | Location |
|-----------|----------|
| TN231 AirPark | Nashville, TN (DC) |
| PH550 | Manila, Philippines |
| II771 | India |
| CA777 | Los Angeles, CA (4225 x2 — coming soon) |

---

## Decision Tree: Which Platform Am I On?

```
Is there an FXOS management IP for this headend?
├── YES → 41xx. Start troubleshooting in FXOS.
└── NO  → 42xx. ASA is the only OS. Proceed normally.
```

---

## Common Mistakes by Platform

| Mistake | Platform | Consequence |
|---------|----------|-------------|
| Looking for NTP config in ASA | 41xx | Will not find it. Time is FXOS-owned. |
| Upgrading ASA without checking FXOS compatibility | 41xx | Possible boot failure |
| Applying 41xx runbook to a 42xx | Both | Wasted time, wrong diagnostic path |
| Forgetting FXOS needs its own TACACS config | 41xx | FXOS locked to local auth after TACACS change |

---

## Related Content
- `ntp_architecture` — NTP deep dive by platform
- `tower_build_41xx` — L2 build runbook for 41xx
- `tower_build_42xx` — L2 build runbook for 42xx
- `sim: ntp_drift_cert_validation` — Hands-on scenario (41xx)
