---
id: recipe_venafi_certificate_renewal
type: recipe
tags: [recipe, venafi, certificate, change, rollback]
---

# Recipe_Venafi_Certificate_Renewal

## Purpose

Reusable change recipe for EmpVPN certificate renewal work involving Venafi-managed certificates.

## Inputs

- Target headend/tower
- Certificate common name / SANs
- Venafi request or renewal details
- Maintenance window
- Rollback plan

## Validation

- Confirm cert chain is trusted.
- Confirm Cisco Secure Client connection.
- Confirm DTLS/TLS negotiation remains healthy.
- Confirm Splunk shows expected session establishment events.

## Rollback

Restore prior trustpoint/cert chain and remove impacted headend from rotation if required.
