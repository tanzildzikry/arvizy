# SQL Validation Pack Template

## Purpose

Define mandatory SQL validation checks before Power BI implementation.

## Required Validation Areas

### 1. Load Validation

- raw row count
- core row count
- mart row count
- rejected/invalid row count if applicable

### 2. Grain Validation

- duplicate check by expected grain
- business key duplicate check
- snapshot date count
- one row per declared grain test

### 3. Key Validation

- dimension key uniqueness
- blank key check
- orphan fact-to-dimension check
- UNKNOWN row requirement

### 4. Numeric Reconciliation

- source vs core totals
- core vs mart totals
- cost/revenue/amount totals
- negative or abnormal values

### 5. Date Validation

- invalid date count
- Excel serial date parsing check
- date range check
- snapshot date coverage

### 6. Business Rule Validation

- aging bucket distribution
- risk level distribution
- open/closed status distribution
- UMK reconciliation
- document completeness count
- backlog movement coverage if applicable

### 7. Power BI Readiness Validation

- mart object row counts
- relationship key coverage
- control KPI view totals
- current vs snapshot fact separation
- disconnected control table readiness

## Required Output

For every validation query:

```text
Validation ID
Validation Name
Purpose
SQL Query
Expected Result
Failure Meaning
Required Fix
```

## Hard Rules

- No Power BI readiness without SQL validation output.
- No KPI readiness without SQL control/reference totals.
- No relationship readiness without key uniqueness and orphan checks.
