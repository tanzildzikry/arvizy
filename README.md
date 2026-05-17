# Arvizy

Arvizy is a reusable dashboard optimizer agent operating system for BI analytics projects.

It is designed to structure, review, validate, and document dashboard development workflows through specialized agent modes for SQL optimization, SQL validation, DAX optimization, documentation management, phase handover, and final review.

---

## 1. Purpose

Arvizy helps BI and analytics projects maintain:

- clear SQL layer responsibility
- stable semantic model design
- controlled DAX measure development
- validation-first workflow
- documentation consistency
- phase handover continuity
- final review discipline before commit or implementation

Arvizy is not intended to replace human review.

It is designed to make agent-assisted review more structured, traceable, reusable, and validation-driven.

---

## 2. Core Concept

Arvizy separates reusable optimizer logic from project-specific context.

```text
Arvizy Core OS
+
Agent Modes
+
Project Profiles
```

The Core OS defines how agents work, communicate, validate, resolve conflicts, produce output, and hand over work.

Agent Modes define specialized responsibilities.

Project Profiles define the business context, naming registry, validation memory, semantic model assumptions, dashboard blueprint, and blocked patterns for each dashboard project.

---

## 3. Current Agent Modes

Arvizy currently defines these manual / semi-manual agent modes:

- Router Agent
- SQL Optimizer Agent
- SQL Validator Agent
- DAX Optimizer Agent
- Documentation Agent
- Final Review Agent
- Phase Handover Protocol

---

## 4. Repository Structure

```text
arvizy/
│
├── 00_docs/
│   ├── architecture/
│   │   └── arvizy_architecture.md
│   ├── concept/
│   │   └── arvizy_concept.md
│   ├── review_records/
│   │   ├── .gitkeep
│   │   └── README.md
│   └── usage_guides/
│       └── chatgpt_plus_usage_guide.md
│
├── 01_core_os/
│   ├── 00_master_agent_workflow.md
│   ├── 07_router_mode.md
│   ├── 08_agent_output_contract.md
│   ├── 09_review_record_template.md
│   ├── 10_agent_test_scenarios.md
│   ├── 11_conflict_resolution_rules.md
│   └── 12_evidence_policy.md
│
├── 02_agents/
│   ├── 01_sql_optimizer_mode.md
│   ├── 02_sql_validator_mode.md
│   ├── 03_dax_optimizer_mode.md
│   ├── 04_documentation_mode.md
│   ├── 05_final_review_mode.md
│   └── 06_phase_handover_protocol.md
│
├── 03_project_profiles/
│   └── finance_ops_dev/
│       ├── 00_blocked_patterns.md
│       ├── 00_decision_log.md
│       ├── 00_naming_registry.md
│       ├── 00_project_memory.md
│       ├── 00_validation_memory.md
│       ├── 13_powerbi_implementation_drift_checklist.md
│       ├── dashboard_blueprint_profile.md
│       └── semantic_model_profile.md
│
├── 04_templates/
│   ├── agent_handover_template.md
│   ├── phase_handover_template.md
│   ├── review_record_template.md
│   └── project_profile_template/
│       ├── 00_blocked_patterns.md
│       ├── 00_decision_log.md
│       ├── 00_naming_registry.md
│       ├── 00_project_memory.md
│       ├── 00_validation_memory.md
│       ├── dashboard_blueprint_profile.md
│       └── semantic_model_profile.md
│
├── 05_examples/
│   └── finance_ops_dev_phase_12_review/
│       ├── .gitkeep
│       ├── README.md
│       ├── phase_12_review_record.md
│       ├── sql_optimizer_handover.md
│       ├── sql_validator_handover.md
│       ├── dax_optimizer_handover.md
│       ├── documentation_handover.md
│       └── final_review_output.md
│
├── CURRENT_STATUS.md
├── PROGRESS_LOG.md
├── PROJECT_SCOPE.md
└── README.md
```

---

## 5. First Project Profile

The first project profile is:

```text
finance_ops_dev
```

This profile is used as the first real-world case study for validating Arvizy against a Finance Operations / AR Collection dashboard workflow.

The profile contains:

- project memory
- decision log
- validation memory
- blocked patterns
- naming registry
- semantic model profile
- dashboard blueprint profile
- Power BI implementation drift checklist

---

## 6. Usage Model

Current usage mode:

```text
Manual / semi-manual workflow with ChatGPT Plus or similar agent environments.
```

Arvizy is currently used by copying or loading the relevant knowledge files into the active agent session.

Typical structure:

```text
Core OS
+
Selected Agent Mode
+
Selected Project Profile
+
Task-Specific Evidence
```

Example for SQL review:

```text
01_core_os/
+
02_agents/01_sql_optimizer_mode.md
+
03_project_profiles/finance_ops_dev/
+
SQL file or SQL snippet to review
```

---

## 7. Workflow Examples

### Full Review Workflow

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

### SQL-Only Workflow

```text
SQL Optimizer Agent
↓
SQL Validator Agent
↓
Final Review Agent
```

### DAX-Only Workflow

```text
DAX Optimizer Agent
↓
Final Review Agent
```

### Documentation Workflow

```text
Documentation Agent
↓
Final Review Agent
```

---

## 8. Core Rules

Arvizy agents must follow these principles:

- preserve business meaning
- do not change logic silently
- do not approve without evidence
- do not overclaim status
- prefer clarity over cleverness
- prefer stable and maintainable output
- respect project-specific naming registries
- respect blocked patterns
- mark incomplete evidence as `NEEDS REVIEW`
- mark unsafe requests as `BLOCKED`

---

## 9. Decision Labels

Arvizy uses these decision labels:

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

## 10. Current Status

```text
Current Phase:
Phase 5 — Review Record System and Example Workflow Completed

Current Status:
STRUCTURE READY / MANUAL WORKFLOW READY

Automation Status:
NOT YET AUTOMATED

Runtime:
ChatGPT Plus / manual copy-paste / semi-manual workflow
```

---

## 11. Future Direction

Future possibilities include:

- API-based agent runner
- MCP-based tool access
- GitHub read/write integration
- PostgreSQL validation runner
- shared memory layer
- local CLI agent runner
- reusable project profile generator
- automated review record creation

These are future directions, not part of the initial manual version.

---

## 12. Design Principle

Arvizy is built to keep agent-assisted BI review:

```text
structured
traceable
reusable
validation-driven
project-aware
handover-ready
```
