# Dashboard Blueprint Profile â€” finance_ops_dev

## 1. Purpose

This file defines the dashboard blueprint expectations for the `finance_ops_dev` project profile.

It helps Arvizy agents review whether SQL, measure logic, semantic model, and visuals support the intended dashboard structure.

This profile is conceptual and must be aligned with the latest dashboard blueprint documentation before final implementation approval.

---

## 2. Dashboard Purpose

The dashboard is intended to support:

- executive overview
- management meeting discussion
- weekly reporting
- daily operational monitoring
- AR Collection follow-up
- Business Control visibility
- backlog and unbilled control
- PIC-level operational accountability

---

## 3. Design Style

The dashboard should follow:

- clean corporate visual style
- minimal clutter
- strong whitespace
- concise KPI cards
- clear hierarchy
- restrained colors
- executive-friendly layout
- operational drill-down where needed
- narrative-driven page flow
- no unnecessary decorative elements

---

## 4. Reader Flow

The dashboard should guide the reader through:

```text
What is happening?
â†“
Why does it matter?
â†“
Where is the issue?
â†“
Who/what needs action?
â†“
What should be done next?
```

---

## 5. Layered Dashboard Structure

The dashboard should support three layers:

```text
Executive Layer
Analytical Layer
Operational Layer
```

### Executive Layer

Purpose:

- high-level status
- exposure summary
- risk level
- trend / movement signal
- management-ready conclusion

### Analytical Layer

Purpose:

- explain drivers
- identify segment concentration
- show customer/PIC/category/risk pattern
- support management discussion

### Operational Layer

Purpose:

- show actionable details
- identify items requiring follow-up
- support PIC/customer/BC drill-down
- help daily monitoring

---

## 6. Suggested Page Categories

Potential page categories:

```text
Executive Overview
Unbilled Summary
Movement / Backlog Monitoring
PIC Analysis
Customer Analysis
Operational Detail
Data Quality / Exception Control
```

Exact page names must follow the latest dashboard blueprint.

---

## 7. Executive Overview Page

Purpose:

```text
Provide management-level summary of current AR/BC control position.
```

Expected visual types:

- KPI cards
- risk summary card
- concise trend/movement indicator
- top driver visual
- compact narrative insight
- exception highlight

Suggested slicers:

- period / snapshot date
- business pillar
- PIC / division
- customer
- event category
- risk level

Visual philosophy:

- not crowded
- no excessive table detail
- focus on decision summary

---

## 8. Unbilled Summary Page

Purpose:

```text
Explain unbilled exposure, aging, risk, and main drivers.
```

Expected visual types:

- total unbilled card
- open BC count card
- aging bucket distribution
- risk level distribution
- top customer exposure
- top PIC exposure
- event category breakdown
- trend/summary if validated

Suggested slicers:

- period / snapshot date
- PIC
- customer
- aging bucket
- risk level
- event category
- bill status

---

## 9. Movement / Backlog Monitoring Page

Purpose:

```text
Explain backlog movement, inflow, outflow, and prevention/control signal.
```

Expected visual types:

- movement readiness status
- backlog delta
- inflow value
- outflow value
- prevention indicator
- movement by period
- PIC movement contribution

Important rule:

```text
Full movement interpretation is blocked until enough snapshot dates exist and validation supports movement analysis.
```

Suggested slicers:

- snapshot date
- period
- PIC
- customer
- event category
- movement flag

---

## 10. PIC Analysis Page

Purpose:

```text
Evaluate PIC workload, exposure, aging, risk, and action priority.
```

Expected visual types:

- selected PIC card
- PIC KPI strip
- exposure by aging bucket
- risk profile
- workload indicator
- action priority list
- operational notes / next action

Suggested slicers:

- PIC
- division
- risk level
- aging bucket
- customer
- event category

Important rule:

measure logic should not create duplicate by-PIC measures if Dim_PIC slicing can handle analysis.

---

## 11. Customer Analysis Page

Purpose:

```text
Identify customer concentration, exposure, risk, and follow-up priority.
```

Expected visual types:

- top customer exposure
- customer aging profile
- customer risk profile
- customer open BC detail
- customer-level exception list

Suggested slicers:

- customer
- PIC
- risk level
- aging bucket
- event category
- period / snapshot date

---

## 12. Operational Detail Page

Purpose:

```text
Support daily follow-up and item-level monitoring.
```

Expected visual types:

- detail table
- item-level status
- BC number
- customer
- PIC
- aging
- bill status
- document status
- deadline / action field
- remarks / issue field

Suggested slicers:

- PIC
- customer
- bill status
- aging bucket
- risk level
- event category
- document status

This page can be denser than executive pages, but must remain usable.

---

## 13. Data Quality / Exception Control Page

Purpose:

```text
Identify missing, inconsistent, or risky data conditions.
```

Expected checks:

- missing PIC
- missing customer
- missing BC number
- invalid dates
- negative/blank amounts
- orphan keys
- duplicate business keys
- missing status
- mismatched invoice data
- validation exceptions

Suggested slicers:

- issue type
- source layer
- severity
- PIC
- period

---

## 14. Slicer Principles

Slicers should be:

- consistent across related pages
- not excessive
- aligned with page purpose
- placed predictably
- based on dimensions where possible
- not created from unstable fact columns unless justified

Common slicer candidates:

- snapshot date
- period
- PIC
- division
- customer
- event category
- aging bucket
- risk level
- bill status
- movement flag

---

## 15. Visual Design Rules

Visuals should:

- answer a clear business question
- use concise titles
- avoid unnecessary legends
- avoid excessive colors
- avoid dense pages
- avoid duplicate metrics
- use consistent number formatting
- support executive readability
- support operational action where needed

---

## 16. Narrative Rules

Narrative should be:

- concise
- evidence-based
- action-oriented
- non-judgmental
- operationally fair
- aligned with validation status

Do not generate strong narrative claims if data validation is incomplete.

Use conservative wording when evidence is partial.

---

## 17. Dashboard Readiness Rules

Dashboard design is ready for implementation when:

- semantic model objects are defined
- relationships are clear
- analytical measure baseline is controlled
- SQL reporting layer is validated enough
- KPI reconciliation path exists
- visual mapping is clear
- blocked implementation patterns are avoided

Dashboard is not fully validated until:

- PBIX model is built
- relationships are validated
- KPI cards reconcile
- visual behavior is checked
- user final validation is completed

---

## 18. Current Profile Status

```text
Status:
ACTIVE

Project Profile:
finance_ops_dev

Freshness:
NEEDS ALIGNMENT WITH LATEST DASHBOARD BLUEPRINT AND PHASE 12 DOCUMENTATION

Framework phase:
Phase 4 â€” Finance Ops Dev Project Profile Build
```



