# ChatGPT Plus Usage Guide — Arvizy

## 1. Purpose

This guide explains how to use Arvizy manually or semi-manually with ChatGPT Plus.

The goal is to make the agent workflow usable before any API, MCP, or local automation layer exists.

---

## 2. Usage Model

In ChatGPT Plus, Arvizy is used by loading or copying the correct knowledge files into the conversation.

The user selects the desired agent mode and provides the relevant project context.

Arvizy then produces structured output based on:

- Core OS rules
- Agent mode rules
- Project profile context
- user-provided task
- available evidence

---

## 3. Required Knowledge Layers

For any real task, use these layers:

```text
Core OS
+
Selected Agent Mode
+
Selected Project Profile
+
Task-Specific Evidence
```

Example:

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

## 4. General Prompt Pattern

Use this pattern when starting an Arvizy task in ChatGPT Plus:

```text
Use Arvizy.

Mode:
[Agent Mode]

Read and follow:
- [Core OS file]
- [Agent mode file]
- [Project profile files]

Task:
[Describe the task]

Rules:
- Follow the Agent Output Contract.
- Do not work outside the selected mode.
- Do not approve without evidence.
- Mark NEEDS REVIEW if evidence is incomplete.
```

---

## 5. Router Mode Usage

Use Router Mode when unsure which agent should handle the task.

Prompt:

```text
Use Arvizy Router Mode.

Read:
- 01_core_os/00_master_agent_workflow.md
- 01_core_os/07_router_mode.md
- 01_core_os/08_agent_output_contract.md
- 01_core_os/12_evidence_policy.md

Task:
Classify this request and recommend the correct workflow intensity and agent sequence.

Request:
[paste request]
```

Expected output:

- request classification
- workflow intensity
- recommended agent sequence
- required inputs
- stop conditions

---

## 6. SQL Optimizer Mode Usage

Use SQL Optimizer Mode when reviewing or improving SQL.

Prompt:

```text
Use Arvizy SQL Optimizer Mode.

Read:
- 01_core_os/00_master_agent_workflow.md
- 01_core_os/08_agent_output_contract.md
- 01_core_os/12_evidence_policy.md
- 02_agents/01_sql_optimizer_mode.md
- 03_project_profiles/[project_name]/00_project_memory.md
- 03_project_profiles/[project_name]/00_naming_registry.md
- 03_project_profiles/[project_name]/00_blocked_patterns.md

Task:
Review this SQL for structure, readability, stability, validation readiness, and BI consumption.

SQL:
[paste SQL]
```

Rules:

- Do not create DAX.
- Do not update documentation.
- Do not change business logic silently.
- Include validation requirements.
- If no rewrite is needed, state that no SQL rewrite is required.

---

## 7. SQL Validator Mode Usage

Use SQL Validator Mode when checking whether SQL output is correct.

Prompt:

```text
Use Arvizy SQL Validator Mode.

Read:
- 01_core_os/00_master_agent_workflow.md
- 01_core_os/08_agent_output_contract.md
- 01_core_os/12_evidence_policy.md
- 02_agents/02_sql_validator_mode.md
- 03_project_profiles/[project_name]/00_validation_memory.md
- 03_project_profiles/[project_name]/00_naming_registry.md

Task:
Validate the SQL output and classify the result as PASS, REVIEW, or FAIL.

Validation target:
[paste SQL / output / expected result]

Actual result:
[paste actual result if available]
```

Rules:

- Do not approve without actual evidence.
- If actual result is missing, return `NEEDS REVIEW`.
- Separate expected result from actual result.

---

## 8. DAX Optimizer Mode Usage

Use DAX Optimizer Mode when reviewing or creating DAX measures.

Prompt:

```text
Use Arvizy DAX Optimizer Mode.

Read:
- 01_core_os/00_master_agent_workflow.md
- 01_core_os/08_agent_output_contract.md
- 01_core_os/12_evidence_policy.md
- 02_agents/03_dax_optimizer_mode.md
- 03_project_profiles/[project_name]/semantic_model_profile.md
- 03_project_profiles/[project_name]/00_naming_registry.md
- 03_project_profiles/[project_name]/00_blocked_patterns.md

Task:
Review or create this DAX measure.

Context:
[paste measure / requirement / semantic model context]
```

Rules:

- Check existing measure first.
- Avoid duplicate visual-specific measures.
- Do not recreate SQL business shaping logic in DAX unless justified.
- Include visual mapping if the measure is intended for dashboard use.

---

## 9. Documentation Mode Usage

Use Documentation Mode when updating project documentation.

Prompt:

```text
Use Arvizy Documentation Mode.

Read:
- 01_core_os/00_master_agent_workflow.md
- 01_core_os/08_agent_output_contract.md
- 01_core_os/12_evidence_policy.md
- 02_agents/04_documentation_mode.md
- 03_project_profiles/[project_name]/00_project_memory.md
- 03_project_profiles/[project_name]/00_validation_memory.md
- 03_project_profiles/[project_name]/00_decision_log.md

Task:
Update documentation based on this completed work.

Evidence:
[paste validation result / review output / changed files]
```

Rules:

- Keep progress log cumulative.
- Do not overclaim PASS.
- Preserve phase status accurately.
- Produce ready-to-copy markdown when requested.

---

## 10. Final Review Mode Usage

Use Final Review Mode before commit, phase transition, or implementation approval.

Prompt:

```text
Use Arvizy Final Review Mode.

Read:
- 01_core_os/00_master_agent_workflow.md
- 01_core_os/08_agent_output_contract.md
- 01_core_os/11_conflict_resolution_rules.md
- 01_core_os/12_evidence_policy.md
- 02_agents/05_final_review_mode.md
- 03_project_profiles/[project_name]/00_validation_memory.md
- 03_project_profiles/[project_name]/00_decision_log.md
- 03_project_profiles/[project_name]/00_blocked_patterns.md

Task:
Perform final review.

Evidence:
- git status:
[paste output]

- git diff --stat:
[paste output]

- validation result:
[paste output]

- documentation update:
[paste summary]
```

Rules:

- Do not approve without evidence.
- Do not create new features.
- Return `APPROVED`, `NEEDS REVISION`, or `BLOCKED`.
- Provide commit message only when changed files are known.

---

## 11. Phase Handover Usage

Use Phase Handover Protocol when moving between phases or starting a new chat.

Prompt:

```text
Use Arvizy Phase Handover Protocol.

Read:
- 01_core_os/00_master_agent_workflow.md
- 01_core_os/08_agent_output_contract.md
- 02_agents/06_phase_handover_protocol.md
- 03_project_profiles/[project_name]/00_project_memory.md
- 03_project_profiles/[project_name]/00_decision_log.md
- 03_project_profiles/[project_name]/00_validation_memory.md

Task:
Create a phase handover summary.

Include:
- current phase
- completed work
- validation status
- blockers
- next phase
- files needed in next chat
```

---

## 12. Recommended Manual Workflow

For a full review:

```text
1. Router Mode
2. SQL Optimizer Mode
3. SQL Validator Mode
4. DAX Optimizer Mode
5. Documentation Mode
6. Final Review Mode
```

For a SQL-only task:

```text
1. SQL Optimizer Mode
2. SQL Validator Mode
3. Final Review Mode
```

For a DAX-only task:

```text
1. DAX Optimizer Mode
2. Final Review Mode
```

For documentation-only task:

```text
1. Documentation Mode
2. Final Review Mode
```

---

## 13. Minimum Evidence Before Approval

Before asking for approval, provide:

```text
git status
git diff --stat
validation result, if technical logic changed
documentation update summary
```

If these are missing, Arvizy should return:

```text
NEEDS REVIEW
```

---

## 14. Best Practice

Use small, controlled runs.

Do not ask every agent to solve everything at once.

Use the correct mode for the task.

Preserve review records.

Commit documentation updates after meaningful workflow milestones.

---

## 15. Current Usage Status

```text
Usage mode:
Manual / semi-manual with ChatGPT Plus

Automation:
Not yet implemented

Recommended current usage:
Copy-paste agent knowledge and project profile context into ChatGPT Plus as needed.
```
