# SQL Delivery Completeness Gate

## Purpose

This gate defines the minimum output requirements for a SQL delivery design to be considered complete as a BI delivery artifact.

It was added after testing showed that ArvizyOS+ BI Delivery Extension could produce strong SQL schemas, but did not always enforce some mandatory BI delivery rules in the actual generated SQL.

## Status

```text
MANDATORY COMPLETENESS GATE
```

This file is part of the experimental BI Delivery Extension. It does not approve production readiness.

---

## Core Rule

A SQL delivery output is incomplete unless it includes all required delivery components below.

If any required component is missing, the agent must explicitly state:

```text
SQL DELIVERY DESIGN INCOMPLETE
```

and list the missing components.

---

## Required Component 1 â€” Fact Mart Views Expose Normalized Keys

Every Power BI fact mart view must expose relationship keys directly.

Required keys where applicable:

```text
bc_key
pic_key
customer_key
event_category_key
bill_status_key
umk_status_key
aging_bucket_key
risk_level_key
snapshot_date
event_end_date_key
invoice_date_key
```

Example acceptable fact columns:

```text
bc_number
bc_key
pic_name
pic_key
customer_name
customer_key
event_category
event_category_key
bill_status
bill_status_key
```

Not acceptable as the only relationship-ready fields:

```text
pic_name only
customer_name only
event_category only
bc_number only
```

---

## Required Component 2 â€” Key-to-Key Power BI Relationship Guidance

Power BI relationship guidance must use normalized key-to-key mapping.

Required style:

```text
dim_pic[pic_key] -> fact_bc_current[pic_key]
dim_customer[customer_key] -> fact_bc_current[customer_key]
dim_bc[bc_key] -> fact_bc_current[bc_key]
dim_event_category[event_category_key] -> fact_bc_current[event_category_key]
dim_date[date_key] -> fact_bc_current[event_end_date_key]
```

Not acceptable unless explicitly justified and validated:

```text
dim_pic[pic_key] -> fact_bc_current[pic_name]
dim_customer[customer_key] -> fact_bc_current[customer_name]
dim_bc[bc_key] -> fact_bc_current[bc_number]
```

---

## Required Component 3 â€” Marlett Document Completeness Logic

If the source contains `SPK`, `PO`, `BAST`, and `BILLS`, SQL output must decode these fields explicitly.

Encoding rule:

```text
a = available / checklist
r = missing / X
```

Required output fields:

```text
spk_available
po_available
bast_available
bills_available
mandatory_document_complete
missing_document_list
```

Required logic:

```text
spk_available   = lower(spk_code) = 'a'
po_available    = lower(po_code) = 'a'
bast_available  = lower(bast_code) = 'a'
bills_available = lower(bills_code) = 'a'

mandatory_document_complete =
    spk_available
    and po_available
    and bast_available
    and bills_available
```

`dokumen_kurang` may be included, but it is supporting evidence only when Marlett fields exist.

---

## Required Component 4 â€” Explicit UMK Reconciliation

If the source contains UMK Vendor, UMK Non Vendor, UMK Release, and Pengajuan UMK Pending, SQL output must include explicit UMK reconciliation fields.

Business rule:

```text
UMK VENDOR + UMK NON VENDOR = UMK RELEASE
PENGAJUAN UMK PENDING = pending / issued UMK
```

Required fields:

```text
umk_vendor_value
umk_non_vendor_value
umk_release_source_value
umk_released_calculated_value
umk_release_difference_value
umk_issued_pending_value
umk_release_reconciliation_status
```

Required logic:

```text
umk_released_calculated_value =
    coalesce(umk_vendor_value, 0)
    + coalesce(umk_non_vendor_value, 0)

umk_release_difference_value =
    coalesce(umk_release_source_value, 0)
    - umk_released_calculated_value

umk_release_reconciliation_status =
    case
        when abs(umk_release_difference_value) <= tolerance then 'MATCHED'
        else 'NEEDS REVIEW'
    end
```

Avoid ambiguous naming such as `umk_total_request_value` when the business meaning is released UMK.

---

## Required Component 5 â€” Relationship-Check Mart View

If Power BI implementation is expected, SQL output must include a relationship-check mart view.

Required view:

```text
03_mart.vw_powerbi_relationship_check
```

Minimum fields:

```text
snapshot_date
bc_number
bc_key
pic_key
customer_key
event_category_key
event_end_date_key
pic_relationship_status
customer_relationship_status
bc_relationship_status
event_category_relationship_status
date_relationship_status
```

Purpose:

```text
Validate key coverage before Power BI relationship creation and DAX implementation.
```

---

## Required Component 6 â€” Control / Reconciliation Views

SQL output must include control/reconciliation views for Power BI validation.

Recommended views:

```text
03_mart.vw_control_current_kpi
03_mart.vw_control_snapshot_kpi
03_mart.vw_control_movement_kpi
03_mart.vw_control_data_quality
```

Control views should remain disconnected in Power BI unless explicitly justified.

---

## Required Component 7 â€” Validation Queries for Completeness Gate

SQL output must include validation queries for:

```text
raw-to-core row count
core-to-mart row count
duplicate grain check
dimension key uniqueness
orphan fact-to-dimension keys
Marlett document completeness distribution
UMK reconciliation distribution
relationship key coverage
control KPI baseline
snapshot / movement readiness if snapshots exist
```

---

## Required Component 8 â€” Physical Dimension Promotion Criteria

SQL output must state whether dimension views are enough or whether physical dimensions are required.

Dimension views are acceptable when:

```text
dataset is small
no alias mapping is required
no manual standardization is required
no UNKNOWN row handling is needed
performance is acceptable
```

Physical dimensions are required or recommended when:

```text
PIC/customer aliases exist
standardization mapping is required
UNKNOWN row handling is required
dimension keys must remain stable across refreshes
manual stewardship is required
SCD/history is required
performance becomes an issue
```

---

## Output Completion Statement

Every SQL delivery output must end with one of these statements:

```text
SQL DELIVERY DESIGN COMPLETE FOR INITIAL BUILD â€” VALIDATION REQUIRED
```

or

```text
SQL DELIVERY DESIGN INCOMPLETE â€” REQUIRED COMPONENTS MISSING
```

Do not use:

```text
IMPLEMENTATION READY
PRODUCTION READY
VALIDATED
```

unless actual validation evidence is provided.

<!-- BEGIN BI DELIVERY PROMOTION STATUS -->

## BI Delivery Promotion Status

`	ext
ArvizyOS+ BI Delivery Extension = DEFAULT FOR BI DELIVERY WORKFLOW
`

## Promotion Basis

The extension was promoted after a successful SQL Delivery Completeness Gate test using a new BC dataset.

The refined output included:

- workbook inspection
- source-preserving raw layer
- typed/cleaned core layer
- Power BI-ready mart views
- normalized relationship keys in fact views
- key-to-key Power BI relationship guidance
- Marlett document completeness decoding
- explicit UMK reconciliation
- relationship-check mart view
- control/reconciliation views
- validation query pack
- physical dimension promotion criteria
- Power BI semantic model guidance
- no DAX creation
- no production-readiness claim

## Current Operating Role

Use this extension as the default workflow for end-to-end BI delivery tasks:

`	ext
source profiling
SQL raw/core/mart schema
SQL validation pack
Power BI semantic model contract
relationship validation preparation
DAX measure registry planning
dashboard visual contract
production readiness gate
`

## Governance Boundary

This promotion does not approve any specific project, SQL implementation, semantic model, Power BI report, DAX measure, or production deployment.

Production readiness still requires:

`	ext
SQL execution evidence
row count reconciliation
grain validation
dimension key uniqueness
orphan row validation
semantic model export / .bim
relationship screenshot or metadata
measure inventory
SQL vs Power BI KPI reconciliation
visual behavior validation
performance evidence
documentation / handover evidence
`

## Mandatory Watchlist

Every SQL delivery output must end with one of:

`	ext
SQL DELIVERY DESIGN COMPLETE FOR INITIAL BUILD â€” VALIDATION REQUIRED
`

or

`	ext
SQL DELIVERY DESIGN INCOMPLETE â€” REQUIRED COMPONENTS MISSING
`

<!-- END BI DELIVERY PROMOTION STATUS -->

<!-- BEGIN EXACT FINAL STATUS PHRASE WATCHLIST -->

## Exact Final Status Phrase Watchlist

Every SQL delivery output must end with exactly one of these phrases:

`	ext
SQL DELIVERY DESIGN COMPLETE FOR INITIAL BUILD â€” VALIDATION REQUIRED
`

or

`	ext
SQL DELIVERY DESIGN INCOMPLETE â€” REQUIRED COMPONENTS MISSING
`

If the generated SQL design includes all mandatory components but misses the exact phrase, classify the issue as:

`	ext
OUTPUT CONTRACT WATCHLIST
`

not as an architecture failure.

If the generated SQL design is missing mandatory components, classify it as:

`	ext
SQL DELIVERY DESIGN INCOMPLETE â€” REQUIRED COMPONENTS MISSING
`

<!-- END EXACT FINAL STATUS PHRASE WATCHLIST -->

