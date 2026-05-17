# Conflict Resolution Rules — Arvizy

## 1. Purpose

This document defines how Arvizy agents must handle conflicting information.

Conflicts can happen between:

- memory files
- documentation files
- validation outputs
- user-provided evidence
- project profiles
- old review records
- latest database results
- latest semantic model exports

Agents must resolve conflicts conservatively.

When evidence conflicts, Arvizy must avoid overclaiming.

---

## 2. Core Rule

If sources disagree, use the more conservative status.

Default rule:

```text
PASS loses to NEEDS REVIEW unless direct validation evidence proves PASS.
```

This prevents agents from approving work based on stale, incomplete, or conflicting documentation.

---

## 3. Source Priority

Use this source priority when resolving conflicts.

```text
1. Latest direct validation result
2. Latest SQL/database output
3. Latest semantic model export or .bim file
4. Latest explicit user-provided evidence
5. 00_validation_memory.md
6. 00_decision_log.md
7. Current status file
8. Progress log
9. Handover document
10. Latest review record
11. Older review records
12. General project memory
13. Agent memory or assumption
```

Higher priority sources override lower priority sources.

However, if the higher priority source is incomplete or ambiguous, mark the result as:

```text
NEEDS REVIEW
```

---

## 4. Status Conflict Rules

### PASS vs NEEDS REVIEW

If one source says:

```text
PASS
```

and another says:

```text
NEEDS REVIEW
```

Use:

```text
NEEDS REVIEW
```

unless direct validation evidence proves PASS.

---

### COMPLETED vs IN PROGRESS

If one source says:

```text
COMPLETED
```

and another says:

```text
IN PROGRESS
```

Use:

```text
IN PROGRESS
```

unless completion is supported by final review evidence.

---

### APPROVED vs BLOCKED

If one source says:

```text
APPROVED
```

and another says:

```text
BLOCKED
```

Use:

```text
BLOCKED
```

until the blocker is resolved and evidence is provided.

---

### PASS STRUCTURE ONLY vs PASS

If one source says:

```text
PASS STRUCTURE ONLY
```

and another says:

```text
PASS
```

Use:

```text
PASS STRUCTURE ONLY
```

unless implementation-level validation evidence exists.

---

## 5. Naming Conflict Rules

If naming registry conflicts with direct source evidence, such as:

- latest `.bim`
- latest SQL view definition
- latest `information_schema`
- latest user-provided schema output

then the direct source evidence takes priority.

The agent must mark the naming registry as possibly stale.

Use:

```text
NEEDS REVIEW
```

if final naming cannot be confirmed.

---

## 6. Validation Conflict Rules

If validation memory conflicts with actual validation output, use the actual validation output.

Example:

```text
00_validation_memory.md:
PASS

Actual SQL output:
Mismatch detected
```

Decision:

```text
FAILED VALIDATION
```

or:

```text
NEEDS REVISION
```

depending on severity.

---

## 7. Documentation Conflict Rules

If progress log, current status, and handover conflict, use the most conservative status.

Example:

```text
progress_log.md:
Phase 12 PASS

current_status.md:
Phase 12 NEEDS REVIEW

validation result:
PASS STRUCTURE ONLY
```

Decision:

```text
PASS STRUCTURE ONLY
```

and full phase status remains:

```text
NEEDS REVIEW
```

---

## 8. Time and Freshness Rules

Newer evidence is generally stronger than older evidence, but only if it is direct and relevant.

A newer document that repeats old assumptions is not stronger than an older direct validation result.

Use this priority:

```text
Direct evidence > newer summary
Validated output > undocumented memory
Current database result > old documentation
```

---

## 9. Project Profile Conflict Rules

If a Core OS rule conflicts with a Project Profile rule:

- Use Core OS for universal governance.
- Use Project Profile for project-specific context.
- Do not let a Project Profile bypass evidence requirements.
- Do not let a Project Profile bypass no-overclaim rules.
- Do not let a Project Profile bypass safety or validation rules.

Project Profile can specialize behavior, but cannot weaken validation discipline.

---

## 10. Agent Handover Conflict Rules

If previous agent handover conflicts with evidence, use evidence.

Previous agent handover is context, not proof.

The next agent must not blindly trust handover if:

- evidence is missing
- validation output is absent
- status is overclaimed
- source files conflict
- blocked patterns are ignored

Use:

```text
NEEDS REVIEW
```

when unresolved.

---

## 11. Final Review Conflict Rules

Final Review Agent must not approve if there are unresolved conflicts.

Final Review Agent must return:

```text
NEEDS REVIEW
```

or:

```text
BLOCKED
```

depending on severity.

Use `BLOCKED` when:

- a known blocked pattern exists
- validation failed
- requested approval would be unsafe
- business logic changed without evidence

Use `NEEDS REVIEW` when:

- evidence is incomplete
- status conflicts are unresolved
- required files are missing
- validation has not been run

---

## 12. Conflict Resolution Output Format

When resolving a conflict, agents must state:

```text
Conflict Detected:
[description]

Sources in Conflict:
- [source 1]
- [source 2]

Selected Status:
[status]

Reason:
[reason]

Required Next Step:
[next step]
```

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
