# Arvizy Architecture

## 1. Architecture Overview

Arvizy is structured as a reusable agent operating system for BI dashboard optimization.

The architecture is divided into four major layers:

```text
Core OS
Agent Modes
Project Profiles
Review Records
```

Each layer has a different responsibility.

---

## 2. High-Level Structure

```text
arvizy/
│
├── 00_docs/
│   ├── concept/
│   ├── architecture/
│   ├── usage_guides/
│   └── review_records/
│
├── 01_core_os/
│
├── 02_agents/
│
├── 03_project_profiles/
│
├── 04_templates/
│
└── 05_examples/
```

---

## 3. Core OS Layer

Folder:

```text
01_core_os/
```

Purpose:

The Core OS defines universal rules used by all agents.

It contains the governance layer for:

- workflow sequence
- routing logic
- output format
- evidence policy
- conflict resolution
- review record format
- agent test scenarios

The Core OS should remain reusable across dashboard projects.

It should avoid hardcoding project-specific assumptions.

---

## 4. Agent Modes Layer

Folder:

```text
02_agents/
```

Purpose:

The Agent Modes define specialized agent responsibilities.

Each agent mode has its own role, scope, allowed actions, forbidden actions, and output requirements.

Planned agent modes:

- SQL Optimizer Agent
- SQL Validator Agent
- DAX Optimizer Agent
- Documentation Agent
- Final Review Agent
- Phase Handover Protocol

Agents must follow the Core OS rules.

Agents must also respect the selected Project Profile.

---

## 5. Project Profiles Layer

Folder:

```text
03_project_profiles/
```

Purpose:

Project Profiles contain project-specific knowledge.

Each dashboard project should have its own profile.

A project profile may include:

- project memory
- decision log
- validation memory
- blocked patterns
- naming registry
- semantic model profile
- dashboard blueprint profile
- implementation drift checklist

The first project profile is:

```text
03_project_profiles/finance_ops_dev/
```

---

## 6. Review Records Layer

Folders:

```text
00_docs/review_records/
```

and optionally:

```text
05_examples/
```

Purpose:

Review records preserve important review outcomes.

A review record should capture:

- task
- source reviewed
- agent sequence
- findings
- validation evidence
- decision
- risk
- blocked items
- approved items
- next step
- commit suggestion

Review records help preserve continuity across phases and chats.

---

## 7. Conceptual Workflow

```text
User Request
↓
Router Agent
↓
Selected Agent Sequence
↓
Agent Output Contract
↓
Validation / Evidence Gate
↓
Documentation / Review Record
↓
Final Review
↓
Implementation / Commit Decision
```

---

## 8. Full Workflow Sequence

Default full workflow:

```text
Router Agent
↓
SQL Optimizer Agent
↓
SQL Validator Agent
↓
DAX Optimizer Agent
↓
Documentation Agent
↓
Final Review Agent
```

Not every request requires the full workflow.

The Router Agent determines the correct workflow intensity.

---

## 9. Workflow Intensity

### Light Workflow

Used for isolated tasks.

Examples:

- commit message suggestion
- small documentation review
- explain one SQL or DAX snippet
- classify task type

### Standard Workflow

Used when one technical layer is affected.

Examples:

- SQL view review
- SQL validation
- DAX measure review
- documentation update after validation

### Full Workflow

Used when multiple layers or phase readiness are affected.

Examples:

- SQL + DAX + documentation review
- semantic model readiness review
- dashboard blueprint review
- phase transition
- pre-commit final review

---

## 10. Responsibility Model

```text
SQL Layer
= data cleaning, transformation, business shaping, mart readiness

Semantic Model Layer
= relationships, grain, dimension/fact structure, filter path

DAX Layer
= analytical measures, display measures, controlled dynamic logic

Visual Layer
= presentation, slicers, layout, reader flow

Documentation Layer
= progress continuity, decision trace, handover, auditability
```

Agents must not move logic between layers unless there is a clear reason and validation requirement.

---

## 11. Evidence Gate

Arvizy must not approve work without evidence.

Evidence may include:

- SQL validation output
- database query result
- `information_schema` output
- semantic model export
- `.bim` file structure
- Git diff/stat
- Power BI screenshot
- KPI reconciliation result
- explicit user-provided validation result

If evidence is incomplete, the decision must be:

```text
NEEDS REVIEW
```

---

## 12. Conflict Handling

If sources conflict, Arvizy uses the more conservative status.

Default rule:

```text
PASS loses to NEEDS REVIEW unless direct validation evidence proves PASS.
```

Latest direct validation evidence outranks older documentation.

---

## 13. Reusability Design

Arvizy is designed to be reusable.

Core logic should remain in:

```text
01_core_os/
02_agents/
```

Project-specific logic should remain in:

```text
03_project_profiles/[project_name]/
```

This makes it possible to reuse Arvizy for different dashboard projects by creating a new project profile.

---

## 14. Initial Project Profile

The first project profile is:

```text
finance_ops_dev
```

This profile is used to validate Arvizy against a real Finance Operations / AR Collection dashboard workflow.

---

## 15. Current Architecture Status

```text
Architecture Status:
INITIAL MANUAL AGENT WORKFLOW

Automation Status:
NOT YET AUTOMATED

Runtime:
ChatGPT Plus / manual copy-paste / semi-manual review process

Future Runtime Options:
OpenAI API
MCP tools
local agent runner
GitHub integration
database validation runner
```
