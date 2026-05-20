# DAX Production Measure Registry Template

## Purpose

Plan and control DAX measure creation for Power BI production delivery.

## Measure Categories

### 1. Base Measures

Examples:

- Total Revenue
- Total Cost
- Open BC Count
- Total Unbilled
- Total UMK Released
- Total UMK Issued

### 2. Derived Measures

Examples:

- Backlog Delta
- Outstanding Variance
- High Risk Exposure
- UMK Difference

### 3. Ratio Measures

Examples:

- High Risk %
- Document Completeness %
- UMK Issued vs Released %
- PIC Contribution %

### 4. Display Measures

Examples:

- formatted values
- selected period label
- selected PIC label
- dynamic KPI title

### 5. Narrative Measures

Examples:

- executive summary text
- risk status narrative
- action priority message

### 6. Validation Measures

Examples:

- SQL vs Power BI variance
- reconciliation status
- control comparison

## Required Fields

For every measure define:

```text
Measure Name
Category
Business Definition
Depends On
Table/Folder
Visual Usage
Filter Context Expectation
Relationship Dependency
Total/Subtotal Behavior
SQL Control Reference
Validation Scenario
Status
```

## Hard Rules

- Check existing measure inventory before creating new measures.
- Do not create by-PIC/by-customer measures if dimension slicing is enough.
- Do not use DAX to fix bad relationship design.
- Do not duplicate SQL row-level business logic in DAX.
- Do not approve measures without validation scenario.
