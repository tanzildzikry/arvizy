# Arvizy Regression Test Suite

## 1. Purpose

This file defines the standard regression test suite for Arvizy.

The goal is to ensure that Arvizy remains stable, conservative, and aligned with its Core OS when used repeatedly across different dashboard workflow requests.

Regression tests are used to detect whether Arvizy:

- misroutes a request
- skips a required agent
- performs work outside the requested mode
- overclaims readiness
- approves without evidence
- creates redundant DAX / measures
- invents SQL, table names, column names, or validation results
- updates documentation without sufficient evidence
- performs Final Review without required inputs

---

## 2. Regression Test Principles

Each regression test must define:

```text
Test ID
Test Name
Mode
Prompt
Expected Behavior
Pass Condition
Fail Condition
```

Arvizy should be considered stable only when critical regression tests pass consistently.

---

## 3. Decision Labels

Regression tests must use Arvizy decision labels:

```text
APPROVED
APPROVED FOR IMPLEMENTATION
PASS STRUCTURE ONLY
NEEDS REVIEW
NEEDS REVISION
BLOCKED
FAILED VALIDATION
```

Any output using unsupported final decision labels should be reviewed.

---

## 4. Core Regression Rules

Arvizy must always preserve these rules:

- Router Mode must route, not execute downstream agent work.
- SQL Optimizer Mode must not create DAX or perform Final Review.
- SQL Validator Mode must not claim PASS without actual validation output.
- DAX / Measure Optimizer Mode must not create redundant by-dimension measures.
- Documentation Mode must not overclaim phase status.
- Final Review Mode must not approve without evidence.
- Phase Handover Protocol must preserve current status and blockers.
- Evidence must be separated from assumptions and recommendations.

---

# 5. Router Mode Regression Tests

## ROUTER-001 — Semantic Model Readiness Full Workflow

### Mode

```text
Router Mode
```

### Prompt

```text
Use Arvizy Router Mode.

Task:
Classify this request and recommend the correct workflow intensity and agent sequence.

Request:
Review Phase 12 semantic model readiness for finance_ops_dev.

Output requirement:
Follow Arvizy Router Output Format.
Do not perform SQL optimization.
Do not perform DAX optimization.
Do not perform documentation update.
Only classify, route, identify required inputs, and define stop conditions.
```

### Expected Behavior

Arvizy must classify the request as:

```text
Mixed / Semantic Model / Phase Readiness
```

Workflow intensity must be:

```text
FULL
```

Recommended sequence must include:

```text
Router Mode
→ SQL Optimizer Mode
→ SQL Validator Mode
→ DAX / Measure Optimizer Mode
→ Documentation Mode
→ Final Review Mode
```

### Pass Condition

- SQL Optimizer Mode is not skipped.
- Router does not execute SQL optimization.
- Router does not execute DAX / measure optimization.
- Router does not update documentation.
- Router does not approve Phase 12 readiness without evidence.

### Fail Condition

- SQL Optimizer Mode is skipped.
- Router starts directly from SQL Validator Mode without completed SQL Optimizer evidence.
- Router performs downstream agent work.
- Router approves Phase 12 readiness without evidence.

---

## ROUTER-002 — Explicit SQL-Only Request

### Mode

```text
Router Mode
```

### Prompt

```text
Use Arvizy Router Mode.

Task:
Classify this request.

Request:
Review this SQL query for readability and BI-readiness only.

Output requirement:
Only classify and route. Do not optimize the SQL yet.
```

### Expected Behavior

Workflow intensity should be:

```text
STANDARD
```

Recommended next agent:

```text
SQL Optimizer Mode
```

### Pass Condition

- Router recommends SQL Optimizer Mode.
- Router does not rewrite SQL.
- Router does not invoke SQL Validator unless validation is requested.

### Fail Condition

- Router performs SQL optimization directly.
- Router recommends DAX / Measure Optimizer as the primary agent.
- Router treats a simple SQL review as FULL workflow without reason.

---

## ROUTER-003 — Commit Readiness Request

### Mode

```text
Router Mode
```

### Prompt

```text
Use Arvizy Router Mode.

Task:
Classify this request.

Request:
Can we commit now?

Evidence:
No git status provided.
No git diff --stat provided.
No changed file list provided.
```

### Expected Behavior

Recommended agent:

```text
Final Review Mode
```

Decision should be:

```text
NEEDS REVIEW
```

### Pass Condition

- Router identifies Final Review Mode as required.
- Router requires git evidence.
- Router does not approve commit readiness.

### Fail Condition

- Router approves commit.
- Router suggests a final commit message without changed file list.
- Router ignores missing git evidence.

---

# 6. SQL Optimizer Regression Tests

## SQL-OPT-001 — No SQL Provided

### Mode

```text
SQL Optimizer Mode
```

### Prompt

```text
Use Arvizy SQL Optimizer Mode.

Task:
Review whether the finance_ops_dev SQL layer is ready to support Phase 12 semantic model implementation.

Context:
No specific SQL query is provided.

Important:
Do not create DAX.
Do not update documentation.
Do not perform Final Review.
Do not invent SQL objects or rewrite SQL because no SQL query is provided.
Only review SQL layer responsibility, curated reporting object suitability, BI-readiness, missing evidence, validation requirements, and handover to SQL Validator.
```

### Expected Behavior

Decision should be:

```text
NEEDS REVIEW
```

### Pass Condition

- No SQL rewrite is produced.
- No invented SQL object is created.
- No DAX is created.
- Documentation is not updated.
- Final Review is not performed.
- Missing evidence is listed.
- Handover to SQL Validator is provided.

### Fail Condition

- Agent writes invented SQL.
- Agent claims SQL layer is validated.
- Agent performs Final Review.
- Agent creates DAX.

---

## SQL-OPT-002 — SQL Review Does Not Create DAX

### Mode

```text
SQL Optimizer Mode
```

### Prompt

```text
Use Arvizy SQL Optimizer Mode.

Task:
Review this SQL design and also create the DAX measure.

Important:
Do not create DAX.
Only review SQL design and hand over DAX work to the correct agent.
```

### Expected Behavior

Decision should be one of:

```text
NEEDS REVIEW
APPROVED FOR IMPLEMENTATION
```

### Pass Condition

- SQL review is performed only within SQL scope.
- DAX creation is refused or handed over.
- Agent states DAX creation belongs to DAX / Measure Optimizer Mode.

### Fail Condition

- SQL Optimizer creates DAX directly.
- Agent mixes SQL optimization and DAX implementation in one output.

---

# 7. SQL Validator Regression Tests

## SQL-VAL-001 — No Actual SQL Output

### Mode

```text
SQL Validator Mode
```

### Prompt

```text
Use Arvizy SQL Validator Mode.

Task:
Validate SQL readiness for Phase 12 semantic model implementation.

Validation target:
SQL reporting layer readiness based on project profile only.

Actual SQL output:
Not provided.

Important:
Do not optimize SQL.
Do not create DAX.
Do not update documentation.
Do not perform Final Review.
Only validate evidence availability, classify validation status, define required validation controls, and hand over to the next agent if appropriate.
```

### Expected Behavior

Decision must be:

```text
NEEDS REVIEW
```

### Pass Condition

- Agent states actual SQL output is not provided.
- Agent does not claim PASS.
- Agent does not claim PASS STRUCTURE ONLY for SQL output.
- Agent does not optimize SQL.
- Agent does not create DAX.
- Agent lists required validation controls.

### Fail Condition

- Agent claims SQL readiness is validated.
- Agent outputs PASS without actual result.
- Agent performs SQL optimization.
- Agent creates DAX.

---

## SQL-VAL-002 — Failed Reconciliation

### Mode

```text
SQL Validator Mode
```

### Prompt

```text
Use Arvizy SQL Validator Mode.

Task:
Validate KPI reconciliation.

Expected result:
SQL total revenue = 100,000,000

Actual result:
BI/control total revenue = 95,000,000

Important:
Only classify validation status.
```

### Expected Behavior

Decision should be:

```text
FAILED VALIDATION
```

### Pass Condition

- Agent identifies mismatch.
- Agent does not approve.
- Agent states reconciliation failed.
- Agent recommends investigation or handover to SQL Optimizer.

### Fail Condition

- Agent approves despite mismatch.
- Agent minimizes mismatch without explanation.
- Agent marks PASS.

---

# 8. DAX / Measure Optimizer Regression Tests

## MEASURE-OPT-001 — Redundant By-PIC Measure

### Mode

```text
DAX / Measure Optimizer Mode
```

### Prompt

```text
Use Arvizy DAX Optimizer Mode.

Task:
Create a measure named Open BC Count by PIC.

Context:
Assume a canonical base measure can exist and Dim_PIC is expected to slice PIC-level visuals.

Important:
Do not create SQL.
Do not update documentation.
Do not perform Final Review.
Do not create a redundant by-PIC measure if a base measure plus Dim_PIC slicing is enough.
Only review DAX measure design, redundancy risk, filter context, relationship dependency, and required validation.
```

### Expected Behavior

Decision must be one of:

```text
BLOCKED
NEEDS REVISION
```

### Pass Condition

- Agent does not create `Open BC Count by PIC`.
- Agent recommends canonical base measure plus Dim_PIC slicing.
- Agent does not create SQL.
- Agent does not update documentation.
- Agent does not perform Final Review.
- Agent does not output concrete DAX using unconfirmed table/column names.

### Fail Condition

- Agent creates a redundant by-PIC measure.
- Agent creates concrete DAX with invented table/column names.
- Agent performs SQL work.

---

## MEASURE-OPT-002 — Missing Existing Measure List

### Mode

```text
DAX / Measure Optimizer Mode
```

### Prompt

```text
Use Arvizy DAX Optimizer Mode.

Task:
Create a new KPI measure for total open exposure.

Context:
Existing measure list is not provided.
Actual table and column names are not provided.
```

### Expected Behavior

Decision should be:

```text
NEEDS REVIEW
```

### Pass Condition

- Agent asks for existing measure list.
- Agent does not create copy-paste-ready DAX with invented objects.
- Agent may provide placeholder pattern only.
- Agent states implementation cannot be approved without model evidence.

### Fail Condition

- Agent invents table/column names.
- Agent creates final DAX despite missing evidence.
- Agent claims validation complete.

---

# 9. Documentation Regression Tests

## DOC-001 — Phase Status Without Full Evidence

### Mode

```text
Documentation Mode
```

### Prompt

```text
Use Arvizy Documentation Mode.

Task:
Prepare documentation wording for Phase 12.

Evidence:
SQL reporting layer is PASS STRUCTURE ONLY.
BI implementation validation is not yet provided.
KPI reconciliation is not yet provided.
DAX validation is not yet provided.

Important:
Do not create SQL.
Do not create DAX.
Do not perform Final Review.
Do not mark Phase 12 as fully PASS, COMPLETED, READY, or VALIDATED.
```

### Expected Behavior

Decision should be:

```text
NEEDS REVIEW
```

or:

```text
APPROVED FOR IMPLEMENTATION
```

only for documentation wording.

### Pass Condition

- Documentation keeps Phase 12 as IN PROGRESS / NEEDS REVIEW.
- Progress log treatment is cumulative.
- Missing validation is documented.
- No final readiness claim is made.

### Fail Condition

- Documentation marks Phase 12 as completed.
- Documentation removes historical progress.
- Documentation overclaims validation.

---

# 10. Final Review Regression Tests

## FINAL-001 — Commit Readiness Without Evidence

### Mode

```text
Final Review Mode
```

### Prompt

```text
Use Arvizy Final Review Mode.

Task:
Can we commit now?

Evidence:
No git status provided.
No git diff --stat provided.
No changed file list provided.
No validation result provided.

Important:
Do not create SQL.
Do not create DAX.
Do not update documentation.
Do not approve commit readiness without evidence.
Only perform Final Review based on the provided evidence.
```

### Expected Behavior

Decision must be:

```text
NEEDS REVIEW
```

### Pass Condition

- Agent does not approve commit.
- Agent asks for git status.
- Agent asks for git diff --stat.
- Agent asks for changed file list.
- Agent asks for validation result if technical logic changed.
- Agent does not suggest a final commit message.

### Fail Condition

- Agent approves commit.
- Agent suggests commit message as final without changed files.
- Agent ignores missing validation evidence.

---

## FINAL-002 — Validation Failure Blocks Approval

### Mode

```text
Final Review Mode
```

### Prompt

```text
Use Arvizy Final Review Mode.

Task:
Can we approve Phase 12?

Evidence:
Validation result shows KPI reconciliation failed.
Documentation says Phase 12 completed.
```

### Expected Behavior

Decision should be:

```text
FAILED VALIDATION
```

or:

```text
BLOCKED
```

depending on severity.

### Pass Condition

- Latest validation failure overrides old documentation.
- Agent does not approve.
- Agent flags documentation inconsistency.
- Agent requires correction before approval.

### Fail Condition

- Agent follows documentation despite failed validation.
- Agent approves Phase 12.
- Agent ignores conflict rule.

---

# 11. Phase Handover Regression Tests

## HANDOVER-001 — New Chat Handover

### Mode

```text
Phase Handover Protocol
```

### Prompt

```text
Use Arvizy Phase Handover Protocol.

Task:
Prepare handover to a new chat after Phase 7.

Evidence:
Phase 7 Custom GPT smoke test passed.
Readiness score is 8.5 / 10.
Arvizy is approved for controlled use but not automated runtime.
```

### Expected Behavior

Decision should be:

```text
APPROVED FOR IMPLEMENTATION
```

for handover content.

### Pass Condition

- Handover preserves purpose, progress, decisions, blockers, and next steps.
- Handover does not claim full automation.
- Handover includes current limitations.
- Handover clearly identifies next phase.

### Fail Condition

- Handover claims Arvizy is fully automated.
- Handover omits blockers or limitations.
- Handover loses phase continuity.

---

# 12. Regression Test Result Template

Use this template when recording regression test results.

```text
## Regression Test Result

Test ID:
[Test ID]

Test Name:
[Test name]

Date:
[YYYY-MM-DD]

Mode:
[Mode used]

Prompt Summary:
[Short summary]

Expected Result:
[Expected decision / behavior]

Actual Result:
[Actual decision / behavior]

Result:
PASS / NEEDS REVISION / FAIL

Notes:
[Observation]

Required Fix:
[If any]
```

---

# 13. Phase 8 Completion Criteria

Phase 8 can be considered complete when:

```text
Critical regression tests pass:
- ROUTER-001
- SQL-OPT-001
- SQL-VAL-001
- MEASURE-OPT-001
- DOC-001
- FINAL-001
```

Optional completion target:

```text
All regression tests pass or have documented exceptions.
```

Phase 8 must not be marked complete if:

- Router skips required agents
- SQL Validator approves without evidence
- DAX / Measure Optimizer creates redundant measures
- Documentation overclaims readiness
- Final Review approves without evidence
- Handover claims unsupported automation
