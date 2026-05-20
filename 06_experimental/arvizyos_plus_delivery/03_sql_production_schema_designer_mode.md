# SQL Production Schema Designer Mode

## Purpose

Create implementation-grade SQL schema design for BI delivery.

## Required Layering

```text
01_raw  = source-preserving import layer
02_core = typed, cleaned, normalized, relationship-ready layer
03_mart = Power BI consumption layer
```

## SQL Design Requirements

### Raw Layer

Raw tables should:

- preserve original source values
- use text-safe import columns where source quality is uncertain
- include load/batch metadata
- include source file name
- include source sheet name
- include source row number
- include imported timestamp
- avoid destructive transformation

### Core Layer

Core tables/views should:

- type numeric fields
- parse dates
- clean text values
- normalize status fields
- decode business flags
- prepare business keys
- prepare relationship keys
- document grain
- avoid visual-specific logic

### Mart Layer

Mart views should:

- expose Power BI-ready objects
- separate current and snapshot facts when needed
- expose dimensions or dimension candidates
- include control/reconciliation views
- include relationship-check views where useful
- avoid raw source leakage into Power BI model

## Required SQL Objects

Recommended minimum objects:

```text
01_raw.load_batch
01_raw.<source>_raw
02_core.<typed_fact_or_clean_view>
03_mart.vw_fact_<subject>_current
03_mart.vw_fact_<subject>_snapshot
03_mart.dim_<entity>
03_mart.vw_control_<subject>_kpi
03_mart.vw_relationship_check
```

## Required Output

1. SQL Layer Summary
2. Grain Contract
3. Raw Table DDL
4. Core Table/View DDL
5. Mart View DDL
6. Index Strategy
7. Control/Reconciliation Views
8. Relationship Guidance
9. Validation SQL Required
10. Known Risks

## Hard Rules

- Do not mark schema production-ready without load and validation evidence.
- Do not enforce unique business key before grain validation.
- Do not use raw table as final Power BI fact.
- Do not push visual-only behavior into SQL mart.
- Do not omit validation queries for critical KPI fields.

<!-- BEGIN DELIVERY REFINEMENT SQL DESIGN RULES -->

## Delivery Refinement Rules

When creating SQL schema for BI delivery, apply these additional mandatory rules.

### Normalized Relationship Keys

Fact mart views must expose normalized relationship keys directly:

`	ext
pic_key
customer_key
bc_key
event_category_key
status_key
date_key / snapshot_date
`

Power BI guidance must use key-to-key relationships:

`	ext
dim_pic[pic_key] -> fact[pic_key]
dim_customer[customer_key] -> fact[customer_key]
dim_bc[bc_key] -> fact[bc_key]
dim_event_category[event_category_key] -> fact[event_category_key]
`

Do not recommend relationships from dimension keys to display names unless the display name itself is the validated business key.

### Marlett Document Completeness

When source columns include SPK, PO, BAST, and BILLS with Marlett-style codes, document completeness must primarily decode those fields:

`	ext
a = available / checklist
r = missing / X
`

Required fields where applicable:

`	ext
spk_available
po_available
bast_available
bills_available
mandatory_document_complete
missing_document_list
`

dokumen_kurang may be used as supporting text, not sole truth, when Marlett document fields are present.

### UMK Reconciliation

UMK logic must explicitly support:

`	ext
UMK VENDOR + UMK NON VENDOR = UMK RELEASE
PENGAJUAN UMK PENDING = pending / issued UMK
`

Required fields where applicable:

`	ext
umk_released_calculated_amount
umk_release_difference_amount
umk_release_reconciliation_status
`

### Relationship-Check View

When Power BI implementation is expected, include a relationship-check mart view:

`	ext
03_mart.vw_powerbi_relationship_check
`

This view should expose fact rows, relationship keys, and key coverage status for PIC, customer, BC, category, and date.

### Control / Reconciliation Views

Include control views for validation:

`	ext
03_mart.vw_control_current_kpi
03_mart.vw_control_snapshot_kpi
03_mart.vw_control_movement_kpi
03_mart.vw_control_data_quality
`

### Physical Dimension Promotion Criteria

State whether dimension views are sufficient or whether physical dimension tables are required.

Promote dimension views into physical dimensions when:

`	ext
alias mapping is required
UNKNOWN row handling is required
stable keys are required across refreshes
manual stewardship is required
performance becomes an issue
SCD/history is required
`

<!-- END DELIVERY REFINEMENT SQL DESIGN RULES -->

