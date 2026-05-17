# Evidence Policy — Arvizy

## 1. Purpose

This document defines what counts as evidence in Arvizy workflows.

Arvizy agents must not approve, validate, or mark work as complete without sufficient evidence.

The evidence policy prevents:

- unsupported approval
- status overclaim
- stale memory usage
- undocumented assumptions
- accidental phase completion
- unsafe SQL or DAX changes
- documentation drift

---

## 2. Core Evidence Rule

Agents must distinguish between:

```text
Evidence
Assumption
Recommendation
```

Agents must not present assumptions as evidence.

Agents must not approve based only on memory.

Agents must not approve based only on old documentation.

---

## 3. Valid Evidence Types

Valid evidence may include:

- direct SQL validation output
- database query result
- `information_schema` result
- row count output
- reconciliation output
- duplicate key validation output
- orphan key validation output
- latest SQL view definition
- latest semantic model export
- latest `.bim` structure
- Power BI relationship screenshot
- KPI card reconciliation result
- Git status
- Git diff/stat
- explicit user-provided validation result
- current project documentation with clear date/context
- current review record with supporting evidence

---

## 4. Insufficient Evidence

These are not enough for approval:

- memory only
- old handover only
- "likely correct"
- "seems fine"
- "probably safe"
- generic best practice
- undocumented assumption
- stale documentation
- unverified agent output
- old review record without current validation
- project profile statement without direct evidence
- expected result without actual result

---

## 5. Evidence Required by Task Type

### SQL Optimization

Required evidence for approval:

- SQL reviewed
- expected business meaning
- validation requirement
- naming/context check

For full approval after SQL change:

- actual validation output
- row count or reconciliation check where relevant
- grain check where relevant

If actual validation output is missing, decision must not be full `APPROVED`.

---

### SQL Validation

Required evidence:

- validation target
- validation query
- expected result
- actual result

If actual result is missing, decision must be:

```text
NEEDS REVIEW
```

If actual result contradicts expected result, decision must be:

```text
FAILED VALIDATION
```

or:

```text
NEEDS REVISION
```

---

### DAX Optimization

Required evidence for final approval:

- existing measure check
- semantic model context
- table/column names
- relationship context
- SQL or source reconciliation reference for KPI measures

If existing measure list is missing, agent must not assume no measure exists.

Use:

```text
NEEDS REVIEW
```

or clearly mark any DAX as draft.

---

### Documentation Update

Required evidence:

- source review output
- validation status
- decision label
- updated file scope
- phase status

Documentation Agent must not claim `PASS` unless validation evidence supports it.

If evidence says `PASS STRUCTURE ONLY`, documentation must preserve that wording.

---

### Final Review

Required evidence:

- git status
- git diff --stat
- changed file list
- validation result if technical logic changed
- documentation status
- unresolved blocker check

If these are missing, Final Review Agent must return:

```text
NEEDS REVIEW
```

---

## 6. Evidence Strength

Use the following strength order:

```text
1. Direct validation output
2. Direct database / semantic model output
3. Explicit user-provided result
4. Current project documentation with evidence
5. Latest review record with evidence
6. Project memory
7. Agent handover
8. Assumption
```

Items 1–5 may support approval.

Items 6–8 cannot support approval by themselves.

---

## 7. Approval Rule

Agents may use:

```text
APPROVED
```

only when sufficient evidence exists.

Agents may use:

```text
APPROVED FOR IMPLEMENTATION
```

when the design is safe to implement but final validation is still required.

Agents may use:

```text
PASS STRUCTURE ONLY
```

when structure has been checked but implementation or output is not fully validated.

Agents must use:

```text
NEEDS REVIEW
```

when evidence is incomplete, unclear, stale, or conflicting.

Agents must use:

```text
BLOCKED
```

when the request violates a known rule or would be unsafe.

---

## 8. Evidence Statement Requirement

When an agent gives a decision, it must state the evidence basis.

Example:

```text
Decision:
PASS STRUCTURE ONLY

Evidence:
- reporting views exist
- required columns are present

Missing Evidence:
- KPI card reconciliation
- Power BI relationship validation
- final user validation
```

---

## 9. No Evidence / No Approval Rule

If the user asks:

```text
Can we approve?
```

and provides no evidence, the agent must respond:

```text
NEEDS REVIEW
```

The agent must request or list the required evidence.

It must not guess.

---

## 10. Evidence Conflict Rule

If evidence conflicts, agents must apply the Conflict Resolution Rules.

Default rule:

```text
Use the more conservative status.
```

If one evidence source says `PASS` and another says `NEEDS REVIEW`, use:

```text
NEEDS REVIEW
```

unless direct validation proves `PASS`.

---

## 11. Git Evidence Rule

Before commit approval, required evidence includes:

```text
git status
git diff --stat
changed files
validation result, if technical logic changed
documentation consistency check
```

If these are missing, Final Review Agent must not approve.

---

## 12. Evidence Storage

Important evidence should be stored in:

```text
00_docs/review_records/
```

or a project-specific review record folder.

Evidence may also be summarized into:

```text
03_project_profiles/[project_name]/00_validation_memory.md
```

but memory must not replace direct evidence for approval.

---

## 13. Status

```text
Status:
ACTIVE

Applies to:
All Arvizy agent modes

Framework phase:
Phase 2 — Core OS Knowledge Build
```
