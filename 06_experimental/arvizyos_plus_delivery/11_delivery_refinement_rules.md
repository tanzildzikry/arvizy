# BI Delivery Refinement Rules

## Purpose

This file records refinement rules discovered during the first ArvizyOS+ BI Delivery Extension test using a new BC dataset.

The goal is to make future SQL-to-Power-BI delivery output closer to an ideal production design draft by combining:

```text
ArvizyOS governance discipline
+ ArvizyOS+ BI architecture awareness
+ production-grade SQL / semantic model implementation detail
```

## Status

```text
EXPERIMENTAL REFINEMENT RULES
```

These rules improve future output but do not approve any current dashboard, SQL schema, semantic model, or Power BI implementation.

---

## Mandatory Refinement Rules

### 1. Fact Mart Views Must Expose Normalized Relationship Keys

Fact mart views must expose normalized relationship keys directly.

Required keys where applicable:

```text
pic_key
customer_key
bc_key
event_category_key
status_key
date_key / snapshot_date
```

Preferred relationship style:

```text
dim_pic[pic_key] -> fact[pic_key]
dim_customer[customer_key] -> fact[customer_key]
dim_bc[bc_key] -> fact[bc_key]
dim_event_category[event_category_key] -> fact[event_category_key]
```

Avoid relationship guidance like:

```text
dim_pic[pic_key] -> fact[pic_name]
dim_customer[customer_key] -> fact[customer_name]
dim_bc[bc_key] -> fact[bc_number]
```

unless the display field itself is explicitly validated as the business key.

---

### 2. Power BI Relationship Guidance Must Use Key-to-Key Mapping

Power BI semantic model guidance must use key-to-key relationships, not key-to-display-name relationships.

Every relationship recommendation must specify:

```text
dimension table
dimension key
fact table/view
fact key
cardinality
filter direction
active/inactive status
business purpose
```

Default relationship behavior:

```text
one-to-many
single-direction
dimension filters fact
```

Many-to-many, bidirectional, and fact-to-fact relationships require explicit justification and validation evidence.

---

### 3. Document Completeness Must Decode Marlett Fields

For the finance_ops_dev / BC dataset pattern, document completeness must primarily decode Marlett document fields:

```text
SPK
PO
BAST
BILLS
```

Encoding rule:

```text
a = available / checklist
r = missing / X
```

Recommended logic:

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

`dokumen_kurang` may be used as supporting note or exception detail, but it should not be the sole truth when Marlett fields are present.

---

### 4. UMK Reconciliation Must Be Explicit

UMK logic must explicitly represent the business rule:

```text
UMK VENDOR + UMK NON VENDOR = UMK RELEASE
PENGAJUAN UMK PENDING = pending / issued UMK
```

Required output fields where applicable:

```text
umk_vendor_amount
umk_non_vendor_amount
umk_release_source_amount
umk_released_calculated_amount
umk_release_difference_amount
umk_issued_pending_amount
umk_release_reconciliation_status
```

Recommended formulas:

```text
umk_released_calculated_amount =
    coalesce(umk_vendor_amount, 0)
    + coalesce(umk_non_vendor_amount, 0)

umk_release_difference_amount =
    coalesce(umk_release_source_amount, 0)
    - umk_released_calculated_amount

umk_release_reconciliation_status =
    MATCHED / NEEDS REVIEW
```

---

### 5. Include Relationship-Check Mart View

When Power BI implementation is expected, SQL design should include a relationship-check mart view.

Suggested view:

```text
03_mart.vw_powerbi_relationship_check
```

Suggested fields:

```text
snapshot_date
bc_number
bc_key
pic_key
customer_key
event_category_key
date_key
pic_relationship_status
customer_relationship_status
bc_relationship_status
event_category_relationship_status
date_relationship_status
```

Purpose:

```text
Validate relationship key coverage before DAX and visual implementation.
```

---

### 6. Include Physical Dimension Promotion Criteria

Dimension views are acceptable for early design, but output must state when dimension views should be promoted into physical dimension tables.

Dimension views are acceptable when:

```text
dataset is small
no alias mapping is required
no manual standardization is required
no SCD/history requirement exists
no UNKNOWN row handling is required
performance is acceptable
```

Promote to physical dimensions when:

```text
PIC/customer alias appears
standardization mapping is required
UNKNOWN row is required
dimension key must remain stable across refreshes
performance becomes an issue
manual stewardship is needed
SCD/history is required
```

---

### 7. Control Views Must Be Included for KPI Reconciliation

SQL delivery output should include control/reconciliation views, especially for Power BI validation.

Recommended views:

```text
03_mart.vw_control_current_kpi
03_mart.vw_control_snapshot_kpi
03_mart.vw_control_movement_kpi
03_mart.vw_control_data_quality
```

Control views should normally remain disconnected in Power BI unless explicitly justified.

---

### 8. Production Readiness Must Remain Blocked Without Evidence

Even if a complete schema is generated, status must remain one of:

```text
DESIGN DRAFT
NEEDS REVIEW
VALIDATION REQUIRED
APPROVED FOR INITIAL BUILD
```

Do not use:

```text
IMPLEMENTATION READY
PRODUCTION READY
VALIDATED
```

unless actual validation evidence is provided.

Required evidence includes:

```text
SQL execution result
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
```
