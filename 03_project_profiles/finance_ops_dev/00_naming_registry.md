# Naming Registry — finance_ops_dev

## 1. Purpose

This file records approved naming conventions, known object names, and deprecated names for the `finance_ops_dev` project profile.

The naming registry helps Arvizy agents avoid:

- hallucinated table names
- nonexistent column names
- deprecated names
- inconsistent DAX naming
- broken SQL references
- semantic model mismatch

This file must be checked against the latest direct evidence when available.

---

## 2. Freshness Rule

If this naming registry conflicts with the latest direct evidence, use the latest direct evidence.

Direct evidence may include:

- latest SQL view definition
- latest `information_schema` output
- latest `.bim` file
- latest semantic model export
- latest user-provided column list
- latest validated project documentation

If conflict exists and cannot be resolved, return:

```text
NEEDS REVIEW
```

Do not assume this registry is always current.

---

## 3. Approved Schema Names

Known controlled schema pattern:

| Schema | Purpose | Status |
|---|---|---|
| `01_raw` | Raw/source import layer | ACTIVE |
| `02_core` | Cleaning / transformation layer | ACTIVE |
| `03_mart` | Analytics mart / reporting layer | ACTIVE |

Blocked by default:

| Schema | Reason |
|---|---|
| `public` | Not used for controlled project objects unless explicitly justified |

---

## 4. Current Known Core View

Known earlier/current project reference:

```text
"02_core".vw_fact_bc_clean
```

Purpose:

```text
Cleaned fact-level Business Control data.
```

Status:

```text
NEEDS FRESHNESS CHECK
```

Important:

This view name and columns must be validated against the latest repo/database output before final SQL generation.

---

## 5. Current Known Mart View

Known earlier/current project reference:

```text
"03_mart".vw_unbilled_base
```

Purpose:

```text
Unbilled analytical mart view.
```

Status:

```text
NEEDS FRESHNESS CHECK
```

Important:

This view may not represent the latest Phase 12 reporting object naming. Validate against latest repo documentation.

---

## 6. Known Earlier Core Columns

The following columns have been referenced in prior project context.

They must be validated against latest direct evidence before use.

| Column | Meaning | Status |
|---|---|---|
| `no` | source row number / identifier | NEEDS FRESHNESS CHECK |
| `event_name` | event name | NEEDS FRESHNESS CHECK |
| `customer` | customer text/name | NEEDS FRESHNESS CHECK |
| `customer_name` | customer name | NEEDS FRESHNESS CHECK |
| `event_start_date` | event start date | NEEDS FRESHNESS CHECK |
| `event_end_date` | event end date | NEEDS FRESHNESS CHECK |
| `event_period_month` | event month | NEEDS FRESHNESS CHECK |
| `event_period_year` | event year | NEEDS FRESHNESS CHECK |
| `unbilled_aging` | unbilled aging days | NEEDS FRESHNESS CHECK |
| `event_status` | event status | NEEDS FRESHNESS CHECK |
| `event_category` | event category | NEEDS FRESHNESS CHECK |
| `pic_internal` | internal PIC | NEEDS FRESHNESS CHECK |
| `bc_number` | BC number | NEEDS FRESHNESS CHECK |
| `cost` | cost amount | NEEDS FRESHNESS CHECK |
| `revenue` | revenue amount | NEEDS FRESHNESS CHECK |
| `cost_value` | cost amount, curated naming style | NEEDS FRESHNESS CHECK |
| `revenue_value` | revenue amount, curated naming style | NEEDS FRESHNESS CHECK |
| `total_terinvoice` | total invoiced amount | NEEDS FRESHNESS CHECK |
| `total_terinvoice_value` | total invoiced amount, curated naming style | NEEDS FRESHNESS CHECK |
| `umk_released` | UMK released amount | NEEDS FRESHNESS CHECK |
| `umk_issued` | UMK issued amount | NEEDS FRESHNESS CHECK |
| `periode_pencatatan` | recording period | NEEDS FRESHNESS CHECK |
| `remarks` | remarks | NEEDS FRESHNESS CHECK |
| `dokumen_kurang` | missing document notes | NEEDS FRESHNESS CHECK |
| `dateline_ke_ar_date` | deadline to AR date | NEEDS FRESHNESS CHECK |
| `dateline_ke_ar_note` | deadline to AR note | NEEDS FRESHNESS CHECK |
| `pic_user` | user PIC | NEEDS FRESHNESS CHECK |
| `po_status` | PO status | NEEDS FRESHNESS CHECK |
| `po_number` | PO number | NEEDS FRESHNESS CHECK |
| `bill_status` | billing status | NEEDS FRESHNESS CHECK |
| `invoice_number` | invoice number | NEEDS FRESHNESS CHECK |
| `invoice_date_latest` | latest invoice date | NEEDS FRESHNESS CHECK |
| `closing_duration` | closing duration | NEEDS FRESHNESS CHECK |
| `handling_fee` | handling fee | NEEDS FRESHNESS CHECK |
| `profit` | profit amount | NEEDS FRESHNESS CHECK |

---

## 7. Deprecated / Risky Names

These names have appeared in earlier iterations or error cases.

Agents must not use them unless latest direct evidence confirms they are valid.

| Name | Reason |
|---|---|
| `rab` | Deprecated/old source naming; use current revenue naming if applicable |
| `aging_days` | Previously caused missing column error; validate before use |
| `unbill_aging` | Older variation; current naming may be `unbilled_aging` or curated equivalent |
| `revenue` | May be replaced by `revenue_value` in curated reporting views |
| `cost` | May be replaced by `cost_value` in curated reporting views |
| `FACT_BC FINAL` | Older Power BI naming; use current source-of-truth naming if applicable |

---

## 8. Expected Power BI Reporting Object Pattern

Phase 12 may use curated reporting objects such as:

| Object | Role | Status |
|---|---|---|
| `Fact_Current_BC` | current/latest fact layer | NEEDS FRESHNESS CHECK |
| `Fact_Movement_BC` | movement/trend fact layer | NEEDS FRESHNESS CHECK |
| `Fact_Issue_Current` | detail / drill-through / issue fact layer | NEEDS FRESHNESS CHECK |
| `Control_Current_KPI` | disconnected current KPI control | NEEDS FRESHNESS CHECK |
| `Control_Movement_KPI` | disconnected movement KPI control | NEEDS FRESHNESS CHECK |
| `Dim_PIC` | PIC dimension | NEEDS FRESHNESS CHECK |
| `Dim_BC` | BC dimension | NEEDS FRESHNESS CHECK |
| `Dim_Date` | date dimension | NEEDS FRESHNESS CHECK |
| `_Measures` | DAX measure container | NEEDS FRESHNESS CHECK |

Important:

Validate exact names against latest Phase 12 documentation or latest `.bim`.

---

## 9. DAX Naming Rules

General DAX naming principles:

- use clear business names
- prefer canonical reusable measures
- avoid visual-specific duplicate measures
- avoid unnecessary "by PIC", "by Customer", or "by Division" suffix when slicing is handled by dimensions
- separate numeric measures from display/text measures
- avoid creating synonyms for existing measures

Example canonical style:

```text
Current Open BC Count
Current Open Revenue
Current High Risk Count
Movement Readiness Flag
Movement Readiness Status
```

All measure names must be validated against latest existing measure list before final creation.

---

## 10. SQL Naming Rules

SQL naming should be:

- lowercase when defined in database views unless existing project convention differs
- readable
- stable
- descriptive
- consistent across layers
- aligned with mart/reporting purpose

Use quoted schema names when schema begins with numeric prefix:

```sql
"02_core".vw_fact_bc_clean
"03_mart".vw_unbilled_base
```

---

## 11. Relationship Naming Context

Common relationship dimensions may include:

- PIC dimension
- customer dimension
- BC dimension
- date dimension
- event category dimension

Exact object names must be validated against latest semantic model profile or `.bim`.

---

## 12. Registry Maintenance Rule

Update this registry when:

- latest schema changes
- latest `.bim` is reviewed
- new reporting object names are locked
- deprecated names are confirmed invalid
- measure naming convention changes
- semantic model objects are renamed

Each update should include:

- object name
- type
- source
- status
- last confirmed evidence

---

## 13. Status

```text
Status:
ACTIVE

Project Profile:
finance_ops_dev

Freshness:
NEEDS DIRECT VALIDATION AGAINST LATEST REPO / DATABASE / .BIM BEFORE FINAL TECHNICAL OUTPUT

Framework phase:
Phase 4 — Finance Ops Dev Project Profile Build
```
