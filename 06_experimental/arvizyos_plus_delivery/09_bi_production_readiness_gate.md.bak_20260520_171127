# BI Production Readiness Gate

## Purpose

Decide whether a BI dashboard is ready for production/reporting use.

## Required Evidence

### SQL Evidence

- SQL schema executed successfully
- raw/core/mart row counts
- grain validation
- duplicate check
- null key check
- orphan row validation
- numeric reconciliation
- business rule validation
- control KPI output

### Power BI Model Evidence

- `.bim` or semantic model export
- loaded table list
- relationship screenshot or metadata
- table role mapping
- relationship validation
- field visibility check
- date table strategy

### DAX Evidence

- final measure inventory
- measure dependency map
- base measure validation
- ratio/derived measure validation
- display/narrative measure review
- redundant measure check

### Visual Evidence

- visual mapping
- slicer behavior test
- card reconciliation
- breakdown reconciliation
- visual total check
- tooltip/drill behavior if applicable

### Performance Evidence

- model size check
- page load test
- slow visual review
- high-cardinality slicer review
- heavy DAX review

### Documentation Evidence

- data dictionary
- SQL view contract
- semantic model contract
- relationship registry
- measure registry
- validation log
- handover notes

## Status Decision

Use only:

```text
PRODUCTION READY
PASS WITH WATCHLIST
NEEDS REVIEW
NEEDS REVISION
BLOCKED
```

## Hard Stop Conditions

- Missing `.bim` or model evidence.
- Missing relationship validation.
- Missing KPI reconciliation.
- Missing measure inventory.
- Missing SQL validation output.
- Unresolved many-to-many / fact-to-fact risk.
- Unresolved performance issue.
- Missing final review evidence.

## Final Rule

A dashboard is not production-ready because it looks correct.

It is production-ready only when SQL, model, DAX, visuals, reconciliation, performance, and documentation evidence all support the result.
