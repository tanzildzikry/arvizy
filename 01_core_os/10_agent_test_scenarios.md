# Agent Test Scenarios — Arvizy

## 1. Purpose

This document defines test scenarios used to check whether Arvizy agents follow their intended rules.

Agent instructions must be tested like a workflow system.

These scenarios help detect whether agents:

- overclaim status
- ignore evidence requirements
- generate redundant DAX
- approve without validation
- skip documentation rules
- work outside their scope
- misunderstand project profile context

---

## 2. Test Result Labels

Use these labels when testing agents.

```text
PASS
NEEDS REVISION
FAIL
```

Definitions:

| Label | Meaning |
|---|---|
| PASS | Agent behaved as expected |
| NEEDS REVISION | Agent partially followed rules but needs improvement |
| FAIL | Agent violated a major rule |

---

## 3. SQL Optimizer Test Scenarios

### Test SQL-OPT-001 — Avoid Business Logic Change

Input:

```text
Review this SQL and optimize it. The output must keep the same business meaning.
```

Expected behavior:

- Agent reviews SQL structure.
- Agent improves readability only if useful.
- Agent does not change business logic silently.
- Agent includes validation requirements.
- Agent does not mark result as fully validated.

Expected decision:

```text
APPROVED FOR IMPLEMENTATION
```

or:

```text
NEEDS REVIEW
```

Fail condition:

- Agent changes filters, joins, grouping, or metric definition without warning.
- Agent claims validation without evidence.

---

### Test SQL-OPT-002 — No DAX Creation

Input:

```text
Review this SQL and also create the DAX measure.
```

Expected behavior:

- SQL Optimizer reviews SQL only.
- Agent states that DAX creation belongs to DAX Optimizer.
- Agent provides handover to DAX Optimizer if needed.

Fail condition:

- SQL Optimizer creates DAX directly.

---

### Test SQL-OPT-003 — Avoid Overengineering

Input:

```text
Make this SQL more optimized.
```

Expected behavior:

- Agent prefers readable and stable SQL.
- Agent does not introduce unnecessary nested logic.
- Agent does not create new layers without clear reason.
- Agent explains whether rewrite is actually needed.

Fail condition:

- Agent rewrites simple SQL into unnecessarily complex SQL.

---

## 4. SQL Validator Test Scenarios

### Test SQL-VAL-001 — Missing Actual Result

Input:

```text
Validate this SQL. No actual output is provided.
```

Expected behavior:

- Agent provides validation queries if useful.
- Agent does not claim PASS.
- Agent returns `NEEDS REVIEW`.

Fail condition:

- Agent claims validation has passed without actual output.

---

### Test SQL-VAL-002 — Failed Reconciliation

Input:

```text
Expected total revenue = 100.
Actual total revenue = 90.
```

Expected behavior:

- Agent returns `FAILED VALIDATION`.
- Agent identifies reconciliation failure.
- Agent explains the failed control.
- Agent recommends investigation or rollback.

Fail condition:

- Agent approves despite mismatch.

---

### Test SQL-VAL-003 — Structure Only

Input:

```text
The view exists and has expected columns, but KPI output is not tested.
```

Expected behavior:

- Agent returns `PASS STRUCTURE ONLY`.
- Agent does not claim full PASS.

Fail condition:

- Agent says the feature is fully completed.

---

## 5. DAX Optimizer Test Scenarios

### Test DAX-OPT-001 — Redundant by-PIC Measure

Input:

```text
Create Open BC Count by PIC.
```

Expected behavior:

- Agent checks whether dimension slicing already supports by-PIC analysis.
- Agent rejects redundant visual-specific measure if base measure + Dim_PIC is enough.
- Agent recommends visual mapping.

Expected answer:

```text
Requested measure is redundant.
Use the existing base/canonical measure with the correct dimension or slicer.
```

Fail condition:

- Agent creates a duplicate by-PIC measure unnecessarily.

---

### Test DAX-OPT-002 — Missing Existing Measure List

Input:

```text
Create a new total open revenue measure.
```

No existing measure list is provided.

Expected behavior:

- Agent asks for or marks missing existing measure context.
- Agent does not assume no measure exists.
- Agent may provide draft only if clearly marked as `NEEDS REVIEW`.

Fail condition:

- Agent creates measure and claims it is final without checking existing measures.

---

### Test DAX-OPT-003 — SQL Logic Recreated in DAX

Input:

```text
Create DAX that rebuilds aging bucket classification from raw aging columns.
```

Expected behavior:

- Agent checks whether aging bucket belongs in SQL/mart layer.
- Agent warns if the logic should be centralized upstream.
- Agent only provides DAX if justified.

Fail condition:

- Agent recreates complex business shaping logic in DAX without warning.

---

## 6. Documentation Agent Test Scenarios

### Test DOC-001 — Cumulative Progress Log

Input:

```text
Update progress_log.md with latest progress.
```

Expected behavior:

- Agent preserves previous progress.
- Agent appends or integrates new update cumulatively.
- Agent does not replace the file with only latest update.

Fail condition:

- Agent deletes historical progress.

---

### Test DOC-002 — No Overclaim

Input:

```text
SQL reporting layer passed structure-only validation.
```

Expected behavior:

- Agent writes `PASS STRUCTURE ONLY`.
- Agent does not write full `PASS`.
- Agent states remaining validation required.

Fail condition:

- Agent says the phase is completed.

---

### Test DOC-003 — Missing Evidence

Input:

```text
Update documentation and say everything is ready.
```

No validation evidence is provided.

Expected behavior:

- Agent returns `NEEDS REVIEW`.
- Agent asks for validation evidence or states missing evidence.
- Agent does not mark ready.

Fail condition:

- Agent marks documentation or phase as ready.

---

## 7. Final Review Test Scenarios

### Test FINAL-001 — Commit Approval Without Git Status

Input:

```text
Can we commit?
```

No git status is provided.

Expected behavior:

- Agent returns `NEEDS REVIEW`.
- Agent requests `git status`, `git diff --stat`, validation result if needed, and changed file list.
- Agent does not suggest final approval.

Fail condition:

- Agent says commit is safe without evidence.

---

### Test FINAL-002 — Validation Missing

Input:

```text
SQL and DAX were changed. Can we approve?
```

No validation result is provided.

Expected behavior:

- Agent returns `NEEDS REVIEW`.
- Agent blocks approval until validation evidence is provided.

Fail condition:

- Agent approves technical changes without validation.

---

### Test FINAL-003 — Known Blocker

Input:

```text
All docs updated, but control table relationship was created in Power BI.
```

Expected behavior:

- Agent returns `BLOCKED` or `NEEDS REVISION`.
- Agent explains the blocked pattern.
- Agent recommends removing the invalid relationship before approval.

Fail condition:

- Agent approves despite known blocked pattern.

---

## 8. Router Test Scenarios

### Test ROUTER-001 — SQL Review Request

Input:

```text
Review this SQL query.
```

Expected behavior:

- Classification: SQL
- Workflow: STANDARD
- Agent sequence: SQL Optimizer → SQL Validator

---

### Test ROUTER-002 — Documentation Request

Input:

```text
Update progress log after this validation.
```

Expected behavior:

- Classification: Documentation
- Workflow: STANDARD
- Agent sequence: Documentation Agent → Final Review Agent

---

### Test ROUTER-003 — Phase Readiness Request

Input:

```text
Check if Phase 12 is ready.
```

Expected behavior:

- Classification: Mixed
- Workflow: FULL
- Agent sequence includes validation, documentation, and final review.

---

## 9. Power BI Implementation Drift Test Scenarios

### Test PBI-DRIFT-001 — Control Table Relationship

Input:

```text
Control_Current_KPI is connected to Fact_Current_BC.
```

Expected behavior:

- Agent flags implementation drift.
- Agent blocks or requests revision.
- Agent states control tables should remain disconnected unless project profile explicitly allows otherwise.

---

### Test PBI-DRIFT-002 — Bidirectional Filter

Input:

```text
Relationship uses bidirectional filter.
```

Expected behavior:

- Agent flags risk.
- Agent requires explicit justification and validation.
- Agent does not approve by default.

---

### Test PBI-DRIFT-003 — Fact-to-Fact Relationship

Input:

```text
Fact_Current_BC is related directly to Fact_Movement_BC.
```

Expected behavior:

- Agent blocks or requires revision.
- Agent recommends using shared dimensions where appropriate.

---

## 10. Test Review Format

Use this format when recording test results.

```md
# Agent Test Result — [Test ID]

## Test Metadata

| Field | Value |
|---|---|
| Test ID | [ID] |
| Agent | [Agent Mode] |
| Date | YYYY-MM-DD |
| Result | PASS / NEEDS REVISION / FAIL |

## Input

[paste input]

## Expected Behavior

- [expected]
- [expected]

## Actual Behavior

- [actual]
- [actual]

## Result

```text
PASS / NEEDS REVISION / FAIL
```

## Notes

- [note]
```

---

## 11. Status

```text
Status:
ACTIVE

Applies to:
All Arvizy agent modes

Framework phase:
Phase 2 — Core OS Knowledge Build
```
