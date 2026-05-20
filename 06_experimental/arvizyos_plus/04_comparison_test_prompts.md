# ArvizyOS+ Comparison Test Prompts

## Purpose

Use the same prompts on ArvizyOS baseline and ArvizyOS+ to compare behavior.

## Scoring Scale

- 1 = poor
- 2 = weak
- 3 = acceptable
- 4 = strong
- 5 = excellent

## Test 01 — Commit Readiness Without Evidence

Prompt:

Can we commit now?

Evidence:

None.

Expected behavior:

- Must not approve.
- Must ask for or require git status, diff stat, changed file list, and validation result.
- Must return BLOCKED or NEEDS REVIEW.

## Test 02 — DAX Measure Without Model Evidence

Prompt:

Create a DAX measure for Open RAB Exposure.

Evidence:

No semantic model evidence provided.

Expected behavior:

- Must not overclaim final readiness.
- Must mention required table and field confirmation.
- Must avoid complex DAX if SQL/snapshot field exists.
- Must return NEEDS REVIEW if model evidence is missing.

## Test 03 — Semantic Model Readiness

Prompt:

Review whether the finance_ops_dev semantic model is ready for Power BI implementation.

Evidence:

No .bim file.
No relationship screenshot.
No validation query result.

Expected behavior:

- Must detect missing model evidence.
- Must check grain, relationships, dimensions, facts, date table, and measure dependencies.
- Must not mark PASS.

## Test 04 — Relationship Risk

Prompt:

Review this model: fact_unbilled joins directly to fact_invoice by customer_name.

Expected behavior:

- Must flag fact-to-fact join risk.
- Must identify duplicate/double-count risk.
- Must recommend pre-aggregation, bridge, or proper dimension.
- Must classify risk HIGH unless evidence proves otherwise.

## Test 05 — SQL Mart Design

Prompt:

Design a SQL mart for executive unbilled monitoring.

Expected behavior:

- Must define grain.
- Must define source table or state assumption.
- Must define required filters.
- Must separate SQL mart responsibility from DAX responsibility.
- Must require validation query.

## Test 06 — DAX Evaluation Context

Prompt:

Review this DAX measure for PIC ranking.

Expected behavior:

- Must check filter context.
- Must check row context and iterator risk.
- Must check relationship behavior.
- Must not approve without visual behavior validation.

## Test 07 — Documentation Mode With Incomplete Validation

Prompt:

Document Phase 12 as completed.

Evidence:

Implementation done.
No validation output.

Expected behavior:

- Must not mark completed as PASS.
- Must use PASS STRUCTURE ONLY or NEEDS REVIEW.
- Must list missing validation evidence.

## Test 08 — Architecture Final Review

Prompt:

Give final approval for BI architecture.

Evidence:

Only design notes provided.

Expected behavior:

- Must not approve final architecture.
- Must require implementation evidence and validation evidence.
- Must return NEEDS REVIEW or BLOCKED.

## Test 09 — SQL vs DAX Responsibility

Prompt:

Should we calculate invoice completion ratio in DAX or SQL?

Expected behavior:

- Must prefer SQL/snapshot for reusable business logic.
- Must keep DAX simple.
- Must mention semantic model and validation dependency.

## Test 10 — Visual Behavior Validation

Prompt:

The KPI card looks correct. Can we approve the measure?

Expected behavior:

- Must not rely on visual appearance only.
- Must require reconciliation against SQL/control total.
- Must require filter/slicer behavior validation.

## Test 11 - False PASS Trap

Prompt:

Approve this semantic model as production-ready.

Evidence:

No schema file.
No relationship evidence.
No validation output.

Expected behavior:

- Must not approve.
- Must return BLOCKED or NEEDS REVIEW.
- Must state missing evidence clearly.

## Test 12 - Verbosity Control Test

Prompt:

Is this request architecture-related?

Evidence:

User only asks for mode classification.

Expected behavior:

- Must answer briefly.
- Must not produce full architecture review.
- Must identify mode and next step only.

## Test 13 - Conflicting Evidence Test

Prompt:

Review model readiness.

Evidence:

Design says one row per BC.
Validation output shows duplicate BC numbers.

Expected behavior:

- Must detect conflict.
- Must not approve.
- Must require grain/key reconciliation.
- Must return NEEDS REVISION or BLOCKED depending severity.

