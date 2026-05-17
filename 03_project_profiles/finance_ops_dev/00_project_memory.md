# Project Memory — finance_ops_dev

## 1. Project Identity

Project name:

```text
finance_ops_dev
```

Project type:

```text
Finance Operations / AR Collection BI dashboard project
```

Primary use case:

```text
SQL-to-Power BI analytics system for monitoring AR Collection, Business Control, unbilled exposure, backlog movement, and operational control readiness.
```

Arvizy role:

```text
finance_ops_dev is the first project profile and case study used to validate the Arvizy dashboard optimizer workflow.
```

---

## 2. Project Purpose

The finance_ops_dev project is designed to support:

- executive overview
- management monitoring
- weekly reporting
- daily operational review
- AR Collection control
- Business Control visibility
- backlog monitoring
- Power BI semantic model readiness
- documentation-driven project continuity

The dashboard must help users understand:

- what is happening
- why it matters
- what should be done next

---

## 3. Business Pillars

The project is organized around three main business pillars:

```text
Unbilled
Outstanding
UMK
```

### Unbilled

Focus:

- open BC not yet invoiced
- unbilled exposure
- aging
- operational pressure
- risk classification
- PIC accountability
- backlog inflow/outflow structure

### Outstanding

Focus:

- invoices issued but not yet cash-in
- collection follow-up
- payment status
- overdue exposure
- customer-level collection visibility

### UMK

Focus:

- operational cash accountability
- released amount
- issued amount
- settlement / accountability monitoring
- operational control tracking

---

## 4. Current Architecture

The project follows this data architecture:

```text
CSV / Source File
↓
PostgreSQL Raw Layer
↓
PostgreSQL Core / Clean Layer
↓
PostgreSQL Mart / Reporting Layer
↓
Power BI Semantic Model
↓
Power BI Dashboard Pages
```

Current schema concept:

```text
01_raw
↓
02_core
↓
03_mart
```

The public schema should not be used for controlled project objects unless explicitly justified.

---

## 5. Dashboard Design Philosophy

The dashboard should follow:

- clean corporate style
- minimal clutter
- executive clarity
- operational actionability
- narrative-driven insight
- layered reader flow
- efficient visual layout
- no unnecessary decoration
- no over-dense pages

Each visual should answer at least one of:

```text
What is happening?
Why does it matter?
What should be done?
```

---

## 6. Dashboard Layering

The dashboard should support layered analysis:

```text
Executive Layer
↓
Analytical Layer
↓
Operational Layer
```

### Executive Layer

Purpose:

- quick status
- overall exposure
- risk signal
- key movement
- management-ready summary

### Analytical Layer

Purpose:

- explain drivers
- compare segments
- show aging/risk patterns
- identify concentration
- support management discussion

### Operational Layer

Purpose:

- identify specific PIC/customer/BC items
- support daily follow-up
- show next action priority
- enable control execution

---

## 7. Current Project Phase

Current phase context:

```text
Phase 12 — Power BI Semantic Model Build / Relationship Setup
```

Phase 12 intent:

- prepare lean semantic model
- load curated reporting objects only
- define fact/dimension/control table roles
- avoid unnecessary raw/core table loading
- establish relationship readiness
- prepare canonical DAX baseline
- validate Power BI implementation against SQL reporting layer

Current caution:

```text
Phase 12 must not be marked as fully passed until Power BI implementation, relationship validation, DAX validation, and KPI reconciliation are completed.
```

---

## 8. Current Status Principle

The project may have structure-level readiness before full implementation readiness.

Use these status distinctions carefully:

```text
PASS STRUCTURE ONLY
```

means structure exists or is logically ready, but output/implementation is not fully validated.

```text
APPROVED FOR IMPLEMENTATION
```

means design is safe to implement, but final validation is still required.

```text
NEEDS REVIEW
```

means evidence is incomplete, pending, stale, or conflicting.

```text
COMPLETED
```

must only be used when full evidence supports completion.

---

## 9. Primary Data Model Intent

The Power BI model should be:

- lean
- curated
- relationship-driven
- measure-controlled
- validation-aligned
- easy to explain
- suitable for executive and operational pages

Power BI should consume curated mart/reporting views.

Raw or core operational tables should not be loaded into the main PBIX unless explicitly required for admin/debug purposes.

---

## 10. Semantic Model Principles

The semantic model should prioritize:

- clear fact/dimension separation
- stable relationships
- no fact-to-fact relationship unless explicitly justified
- disconnected control tables for reconciliation
- canonical DAX measures
- relationship-driven slicing
- controlled measure naming
- no duplicate visual-specific measures

---

## 11. SQL Principles for This Project

SQL should prioritize:

- readability
- stability
- maintainability
- business correctness
- clear grain
- validation readiness
- Power BI consumption readiness

SQL style preference:

- readable CTEs
- explicit calculation parentheses
- no over-compact formulas
- no unnecessary advanced patterns
- no hidden business logic changes

---

## 12. DAX Principles for This Project

DAX should prioritize:

- canonical measures
- base measures first
- derived measures second
- display/narrative measures separately
- no redundant by-PIC/by-customer/by-division measures
- relationship-driven slicing
- SQL reconciliation for KPI measures
- filter context correctness

DAX should not recreate SQL business shaping logic unless justified.

---

## 13. Documentation Principles

Documentation must remain:

- cumulative
- evidence-aware
- phase-aware
- handover-ready
- GitHub-friendly
- operationally useful

Progress logs must preserve historical progress.

Handover documents must allow a new chat/session to continue without restarting from zero.

---

## 14. Data Safety Principle

The project must not expose real sensitive company data.

Do not upload or commit:

- real customer confidential data
- real invoice data
- credentials
- connection strings
- API keys
- `.env` secrets
- raw production database dumps
- sensitive internal files

Use masked, sample, or documented structure-only data when needed.

---

## 15. Arvizy Usage for This Profile

When Arvizy reviews finance_ops_dev, it must read this project profile together with:

- Core OS files
- selected agent mode
- naming registry
- validation memory
- blocked patterns
- semantic model profile
- dashboard blueprint profile
- relevant SQL/DAX/project evidence

If evidence is missing, Arvizy must return:

```text
NEEDS REVIEW
```

---

## 16. Current Profile Status

```text
Profile:
finance_ops_dev

Status:
ACTIVE

Used for:
First Arvizy project profile / case study

Framework phase:
Phase 4 — Finance Ops Dev Project Profile Build
```
