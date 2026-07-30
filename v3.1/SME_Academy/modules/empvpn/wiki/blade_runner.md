---
id: blade_runner
title: Blade_Runner_Base_Config_Tool
tags: [blade_runner, base_config, asa, tower_build, level2]
levels: [level2]
platform: all
status: in_development
---

# Blade_Runner_Base_Config_Tool

> **Status: In Development**
> Blade Runner is currently Curator-operated. SMEs do not run it directly yet.
> This page will be updated when it becomes self-service.

---

## What Blade Runner Does

Blade Runner generates a validated base ASA configuration for a new headend,
consistent with current standards. It takes site-specific inputs and produces
a config that matches the established baseline for the environment.

This eliminates hand-crafting base configs from scratch, which is both
slow and a source of human error.

---

## Current Workflow (Curator-Operated)

Until Blade Runner is self-service, the workflow is:

1. SME gathers required inputs (see below)
2. SME submits inputs to Horton via a pending contribution or direct request
3. Horton runs Blade Runner and returns the generated config
4. SME validates config, applies to headend, tests

---

## Inputs Required

| Input | Description |
|-------|-------------|
| Site code | e.g. TN231, PH550 |
| Platform | 41xx or 42xx |
| Inside IP / mask | ASA inside interface |
| Outside IP / mask | ASA outside interface |
| DHCP pool range | Assigned range for VPN clients |
| Headend hostname | Standard naming convention |
| TACACS server IPs | From TACACS team |
| NTP server IPs | Minimum 3 |

---

## Future State

When Blade Runner becomes SME-facing, this page will include:
- Direct link to the tool
- Input form walkthrough
- Output validation checklist
- How to submit the generated config for Curator review before applying

---

## Related
- `tower_build_41xx` — Full build runbook for 41xx
- `tower_build_42xx` — Full build runbook for 42xx
