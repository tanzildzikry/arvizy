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
