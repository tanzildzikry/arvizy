# Project Scope â€” Arvizy

## 1. Project Name

```text
Arvizy
```

---

## 2. Project Type

```text
Reusable dashboard optimizer agent operating system
```

---

## 3. Primary Objective

Arvizy provides a structured agent workflow for reviewing, optimizing, validating, documenting, and handing over BI dashboard projects.

It is designed to support dashboard development workflows involving:

- SQL layers
- semantic models
- analytical measures
- BI dashboards
- validation workflows
- documentation systems
- final review gates
- project profile management

---

## 4. Core Scope

Arvizy covers:

- SQL optimization workflow
- SQL validation workflow
- measure optimization workflow
- semantic model review workflow
- BI platform implementation drift review
- documentation workflow
- final review workflow
- phase handover workflow
- project profile management
- review record creation
- reusable templates for new dashboard projects

---

## 5. Core Architecture

Arvizy is separated into:

```text
Core OS
Agent Modes
Project Profiles
Templates
Examples
Review Records
```

### Core OS

Defines reusable governance rules:

- master workflow
- router rules
- output contract
- evidence policy
- conflict resolution
- review record format
- test scenarios

### Agent Modes

Defines specialized agent behavior:

- SQL Optimizer
- SQL Validator
- Measure Optimizer
- Documentation
- Final Review
- Phase Handover

### Project Profiles

Defines project-specific context:

- project memory
- decision log
- validation memory
- blocked patterns
- naming registry
- semantic model profile
- dashboard blueprint profile

### Templates

Provides reusable starting points for:

- project profiles
- review records
- agent handovers
- phase handovers

### Examples

Provides example workflows and case studies.

---

## 6. First Project Profile

The first project profile is:

```text
finance_ops_dev
```

This profile is used as the first real-world validation case for Arvizy.

It represents a Finance Operations / AR Collection dashboard workflow involving:

- PostgreSQL
- SQL mart/reporting layer
- BI semantic model
- analytical measures
- dashboard blueprint
- validation memory
- documentation continuity

---

## 7. In Scope for Initial Version

Initial version includes:

- manual Core OS documentation
- manual agent mode instructions
- finance_ops_dev project profile
- reusable templates
- example Phase 12 review workflow
- ChatGPT Plus usage guide
- evidence and conflict handling rules
- review record conventions

---

## 8. Out of Scope for Initial Version

The initial version does not include:

- fully automated MCP runtime
- direct database execution
- direct repository write automation
- autonomous multi-agent orchestration
- production deployment
- real company data processing
- credential management
- hosted web application
- package publishing
- CLI runner

These may be considered later.

---

## 9. Intended Usage

Arvizy is intended to be used manually or semi-manually with:

- ChatGPT Plus
- Claude
- Codex
- other agent environments
- future OpenAI API-based runner
- future MCP tool layer

Current intended usage:

```text
Manual / semi-manual knowledge-guided workflow.
```

---

## 10. Data Safety Scope

Arvizy must not store or expose real sensitive company data.

Do not commit:

- real confidential customer data
- real invoice-level sensitive data
- credentials
- connection strings
- `.env` secrets
- API keys
- production database dumps
- private internal files

Use:

- masked data
- sample data
- structure-only documentation
- synthetic examples
- validated but non-sensitive summaries

---

## 11. Reusability Scope

Arvizy must remain reusable across dashboard projects.

Core OS files should stay generic.

Project-specific rules must be stored under:

```text
03_project_profiles/[project_name]/
```

The `finance_ops_dev` profile is a case study, not the hardcoded identity of Arvizy.

---

## 12. Current Scope Status

```text
Status:
ACTIVE

Current maturity:
Manual / semi-manual framework

Current phase:
Phase 5 â€” Review Record System and Example Workflow Completed
```



