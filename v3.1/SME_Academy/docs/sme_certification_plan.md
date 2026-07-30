---
id: sme_certification_plan
title: EmpVPN_SME_Certification_Plan
tags: [certification, level1, level2, curriculum, plan]
levels: [level0, level1, level2]
status: active
---

# EmpVPN_SME_Certification_Plan

**Organization:** Optum / UHG  
**Service:** Employee VPN (EmpVPN)  
**Scale:** ~500k endpoints | ~60 headends | 32 countries  
**SLO:** Horton  
**SME Pool Target:** 6 certified SMEs  

---

## Program Philosophy

We are not building certificate collectors. We are building engineers who are
**curious, self-starting, and dangerous in the best possible way**.

A CCNA/CCNP-level network engineer who asks good questions and chases problems
independently is worth more to this program than a credentialed engineer who
waits to be told what to do.

SME_Academy is the tool that enables self-starters. Everything they need —
documentation, runbooks, simulations, Splunk references, change recipes — lives here.
The goal is that no SME ever has to ask Horton a question they could have answered
themselves with five minutes in the Academy.

---

## Certification Tiers

### Level 0 — Onboarding (Gate, not graded)

**Objective:** Get the SME set up and connected before any technical content begins.

| Task | Deliverable |
|------|-------------|
| WSL installed and working | Screenshot or self-attestation |
| GHEC account created | Username submitted to Horton |
| Repo cloned successfully | `git log` output |
| SME_Academy profile complete | Profile tab filled in |
| PAT created and stored at `~/creds/pat.txt` | Self-attestation |

**Gate:** Must be complete before L1 content unlocks.

---

### Level 1 — Care and Feeding

**Objective:** SME can handle day-to-day VPN operations independently without escalating routine issues to the SLO.

**Duration:** Estimated 6-8 weeks self-paced.

#### Knowledge Areas

| Area | Topics |
|------|--------|
| Service Map | F5 Geo DNS, ASA, Secure Client, Zscaler, Venafi, DNS, SDWAN, datacenter topology |
| Platform Basics | 41xx vs 42xx differences, FXOS awareness, when to look where |
| NTP | Architecture by platform, trap doors, alerting standards |
| Splunk | Reading ASA syslogs, syslog 602101, DTLS/MTU events, building basic searches |
| Certificates | What certs live on a headend, Venafi basics, cert chain validation |
| DTLS/MTU | Troubleshooting methodology, MSS/PMTU, fragmentation |
| Change Awareness | How to read a CHG, what not to touch without an approved change |
| Trap Doors | ACL/XML lint checking, order of operations, NTP, human error patterns |

#### Assessments

| Assessment | Format | Passing |
|------------|--------|---------|
| Platform quiz | 10 questions, multiple choice | 80% |
| NTP sim | Scenario-based (II771 India incident) | Complete |
| DTLS/MTU quiz | 10 questions | 80% |
| Splunk lab | Find the event, identify the cause | Pass/Fail |
| Service map true/false | 15 questions | 80% |

#### L1 Certification Criteria
- All assessments passed
- Horton sign-off (brief conversation or shadow session)
- Profile updated to `l1_certified`

---

### Level 2 — Build and Own

**Objective:** SME can stand up a new VPN tower end-to-end, manage the full cert lifecycle,
own complex changes, and serve as backup SLO in an emergency.

> Note: L2 SMEs form the succession pool for the next VPN SLO.
> They do not need to know this. Build them like they might need to run it someday,
> because they might.

**Duration:** Estimated 10-14 weeks after L1 certification.

#### Knowledge Areas

| Area | Topics |
|------|--------|
| Tower Build 41xx | FXOS install, ASA install, order of operations, Nlyte, TACACS, Blade Runner inputs, monitoring onboarding |
| Tower Build 42xx | ASA-only build, same endpoint but cleaner path |
| Nlyte | Reading and updating rack diagrams, RMA process, physical asset tracking |
| Cert Lifecycle | Venafi end-to-end, renewal windows, pushing certs to ASA, trust points, DTLS vs TLS certs |
| Change Management | Writing a CHG, execution, rollback, ACL/XML lint before push |
| Proxy PAC | Adding pool ranges, validation, impact of getting it wrong |
| TACACS | Onboarding a new headend, FXOS vs ASA TACACS config on 41xx |
| Monitoring | CIs in NA, GnX, Cacti, Splunk onboarding for a new headend |
| Blade Runner | Inputs, review of output, validation before applying (tool in development) |

#### Assessments

| Assessment | Format | Passing |
|------------|--------|---------|
| Tower build quiz (41xx) | 15 questions | 85% |
| Tower build quiz (42xx) | 15 questions | 85% |
| Cert lifecycle sim | Scenario-based | Complete |
| Change execution sim | Write + execute a CHG scenario | Pass/Fail |
| Nlyte lab | Read a diagram, identify an RMA path | Pass/Fail |

#### L2 Certification Criteria
- L1 certified (prerequisite)
- All L2 assessments passed
- Observed or shadowed on at least one real change
- Horton sign-off
- Profile updated to `l2_certified`

---

## Leaderboard and Privacy

| Data | Visibility |
|------|------------|
| Anonymous leaderboard (points, badges, % complete) | All SMEs |
| Individual certification status (pass/fail only) | All SMEs |
| Full progress detail (scores, notes, sim history) | SLO + Service Architect only |
| Other SMEs' detailed progress | Not visible |

---

## Content Roadmap

Items marked 🔲 are planned but not yet built.

### Built
- [x] WSL/Git onboarding (L0)
- [x] Platform guide 41xx vs 42xx (L1)
- [x] NTP architecture and trap doors (L1)
- [x] Site inventory (L1/L2)
- [x] Nlyte DCIM guide (L2)
- [x] Blade Runner reference (L2, in_development)
- [x] NTP drift cert validation sim (L1/L2)
- [x] DTLS MTU training (L1)
- [x] DTLS MTU triage runbook (L1)

### Planned
- 🔲 Tower build runbook — 41xx (L2)
- 🔲 Tower build runbook — 42xx (L2)
- 🔲 Cert lifecycle wiki + sim (L1/L2)
- 🔲 Proxy PAC wiki (L2)
- 🔲 TACACS onboarding guide (L2)
- 🔲 ACL/XML lint trap door guide (L1)
- 🔲 Order of operations trap door guide (L1)
- 🔲 Monitoring onboarding checklist (L2)
- 🔲 Leaderboard UI in academy.js
- 🔲 Progress detail access control (SLO/Architect role gate)
- 🔲 L1 quiz set (all topics)
- 🔲 L2 quiz set (all topics)

---

## Contact

SLO: Horton (`horton` in SME_Academy)  
Repo: [VPN_Academy-](https://github.com/stevejhorton/VPN_Academy-)
