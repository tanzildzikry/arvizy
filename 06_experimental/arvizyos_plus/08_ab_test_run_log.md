# ArvizyOS+ A/B Test Run Log

## Purpose

Document controlled A/B testing between baseline **ArvizyOS** and experimental **ArvizyOS+**.

## Test Principle

- Same or equivalent prompt is tested against both agents.
- Same evidence condition is preserved.
- No agent is allowed to claim PASS / READY / APPROVED without evidence.
- ArvizyOS is treated as the stable governance baseline.
- ArvizyOS+ is evaluated as the BI architecture-enhanced candidate.

---

## Summary Result

| Test | Topic | ArvizyOS Score | ArvizyOS+ Score | Result |
|---|---|---:|---:|---|
| Test 1 | Semantic Model Readiness | 40 / 50 | 49 / 50 | ArvizyOS+ wins |
| Test 2 | Open BC Count by PIC | 43 / 50 | 50 / 50 | ArvizyOS+ wins |
| Test 3 | General BI Dashboard Readiness | 44 / 50 | 49 / 50 | ArvizyOS+ wins |
| Test 4 | SQL vs DAX Responsibility | 47 / 50 | 49 / 50 | ArvizyOS+ wins |
| Test 5 | Power BI Relationship Risk | 48 / 50 | 50 / 50 | ArvizyOS+ wins |

## Total Score

| Agent | Total Score | Result |
|---|---:|---|
| ArvizyOS | 222 / 250 | Strong governance baseline |
| ArvizyOS+ | 247 / 250 | Strong BI architecture candidate |

---

## Test 1 — Semantic Model Readiness

- Prompt focus: Review Phase 12 semantic model readiness for `finance_ops_dev` with missing model evidence.
- Evidence condition:
  - No `.bim` provided.
  - No relationship screenshot provided.
  - No validation query result provided.
  - No changed file list provided.
- Result:
  - ArvizyOS: 40 / 50
  - ArvizyOS+: 49 / 50
- Key finding:
  - ArvizyOS+ identified semantic model, relationship, grain, DAX dependency, KPI reconciliation, and implementation-readiness gaps more explicitly.

---

## Test 2 — Open BC Count by PIC

- Prompt focus: Review whether a separate measure named `Open BC Count by PIC` should be created.
- Evidence condition:
  - Existing measure inventory not provided.
  - Semantic model / relationship evidence not provided.
  - Dim_PIC expected to slice PIC-level visuals.
- Result:
  - ArvizyOS: 43 / 50
  - ArvizyOS+: 50 / 50
- Key finding:
  - ArvizyOS+ was stronger in detecting COUNTROWS vs DISTINCTCOUNT risk, visual behavior requirements, orphan row risk, and SQL/control reconciliation requirement.

---

## Test 3 — General BI Dashboard Readiness

- Prompt focus: General review of BI dashboard readiness across data structure, Power BI model, relationship, measure, and reporting usage.
- Evidence condition:
  - SQL reporting layer exists structurally.
  - No `.bim`.
  - No relationship screenshot.
  - No final measure list.
  - No Power BI vs SQL reconciliation.
  - No changed file list.
- Result:
  - ArvizyOS: 44 / 50
  - ArvizyOS+: 49 / 50
- Key finding:
  - ArvizyOS+ was more sensitive to architecture-layer risks without weakening evidence discipline.

---

## Test 4 — SQL vs DAX Responsibility

- Prompt focus: Classify which logic belongs in SQL and which belongs in DAX.
- Evidence condition:
  - No final measure list.
  - No semantic model export.
  - No performance test.
  - Aging bucket, risk level, backlog inflow/outflow, UMK released/issued, and document completeness are already in or planned for SQL.
- Result:
  - ArvizyOS: 47 / 50
  - ArvizyOS+: 49 / 50
- Key finding:
  - ArvizyOS+ better separated SQL/mart/snapshot, semantic model, DAX, visual behavior, reconciliation, and performance responsibilities.

---

## Test 5 — Power BI Relationship Risk

- Prompt focus: Review relationship risk for PIC, customer, date, and backlog movement.
- Evidence condition:
  - No relationship screenshot.
  - No `.bim`.
  - No key uniqueness check.
  - No orphan row validation.
  - No grain definition for each table.
- Result:
  - ArvizyOS: 48 / 50
  - ArvizyOS+: 50 / 50
- Key finding:
  - ArvizyOS+ produced a stronger relationship validation package, including model evidence, grain validation, key validation, relationship validation, visual behavior validation, and reconciliation validation.

---

## Overall Finding

ArvizyOS+ won **5 out of 5** A/B tests.

ArvizyOS baseline remains a strong governance agent, but ArvizyOS+ is better suited for:

- BI solution architecture
- SQL mart design
- Semantic model design
- Relationship risk detection
- DAX evaluation-context review
- Power BI implementation audit
- Performance and architecture readiness review

---

## Failure Pattern Review

No critical failure pattern detected.

Observed result:

- No false PASS.
- No unsupported READY.
- No SQL created when SQL creation was forbidden.
- No DAX created when DAX creation was forbidden.
- Evidence policy remained intact.
- Architecture awareness improved.
- Output remained operationally usable.

---

## Current Recommendation

Promote ArvizyOS+ to:

```text
DEFAULT FOR BI ARCHITECTURE WORKFLOW
```

Keep ArvizyOS baseline as:

```text
STABLE GOVERNANCE BASELINE / FALLBACK
```
