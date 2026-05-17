# Arvizy Prompt Templates

## 1. Purpose

This file provides reusable daily-use prompt templates for Arvizy.

Use these prompts when working with Arvizy Custom GPT or any Arvizy-compatible assistant workflow.

The goal is to make Arvizy usage:

- consistent
- evidence-aware
- scoped correctly
- aligned with the correct agent mode
- easier to repeat across projects

---

## 2. General Usage Rule

Start with Router Mode when the request affects multiple layers or when the correct agent is unclear.

Use a specific mode only when the intended workflow is already clear.

General rule:

```text
Router first for classification.
Specific mode when the task is already scoped.
Final Review only when evidence package is available.
```

---

# 3. Router Mode Templates

## 3.1 General Router Classification

```text
Use Arvizy Router Mode.

Task:
Classify this request and recommend the correct workflow intensity and agent sequence.

Request:
[PASTE REQUEST HERE]

Output requirement:
Follow Arvizy Router Output Format.
Do not perform SQL optimization.
Do not perform DAX / measure optimization.
Do not update documentation.
Do not perform Final Review.
Only classify, route, identify required inputs, and define stop conditions.
```

---

## 3.2 Phase Readiness Router

```text
Use Arvizy Router Mode.

Task:
Classify this phase readiness request and recommend the correct workflow intensity and agent sequence.

Request:
Review [PHASE NAME] readiness for [PROJECT NAME].

Context:
[OPTIONAL CONTEXT]

Output requirement:
Follow Arvizy Router Output Format.
Do not perform SQL optimization.
Do not perform SQL validation.
Do not perform DAX / measure optimization.
Do not update documentation.
Do not perform Final Review.
Only classify, route, identify required evidence, define stop conditions, and recommend the next agent sequence.
```

---

## 3.3 Commit Readiness Router

```text
Use Arvizy Router Mode.

Task:
Classify this commit-readiness request.

Request:
Can we commit now?

Evidence:
[PASTE AVAILABLE GIT / VALIDATION EVIDENCE HERE]

Output requirement:
Follow Arvizy Router Output Format.
Do not approve commit readiness.
Do not create SQL.
Do not create DAX.
Do not update documentation.
Only route the request to the correct agent and list missing evidence.
```

---

# 4. SQL Optimizer Templates

## 4.1 SQL Design Review

```text
Use Arvizy SQL Optimizer Mode.

Task:
Review this SQL for readability, maintainability, BI-readiness, and semantic model suitability.

SQL:
```sql
[PASTE SQL HERE]
```

Context:
[DESCRIBE BUSINESS PURPOSE / DASHBOARD PURPOSE]

Important:
Do not create DAX.
Do not update documentation.
Do not perform Final Review.
Only review SQL design, layer responsibility, grain readiness, naming, maintainability, and BI-readiness.

Output requirement:
Follow Arvizy SQL Optimizer Output Format.
```

---

## 4.2 SQL Layer Readiness Review Without SQL Provided

```text
Use Arvizy SQL Optimizer Mode.

Task:
Review whether the [PROJECT NAME] SQL layer is ready to support [PHASE / DASHBOARD / SEMANTIC MODEL PURPOSE].

Context:
No specific SQL query is provided.
Assume this is a design-level SQL layer responsibility review only.

Important:
Do not create DAX.
Do not update documentation.
Do not perform Final Review.
Do not invent SQL objects or rewrite SQL because no SQL query is provided.
Only review SQL layer responsibility, curated reporting object suitability, BI-readiness, missing evidence, validation requirements, and handover to SQL Validator.

Output requirement:
Follow Arvizy SQL Optimizer Output Format.
```

---

## 4.3 SQL Refactor Request

```text
Use Arvizy SQL Optimizer Mode.

Task:
Refactor this SQL for readability, maintainability, and BI consumption.

SQL:
```sql
[PASTE SQL HERE]
```

Business rules:
[PASTE BUSINESS RULES HERE]

Important:
Do not change business meaning.
Do not create DAX.
Do not update documentation.
Do not perform Final Review.
Explain any structural changes.
If business logic is ambiguous, return NEEDS REVIEW before rewriting.

Output requirement:
Follow Arvizy SQL Optimizer Output Format.
Provide full copy-paste-ready SQL only if enough evidence is available.
```

---

# 5. SQL Validator Templates

## 5.1 SQL Validation Evidence-Gate Review

```text
Use Arvizy SQL Validator Mode.

Task:
Validate SQL readiness for [PHASE / DASHBOARD / SEMANTIC MODEL PURPOSE].

Validation target:
[DESCRIBE TARGET]

Expected result:
[PASTE EXPECTED RESULT]

Actual SQL output:
[PASTE ACTUAL SQL OUTPUT]

Important:
Do not optimize SQL.
Do not create DAX.
Do not update documentation.
Do not perform Final Review.
Only validate evidence availability, compare expected vs actual result, classify validation status, define failed controls, and hand over to the next agent if appropriate.

Output requirement:
Follow Arvizy SQL Validator Output Format.
```

---

## 5.2 SQL Validator Without Actual Output

```text
Use Arvizy SQL Validator Mode.

Task:
Validate SQL readiness for [PHASE / DASHBOARD / SEMANTIC MODEL PURPOSE].

Validation target:
[DESCRIBE VALIDATION TARGET]

Actual SQL output:
Not provided.

Important:
Do not optimize SQL.
Do not create DAX.
Do not update documentation.
Do not perform Final Review.
Only validate evidence availability, classify validation status, define required validation controls, and hand over to the next agent if appropriate.

Output requirement:
Follow Arvizy SQL Validator Output Format.
```

---

## 5.3 KPI Reconciliation Validation

```text
Use Arvizy SQL Validator Mode.

Task:
Validate KPI reconciliation.

KPI:
[KPI NAME]

Expected result:
[PASTE EXPECTED / CONTROL VALUE]

Actual result:
[PASTE ACTUAL VALUE]

Context:
[PASTE CONTEXT]

Important:
Do not optimize SQL.
Do not create DAX.
Do not update documentation.
Do not perform Final Review.
Only classify validation result, identify mismatch if any, and define next required action.

Output requirement:
Follow Arvizy SQL Validator Output Format.
```

---

# 6. DAX / Measure Optimizer Templates

## 6.1 General DAX / Measure Review

```text
Use Arvizy DAX Optimizer Mode.

Task:
Review this DAX / measure logic for correctness, redundancy, filter context, relationship dependency, and validation requirements.

Measure:
```DAX
[PASTE DAX HERE]
```

Context:
[DESCRIBE BUSINESS PURPOSE]

Important:
Do not create SQL.
Do not update documentation.
Do not perform Final Review.
Only review measure design, redundancy risk, filter context, relationship dependency, SQL/control reconciliation dependency, and required validation.

Output requirement:
Follow Arvizy DAX Optimizer Output Format.
```

---

## 6.2 Redundant By-Dimension Measure Check

```text
Use Arvizy DAX Optimizer Mode.

Task:
Create a measure named [MEASURE NAME BY DIMENSION].

Context:
Assume a canonical base measure can exist and [DIMENSION TABLE] is expected to slice visuals.

Important:
Do not create SQL.
Do not update documentation.
Do not perform Final Review.
Do not create a redundant by-dimension measure if a base measure plus dimension slicing is enough.
Only review measure design, redundancy risk, filter context, relationship dependency, and required validation.

Output requirement:
Follow Arvizy DAX Optimizer Output Format.
```

---

## 6.3 Existing Measure Reuse Review

```text
Use Arvizy DAX Optimizer Mode.

Task:
Review whether a new measure is needed or whether existing canonical measures should be reused.

Request:
[DESCRIBE REQUESTED KPI / VISUAL]

Existing measures:
[PASTE EXISTING MEASURE LIST]

Model context:
[PASTE TABLE / RELATIONSHIP CONTEXT]

Important:
Do not create SQL.
Do not update documentation.
Do not perform Final Review.
Do not create redundant measures.
Only determine whether a new measure is justified and what validation is required.

Output requirement:
Follow Arvizy DAX Optimizer Output Format.
```

---

# 7. Semantic Model / .bim Review Templates

## 7.1 General .bim Review

```text
lakukan review skema, model, relationship, dan apapun untuk mengoptimalkan DAX dan measuresnya
ini adalah dashboard umum
```

Use this when uploading a `.bim` file and you want Arvizy to perform broad semantic model review.

Expected Arvizy coverage:

```text
- model inventory
- table role classification
- relationship review
- filter path and slicer behavior
- measure architecture review
- DAX / measure risk findings
- column hygiene and report usability
- date role review
- control and reconciliation review
- dashboard page impact
- recommended fix priority
- required validation
- decision
- risk level
- handover to next agent
```

---

## 7.2 Structured .bim Review

```text
Use Arvizy DAX Optimizer Mode.

Task:
Review this uploaded .bim model.

Request:
Lakukan review skema, model, relationship, dan apapun untuk mengoptimalkan DAX dan measures.
Ini adalah dashboard umum.

Important:
Do not create SQL.
Do not update documentation.
Do not perform Final Review.
Review model structure, relationship, measure architecture, slicer behavior, column hygiene, date role clarity, control/reconciliation design, dashboard impact, and validation requirements.

Output requirement:
Use Semantic Model Review Output Format if available.
```

---

## 7.3 .bim Review Comparison Prompt

```text
Use Arvizy DAX Optimizer Mode.

Task:
Review this .bim model and compare the result against a previous review.

Inputs:
- Current .bim file
- Previous review output

Important:
Do not create SQL.
Do not update documentation.
Do not perform Final Review.
Only compare review quality, missed issues, confirmed findings, improved findings, and remaining gaps.

Output requirement:
Include:
- confirmed findings
- missed findings
- inaccurate findings
- improvement opportunities
- final review quality score
```

---

# 8. Documentation Mode Templates

## 8.1 Documentation Update

```text
Use Arvizy Documentation Mode.

Task:
Update documentation wording for [PHASE / REVIEW / STATUS].

Evidence:
[PASTE EVIDENCE]

Important:
Do not create SQL.
Do not create DAX.
Do not perform Final Review.
Do not mark the phase as PASS, COMPLETED, READY, VALIDATED, or APPROVED unless evidence supports it.
Preserve cumulative progress history.

Output requirement:
Follow Arvizy Documentation Output Format.
Provide ready-to-copy markdown if requested.
```

---

## 8.2 Progress Log Update

```text
Use Arvizy Documentation Mode.

Task:
Update PROGRESS_LOG.md cumulatively.

New evidence:
[PASTE NEW EVIDENCE]

Current status:
[PASTE CURRENT STATUS]

Important:
Do not replace historical progress.
Do not create SQL.
Do not create DAX.
Do not perform Final Review.
Do not overclaim readiness.
Only add or revise progress log content based on evidence.

Output requirement:
Provide full ready-to-copy markdown or a downloadable .md file.
```

---

## 8.3 Current Status Update

```text
Use Arvizy Documentation Mode.

Task:
Update CURRENT_STATUS.md.

New status:
[PASTE NEW STATUS]

Evidence:
[PASTE EVIDENCE]

Important:
Do not create SQL.
Do not create DAX.
Do not perform Final Review.
Do not overclaim readiness.
Use conservative status wording if validation evidence is incomplete.

Output requirement:
Provide full ready-to-copy markdown or a downloadable .md file.
```

---

# 9. Final Review Templates

## 9.1 Commit Readiness Review

```text
Use Arvizy Final Review Mode.

Task:
Can we commit now?

Evidence:
git status:
[PASTE GIT STATUS]

git diff --stat:
[PASTE GIT DIFF --STAT]

Changed file list:
[PASTE CHANGED FILE LIST]

Validation result:
[PASTE VALIDATION RESULT OR SAY NOT APPLICABLE]

Documentation consistency check:
[PASTE CHECK RESULT]

Unresolved blocker check:
[PASTE CHECK RESULT]

Important:
Do not create SQL.
Do not create DAX.
Do not update documentation.
Do not approve commit readiness without evidence.
Only perform Final Review based on the provided evidence.

Output requirement:
Follow Arvizy Final Review Output Format.
```

---

## 9.2 Commit Readiness Without Evidence Test

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

Output requirement:
Follow Arvizy Final Review Output Format.
```

---

## 9.3 Phase Approval Review

```text
Use Arvizy Final Review Mode.

Task:
Can we approve [PHASE NAME]?

Evidence:
[PASTE FULL EVIDENCE PACKAGE]

Important:
Do not create SQL.
Do not create DAX.
Do not update documentation.
Do not approve phase readiness without evidence.
Only perform Final Review based on the provided evidence.

Required evidence:
- validation result
- changed file list if applicable
- documentation consistency check
- unresolved blocker check
- final status proposal

Output requirement:
Follow Arvizy Final Review Output Format.
```

---

# 10. Phase Handover Templates

## 10.1 Handover to New Chat

```text
Use Arvizy Phase Handover Protocol.

Task:
Prepare handover to a new chat.

Project:
[PROJECT NAME]

Current phase:
[CURRENT PHASE]

Latest completed work:
[PASTE COMPLETED WORK]

Current status:
[PASTE CURRENT STATUS]

Known blockers:
[PASTE BLOCKERS OR NONE]

Next safe step:
[PASTE NEXT STEP]

Important:
Do not create SQL.
Do not create DAX.
Do not update implementation files.
Do not overclaim readiness.
Preserve purpose, progress, planning, structure, decisions, blockers, and next steps.

Output requirement:
Follow Arvizy Phase Handover Output Format.
```

---

## 10.2 Agent-to-Agent Handover

```text
Use Arvizy Phase Handover Protocol.

Task:
Prepare handover from [CURRENT AGENT] to [NEXT AGENT].

Current agent output:
[PASTE CURRENT AGENT OUTPUT]

Decision:
[PASTE DECISION]

Risk level:
[PASTE RISK LEVEL]

Required next evidence:
[PASTE REQUIRED EVIDENCE]

Important:
Do not perform the next agent's task.
Only prepare clean handover.

Output requirement:
Follow Arvizy Phase Handover Output Format.
```

---

# 11. Git Evidence Collection Prompt

Use this prompt when you need to collect evidence before Final Review.

```text
I need to prepare evidence for Arvizy Final Review.

Please ask me for or help me collect:

1. git status
2. git diff --stat
3. changed file list
4. validation result if technical logic changed
5. documentation consistency check
6. unresolved blocker check
7. sensitive data / credential check

Do not approve commit readiness yet.
Only prepare the evidence package.
```

---

# 12. Recommended Daily Workflow

## 12.1 For Unknown Requests

```text
Router Mode
→ correct specialist agent
→ validator if evidence exists
→ documentation if needed
→ final review before approval / commit
```

## 12.2 For SQL Work

```text
SQL Optimizer Mode
→ SQL Validator Mode
→ Documentation Mode if status changes
→ Final Review Mode before commit
```

## 12.3 For DAX / Measure Work

```text
DAX / Measure Optimizer Mode
→ SQL Validator Mode if reconciliation is needed
→ Documentation Mode if status changes
→ Final Review Mode before commit
```

## 12.4 For .bim / Semantic Model Review

```text
DAX / Measure Optimizer Mode with semantic model review
→ SQL Validator Mode for grain/key/reconciliation validation
→ Documentation Mode if review record/status update is needed
→ Final Review Mode before approval
```

## 12.5 For Documentation Work

```text
Documentation Mode
→ Final Review Mode before commit if files changed
```

---

# 13. Status

```text
Status:
ACTIVE

Applies to:
Arvizy controlled daily usage

Framework phase:
Phase 8 — Regression Testing / Controlled Usage Expansion
```
