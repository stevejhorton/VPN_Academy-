---
id: ntp_architecture
title: NTP_Architecture_and_Trap_Doors
tags: [ntp, fxos, asa, 41xx, 42xx, certificates, time_sync, trap_door]
levels: [level1, level2]
platform: all
status: active
---

# NTP_Architecture_and_Trap_Doors

Time synchronization is load-bearing infrastructure for VPN headends.
Certs validate against time. DTLS validates against time. Logs are useless without it.
This is not a background concern — it is a foreground operational requirement.

---

## 41xx: NTP Lives in FXOS

On 41xx platforms, **FXOS owns time**. The ASA does not manage NTP independently.

```
FXOS (host OS)
  └── NTP configured here
  └── ASA inherits time from FXOS
      └── ASA NTP config is irrelevant / not present
```

### Diagnostic Path for Time Issues on 41xx

1. SSH to FXOS management IP
2. `show ntp` or navigate to Platform Settings → NTP in FXOS UI
3. Verify at least 2 of 3 sources are synced
4. Do NOT start in ASA — you will find nothing wrong there

### Current Standard: 3 NTP Sources

We run 3 NTP source IPs on all headends. Alerting fires if zero sources
are in sync for 24 hours or more. This came from a hard lesson (see below).

---

## 42xx: NTP Lives in ASA

On 42xx platforms, ASA manages NTP directly.

```bash
show ntp status
show ntp associations
```

Standard config: 3 NTP servers. Same alerting threshold.

---

## The India Incident — Why We Run 3 Sources

> **Scenario**: II771 India headend. Single NTP source configured (41xx platform).
> NTP lost sync on the FXOS side. Time drifted beyond cert validation tolerance.
> Result: Headend could not validate certificates despite having a valid cert and
> full valid chain. VPN service degraded.
>
> **Root cause**: Single point of failure in NTP. FXOS time drift.
> ASA cert validation failure was the symptom, not the cause.
>
> **Resolution**:
> - Added 2 additional NTP sources to FXOS config
> - Implemented alerting: page if all NTP sources unsynced for 24hrs+
> - Added NTP source count check to tower build checklist
>
> **Lesson**: When cert validation fails and the cert looks valid — check NTP first.
> On a 41xx, check NTP in FXOS, not ASA.

---

## Trap Door Summary

| Trap | Platform | How to avoid |
|------|----------|-------------|
| Chasing cert errors when time is the real problem | Both | Check NTP before cert chain |
| Looking in ASA for NTP config | 41xx | FXOS owns time on 41xx |
| Single NTP source | Both | Minimum 3 sources, always |
| No NTP sync alerting | Both | Alert on 24hr+ zero-sync condition |

---

## Related
- `platform_41xx_vs_42xx` — Platform overview
- `sim: ntp_drift_cert_validation` — Simulation based on the India incident
