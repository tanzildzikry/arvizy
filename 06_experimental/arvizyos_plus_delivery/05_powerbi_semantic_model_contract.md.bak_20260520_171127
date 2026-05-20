# Power BI Semantic Model Contract

## Purpose

Define the Power BI model design contract after SQL mart design.

## Required Sections

### 1. Loaded Tables

Classify every table as:

- fact
- dimension
- disconnected control
- measure container
- helper table
- should not be loaded

### 2. Grain

Declare grain for every loaded fact and dimension.

### 3. Relationships

For every relationship define:

- from table
- from column
- to table
- to column
- cardinality
- filter direction
- active/inactive status
- relationship purpose

### 4. Date Strategy

Define:

- primary reporting date
- snapshot date
- invoice date
- event start/end date
- inactive date relationships if needed
- role-playing date requirement

### 5. Field Visibility

Define:

- hidden technical keys
- hidden raw fields
- visible business fields
- sort-by columns
- display names

### 6. Control Tables

Control/reconciliation tables should normally remain disconnected.

## Hard Rules

- No direct fact-to-fact relationship unless justified and validated.
- No many-to-many relationship unless justified and validated.
- No bidirectional filter unless justified and validated.
- No DAX approval before relationship validation.
- No reporting readiness without KPI reconciliation.
