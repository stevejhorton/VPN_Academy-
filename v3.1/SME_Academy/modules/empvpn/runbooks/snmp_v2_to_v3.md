---
id: snmp_v2_to_v3
title: SNMP_v2_to_v3_Migration
tags: [snmp, asa, cacti, gnx, monitoring, change]
levels: [level1]
---

# SNMP_v3 Workflow

1. Verify the list below is current by looking in github in the VPN repo.
2. Create chg in SNow
3. Contact Steve so he can update device polling in Cacti (nsis.optum.com)
4. Contact Sagar so he can turn aff alerting and change CI in Grafana.
5. Contact Teja to get alerting turned off in splunk.
6. After change check VPN Dashboard to verify device is now reporting via SNMPv3. May take 5/10 mins. 
7. If working, reenable alerting. 
8. Close chg

** CI List

snmp-server group globalEnforcePriv v3 priv 
snmp-server user netshaaes globalEnforcePriv v3 auth sha SOME_PW1 priv aes 128 SOME_PW2 
snmp-server host inside 10.122.72.188 version 3 netshaaes
snmp-server host inside 10.122.72.189 version 3 netshaaes
snmp-server host inside 10.177.72.148 version 3 netshaaes
snmp-server host inside 10.177.72.149 version 3 netshaaes
snmp-server host inside 10.28.199.57 version 3 netshaaes
snmp-server host inside 10.29.208.235 version 3 netshaaes
snmp-server host inside 10.86.186.96 version 3 netshaaes
snmp-server host inside 10.87.57.127 version 3 netshaaes
snmp-server host inside 10.28.67.198 version 3 netshaaes
snmp-server host inside 10.28.192.54 version 3 netshaaes
snmp-server host inside 10.29.64.33 version 3 netshaaes
snmp-server host inside 10.29.192.33 version 3 netshaaes
snmp-server host inside 10.28.201.166 version 3 netshaaes
snmp-server host inside 10.48.66.95 version 3 netshaaes
snmp-server host inside 10.48.66.96 version 3 netshaaes
snmp-server host inside 10.201.66.113 version 3 netshaaes
snmp-server host inside 10.201.66.118 version 3 netshaaes
snmp-server host inside 10.86.32.72 version 3 netshaaes
snmp-server host inside 10.86.140.194 version 3 netshaaes
snmp-server host inside 10.28.77.70 version 3 netshaaes

no snmp-server host Inside 10.178.73.53 poll community ozQMeeuN version 2c
no snmp-server host Inside 10.86.142.14 poll community ozQMeeuN version 2c
no snmp-server host Inside 10.86.142.15 poll community ozQMeeuN version 2c
no snmp-server host Inside 10.87.17.216 poll community ozQMeeuN version 2c
no snmp-server host Inside 10.177.43.102 poll community ozQMeeuN version 2c
no snmp-server host Inside 10.123.201.210 poll community ozQMeeuN version 2c
no snmp-server host Inside 10.204.28.77 poll community ozQMeeuN version 2c

no snmp-server community ozQMeeuN



*** backout

no snmp-server host inside 10.122.72.188 version 3 netshaaes
no snmp-server host inside 10.122.72.189 version 3 netshaaes
no snmp-server host inside 10.177.72.148 version 3 netshaaes
no snmp-server host inside 10.177.72.149 version 3 netshaaes
no snmp-server host inside 10.28.199.57 version 3 netshaaes
no snmp-server host inside 10.29.208.235 version 3 netshaaes
no snmp-server host inside 10.86.186.96 version 3 netshaaes
no snmp-server host inside 10.87.57.127 version 3 netshaaes
no snmp-server host inside 10.28.67.198 version 3 netshaaes
no snmp-server host inside 10.28.192.54 version 3 netshaaes
no snmp-server host inside 10.29.64.33 version 3 netshaaes
no snmp-server host inside 10.29.192.33 version 3 netshaaes
no snmp-server host inside 10.28.201.166 version 3 netshaaes
no snmp-server host inside 10.48.66.95 version 3 netshaaes
no snmp-server host inside 10.48.66.96 version 3 netshaaes
no snmp-server host inside 10.201.66.113 version 3 netshaaes
no snmp-server host inside 10.201.66.118 version 3 netshaaes
no snmp-server host inside 10.86.32.72 version 3 netshaaes
no snmp-server host inside 10.86.140.194 version 3 netshaaes
no snmp-server host inside 10.28.77.70 version 3 netshaaes
no snmp-server user netshaaes
no snmp-server group globalEnforcePriv v3 priv

snmp-server community ozQMeeuN

snmp-server host Inside 10.178.73.53 poll community ozQMeeuN version 2c
snmp-server host Inside 10.86.142.14 poll community ozQMeeuN version 2c
snmp-server host Inside 10.86.142.15 poll community ozQMeeuN version 2c
snmp-server host Inside 10.87.17.216 poll community ozQMeeuN version 2c
snmp-server host Inside 10.177.43.102 poll community ozQMeeuN version 2c
snmp-server host Inside 10.123.201.210 poll community ozQMeeuN version 2c
snmp-server host Inside 10.201.66.113 poll community ozQMeeuN version 2c
snmp-server host Inside 10.201.66.118 poll community ozQMeeuN version 2c
snmp-server host Inside 10.48.66.95 poll community ozQMeeuN version 2c
snmp-server host Inside 10.48.66.96 poll community ozQMeeuN version 2c
snmp-server host Inside 10.86.186.96 poll community ozQMeeuN version 2c
snmp-server host Inside 10.29.208.235 poll community ozQMeeuN version 2c
snmp-server host Inside 10.87.57.127 poll community ozQMeeuN version 2c
snmp-server host Inside 10.28.199.57 poll community ozQMeeuN version 2c
snmp-server host Inside 10.28.77.70 poll community ozQMeeuN version 2c
snmp-server host Inside 10.86.140.194 poll community ozQMeeuN version 2c
snmp-server host Inside 10.86.32.72 poll community ozQMeeuN version 2c
snmp-server host Inside 10.204.28.77 poll community ozQMeeuN version 2c





