# Naming Registry â€” [project_name]

## 1. Purpose

This file records approved naming conventions, known object names, and deprecated names for the `[project_name]` project profile.

The naming registry helps Arvizy agents avoid:

- hallucinated table names
- nonexistent column names
- deprecated names
- inconsistent measure naming
- broken references
- semantic model mismatch

---

## 2. Freshness Rule

If this naming registry conflicts with latest direct evidence, use latest direct evidence.

Direct evidence may include:

- latest view/table definition
- latest schema output
- latest semantic model export
- latest `semantic model export`
- latest user-provided column list
- latest validated project documentation

If conflict exists and cannot be resolved, return:

```text
NEEDS REVIEW
```

---

## 3. Approved Source / Schema / Dataset Names

| Name | Type | Purpose | Status | Last Confirmed |
|---|---|---|---|---|
| [name] | [schema/table/view/dataset] | [purpose] | ACTIVE / NEEDS REVIEW | [date/evidence] |

---

## 4. Approved Table / View Names

| Object | Role | Status | Last Confirmed |
|---|---|---|---|
| [object name] | [role] | ACTIVE / NEEDS REVIEW | [date/evidence] |

---

## 5. Approved Column Names

| Column | Table/View | Meaning | Status | Last Confirmed |
|---|---|---|---|---|
| [column] | [table/view] | [meaning] | ACTIVE / NEEDS REVIEW | [date/evidence] |

---

## 6. Deprecated / Risky Names

| Name | Reason | Replacement / Action |
|---|---|---|
| [old name] | [reason] | [replacement/action] |

---

## 7. Expected Semantic Model Objects

| Object | Role | Status |
|---|---|---|
| [fact table] | fact | NEEDS REVIEW |
| [dimension table] | dimension | NEEDS REVIEW |
| [control table] | control | NEEDS REVIEW |
| [measure table] | measure container | NEEDS REVIEW |

---

## 8. Measure Naming Rules

General measure naming principles:

- use clear business names
- prefer canonical reusable measures
- avoid duplicate visual-specific measures
- separate numeric and display/text measures
- avoid synonyms for existing measures

---

## 9. SQL / Query Naming Rules

Query naming should be:

- readable
- stable
- descriptive
- consistent across layers
- aligned with reporting purpose

---

## 10. Registry Maintenance Rule

Update this registry when:

- schema changes
- semantic model changes
- new object names are locked
- deprecated names are confirmed invalid
- measure naming convention changes

---

## 11. Status

```text
Status:
DRAFT

Project Profile:
[project_name]

Freshness:
NEEDS DIRECT VALIDATION BEFORE FINAL TECHNICAL OUTPUT
```



