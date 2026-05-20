# Dashboard Visual Contract

## Purpose

Define visual-level requirements so SQL, semantic model, and DAX outputs map to the dashboard correctly.

## Required Page Contract

For each dashboard page define:

```text
Page Name
Business Purpose
Reader Type
Primary Question
KPI Cards
Charts
Tables
Slicers
Required Measures
Required Dimensions
SQL/Mart Dependencies
Validation Requirement
Performance Risk
```

## Visual Contract

For every visual define:

```text
Visual Title
Visual Type
Purpose
Axis / Rows
Legend / Columns
Values / Measures
Tooltip Fields
Slicer Dependency
Expected Total Behavior
SQL Reconciliation Reference
Risk if Wrong
```

## Hard Rules

- Every KPI card must have SQL/control reconciliation reference.
- Every visual using a measure must have expected filter behavior.
- Every slicer must have valid relationship support.
- No visual should depend on raw table fields unless explicitly justified.
- No final visual approval without reconciliation or sanity check.
