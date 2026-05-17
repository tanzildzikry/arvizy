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