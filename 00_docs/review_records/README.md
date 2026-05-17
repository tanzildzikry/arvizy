# Review Records â€” Arvizy

## 1. Purpose

This folder stores review records generated during Arvizy workflow execution.

Review records preserve decisions, evidence, risks, blockers, and next steps.

They help maintain continuity across:

- agent modes
- project phases
- working sessions
- Git commits
- dashboard review cycles
- new ChatGPT conversations

---

## 2. When to Create a Review Record

Create a review record when the workflow performs any of the following:

- SQL optimizer review
- SQL validation review
- measure optimizer review
- semantic model review
- dashboard blueprint review
- documentation update review
- final review before commit
- phase transition
- important blocked decision
- important approval decision

---

## 3. Naming Convention

Use this naming format:

```text
YYYY_MM_DD_[project]_[topic]_review.md
```

Examples:

```text
2026_05_17_finance_ops_dev_phase_12_blueprint_review.md
2026_05_17_finance_ops_dev_sql_optimizer_review.md
2026_05_17_finance_ops_dev_measure_optimizer_review.md
2026_05_17_finance_ops_dev_final_review.md
```

---

## 4. Required Sections

Each review record should include:

```text
1. Review Metadata
2. Trigger / Task
3. Source Files Reviewed
4. Agent Sequence Used
5. Findings by Agent
6. Validation Evidence
7. Final Decision
8. Approved Items
9. Blocked Items
10. Required Next Step
11. Commit Suggestion
```

---

## 5. Decision Labels

Use only the approved Arvizy decision labels:

```text
APPROVED
APPROVED FOR IMPLEMENTATION
PASS STRUCTURE ONLY
NEEDS REVIEW
NEEDS REVISION
BLOCKED
FAILED VALIDATION
```

---

## 6. Evidence Rule

A review record must not claim approval without evidence.

Valid evidence may include:

- SQL validation output
- database query output
- semantic model export
- `semantic model export` structure
- Git diff/stat
- BI platform relationship screenshot
- KPI reconciliation result
- explicit user-provided validation result

If evidence is incomplete, use:

```text
NEEDS REVIEW
```

---

## 7. Review Record Template

Use the template stored in:

```text
04_templates/review_record_template.md
```

or the Core OS template:

```text
01_core_os/09_review_record_template.md
```

---

## 8. Current Status

```text
Status:
ACTIVE

Current Usage:
Manual review record creation

Automation:
Not yet implemented
```



