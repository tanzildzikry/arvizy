# Blocked Patterns â€” finance_ops_dev

## 1. Purpose

This file defines patterns that Arvizy agents must block, flag, or require revision for the `finance_ops_dev` project profile.

Blocked patterns prevent:

- overclaiming
- semantic model drift
- SQL/measure redundancy
- unsafe validation assumptions
- documentation loss
- dashboard logic inconsistency

---

## 2. Decision Labels for Blocked Patterns

Use these labels:

```text
NEEDS REVIEW
NEEDS REVISION
BLOCKED
FAILED VALIDATION
```

Use `BLOCKED` when the action violates a hard rule.

Use `NEEDS REVISION` when the action is fixable but cannot be approved as-is.

Use `NEEDS REVIEW` when evidence is incomplete.

---

## 3. Blocked SQL Patterns

### SQL-BLOCK-001 â€” Using Public Schema by Default

Pattern:

```text
Using public schema for controlled project objects.
```

Decision:

```text
NEEDS REVISION
```

Reason:

The project uses controlled schema layering.

Expected schema pattern:

```text
01_raw
02_core
03_mart
```

---

### SQL-BLOCK-002 â€” Loading Raw Tables Directly into Main BI platform Model

Pattern:

```text
Using raw/source tables directly as main dashboard fact tables.
```

Decision:

```text
NEEDS REVISION
```

Reason:

Main BI platform model should consume curated mart/reporting objects.

Allowed only for:

- admin/debug page
- temporary validation
- explicitly documented exception

---

### SQL-BLOCK-003 â€” Referencing Deprecated or Unknown Columns

Pattern:

```text
Using column names not confirmed in naming registry or latest schema evidence.
```

Decision:

```text
NEEDS REVIEW
```

or:

```text
NEEDS REVISION
```

Reason:

Prevents broken SQL/measure logic generation.

---

### SQL-BLOCK-004 â€” Changing Business Logic Without Validation

Pattern:

```text
Changing filters, joins, grouping, status logic, or calculation meaning without validation.
```

Decision:

```text
BLOCKED
```

Reason:

Business meaning must be preserved unless change is explicit and validated.

---

### SQL-BLOCK-005 â€” Unclear Output Grain

Pattern:

```text
SQL output grain is unclear or mixes grains.
```

Decision:

```text
NEEDS REVISION
```

Reason:

Unclear grain can break semantic model relationships and KPI reconciliation.

---

### SQL-BLOCK-006 â€” Overengineered SQL

Pattern:

```text
Using unnecessarily complex nested logic when readable CTEs would be clearer.
```

Decision:

```text
NEEDS REVISION
```

Reason:

Project prioritizes readability and maintainability.

---

## 4. Blocked Measure Logic Patterns

### MEASURE-BLOCK-001 â€” Duplicate By-PIC Measures

Pattern:

```text
Creating measure names such as:
- Open BC Count by PIC
- Open Revenue by PIC
- High Risk Count by PIC
```

Decision:

```text
BLOCKED
```

when base measure + Dim_PIC slicing is enough.

Expected approach:

```text
Use canonical base measure.
Use Dim_PIC field on axis/rows/slicer.
```

---

### MEASURE-BLOCK-002 â€” Duplicate By-Customer Measures

Pattern:

```text
Creating customer-specific duplicate measures when customer dimension slicing can handle it.
```

Decision:

```text
BLOCKED
```

Expected approach:

```text
Use canonical base measure.
Use customer dimension on visual axis/rows/slicer.
```

---

### MEASURE-BLOCK-003 â€” Duplicate By-Division Measures

Pattern:

```text
Creating division-specific duplicate measures when dimension slicing can handle it.
```

Decision:

```text
BLOCKED
```

---

### MEASURE-BLOCK-004 â€” Recreating SQL Business Shaping Logic in measure logic

Pattern:

```text
Building stable business classifications in measure logic that should belong in SQL/mart layer.
```

Decision:

```text
NEEDS REVIEW
```

or:

```text
NEEDS REVISION
```

Reason:

Stable row-level business logic should usually be centralized upstream.

---

### MEASURE-BLOCK-005 â€” Creating Measures Without Existing Measure Check

Pattern:

```text
Creating new measure logic without checking existing measures.
```

Decision:

```text
NEEDS REVIEW
```

Reason:

Prevents redundant measure creation.

---

### MEASURE-BLOCK-006 â€” Claiming measure logic Is Validated Without Reconciliation

Pattern:

```text
Stating measure is validated without SQL/control comparison or visual check.
```

Decision:

```text
NEEDS REVIEW
```

---

## 5. Blocked BI Semantic Model Patterns

### PBI-BLOCK-001 â€” Control Table Relationship

Pattern:

```text
Control/reconciliation table connected directly to fact/dimension tables without explicit justification.
```

Decision:

```text
BLOCKED
```

Expected:

```text
Control tables should remain disconnected unless explicitly approved and validated.
```

---

### PBI-BLOCK-002 â€” Fact-to-Fact Relationship

Pattern:

```text
Fact table connected directly to another fact table without explicit justification.
```

Decision:

```text
BLOCKED
```

Expected:

```text
Use shared dimensions unless a validated exception exists.
```

---

### PBI-BLOCK-003 â€” Bidirectional Filters by Default

Pattern:

```text
Using bidirectional filter direction without explicit reason and validation.
```

Decision:

```text
NEEDS REVISION
```

Expected:

```text
Use single-direction filtering by default.
```

---

### PBI-BLOCK-004 â€” Many-to-Many Without Justification

Pattern:

```text
Many-to-many relationship created without explicit validation.
```

Decision:

```text
NEEDS REVIEW
```

or:

```text
BLOCKED
```

depending on impact.

---

### PBI-BLOCK-005 â€” Loading Too Many Non-Curated Tables

Pattern:

```text
Loading raw/core/support tables into main PBIX without clear dashboard purpose.
```

Decision:

```text
NEEDS REVISION
```

Reason:

Model should remain lean and curated.

---

## 6. Blocked Documentation Patterns

### DOC-BLOCK-001 â€” Replacing Cumulative Progress Log

Pattern:

```text
Replacing progress_log.md history with only the latest update.
```

Decision:

```text
BLOCKED
```

Expected:

```text
Progress log must remain cumulative by default.
```

---

### DOC-BLOCK-002 â€” Overclaiming Phase Status

Pattern:

```text
Writing PASS, READY, COMPLETED, or VALIDATED without evidence.
```

Decision:

```text
BLOCKED
```

Expected:

```text
Use NEEDS REVIEW, PASS STRUCTURE ONLY, or APPROVED FOR IMPLEMENTATION when evidence is partial.
```

---

### DOC-BLOCK-003 â€” Handover Without Validation Status

Pattern:

```text
Handover does not mention validation status.
```

Decision:

```text
NEEDS REVISION
```

---

### DOC-BLOCK-004 â€” Handover Without Next Step

Pattern:

```text
Handover does not define next safe step.
```

Decision:

```text
NEEDS REVISION
```

---

## 7. Blocked Final Review Patterns

### FINAL-BLOCK-001 â€” Commit Approval Without Git Status

Pattern:

```text
Approving commit without git status.
```

Decision:

```text
NEEDS REVIEW
```

---

### FINAL-BLOCK-002 â€” Commit Approval Without Changed File List

Pattern:

```text
Approving commit without knowing changed files.
```

Decision:

```text
NEEDS REVIEW
```

---

### FINAL-BLOCK-003 â€” Technical Change Approval Without Validation

Pattern:

```text
Approving SQL/measure logic/semantic model changes without validation evidence.
```

Decision:

```text
BLOCKED
```

---

### FINAL-BLOCK-004 â€” Ignoring Known Blockers

Pattern:

```text
Approving despite known blocked pattern.
```

Decision:

```text
BLOCKED
```

---

## 8. Blocked Data Safety Patterns

### DATA-BLOCK-001 â€” Real Sensitive Data Exposure

Pattern:

```text
Uploading or committing real sensitive company data.
```

Decision:

```text
BLOCKED
```

Includes:

- real customer confidential data
- real invoice details
- credentials
- API keys
- connection strings
- `.env` secrets
- production database dumps
- sensitive internal files

---

## 9. Status

```text
Status:
ACTIVE

Project Profile:
finance_ops_dev

Framework phase:
Phase 4 â€” Finance Ops Dev Project Profile Build
```



