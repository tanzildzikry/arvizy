# BI Delivery Extension Test Prompts

## Test 1 â€” New Dataset to SQL Schema

```text
Use ArvizyOS+ BI Delivery Extension.

Task:
Create a PostgreSQL database schema from this new dataset for end-to-end BI dashboard delivery.

Requirement:
- Use 01_raw, 02_core, 03_mart.
- Identify grain.
- Create raw import table, core typed table/view, mart views, dimensions, control views, and validation queries.
- Include Power BI semantic model guidance.
- Do not create DAX.
- Do not approve production readiness.
```

## Test 2 â€” Source Profiling Only

```text
Use BI Source Profiler Mode.

Task:
Profile this new Excel/CSV dataset before SQL schema design.

Output:
Column inventory, data type assumption, dirty value risks, business mapping, grain hypothesis, candidate keys, and required validation.
Do not create SQL.
```

## Test 3 â€” SQL Validation Pack

```text
Use SQL Validation Pack Designer Mode.

Task:
Create validation queries for this SQL schema before Power BI implementation.

Requirement:
Cover row count, duplicate grain, key uniqueness, orphan rows, numeric totals, business rules, and control KPI output.
Do not create Power BI or DAX.
```

## Test 4 â€” Production Readiness Gate

```text
Use BI Production Readiness Gate Mode.

Task:
Assess whether this dashboard is production-ready.

Evidence:
SQL validation output provided.
No .bim provided.
No relationship screenshot provided.
No measure inventory provided.
No KPI reconciliation provided.

Requirement:
Do not approve production readiness.
Identify blockers and required evidence.
```
