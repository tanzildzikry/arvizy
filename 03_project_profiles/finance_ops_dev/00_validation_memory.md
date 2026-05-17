# Validation Memory — finance_ops_dev

## 1. Purpose

This file records validation status and validation-related memory for the `finance_ops_dev` project profile.

Validation memory helps Arvizy agents avoid overclaiming and ensures that all downstream agents understand the latest known evidence.

Validation memory is not a substitute for direct validation evidence.

For final approval, direct evidence must still be provided.

---

## 2. Core Rule

If validation evidence is incomplete, stale, or missing, use:

```text
NEEDS REVIEW
```

If only structure has been validated, use:

```text
PASS STRUCTURE ONLY
```

If validation has failed, use:

```text
FAILED VALIDATION
```

---

## 3. Current High-Level Validation Status

| Area | Status | Notes |
|---|---|---|
| SQL reporting layer | PASS STRUCTURE ONLY | Structure may be ready, but output-level validation must be confirmed with direct evidence |
| Power BI semantic model | NEEDS REVIEW | Requires PBIX implementation and relationship validation |
| DAX measure baseline | NEEDS REVIEW | Requires latest semantic model and existing measure check |
| KPI reconciliation | NEEDS REVIEW | Requires SQL/control output vs Power BI KPI card comparison |
| Movement analysis | NEEDS REVIEW | Full movement interpretation requires enough snapshot dates |
| Documentation consistency | NEEDS REVIEW | Must be checked after each major change |
| Final phase readiness | NEEDS REVIEW | Cannot be marked complete without final review evidence |

---

## 4. Phase 12 Validation Memory

Current phase context:

```text
Phase 12 — Power BI Semantic Model Build / Relationship Setup
```

Known validation principle:

```text
Phase 12 must not be marked as fully passed until Power BI table load, relationship setup, canonical DAX validation, KPI card reconciliation, and user final validation are complete.
```

Recommended current wording:

```text
Phase 12:
IN PROGRESS / NEEDS REVIEW
```

or if structure is confirmed:

```text
PASS STRUCTURE ONLY
```

Do not use:

```text
Phase 12 PASS
```

unless full validation evidence exists.

---

## 5. Movement Readiness Memory

Movement analysis requires enough snapshot points.

If fewer than 2 distinct snapshot dates exist, movement analysis is not meaningful yet.

Use:

```text
NEEDS REVIEW
```

or:

```text
PASS STRUCTURE ONLY
```

depending on what has been validated.

Blocked until:

- latest-per-day snapshot logic is validated
- at least 2 distinct snapshot dates exist
- movement output reconciles with expected inflow/outflow logic
- Power BI movement visuals are validated

---

## 6. SQL Validation Requirements

For SQL view or mart changes, recommended validation includes:

- row count validation
- grain validation
- duplicate key validation
- orphan key validation
- total reconciliation
- status distribution check
- null check on critical keys
- before vs after comparison if refactoring existing logic
- control view reconciliation if KPI-related

Do not approve SQL as fully validated without actual validation output.

---

## 7. Semantic Model Validation Requirements

For Power BI semantic model readiness, validate:

- loaded table list
- fact table grain
- dimension table uniqueness
- relationship keys
- relationship cardinality
- filter direction
- no unintended many-to-many relationship
- no fact-to-fact relationship unless explicitly justified
- control tables remain disconnected
- inactive relationships documented if used
- model supports intended visual slicing

---

## 8. DAX Validation Requirements

For DAX measures, validate:

- existing measure check
- naming convention
- measure folder/order if applicable
- base measure reuse
- no redundant visual-specific measure
- correct filter context
- expected total behavior
- visual-level behavior
- SQL/control reconciliation for KPI measures
- numeric/display measure separation

If the latest existing measure list is not available, DAX output must be marked:

```text
NEEDS REVIEW
```

or clearly identified as draft.

---

## 9. Documentation Validation Requirements

For documentation updates, validate:

- progress log remains cumulative
- current status matches evidence
- handover reflects latest blockers
- validation status is not overclaimed
- review record is created for significant review
- commit message matches changed files

---

## 10. Final Review Requirements

Before final approval or commit readiness, provide:

```text
git status
git diff --stat
changed files
validation result, if technical logic changed
documentation status
unresolved blocker check
```

If these are missing, Final Review must return:

```text
NEEDS REVIEW
```

---

## 11. Validation Memory Update Rule

Update this file when:

- a validation query passes
- a validation query fails
- a phase status changes
- a Power BI implementation validation completes
- a DAX measure reconciliation completes
- a major blocker is introduced or resolved
- Final Review changes the approval status

Each update should include:

- validation area
- date
- status
- evidence
- next step
- recheck condition

---

## 12. Status

```text
Status:
ACTIVE

Project Profile:
finance_ops_dev

Framework phase:
Phase 4 — Finance Ops Dev Project Profile Build
```
