# Semantic Model Profile â€” [project_name]

## 1. Purpose

This file defines semantic model expectations for the `[project_name]` project profile.

It helps Arvizy agents review model design, measure logic, relationship readiness, and implementation drift.

---

## 2. Semantic Model Objective

The semantic model should be:

- lean
- curated
- relationship-driven
- easy to validate
- easy to explain
- aligned with source/reporting layer
- controlled through canonical measures

---

## 3. Expected Model Layers

```text
Fact Tables
Dimension Tables
Disconnected Control Tables
Measure Container
```

---

## 4. Expected Fact Tables

| Table | Intended Role | Grain | Status |
|---|---|---|---|
| [fact table] | [role] | [grain] | NEEDS REVIEW |

---

## 5. Expected Dimension Tables

| Table | Intended Role | Grain | Status |
|---|---|---|---|
| [dimension table] | [role] | [grain] | NEEDS REVIEW |

---

## 6. Expected Control Tables

| Table | Intended Role | Relationship Rule | Status |
|---|---|---|---|
| [control table] | [role] | disconnected / connected | NEEDS REVIEW |

---

## 7. Measure Container

Potential measure container:

```text
[measure table]
```

Purpose:

- store measures
- keep measures organized
- avoid scattering measures across random tables

Status:

```text
NEEDS REVIEW
```

---

## 8. Relationship Principles

Default relationship principles:

- dimension-to-fact relationships
- single-direction filter by default
- avoid fact-to-fact relationships unless justified
- avoid bidirectional filters unless justified
- avoid many-to-many unless justified
- document inactive relationships if used

---

## 9. Grain Principles

Each table must have clear grain.

If grain is unclear, return:

```text
NEEDS REVIEW
```

---

## 10. Measure Design Principles

Measures should:

- use canonical base measures
- avoid duplicate visual-specific measures
- rely on relationships and slicers for breakdowns
- separate numeric and display measures
- reconcile KPI measures with source/control outputs
- preserve intended filter context

---

## 11. Semantic Model Review Checklist

Check:

- loaded tables
- table roles
- table grain
- relationship keys
- relationship cardinality
- filter direction
- disconnected control tables
- fact-to-fact avoidance
- bidirectional filter avoidance
- measure dependencies
- KPI reconciliation
- visual field mapping

---

## 12. Required Evidence for Approval

Semantic model approval requires one or more of:

- latest model export
- latest `semantic model export`
- relationship screenshot
- table/relationship list
- measure list
- KPI reconciliation output
- user-provided validation result

Without evidence, use:

```text
NEEDS REVIEW
```

---

## 13. Status

```text
Status:
DRAFT

Project Profile:
[project_name]
```



