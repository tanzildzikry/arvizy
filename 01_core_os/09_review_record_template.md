# Review Record Template — Arvizy

## 1. Purpose

This document defines the standard review record format for Arvizy.

A review record preserves the outcome of an agent workflow so the decision, evidence, risk, blockers, and next steps remain traceable.

Review records are useful for:

- handover between chats
- handover between phases
- commit preparation
- audit trail
- debugging agent decisions
- preventing repeated discussion
- preserving validation evidence

---

## 2. File Naming Convention

Use this naming convention:

```text
YYYY_MM_DD_[project_name]_[topic]_review.md
```

Examples:

```text
2026_05_17_finance_ops_dev_phase_12_blueprint_review.md
2026_05_17_finance_ops_dev_sql_optimizer_review.md
2026_05_17_finance_ops_dev_dax_optimizer_review.md
2026_05_17_finance_ops_dev_final_review.md
```

---

## 3. Review Record Template

```md
# Review Record — [Project / Topic]

## 1. Review Metadata

| Field | Value |
|---|---|
| Review Date | YYYY-MM-DD |
| Project | [project_name] |
| Review Topic | [topic] |
| Workflow Type | LIGHT / STANDARD / FULL |
| Final Decision | APPROVED / APPROVED FOR IMPLEMENTATION / PASS STRUCTURE ONLY / NEEDS REVIEW / NEEDS REVISION / BLOCKED / FAILED VALIDATION |
| Risk Level | LOW / MEDIUM / HIGH |

---

## 2. Trigger / Task

[Describe the user request or trigger that started this review.]

---

## 3. Source Files Reviewed

- [file path]
- [file path]
- [evidence source]

If no source files were reviewed, write:

No source files reviewed.

---

## 4. Agent Sequence Used

1. [Agent Mode]
2. [Agent Mode]
3. [Agent Mode]

---

## 5. Findings by Agent

### 5.1 Router Agent

- [finding]
- [finding]

### 5.2 SQL Optimizer Agent

- [finding]
- [finding]

### 5.3 SQL Validator Agent

- [finding]
- [finding]

### 5.4 DAX Optimizer Agent

- [finding]
- [finding]

### 5.5 Documentation Agent

- [finding]
- [finding]

### 5.6 Final Review Agent

- [finding]
- [finding]

Remove unused sections if an agent was not used.

---

## 6. Validation Evidence

### Evidence Provided

- [evidence]
- [evidence]

### Evidence Missing

- [missing evidence]
- [missing evidence]

### Evidence Assessment

[Explain whether evidence is sufficient, incomplete, stale, or conflicting.]

---

## 7. Final Decision

```text
[Decision Label]
```

### Decision Reason

[Explain why this decision was made.]

---

## 8. Approved Items

- [approved item]
- [approved item]

If no items are approved, write:

No items approved.

---

## 9. Blocked Items

- [blocked item]
- [blocked item]

If no items are blocked, write:

No blocked items.

---

## 10. Required Next Step

- [next step]
- [next step]

---

## 11. Files Affected

- [file path]
- [file path]

If no files are affected, write:

No files affected.

---

## 12. Commit Suggestion

```text
[commit message]
```

If commit is not recommended, write:

```text
No commit recommended yet.
```

---

## 13. Notes for Future Handover

- [handover note]
- [handover note]
```

---

## 4. Decision Labels

Use only these decision labels:

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

## 5. Evidence Rules

A review record must not claim approval without evidence.

If evidence is incomplete, use:

```text
NEEDS REVIEW
```

If only structure has been checked, use:

```text
PASS STRUCTURE ONLY
```

If implementation is safe to begin but not validated, use:

```text
APPROVED FOR IMPLEMENTATION
```

---

## 6. Minimum Review Record for Light Workflow

For small reviews, this compact format is acceptable.

```md
# Review Record — [Topic]

## Metadata

| Field | Value |
|---|---|
| Date | YYYY-MM-DD |
| Project | [project_name] |
| Decision | [Decision Label] |
| Risk | LOW / MEDIUM / HIGH |

## Task

[Task summary]

## Sources Reviewed

- [source]

## Findings

- [finding]
- [finding]

## Evidence

- [evidence]

## Decision Reason

[reason]

## Next Step

- [next step]
```

---

## 7. Review Record Storage

Default folder:

```text
00_docs/review_records/
```

Project-specific examples may also be stored in:

```text
05_examples/
```

---

## 8. Status

```text
Status:
ACTIVE

Applies to:
All Arvizy review records

Framework phase:
Phase 2 — Core OS Knowledge Build
```
