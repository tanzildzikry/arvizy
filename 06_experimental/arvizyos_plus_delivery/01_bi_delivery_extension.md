# BI Delivery Extension

## Purpose

The BI Delivery Extension governs end-to-end dashboard delivery from source dataset to production-ready Power BI.

It extends ArvizyOS+ with implementation-grade design rules for:

- source profiling
- SQL schema design
- SQL validation pack
- semantic model design
- relationship validation
- DAX measure planning
- dashboard visual contract
- KPI reconciliation
- performance review
- production readiness gate

## Activation Triggers

Activate this extension when the request involves:

- creating a SQL database from a new dataset
- designing raw/core/mart layers
- creating production-grade SQL schema
- preparing Power BI semantic model from SQL outputs
- designing DAX measure inventory
- preparing dashboard visual mapping
- validating SQL vs Power BI result
- moving from architecture draft to implementation-ready design
- assessing dashboard production readiness

## Capability Layers

### 1. Governance Layer

Inherited from ArvizyOS:

- evidence policy
- validation policy
- output contract
- final review gate
- documentation discipline

### 2. BI Architecture Layer

Inherited from ArvizyOS+:

- SQL mart design awareness
- semantic model awareness
- relationship risk detection
- DAX evaluation-context awareness
- Power BI implementation audit

### 3. Delivery Layer

Added by this extension:

- production SQL schema contract
- source profiling
- import-safe raw layer
- typed core layer
- Power BI mart layer
- validation SQL pack
- model relationship contract
- measure registry plan
- visual contract
- production readiness checklist

## Non-Negotiable Delivery Rules

1. Raw layer must preserve source data safely.
2. Core layer must type, clean, normalize, and document business rules.
3. Mart layer must be consumption-ready for Power BI.
4. Grain must be declared for every raw/core/mart object.
5. Business keys must not be assumed unique without validation.
6. Raw tables should not be consumed directly by Power BI.
7. Control/reconciliation views should remain disconnected in Power BI.
8. Heavy row-level business logic belongs in SQL, not DAX.
9. Relationship-driven slicing should replace by-dimension DAX duplication.
10. Production readiness requires validation evidence, not only design output.

## Required Output for Delivery Tasks

Use the following structure unless the user requests another output format:

1. Mode Used
2. Evidence Status
3. Source Profile Summary
4. Grain Assumption
5. Proposed SQL Layer Design
6. Power BI Semantic Model Impact
7. DAX / Measure Impact
8. Validation Pack Required
9. Production Readiness Status
10. Risks and Stop Conditions
11. Next Recommended Mode

## Status Labels

Allowed status labels:

- DESIGN DRAFT
- APPROVED FOR INITIAL BUILD
- NEEDS REVIEW
- NEEDS REVISION
- BLOCKED
- VALIDATION REQUIRED
- IMPLEMENTATION READY
- PRODUCTION READY

Do not use IMPLEMENTATION READY or PRODUCTION READY unless validation evidence is provided.
