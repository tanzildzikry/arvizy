# Semantic Model Profile — finance_ops_dev

## 1. Purpose

This file defines the semantic model expectations for the `finance_ops_dev` project profile.

It helps Arvizy agents review Power BI model design, DAX logic, relationship readiness, and implementation drift.

This profile must be validated against the latest `.bim`, Power BI model export, or current semantic model documentation before final technical approval.

---

## 2. Semantic Model Objective

The semantic model should be:

- lean
- curated
- relationship-driven
- easy to validate
- easy to explain
- suitable for executive and operational dashboard pages
- aligned with SQL reporting layer
- controlled through canonical DAX measures

Power BI should consume curated reporting objects rather than raw operational tables.

---

## 3. Expected Model Layers

The semantic model is expected to contain:

```text
Fact Tables
Dimension Tables
Disconnected Control Tables
Measure Container
```

---

## 4. Expected Fact Tables

Potential / expected reporting objects:

| Table | Intended Role | Status |
|---|---|---|
| `Fact_Current_BC` | current/latest BC status fact | NEEDS FRESHNESS CHECK |
| `Fact_Movement_BC` | movement / snapshot fact | NEEDS FRESHNESS CHECK |
| `Fact_Issue_Current` | issue/detail/drill-through fact | NEEDS FRESHNESS CHECK |

Important:

Exact names must be validated against latest Phase 12 documentation or `.bim`.

---

## 5. Expected Dimension Tables

Potential / expected dimensions:

| Table | Intended Role | Status |
|---|---|---|
| `Dim_PIC` | PIC slicer and grouping dimension | NEEDS FRESHNESS CHECK |
| `Dim_BC` | BC-level dimension or reference | NEEDS FRESHNESS CHECK |
| `Dim_Date` | date analysis and slicer dimension | NEEDS FRESHNESS CHECK |

Additional dimensions may exist depending on final model:

- customer dimension
- event category dimension
- status dimension
- aging bucket dimension

Do not assume existence without latest model evidence.

---

## 6. Expected Control Tables

Potential / expected disconnected control tables:

| Table | Intended Role | Relationship Rule | Status |
|---|---|---|---|
| `Control_Current_KPI` | current KPI reconciliation | disconnected | NEEDS FRESHNESS CHECK |
| `Control_Movement_KPI` | movement KPI reconciliation | disconnected | NEEDS FRESHNESS CHECK |

Control tables should remain disconnected unless explicitly justified.

---

## 7. Measure Container

Potential measure container:

```text
_Measures
```

Purpose:

- store DAX measures
- keep measures organized
- avoid scattering measures across random tables

Status:

```text
NEEDS FRESHNESS CHECK
```

---

## 8. Relationship Principles

Default relationship principles:

- dimension-to-fact relationships
- single-direction filter by default
- avoid fact-to-fact relationships
- avoid bidirectional filters unless justified
- avoid many-to-many unless justified
- keep control tables disconnected
- document inactive relationships if used

---

## 9. Relationship Risk Rules

### Control Table Relationship

Default decision:

```text
BLOCKED
```

unless explicitly justified and validated.

### Fact-to-Fact Relationship

Default decision:

```text
BLOCKED
```

unless explicitly justified and validated.

### Bidirectional Filter

Default decision:

```text
NEEDS REVISION
```

unless explicitly justified and validated.

### Many-to-Many

Default decision:

```text
NEEDS REVIEW
```

or:

```text
BLOCKED
```

depending on impact.

---

## 10. Grain Principles

Each table must have clear grain.

Examples:

```text
Fact_Current_BC:
one row per current BC / current business item

Fact_Movement_BC:
one row per snapshot/date/business item or defined movement grain

Fact_Issue_Current:
one row per issue/detail item

Dim_PIC:
one row per PIC

Dim_BC:
one row per BC

Dim_Date:
one row per date
```

Exact grain must be confirmed from latest SQL/model evidence.

If grain is unclear, return:

```text
NEEDS REVIEW
```

---

## 11. DAX Design Principles

DAX measures should:

- use canonical base measures
- avoid duplicate by-PIC/by-customer/by-division measures
- rely on relationships and slicers for breakdowns
- separate numeric and display measures
- avoid recreating stable SQL business shaping logic
- reconcile KPI measures with SQL/control outputs
- avoid excessive broad filter removal
- preserve intended filter context

---

## 12. Expected DAX Measure Groups

Potential measure groups:

```text
Current
Control
Recon
Movement
Display
Narrative
```

Exact folder/order must be validated against latest `.bim` or measure documentation.

---

## 13. Movement Readiness Rule

Movement analysis should not be fully approved unless enough snapshot dates exist.

If movement structure exists but data is insufficient:

```text
PASS STRUCTURE ONLY
```

If movement evidence is incomplete:

```text
NEEDS REVIEW
```

Do not approve full movement trend interpretation without sufficient evidence.

---

## 14. Semantic Model Review Checklist

Arvizy agents should check:

- loaded tables
- table roles
- table grain
- relationship keys
- relationship cardinality
- filter direction
- disconnected control tables
- fact-to-fact avoidance
- bidirectional filter avoidance
- DAX measure dependencies
- KPI reconciliation
- dashboard visual field mapping

---

## 15. Required Evidence for Approval

Semantic model approval requires one or more of:

- latest `.bim`
- model relationship screenshot
- exported semantic model metadata
- table/relationship list
- DAX measure list
- KPI reconciliation output
- user-provided validation result

Without evidence, use:

```text
NEEDS REVIEW
```

---

## 16. Current Profile Status

```text
Status:
ACTIVE

Project Profile:
finance_ops_dev

Freshness:
NEEDS VALIDATION AGAINST LATEST .BIM / MODEL EXPORT / PHASE 12 DOCS

Framework phase:
Phase 4 — Finance Ops Dev Project Profile Build
```
