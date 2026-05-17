# Decision Log — finance_ops_dev

## 1. Purpose

This file records locked or important project decisions for the `finance_ops_dev` project profile.

The decision log helps Arvizy agents avoid repeating old discussions, contradicting established rules, or changing project direction without evidence.

Each decision should include:

- decision
- reason
- impact
- reversal condition

---

## 2. Decision Status Labels

Use these labels:

```text
ACTIVE
SUPERSEDED
NEEDS REVIEW
BLOCKED
```

Definitions:

| Status | Meaning |
|---|---|
| ACTIVE | Current decision still applies |
| SUPERSEDED | Decision has been replaced by a newer decision |
| NEEDS REVIEW | Decision may be stale or requires validation |
| BLOCKED | Decision cannot be applied due to known issue |

---

## 3. Locked Decisions

### Decision 001 — Use Arvizy as Separate Project

Status:

```text
ACTIVE
```

Decision:

```text
Arvizy will be developed as a separate public repository/project, while finance_ops_dev will be used as the first project profile and case study.
```

Reason:

- Arvizy should be reusable for dashboard projects beyond finance_ops_dev.
- finance_ops_dev should remain focused as the dashboard project.
- Separation reduces clutter and improves framework reusability.

Impact:

- Arvizy contains Core OS, agent modes, templates, and project profiles.
- finance_ops_dev remains the target project being reviewed.
- Arvizy can later support other dashboard profiles.

Reversal condition:

```text
Only change if Arvizy becomes tightly coupled to finance_ops_dev and can no longer be reused.
```

---

### Decision 002 — Separate Core OS from Project Profile

Status:

```text
ACTIVE
```

Decision:

```text
Reusable optimizer rules must live in Core OS and Agent Modes, while finance_ops_dev-specific context must live in the finance_ops_dev project profile.
```

Reason:

- Prevents Arvizy from becoming a one-project-only framework.
- Allows the optimizer workflow to be reused for other BI dashboards.

Impact:

- Core OS should avoid hardcoding finance_ops_dev assumptions.
- Project-specific table names, business rules, and validation memory must be stored in `03_project_profiles/finance_ops_dev/`.

Reversal condition:

```text
None planned.
```

---

### Decision 003 — Use Curated Reporting Objects for Power BI

Status:

```text
ACTIVE
```

Decision:

```text
Power BI should consume curated mart/reporting objects, not raw or uncontrolled source tables, unless explicitly required for admin/debug purposes.
```

Reason:

- Reduces semantic model clutter.
- Improves performance and clarity.
- Reduces DAX compensation for poor upstream shaping.
- Supports executive-to-operational dashboard flow.

Impact:

- SQL mart/reporting layer must be shaped for BI consumption.
- Raw/core layer should not become default main PBIX data source.
- Arvizy should flag direct raw table usage as risk unless justified.

Reversal condition:

```text
Allowed only if a specific admin/debug page requires raw/core visibility and the purpose is documented.
```

---

### Decision 004 — Control Tables Should Stay Disconnected

Status:

```text
ACTIVE
```

Decision:

```text
Control/reconciliation tables should remain disconnected in the Power BI semantic model unless explicit justification exists.
```

Reason:

- Control tables are used for validation and reconciliation.
- Direct relationships may distort filter context.
- Disconnected control tables keep reconciliation logic explicit.

Impact:

- Arvizy must flag control table relationships as implementation drift unless justified.
- DAX reconciliation should not assume control table relationships.

Reversal condition:

```text
Allowed only after semantic model review and explicit validation.
```

---

### Decision 005 — Avoid Fact-to-Fact Relationships

Status:

```text
ACTIVE
```

Decision:

```text
Power BI model should avoid direct fact-to-fact relationships unless explicitly justified.
```

Reason:

- Fact-to-fact relationships often create ambiguous filter paths.
- Shared dimensions are safer and easier to explain.

Impact:

- Arvizy must flag direct fact-to-fact relationship as model risk.
- Semantic model should use dimensions as relationship drivers.

Reversal condition:

```text
Allowed only if no dimensional alternative exists and validation confirms correct behavior.
```

---

### Decision 006 — Avoid Bidirectional Filters by Default

Status:

```text
ACTIVE
```

Decision:

```text
Bidirectional filters should not be used by default.
```

Reason:

- Bidirectional filters can create ambiguous or unexpected filter behavior.
- They make dashboard logic harder to explain and validate.

Impact:

- Arvizy should flag bidirectional filtering as risk.
- Single-direction filtering is default unless justified.

Reversal condition:

```text
Allowed only with explicit reason, relationship validation, and visual behavior check.
```

---

### Decision 007 — Canonical DAX Measures Only

Status:

```text
ACTIVE
```

Decision:

```text
DAX should use canonical reusable measures rather than duplicate visual-specific measures.
```

Reason:

- Reduces measure bloat.
- Improves maintainability.
- Prevents inconsistent KPI logic.
- Encourages relationship-driven slicing.

Impact:

- By-PIC, by-customer, and by-division duplicate measures should be rejected when a base measure and dimension slicing are enough.

Reversal condition:

```text
Allowed only when a visual-specific measure has a distinct calculation behavior that cannot be handled by filter context.
```

---

### Decision 008 — Existing Measure First

Status:

```text
ACTIVE
```

Decision:

```text
Before creating a new DAX measure, check existing measures first.
```

Reason:

- Prevents redundant measures.
- Maintains semantic model discipline.
- Reduces future refactor workload.

Impact:

- If existing measure list is missing, DAX output must be marked `NEEDS REVIEW` or draft.

Reversal condition:

```text
None planned.
```

---

### Decision 009 — Movement Trend Requires Sufficient Snapshot Dates

Status:

```text
ACTIVE
```

Decision:

```text
Full movement/trend analysis should not be approved unless there are enough snapshot dates to make movement meaningful.
```

Reason:

- Movement logic requires at least multiple snapshot points.
- One snapshot date can validate structure but not real movement trend.

Impact:

- Use `PASS STRUCTURE ONLY` for movement structure when snapshot count is insufficient.
- Do not create full movement interpretation or trend narrative without enough data.

Reversal condition:

```text
When validation confirms enough distinct snapshot dates for movement analysis.
```

---

### Decision 010 — Progress Log Must Be Cumulative

Status:

```text
ACTIVE
```

Decision:

```text
Progress log must preserve historical progress and must not be replaced with latest-only update unless explicitly intended.
```

Reason:

- Prevents loss of project history.
- Supports handover between chats.
- Supports GitHub audit trail.

Impact:

- Documentation Agent must treat progress log as cumulative by default.
- Any latest-only summary must be clearly separated.

Reversal condition:

```text
None planned.
```

---

### Decision 011 — Validation Before Status Upgrade

Status:

```text
ACTIVE
```

Decision:

```text
Project or phase status must not be upgraded without validation evidence.
```

Reason:

- Prevents overclaiming.
- Keeps documentation aligned with reality.
- Ensures Final Review discipline.

Impact:

- `PASS`, `COMPLETED`, or `READY` cannot be used without evidence.
- Use `NEEDS REVIEW`, `PASS STRUCTURE ONLY`, or `APPROVED FOR IMPLEMENTATION` when evidence is partial.

Reversal condition:

```text
None planned.
```

---

### Decision 012 — Readability Over Compactness

Status:

```text
ACTIVE
```

Decision:

```text
SQL and documentation should prioritize readability and maintainability over compactness.
```

Reason:

- Project must be understandable and handover-ready.
- Output may be reviewed by DA/BI team or future user.
- Readable SQL is easier to validate.

Impact:

- Use clear CTEs.
- Use explicit calculation parentheses.
- Avoid overly compressed logic.
- Avoid clever SQL that is difficult to explain.

Reversal condition:

```text
None planned.
```

---

## 4. Decision Maintenance Rule

This decision log must be updated when:

- a project rule changes
- a blocked pattern is reversed
- a new validation policy is introduced
- a semantic model decision is locked
- a DAX naming rule is changed
- a phase changes status based on evidence

If a decision conflicts with direct validation evidence, apply the Arvizy Conflict Resolution Rules.

---

## 5. Status

```text
Status:
ACTIVE

Project Profile:
finance_ops_dev

Framework phase:
Phase 4 — Finance Ops Dev Project Profile Build
```
