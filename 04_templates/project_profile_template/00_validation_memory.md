# Validation Memory — [project_name]

## 1. Purpose

This file records validation status and validation-related memory for the `[project_name]` project profile.

Validation memory helps Arvizy agents avoid overclaiming and understand the latest known evidence.

Validation memory is not a substitute for direct validation evidence.

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
| SQL / data layer | NEEDS REVIEW | [notes] |
| Semantic model | NEEDS REVIEW | [notes] |
| Measures / DAX | NEEDS REVIEW | [notes] |
| KPI reconciliation | NEEDS REVIEW | [notes] |
| Documentation consistency | NEEDS REVIEW | [notes] |
| Final phase readiness | NEEDS REVIEW | [notes] |

---

## 4. Current Phase Validation Memory

Current phase:

```text
[phase]
```

Known validation principle:

```text
[validation principle]
```

Recommended current wording:

```text
[status wording]
```

Do not use:

```text
[blocked status wording]
```

unless evidence exists.

---

## 5. Validation Requirements

For technical changes, recommended validation includes:

- row count validation
- grain validation
- duplicate key validation
- orphan key validation
- total reconciliation
- status distribution check
- null check on critical keys
- before vs after comparison
- KPI/control reconciliation

---

## 6. Final Review Requirements

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

## 7. Validation Memory Update Rule

Update this file when:

- a validation passes
- a validation fails
- a phase status changes
- an implementation validation completes
- a major blocker is introduced or resolved
- Final Review changes approval status

---

## 8. Status

```text
Status:
DRAFT

Project Profile:
[project_name]
```
