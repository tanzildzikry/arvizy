# BI platform Implementation Drift Checklist â€” finance_ops_dev

## 1. Purpose

This checklist helps detect whether BI platform implementation has drifted from the approved semantic model and dashboard blueprint.

Implementation drift can occur when:

- extra tables are loaded
- relationships are created incorrectly
- control tables are connected accidentally
- bidirectional filters are enabled
- duplicate analytical measures are created
- visuals use incorrect fields
- KPI cards do not reconcile with SQL controls

Arvizy must use this checklist when reviewing BI platform implementation readiness.

---

## 2. Drift Review Decision Labels

Use these labels:

```text
APPROVED
APPROVED FOR IMPLEMENTATION
PASS STRUCTURE ONLY
NEEDS REVIEW
NEEDS REVISION
BLOCKED
FAILED VALIDATION
```

---

## 3. Loaded Table Checklist

Check whether only approved tables are loaded into the main PBIX model.

### Expected

- curated fact tables
- curated dimension tables
- disconnected control tables
- measure container table

### Risky

- raw tables loaded directly
- core transformation views loaded without clear reason
- duplicate versions of same table
- unused technical tables
- old/deprecated tables
- temporary validation tables left in main model

### Decision Rule

If non-curated tables are loaded without documented purpose:

```text
NEEDS REVISION
```

---

## 4. Fact Table Checklist

Check:

- fact table grain is clear
- each fact table has a defined role
- fact table does not mix incompatible grains
- fact table can be sliced by intended dimensions
- fact table supports expected visuals
- fact table totals reconcile with SQL/control outputs

If grain is unclear:

```text
NEEDS REVIEW
```

If grain is wrong:

```text
FAILED VALIDATION
```

or:

```text
NEEDS REVISION
```

---

## 5. Dimension Table Checklist

Check:

- dimension keys are unique
- dimension tables are not duplicated unnecessarily
- dimension names are clear
- dimension values are cleaned
- dimensions support expected slicers
- dimensions connect to facts through valid keys

If duplicate dimension keys exist where uniqueness is required:

```text
NEEDS REVISION
```

---

## 6. Relationship Checklist

Check:

- correct fact-to-dimension relationships
- correct cardinality
- correct active/inactive status
- correct filter direction
- no accidental many-to-many relationship
- no fact-to-fact relationship unless justified
- no control table relationship unless justified

If relationship evidence is missing:

```text
NEEDS REVIEW
```

---

## 7. Control Table Disconnection Checklist

Control/reconciliation tables should remain disconnected unless explicitly approved.

Check:

- `Control_Current_KPI` is disconnected
- `Control_Movement_KPI` is disconnected
- control tables are not filtering facts
- reconciliation logic is explicit in measures or validation checks

If control table is connected without justification:

```text
BLOCKED
```

---

## 8. Fact-to-Fact Relationship Checklist

Direct fact-to-fact relationship is blocked by default.

If found, check:

- why it exists
- whether shared dimension can replace it
- whether it creates ambiguous filter paths
- whether totals are affected

Default decision:

```text
BLOCKED
```

unless explicitly justified and validated.

---

## 9. Filter Direction Checklist

Default expected behavior:

```text
Single-direction filter from dimension to fact.
```

Flag:

- bidirectional filters
- ambiguous paths
- unnecessary cross filtering
- many-to-many filter propagation

If bidirectional filter exists without justification:

```text
NEEDS REVISION
```

---

## 10. Date Relationship Checklist

Check:

- date table exists if date analysis is needed
- date key is clean
- active relationship is intentional
- inactive relationships are documented
- measure logic using inactive relationships uses `USERELATIONSHIP()` when needed
- current vs movement date logic is clear

If date relationship is unclear:

```text
NEEDS REVIEW
```

---

## 11. Analytical Measure Checklist

Check:

- canonical measures are used
- existing measures checked before new measures
- no duplicate by-PIC measures
- no duplicate by-customer measures
- no duplicate by-division measures
- numeric and display measures are separated
- KPI measures reconcile with SQL/control outputs
- measure logic does not recreate SQL business shaping logic without justification

If redundant measure exists:

```text
NEEDS REVISION
```

or:

```text
BLOCKED
```

depending on severity.

---

## 12. KPI Card Reconciliation Checklist

For each KPI card, check:

- BI platform measure value
- SQL/control value
- filter context
- selected date/snapshot
- slicer effect
- expected total

If KPI does not match control output:

```text
FAILED VALIDATION
```

If control output is missing:

```text
NEEDS REVIEW
```

---

## 13. Visual Mapping Checklist

Check whether visuals use:

- correct fact table
- correct dimension
- correct measure
- correct slicer
- correct page context
- correct title/narrative
- correct drill-through field if applicable

Flag visuals that require duplicate measures when base measure + dimension is enough.

---

## 14. Movement Page Checklist

Movement/trend visuals require enough snapshot data.

Check:

- distinct snapshot dates
- movement fact readiness
- movement control reconciliation
- trend interpretation validity
- movement readiness flag/status

If snapshot dates are insufficient:

```text
PASS STRUCTURE ONLY
```

or:

```text
NEEDS REVIEW
```

Do not approve full movement trend interpretation.

---

## 15. Documentation Alignment Checklist

Check that documentation reflects implementation reality.

Required docs may include:

- current status
- progress log
- semantic model profile
- validation memory
- review records
- handover

If documentation says `PASS` but validation says `PASS STRUCTURE ONLY`:

```text
NEEDS REVISION
```

---

## 16. Final Drift Review Output Format

Use this format.

```text
## BI platform Drift Review Output

### 1. Scope

[BI platform implementation reviewed]

### 2. Evidence Reviewed

- [evidence]
- [evidence]

### 3. Loaded Table Findings

- [finding]

### 4. Relationship Findings

- [finding]

### 5. Control Table Findings

- [finding]

### 6. Measure Logic Findings

- [finding]

### 7. KPI Reconciliation Findings

- [finding]

### 8. Visual Mapping Findings

- [finding]

### 9. Drift Decision

[APPROVED / APPROVED FOR IMPLEMENTATION / PASS STRUCTURE ONLY / NEEDS REVIEW / NEEDS REVISION / BLOCKED / FAILED VALIDATION]

### 10. Risk Level

[LOW / MEDIUM / HIGH]

### 11. Required Next Step

- [next step]
```

---

## 17. Status

```text
Status:
ACTIVE

Project Profile:
finance_ops_dev

Framework phase:
Phase 4 â€” Finance Ops Dev Project Profile Build
```



