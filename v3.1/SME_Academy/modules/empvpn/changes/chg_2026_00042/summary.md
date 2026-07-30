---
id: chg_2026_00042_dtls_mtu_validation
type: change
status: example
source: normalized_change_knowledge_object
review_required: true
tags: [change, dtls, mtu, validation, rollback]
---

# CHG_2026_00042_DTLS_MTU_Validation

## Why_this_change_mattered

This is a sanitized example of how a past change can be preserved as reusable operational knowledge rather than raw ServiceNow export data.

## What_changed

- Validated DTLS behavior on a target VPN headend.
- Compared TLS fallback behavior.
- Captured Splunk evidence and rollback notes.

## Validation

- Confirmed user connection path.
- Confirmed no unexpected ASA syslog PMTU/MSS events.
- Confirmed normal application traffic after change.

## Rollback

Return the affected tower to the previous known-good config and remove it from active F5/GTM rotation if needed.

## Related

- DTLS_MTU_Troubleshooting
- ASA_Syslog_602101
- DTLS_MTU_Collapse simulation
