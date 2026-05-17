# Dashboard Optimizer OS — Build Roadmap

This document defines the step-by-step roadmap to build a reusable **Dashboard Optimizer OS** with a dedicated **Finance Ops Dev Project Profile**.

The goal is to create an agent workflow that can support SQL optimization, SQL validation, DAX optimization, documentation updates, final review, and phase handover without losing context or quality across sessions.

---

## Target Architecture

```text
Dashboard Optimizer OS
+
Project-Specific Profile
```

The framework must support two layers:

```text
1. Universal Optimizer Operating System
   - reusable across dashboard projects

2. Project-Specific Knowledge Layer
   - customized for finance_ops_dev or any other dashboard project
```

---

# Phase 0 — Lock Concept & Scope

## Objective

Ensure the agent system is not limited to `finance_ops_dev`, but can also be reused for other dashboard projects.

## Key Steps

- Define the framework name:
  - `dashboard_optimizer_os`

- Separate the system into two main layers:
  - **Core OS**
    - universal optimizer rules
    - reusable workflow logic
    - general review and validation principles
  - **Project Profile**
    - project-specific context
    - business definitions
    - naming registry
    - validation memory
    - dashboard-specific decisions

- Define the main agents:
  - Router Agent
  - SQL Optimizer Agent
  - SQL Validator Agent
  - DAX Optimizer Agent
  - Documentation Agent
  - Final Review Agent

- Lock the core principles:
  - Optimizer must not overclaim.
  - Optimizer must not change business logic without validation.
  - Optimizer must produce clear handover output.
  - Optimizer must support reuse across dashboard projects by replacing the project profile.
  - Optimizer must prioritize clarity, stability, validation, and maintainability over unnecessary complexity.

## Output

```text
Concept locked:
Dashboard Optimizer OS = reusable framework
Finance Ops Dev = first project profile
```

---

# Phase 1 — Create Folder Structure

## Objective

Create a clean, reusable folder structure for the operating system, agents, project profiles, and review records.

## Folder Structure

```text
dashboard_optimizer_os/
│
├── core_os/
│   ├── 00_master_agent_workflow.md
│   ├── 07_router_mode.md
│   ├── 08_agent_output_contract.md
│   ├── 09_review_record_template.md
│   ├── 10_agent_test_scenarios.md
│   ├── 11_conflict_resolution_rules.md
│   └── 12_evidence_policy.md
│
├── agents/
│   ├── 01_sql_optimizer_mode.md
│   ├── 02_sql_validator_mode.md
│   ├── 03_dax_optimizer_mode.md
│   ├── 04_documentation_mode.md
│   ├── 05_final_review_mode.md
│   └── 06_phase_handover_protocol.md
│
├── project_profiles/
│   └── finance_ops_dev/
│       ├── 00_project_memory.md
│       ├── 00_decision_log.md
│       ├── 00_validation_memory.md
│       ├── 00_blocked_patterns.md
│       ├── 00_naming_registry.md
│       ├── 13_powerbi_implementation_drift_checklist.md
│       ├── semantic_model_profile.md
│       └── dashboard_blueprint_profile.md
│
└── review_records/
```

## Output

```text
Folder structure ready.
```

---

# Phase 2 — Build Core OS Knowledge

## Objective

Create the universal operating system layer that can be reused across dashboard projects.

---

## 2.1 `00_master_agent_workflow.md`

### Purpose

Define the master contract for all agents.

### Required Content

- Overall workflow purpose
- Agent sequence
- Role boundary
- Validation gate
- Approval gate
- Anti-overengineering rule
- SQL vs DAX vs visual layer responsibility
- Decision status rules:
  - `APPROVED`
  - `NEEDS REVIEW`
  - `BLOCKED`
- No-overclaim rule
- Cross-agent handover rule
- Requirement to preserve evidence before approving

---

## 2.2 `07_router_mode.md`

### Purpose

Decide which agent mode should handle a user request.

### Required Content

- User request classification
- When to use SQL Optimizer
- When to use SQL Validator
- When to use DAX Optimizer
- When to use Documentation Agent
- When to use Final Review Agent
- Workflow intensity classification:
  - Light
  - Standard
  - Full

### Workflow Intensity Rule

```text
LIGHT:
- one file
- no business logic change
- no SQL/DAX logic change

STANDARD:
- one layer affected
- needs validation or documentation

FULL:
- cross-layer impact
- SQL + DAX + documentation
- phase transition
- pre-commit review
```

---

## 2.3 `08_agent_output_contract.md`

### Purpose

Standardize output format across all agents.

### Required Content

Every agent output must include:

- Mode
- Task Scope
- Source Reviewed
- Key Findings
- Decision
- Risk Level
- Blockers
- Required Validation
- Files Affected
- Handover to Next Agent

### Output Decision Values

```text
APPROVED
APPROVED FOR IMPLEMENTATION
NEEDS REVIEW
NEEDS REVISION
BLOCKED
```

---

## 2.4 `09_review_record_template.md`

### Purpose

Create a consistent format for every review record.

### Required Content

- Review metadata
- Trigger / task
- Source files reviewed
- Agent sequence used
- Findings by agent
- Validation evidence
- Final decision
- Blocked items
- Approved items
- Required next step
- Commit suggestion

---

## 2.5 `10_agent_test_scenarios.md`

### Purpose

Test whether agents follow the workflow rules.

### Required Content

- SQL Optimizer test cases
- SQL Validator test cases
- DAX Optimizer test cases
- Documentation Agent test cases
- Final Review Agent test cases
- Router Agent test cases
- Expected behavior
- Fail condition

### Example Test Case

```text
Scenario:
User asks DAX Optimizer to create [Open BC Count by PIC].

Expected:
Agent must reject duplicate by-PIC measure because slicing should be handled through Dim_PIC relationship.

Correct output:
Use [Current Open BC Count] with Dim_PIC[pic_internal] on the visual axis.
```

---

## 2.6 `11_conflict_resolution_rules.md`

### Purpose

Define what happens when two documents or validation records disagree.

### Required Content

- Source-of-truth priority
- Rule for conflicting statuses
- Conservative decision rule
- Rule that `PASS` loses to `NEEDS REVIEW` unless evidence proves PASS
- Rule that validation output is stronger than old memory

### Recommended Source Priority

```text
1. Latest direct validation result
2. Latest SQL/database output
3. Latest .bim / semantic model export
4. 00_validation_memory.md
5. 00_decision_log.md
6. current_status.md
7. progress_log.md
8. handover_to_new_chat_v2.md
9. older review_records
```

---

## 2.7 `12_evidence_policy.md`

### Purpose

Prevent agents from approving or claiming validation without evidence.

### Valid Evidence Types

- Direct SQL output
- `information_schema` result
- Latest `.bim` structure
- Explicit user-provided validation result
- Git diff/stat
- Existing documentation with date/context
- Power BI relationship screenshot or exported semantic model
- KPI card reconciliation output

### Insufficient Evidence

- Assumption
- Memory only
- Old handover only
- “Likely correct”
- Output not backed by validation
- Unverified claim from previous chat

## Output

```text
Core OS ready.
Reusable for other dashboard projects.
```

---

# Phase 3 — Build Agent Role Knowledge

## Objective

Create role-specific agent instructions so each agent has a clear mandate and does not interfere with other agents.

---

## 3.1 `01_sql_optimizer_mode.md`

### Purpose

Define the SQL Optimizer Agent.

### Required Content

- SQL Optimizer role
- Allowed actions
- Forbidden actions
- SQL readability rules
- SQL performance rules
- SQL layer responsibility
- BI consumption readiness rules
- Validation requirement
- PostgreSQL preference if the project profile uses PostgreSQL
- Output format for SQL review

### Core Rules

- Do not create DAX.
- Do not update documentation unless explicitly asked.
- Do not change business logic silently.
- Do not reference nonexistent columns.
- Do not use deprecated names if the naming registry says they are invalid.
- Always include validation requirements.
- Prefer readable, stable SQL over overly compact SQL.

---

## 3.2 `02_sql_validator_mode.md`

### Purpose

Define the SQL Validator Agent.

### Required Content

- SQL Validator role
- `PASS / REVIEW / FAIL` rule
- Grain validation
- Reconciliation validation
- Duplicate key validation
- Orphan key validation
- Row count validation
- Movement/snapshot validation
- No approval without evidence

### Core Rules

- Do not optimize SQL unless validation query itself needs adjustment.
- Do not approve without validation output.
- If evidence is incomplete, return `NEEDS REVIEW`.
- If validation fails, return `FAIL` and explain the failed control.

---

## 3.3 `03_dax_optimizer_mode.md`

### Purpose

Define the DAX Optimizer Agent.

### Required Content

- DAX Optimizer role
- Existing measure first rule
- No duplicate measure rule
- Base measure vs derived measure rule
- Filter context review
- Relationship-driven slicing
- Display measure rule
- DAX performance check
- SQL reconciliation reference

### Core Rules

- Check existing measure before creating new measure.
- Do not create by-PIC, by-customer, or by-division duplicate measures when relationships already support slicing.
- Do not recreate SQL business shaping logic in DAX unless justified.
- Keep DAX canonical.
- Provide full copy-paste-ready DAX only when needed.
- Include visual mapping if a measure is intended for dashboard use.

---

## 3.4 `04_documentation_mode.md`

### Purpose

Define the Documentation Agent.

### Required Content

- Documentation Agent role
- Cumulative progress log rule
- Current status update rule
- Handover update rule
- Review record writing rule
- No-overclaim rule
- Commit message suggestion rule

### Core Rules

- Do not replace cumulative history with only latest update.
- Do not claim `PASS` unless validation evidence supports it.
- Preserve phase status accurately.
- Keep documentation operational, not decorative.
- Make docs useful for handover into a new chat or new working session.

---

## 3.5 `05_final_review_mode.md`

### Purpose

Define the Final Review Agent.

### Required Content

- Final Reviewer role
- Approval rule
- Block rule
- Evidence checklist
- Validation check
- Documentation consistency check
- Git diff/stat requirement
- Final decision format

### Core Rules

- Do not create new features.
- Do not generate new SQL/DAX except minor correction if explicitly needed.
- Do not approve without evidence.
- Block if validation, documentation, or naming consistency is unclear.
- Provide commit message only after changed files and status are known.

---

## 3.6 `06_phase_handover_protocol.md`

### Purpose

Define handover rules between agents, phases, and chats.

### Required Content

- Handover between agents
- Handover between phases
- Minimum files for a new chat
- Minimum evidence for phase transition
- How to resume without losing context
- What must be included before moving to the next phase

### Required Handover Format

```text
## Agent Output Handover

Mode:
[Agent Mode]

Task:
[Task Summary]

Sources Reviewed:
- [File / evidence]

Decision:
APPROVED / NEEDS REVIEW / BLOCKED

Risk Level:
LOW / MEDIUM / HIGH

Key Findings:
- ...

Validation Required:
- ...

Files Affected:
- ...

Next Agent:
[Next Mode]

Notes:
- ...
```

## Output

```text
All 6 agent role files ready.
```

---

# Phase 4 — Build Finance Ops Dev Project Profile

## Objective

Create a project-specific profile for the current Finance Ops Dev dashboard project.

---

## 4.1 `00_project_memory.md`

### Required Content

- Project name:
  - `finance_ops_dev`
- Dashboard purpose:
  - executive overview
  - management monitoring
  - daily operation
- Business pillars:
  - Unbilled
  - Outstanding
  - UMK
- Architecture:
  - PostgreSQL
  - SQL mart
  - Power BI semantic model
  - dashboard layer
- Current phase:
  - Phase 12 Semantic Model / Power BI readiness
- Dashboard style:
  - clean corporate
  - minimal
  - narrative-driven
  - executive-to-operational layering

---

## 4.2 `00_decision_log.md`

### Required Content

- Locked decisions
- Decision date
- Reason
- Impact
- Reversal condition

### Example Decisions

- Power BI should consume curated reporting views.
- Raw tables should not be loaded into the main PBIX.
- Control tables must stay disconnected.
- DAX must not create duplicate by-PIC/by-customer measures if dimensions already support slicing.
- Movement full trend is blocked until enough snapshot dates exist.
- `progress_log.md` must be cumulative.

---

## 4.3 `00_validation_memory.md`

### Required Content

- Latest validation status
- SQL reporting layer status
- Movement readiness status
- PBIX validation status
- KPI reconciliation status
- Current blocked items
- Validation ID references
- Recheck condition

---

## 4.4 `00_blocked_patterns.md`

### Required Content

- Blocked SQL patterns
- Blocked DAX patterns
- Blocked documentation claims
- Blocked Power BI relationship patterns
- Blocked phase approval patterns

### Example Blocked Patterns

- Using `public` schema when project uses controlled schemas.
- Loading raw tables directly into main PBIX.
- Creating fact-to-fact relationships.
- Creating control table relationships.
- Creating bidirectional filters without explicit approval.
- Creating duplicate visual-specific DAX measures.
- Writing `Phase PASS` when only structure-level validation passed.

---

## 4.5 `00_naming_registry.md`

### Required Content

- Approved schema names
- Approved SQL view names
- Approved table names
- Approved column names
- Approved DAX measure naming rules
- Deprecated names
- Freshness rule

### Freshness Rule

```text
If naming registry conflicts with latest .bim, latest SQL view definition, or latest information_schema output, mark NEEDS REVIEW and use the most recent direct evidence.
```

---

## 4.6 `13_powerbi_implementation_drift_checklist.md`

### Required Content

- Loaded table check
- Relationship check
- Control table disconnected check
- Filter direction check
- Fact-to-fact relationship block
- Many-to-many relationship warning
- KPI card reconciliation
- DAX naming check
- Visual mapping check

---

## 4.7 `semantic_model_profile.md`

### Required Content

- Approved fact tables
- Approved dimension tables
- Approved control tables
- Relationship matrix
- Inactive relationship rule
- Semantic model grain
- Measure container rule

---

## 4.8 `dashboard_blueprint_profile.md`

### Required Content

- Dashboard pages
- Visual intent per page
- Slicer policy
- Executive vs analytical vs operational flow
- Narrative objective
- Clean corporate design rule
- Page-level KPI mapping

## Output

```text
Finance Ops Dev profile ready.
```

---

# Phase 5 — Create Review Record System

## Objective

Ensure every important review is recorded and reusable for future handover.

## Folder

```text
review_records/
```

## Naming Convention

```text
review_records/
├── YYYY_MM_DD_phase_12_blueprint_review.md
├── YYYY_MM_DD_sql_optimizer_review.md
├── YYYY_MM_DD_dax_optimizer_review.md
├── YYYY_MM_DD_documentation_review.md
├── YYYY_MM_DD_final_review.md
```

## Each Review Record Must Include

- Task
- Source reviewed
- Agent used
- Findings
- Validation evidence
- Decision
- Risk
- Approved items
- Blocked items
- Next step
- Commit suggestion

## Output

```text
Review record system ready.
```

---

# Phase 6 — Simulate Agent Workflow

## Objective

Test whether the agent workflow behaves according to design before using it on real work.

---

## Test 1 — SQL Optimizer

### Input

```text
Review SQL mart readiness for Power BI semantic model.
```

### Expected Output

- Findings
- Risk level
- Recommended SQL only if needed
- Validation required
- Handover to SQL Validator

---

## Test 2 — SQL Validator

### Input

```text
Validate SQL Optimizer output.
```

### Expected Output

- Validation query
- `PASS / REVIEW / FAIL`
- Evidence required
- Blocker if output evidence is missing

---

## Test 3 — DAX Optimizer

### Input

```text
Create Open BC Count by PIC.
```

### Expected Output

- Reject duplicate by-PIC measure
- Recommend base measure + Dim_PIC slicing
- Explain why the requested measure is redundant

---

## Test 4 — Documentation Agent

### Input

```text
SQL reporting layer PASS STRUCTURE ONLY.
```

### Expected Output

- Must not write `Phase 12 PASS`
- Must write `NEEDS REVIEW`
- Must preserve cumulative progress

---

## Test 5 — Final Review Agent

### Input

```text
Can we commit?
```

### Expected Output

- Require/check:
  - `git status`
  - `git diff --stat`
  - validation result
  - list of modified files
- No approval without evidence

## Output

```text
Agent workflow tested.
Known gaps recorded.
```

---

# Phase 7 — Refine Based on Simulation

## Objective

Improve the agent instructions before using the workflow in real project execution.

## Refinement Checklist

- Check whether agents answer too long.
- Check whether agents are too rigid.
- Check whether agents over-explain.
- Check whether agents generate SQL/DAX without evidence.
- Check whether agents forget blocked patterns.
- Check whether handover is clear.
- Check whether Final Review is strict enough.
- Update instruction files if any failure appears.
- Record known gaps in review records.

## Output

```text
Agent workflow v1 stabilized.
```

---

# Phase 8 — Use on Real Finance Ops Dev Task

## Objective

Run the workflow on a real project task.

## Recommended First Real Task

```text
Review Phase 12 Power BI semantic model readiness.
```

## Agent Sequence

```text
Router Mode
↓
SQL Optimizer Mode
↓
SQL Validator Mode
↓
DAX Optimizer Mode
↓
Documentation Mode
↓
Final Review Mode
```

## Expected Final Decision

```text
APPROVED FOR IMPLEMENTATION
or
NEEDS REVISION
or
BLOCKED
```

## Important Rule

The workflow must not automatically mark the phase as `PASS`.

A full `PASS` requires complete validation evidence.

## Output

```text
First real review completed.
Review record created.
```

---

# Phase 9 — GitHub Integration

## Objective

Add the framework into the repository and make it part of the official working process.

## Recommended Repo Location

Option 1:

```text
00_docs/agent_workflow/
```

Option 2:

```text
00_docs/dashboard_optimizer_os/
```

## Required Updates

- Add the full framework folder.
- Update `current_status.md`.
- Update `progress_log.md`.
- Update `handover_to_new_chat_v2.md`.
- Add note that the agent workflow is available for:
  - SQL review
  - DAX review
  - semantic model review
  - documentation review
  - final phase/commit review

## Suggested Commit Message

```text
docs: add dashboard optimizer agent workflow knowledge pack
```

## Output

```text
Agent workflow committed to GitHub.
```

---

# Phase 10 — Ready-to-Use Operating Procedure

## Objective

Create a simple operating procedure for using the workflow in ChatGPT Plus or any future agent environment.

---

## SQL Task Procedure

```text
Use SQL Optimizer Mode.

Read:
- core_os/
- agents/01_sql_optimizer_mode.md
- project_profiles/finance_ops_dev/

Task:
Review this SQL.

Rules:
- Do not create DAX.
- Do not update documentation.
- Output must follow agent output contract.
```

---

## SQL Validation Procedure

```text
Use SQL Validator Mode.

Read:
- validation memory
- evidence policy
- agents/02_sql_validator_mode.md

Task:
Validate this SQL output.

Rules:
- Classify PASS / REVIEW / FAIL.
- Do not approve without evidence.
```

---

## DAX Task Procedure

```text
Use DAX Optimizer Mode.

Read:
- semantic model profile
- naming registry
- blocked patterns
- agents/03_dax_optimizer_mode.md

Task:
Review/create DAX measure.

Rules:
- Check existing measure first.
- Avoid duplicate visual-specific measure.
- Include visual mapping if relevant.
```

---

## Documentation Task Procedure

```text
Use Documentation Mode.

Read:
- current status
- progress log
- handover
- validation memory
- agents/04_documentation_mode.md

Task:
Update documentation cumulatively.

Rules:
- Do not overclaim PASS.
- Preserve historical progress.
- Keep handover usable for a new chat.
```

---

## Final Review Procedure

```text
Use Final Review Mode.

Read:
- all agent handovers
- validation evidence
- git diff/stat
- agents/05_final_review_mode.md

Task:
Approve/block commit readiness.

Rules:
- Do not approve without evidence.
- Return APPROVED / NEEDS REVISION / BLOCKED.
```

## Output

```text
Workflow ready to use in ChatGPT Plus.
```

---

# Final Phase Status

```text
Phase 0  — Concept locked
Phase 1  — Folder structure created
Phase 2  — Core OS knowledge created
Phase 3  — Agent role knowledge created
Phase 4  — Finance Ops Dev profile created
Phase 5  — Review record system created
Phase 6  — Agent workflow simulated
Phase 7  — Simulation gaps refined
Phase 8  — Real project task tested
Phase 9  — GitHub integration completed
Phase 10 — Ready-to-use procedure finalized
```

---

# Minimal Version

If a shorter implementation path is needed, use this minimum sequence:

```text
Phase 1 — Create folder structure
Phase 2 — Create core OS files
Phase 3 — Create 6 agent mode files
Phase 4 — Create Finance Ops Dev project profile
Phase 5 — Simulate with Phase 12 blueprint
Phase 6 — Refine gaps
Phase 7 — Commit to GitHub
Phase 8 — Use for real SQL/DAX review
```

---

# Recommended Execution Order

```text
1. Build structure
2. Write Core OS
3. Write agent modes
4. Write Finance Ops Dev profile
5. Simulate failure cases
6. Fix instruction gaps
7. Test on Phase 12 blueprint
8. Commit to GitHub
9. Use as official workflow
```

---

# Final Target State

After all phases are completed, the framework will function as:

```text
Dashboard Optimizer OS
+
Finance Ops Dev Profile
```

For other dashboard projects, create a new profile:

```text
project_profiles/new_dashboard_project/
```

The core OS and agent modes can remain reusable, while the project profile provides dashboard-specific context.
