# Phase Handover Protocol — Arvizy

## 1. Purpose

Phase Handover Protocol defines how Arvizy preserves continuity across:

- agent modes
- project phases
- Git commits
- new chats
- working sessions
- dashboard review cycles

The goal is to prevent loss of context and avoid restarting analysis from zero.

---

## 2. Role

The Phase Handover Protocol is not a technical optimizer.

It is a continuity and transition protocol.

It ensures the next session or agent knows:

- what has been completed
- what was validated
- what remains unvalidated
- what is blocked
- what files matter
- what the next safe step is

---

## 3. When to Use

Use Phase Handover Protocol when:

- moving to a new phase
- opening a new chat
- completing a major review
- preparing a handover document
- committing a meaningful milestone
- switching from SQL to DAX work
- switching from technical work to documentation
- preserving current project state

---

## 4. Required Handover Content

Every phase handover should include:

- project name
- current phase
- latest completed phase
- current status
- current risk level
- completed work
- validation status
- unresolved blockers
- files changed
- source-of-truth files
- decisions locked
- next safe step
- files needed in next chat
- instructions for the next agent/session

---

## 5. Required Output Format

Use this format.

```text
## Phase Handover Output

### 1. Project

[Project name]

### 2. Current Phase

[Current phase]

### 3. Latest Completed Phase

[Latest completed phase]

### 4. Current Status

[IN PROGRESS / NEEDS REVIEW / APPROVED FOR IMPLEMENTATION / COMPLETED / BLOCKED]

### 5. Current Risk Level

[LOW / MEDIUM / HIGH]

### 6. Completed Work

- [completed item]
- [completed item]

### 7. Validation Status

- [validation status]
- [validation status]

### 8. Unresolved Blockers

- [blocker]
- [blocker]

If no blockers:
No blockers identified.

### 9. Files Changed

- [file]
- [file]

### 10. Source of Truth Files

- [file]
- [file]

### 11. Locked Decisions

- [decision]
- [decision]

### 12. Next Safe Step

- [next step]

### 13. Files Needed in Next Chat / Session

- [file]
- [file]

### 14. Handover Notes for Next Agent

- [note]
- [note]
```

---

## 6. Status Wording Rules

The protocol must not overclaim phase completion.

Use:

```text
COMPLETED
```

only when final evidence supports completion.

Use:

```text
APPROVED FOR IMPLEMENTATION
```

when design or structure is safe to implement but final validation is not complete.

Use:

```text
PASS STRUCTURE ONLY
```

when structure is valid but output or implementation is not fully validated.

Use:

```text
NEEDS REVIEW
```

when evidence is incomplete or unclear.

Use:

```text
BLOCKED
```

when known blockers prevent progress.

---

## 7. New Chat Minimum Context

For a new chat, provide at minimum:

- project memory
- current status
- progress log
- latest handover
- validation memory
- decision log
- naming registry
- relevant SQL/DAX/semantic model files
- latest review record

If these are unavailable, the new chat must be told that context is incomplete.

---

## 8. Cross-Agent Handover

When one agent hands over to another, include:

- mode used
- scope handled
- decision
- evidence
- blockers
- validation required
- next agent
- notes

Minimum format:

```text
Mode:
Task:
Sources Reviewed:
Decision:
Risk Level:
Key Findings:
Validation Required:
Files Affected:
Next Agent:
Notes:
```

---

## 9. Phase Transition Gate

Before moving to the next phase, check:

- previous phase completed or explicitly carried forward
- validation status documented
- blockers documented
- current status updated
- progress log updated
- handover prepared
- next phase objective defined

If any item is missing, use:

```text
NEEDS REVIEW
```

---

## 10. Commit Handover

After a commit, record:

- commit hash if available
- commit message
- files committed
- validation status
- next step

If commit hash is not available, record commit message and changed files only.

---

## 11. Handover Quality Rules

A good handover must be:

- concise but complete
- evidence-aware
- phase-aware
- file-aware
- blocker-aware
- usable by a new agent or new chat
- free of unsupported claims

A bad handover:

- only says "done"
- omits validation status
- omits blockers
- omits files changed
- says "ready" without evidence
- does not define next step

---

## 12. Status

```text
Status:
ACTIVE

Protocol:
Phase Handover Protocol

Framework phase:
Phase 3 — Agent Role Knowledge Build
```
