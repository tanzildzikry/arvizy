# Relationship Validation Pack

## Purpose

Validate Power BI relationship safety before DAX and dashboard approval.

## Required Checks

### Dimension Key Checks

- Dim_PIC key uniqueness
- Dim_Customer key uniqueness
- Dim_Date key uniqueness
- Other dimension key uniqueness

### Fact Orphan Checks

- Fact to PIC orphan rows
- Fact to Customer orphan rows
- Fact to Date orphan rows
- Movement fact to dimensions orphan rows

### Relationship Metadata Checks

- cardinality
- filter direction
- active/inactive status
- many-to-many detection
- bidirectional filter detection
- fact-to-fact relationship detection
- ambiguous path detection

### Visual/Slicer Behavior Checks

- PIC slicer
- customer slicer
- date slicer
- risk/status/category slicers
- movement page behavior
- control table behavior

### Reconciliation Checks

- grand total vs SQL control
- PIC breakdown vs grand total
- customer breakdown vs grand total
- date-filtered total vs SQL control
- movement inflow/outflow vs SQL control

## Required Output

1. Relationship Status
2. Risks Detected
3. Validation Evidence
4. Failed Checks
5. Required Fix
6. Approval Status

## Hard Rules

- No relationship evidence, no model approval.
- No relationship validation, no DAX approval.
- No slicer behavior validation, no reporting readiness.
