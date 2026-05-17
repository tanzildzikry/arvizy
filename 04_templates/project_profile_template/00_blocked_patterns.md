# Blocked Patterns â€” [project_name]

## 1. Purpose

This file defines patterns that Arvizy agents must block, flag, or require revision for the `[project_name]` project profile.

Blocked patterns prevent:

- overclaiming
- model drift
- logic redundancy
- unsafe validation assumptions
- documentation loss
- dashboard logic inconsistency

---

## 2. Decision Labels for Blocked Patterns

Use these labels:

```text
NEEDS REVIEW
NEEDS REVISION
BLOCKED
FAILED VALIDATION
```

---

## 3. Blocked SQL / Data Patterns

### SQL-BLOCK-001 â€” [Pattern Name]

Pattern:

```text
[blocked pattern]
```

Decision:

```text
NEEDS REVIEW / NEEDS REVISION / BLOCKED
```

Reason:

[reason]

Expected:

```text
[expected pattern]
```

---

## 4. Blocked Measure / Measure Logic Patterns

### MEASURE-BLOCK-001 â€” [Pattern Name]

Pattern:

```text
[blocked pattern]
```

Decision:

```text
NEEDS REVIEW / NEEDS REVISION / BLOCKED
```

Reason:

[reason]

Expected:

```text
[expected pattern]
```

---

## 5. Blocked Semantic Model Patterns

### MODEL-BLOCK-001 â€” [Pattern Name]

Pattern:

```text
[blocked pattern]
```

Decision:

```text
NEEDS REVIEW / NEEDS REVISION / BLOCKED
```

Reason:

[reason]

Expected:

```text
[expected pattern]
```

---

## 6. Blocked Documentation Patterns

### DOC-BLOCK-001 â€” Overclaiming Status

Pattern:

```text
Writing PASS, READY, COMPLETED, or VALIDATED without evidence.
```

Decision:

```text
BLOCKED
```

Expected:

```text
Use NEEDS REVIEW, PASS STRUCTURE ONLY, or APPROVED FOR IMPLEMENTATION when evidence is partial.
```

---

### DOC-BLOCK-002 â€” Losing Historical Progress

Pattern:

```text
Replacing cumulative progress history with latest-only update.
```

Decision:

```text
BLOCKED
```

Expected:

```text
Progress log should remain cumulative unless explicitly designed otherwise.
```

---

## 7. Blocked Final Review Patterns

### FINAL-BLOCK-001 â€” Approval Without Evidence

Pattern:

```text
Approving without required evidence.
```

Decision:

```text
BLOCKED
```

Expected:

```text
Final Review requires evidence before approval.
```

---

## 8. Data Safety Patterns

### DATA-BLOCK-001 â€” Sensitive Data Exposure

Pattern:

```text
Uploading or committing real sensitive data or credentials.
```

Decision:

```text
BLOCKED
```

---

## 9. Status

```text
Status:
DRAFT

Project Profile:
[project_name]
```



