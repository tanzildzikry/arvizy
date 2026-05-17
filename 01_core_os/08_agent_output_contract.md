# Agent Output Contract — Arvizy

## 1. Purpose

This document defines the standard output format that every Arvizy agent must follow.

The goal is to make all agent outputs:

- consistent
- traceable
- reusable
- easy to hand over
- easy to validate
- suitable for review records
- suitable for phase continuation

Every agent must produce output in a structured format so the next agent can continue the workflow without losing context.

---

## 2. Applies To

This output contract applies to all Arvizy agent modes:

- Router Agent
- SQL Optimizer Agent
- SQL Validator Agent
- DAX Optimizer Agent
- Documentation Agent
- Final Review Agent
- Phase Handover Protocol

---

## 3. Required Output Sections

Every agent output must include these sections unless the task is clearly too small.

```text
1. Mode
2. Task Scope
3. Sources Reviewed
4. Key Findings
5. Decision
6. Risk Level
7. Blockers
8. Required Validation
9. Files Affected
10. Handover to Next Agent
```

For very small tasks, the agent may use a compact format, but it must still include:

```text
Mode
Decision
Reason
Next Step
```

---

## 4. Standard Output Format

Use this format for standard and full workflow tasks.

```text
## Agent Output

### 1. Mode

[Agent mode name]

### 2. Task Scope

[Clear summary of the task handled by this agent]

### 3. Sources Reviewed

- [Source file / evidence / user-provided context]
- [Source file / evidence / user-provided context]

### 4. Key Findings

- [Finding 1]
- [Finding 2]
- [Finding 3]

### 5. Decision

[APPROVED / APPROVED FOR IMPLEMENTATION / PASS STRUCTURE ONLY / NEEDS REVIEW / NEEDS REVISION / BLOCKED / FAILED VALIDATION]

### 6. Risk Level

[LOW / MEDIUM / HIGH]

### 7. Blockers

- [Blocker 1]
- [Blocker 2]

If there are no blockers, write:

No blockers identified.

### 8. Required Validation

- [Validation required]
- [Validation required]

If no validation is required, write:

No additional validation required for this task.

### 9. Files Affected

- [File path]
- [File path]

If no files are affected, write:

No files affected.

### 10. Handover to Next Agent

Next Agent:

[Agent mode name / None]

Handover Notes:

- [What the next agent must know]
- [What must not be assumed]
- [What still needs evidence]
```

---

## 5. Decision Labels

Agents must use the following decision labels consistently.

| Decision Label | Meaning |
|---|---|
| `APPROVED` | Evidence supports approval and no blocker remains |
| `APPROVED FOR IMPLEMENTATION` | Design or proposal is safe to implement, but final validation is still required |
| `PASS STRUCTURE ONLY` | Structure is valid, but implementation or output is not fully validated |
| `NEEDS REVIEW` | Evidence is incomplete, unclear, stale, or conflicting |
| `NEEDS REVISION` | A known issue must be fixed before approval |
| `BLOCKED` | The requested action is unsafe, invalid, or violates a rule |
| `FAILED VALIDATION` | Validation evidence shows the result is incorrect |

---

## 6. Risk Levels

Agents must classify risk using one of the following values.

| Risk Level | Meaning |
|---|---|
| `LOW` | Safe to proceed with normal review discipline |
| `MEDIUM` | Proceed carefully; validation or documentation is required |
| `HIGH` | Do not proceed without correction, validation, or explicit approval |

---

## 7. Evidence Requirement

Agents must distinguish between:

```text
Evidence
Assumption
Recommendation
```

Agents must not present assumptions as evidence.

Valid evidence may include:

- SQL validation output
- direct database result
- information schema result
- semantic model export
- `.bim` structure
- Git diff/stat
- user-provided validation result
- Power BI relationship screenshot
- KPI reconciliation output
- current project documentation with clear date/context

Insufficient evidence includes:

- memory only
- old handover only
- “likely correct”
- undocumented assumption
- generic best practice without project context

---

## 8. No-Overclaim Output Rule

Agents must not write:

```text
PASS
COMPLETED
VALIDATED
READY
APPROVED
```

unless sufficient evidence exists.

If only structure has been reviewed, use:

```text
PASS STRUCTURE ONLY
```

If evidence is incomplete, use:

```text
NEEDS REVIEW
```

If implementation is safe but not yet validated, use:

```text
APPROVED FOR IMPLEMENTATION
```

---

## 9. Handover Rules

Every handover must be clear enough for the next agent to continue without asking what happened before.

A handover must include:

- what was reviewed
- what was decided
- what evidence supports the decision
- what remains unvalidated
- what the next agent should do
- what the next agent must not assume

The next agent must treat previous handover as context, not proof.

Evidence must still be checked when approval is required.

---

## 10. Compact Output Format

Use this only for light workflow tasks.

```text
Mode:
[Agent Mode]

Decision:
[Decision Label]

Reason:
[Short reason]

Next Step:
[Recommended next action]
```

---

## 11. Router Output Format

Router Agent must use this format.

```text
## Router Output

### Request Classification

[SQL / DAX / Documentation / Final Review / Handover / Mixed]

### Recommended Workflow Intensity

[LIGHT / STANDARD / FULL]

### Recommended Agent Sequence

1. [Agent Mode]
2. [Agent Mode]
3. [Agent Mode]

### Required Inputs

- [Required input]
- [Required input]

### Stop Conditions

- [Condition that blocks execution]
- [Condition that requires review]
```

---

## 12. SQL Optimizer Output Format

SQL Optimizer Agent must include:

```text
## SQL Optimizer Output

### 1. Scope

### 2. SQL Reviewed

### 3. Structural Findings

### 4. Optimization Findings

### 5. BI Readiness Findings

### 6. Recommended Revision

### 7. Full SQL

### 8. Validation Required

### 9. Decision

### 10. Handover to SQL Validator
```

If no SQL rewrite is required, the agent must write:

```text
No SQL rewrite required.
```

---

## 13. SQL Validator Output Format

SQL Validator Agent must include:

```text
## SQL Validator Output

### 1. Scope

### 2. Validation Target

### 3. Validation Queries

### 4. Expected Result

### 5. Actual Result

### 6. Validation Decision

### 7. Failed Controls

### 8. Risk Level

### 9. Handover to Next Agent
```

If actual result is not provided, the decision must be:

```text
NEEDS REVIEW
```

---

## 14. DAX Optimizer Output Format

DAX Optimizer Agent must include:

```text
## DAX Optimizer Output

### 1. Scope

### 2. Existing Measure Check

### 3. Redundancy Check

### 4. Filter Context Review

### 5. Relationship Dependency

### 6. Recommended DAX

### 7. Visual Mapping

### 8. SQL Reconciliation Reference

### 9. Decision

### 10. Handover to Next Agent
```

If the requested measure is redundant, the agent must write:

```text
Requested measure is redundant.
Use the existing base/canonical measure with the correct dimension or slicer.
```

---

## 15. Documentation Agent Output Format

Documentation Agent must include:

```text
## Documentation Output

### 1. Scope

### 2. Source Reviewed

### 3. Documentation Files Updated

### 4. Status Wording

### 5. Progress Log Treatment

### 6. Handover Treatment

### 7. Commit Message Suggestion

### 8. Decision

### 9. Handover to Final Review
```

Documentation Agent must explicitly state whether progress log is:

```text
CUMULATIVE
```

or:

```text
LATEST UPDATE ONLY
```

For Arvizy and project continuity, default must be:

```text
CUMULATIVE
```

---

## 16. Final Review Output Format

Final Review Agent must include:

```text
## Final Review Output

### 1. Review Scope

### 2. Evidence Reviewed

### 3. Changed Files

### 4. Validation Status

### 5. Documentation Status

### 6. Risk Assessment

### 7. Final Decision

### 8. Approved Items

### 9. Blocked Items

### 10. Required Next Step

### 11. Suggested Commit Message
```

Final Review Agent must not approve commit readiness without:

```text
git status
git diff --stat
validation result, if technical logic changed
documentation consistency check
```

If evidence is incomplete, decision must be:

```text
NEEDS REVIEW
```

---

## 16A. Semantic Model / .bim Review Output Format

Use this output format when the user uploads or references a `.bim`, semantic model export, model schema, relationship metadata, or asks for a general review of schema, model, relationships, DAX, or measures.

The purpose of this format is to prevent generic model reviews and ensure the agent checks model structure, usability, relationships, measures, validation, and dashboard impact.

```text
## Semantic Model Review Output

### 1. Scope

State what model file or evidence is reviewed.

Also state what is not reviewed, such as:
- no SQL execution
- no documentation update
- no Final Review
- no approval without validation evidence

### 2. Tables and Role Classification

List each table and classify it as:
- FACT
- DIMENSION
- CONTROL / RECONCILIATION
- MEASURE CONTAINER
- HELPER / BRIDGE
- DETAIL / ISSUE FACT
- UNKNOWN

For each table, describe purpose, inferred grain if available, and report usability concerns.

### 3. Relationship Review

Review:
- fact-to-dimension paths
- missing slicer paths
- inactive relationship risk
- cardinality risk
- filter direction risk
- fact-to-fact risk
- many-to-many risk
- bidirectional risk
- disconnected control table status

### 4. Filter Path and Slicer Behavior

Explain which slicers are expected to affect which fact tables or dashboard pages.

At minimum review:
- PIC / owner slicer
- customer slicer, if present
- date / snapshot slicer
- BC / transaction slicer
- category / status slicer
- risk / aging slicer

### 5. Measure Architecture Review

Review:
- measure container table
- measure folders
- base measures
- derived measures
- ratio measures
- reconciliation measures
- guardrail measures
- redundant by-dimension measures
- measure dependency clarity

### 6. DAX / Measure Risk Findings

Identify measure risks such as:
- COUNTROWS vs DISTINCTCOUNT grain dependency
- hardcoded filters
- SUM over pre-filtered amount columns
- broad ALL() / REMOVEFILTERS()
- DIVIDE usage
- control table selector risk
- context-sensitive vs global guardrail measures

### 7. Column Hygiene and Usability

Review:
- visible technical columns
- raw text / remarks columns
- IDs and run IDs
- relationship keys
- non-additive numeric columns
- ratios, durations, and flags
- fields that should be hidden from report users

Classify:

Column Hygiene Risk:
LOW / MEDIUM / HIGH

### 8. Date Role Review

Classify the date design as:
- SINGLE ROLE DATE
- ROLE-PLAYING DATE NEEDED
- LATEST-ONLY FACT ACCEPTABLE
- DATE MODEL GAP
- NEEDS REVIEW

Explain date roles such as snapshot date, event date, invoice date, due date, or closing date when present.

### 9. Control and Reconciliation Review

Review:
- whether control tables are disconnected
- whether controls are one-row or multi-snapshot
- whether control measures select the correct control row
- whether reconciliation measures exist
- whether movement controls are used
- whether KPI cards can reconcile to SQL/control outputs

### 10. Dashboard Page Impact

Map findings to dashboard impact.

Examples:
- Executive Overview
- Summary / Analytical pages
- PIC Analysis
- Movement / Trend page
- Operational Detail page

### 11. Recommended Fix Priority

Classify findings by:

Priority 0 — Blocker
Priority 1 — Must Validate Before Approval
Priority 2 — Recommended Model Improvement
Priority 3 — Optional Optimization

### 12. Required Validation

List required validation:
- fact grain
- dimension key uniqueness
- orphan keys
- row counts
- control table grain
- KPI reconciliation
- relationship behavior
- visual-level reconciliation

### 13. Decision

Use Arvizy decision labels:
- APPROVED
- APPROVED FOR IMPLEMENTATION
- PASS STRUCTURE ONLY
- NEEDS REVIEW
- NEEDS REVISION
- BLOCKED
- FAILED VALIDATION

For `.bim` review, common safe combinations are:

Structure Status:
PASS STRUCTURE ONLY

Implementation Status:
NEEDS REVIEW
or
NEEDS REVISION

### 14. Risk Level

Use:
LOW / MEDIUM / HIGH

Explain why.

### 15. Handover to Next Agent

Recommend next agent:
- SQL Validator Agent for grain/key/reconciliation validation
- SQL Optimizer Agent if logic belongs upstream
- Documentation Agent if review record/status wording is needed
- Final Review Agent only after evidence is complete
```

Important rule:

A `.bim` or semantic model export can prove model structure and measure definitions, but it does not prove data quality, grain validity, orphan key status, row counts, or KPI reconciliation unless actual validation output is provided.


---

## 17. Review Record Compatibility

Every agent output should be easy to convert into a review record.

Review records must preserve:

- mode
- source reviewed
- decision
- risk level
- evidence
- blockers
- required next step
- commit suggestion

---

## 18. Output Quality Rules

Agent output must be:

- direct
- structured
- operational
- evidence-aware
- not overly verbose
- not generic
- not decorative
- not speculative
- ready for handover

Agents must avoid:

- vague approval
- unsupported claims
- unnecessary theory
- unrelated recommendations
- creating work outside their scope

---

## 19. Default Behavior When Unsure

If the agent is unsure, it must not guess.

Use:

```text
NEEDS REVIEW
```

Then state:

- what is unclear
- what evidence is missing
- what the safest next step is

---

## 20. Status

```text
Status:
ACTIVE

Applies to:
All Arvizy agent modes

Framework phase:
Phase 2 — Core OS Knowledge Build
```
