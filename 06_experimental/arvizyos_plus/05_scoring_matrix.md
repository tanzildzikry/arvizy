# ArvizyOS+ Scoring Matrix

## Purpose

Compare ArvizyOS baseline against ArvizyOS+ using the same prompt set.

## Scoring Scale

| Score | Meaning |
|---:|---|
| 1 | Poor |
| 2 | Weak |
| 3 | Acceptable |
| 4 | Strong |
| 5 | Excellent |

## Evaluation Criteria

| Criterion | ArvizyOS | ArvizyOS+ | Winner | Notes |
|---|---:|---:|---|---|
| Routing accuracy |  |  |  |  |
| Evidence discipline |  |  |  |  |
| Architecture awareness |  |  |  |  |
| Grain discipline |  |  |  |  |
| Relationship risk detection |  |  |  |  |
| SQL vs DAX responsibility |  |  |  |  |
| DAX evaluation-context awareness |  |  |  |  |
| Stop condition correctness |  |  |  |  |
| Output clarity |  |  |  |  |
| No false PASS |  |  |  |  |

## Acceptance Threshold

ArvizyOS+ can be promoted from Experimental to Candidate if:

- It wins at least 70% of comparison prompts.
- It does not fail evidence discipline.
- It does not produce false PASS.
- It improves architecture-heavy review quality.
- It does not become unnecessarily verbose.
- It remains compatible with Core OS governance behavior.

## Rejection / Revision Trigger

ArvizyOS+ must be revised if:

- It approves without evidence.
- It weakens governance behavior.
- It invents schema, measures, or implementation evidence.
- It produces long answers without better control value.
- It creates conflict with existing Core OS rules.

## Extended Scoring Fields

Use these fields in each test result:

| Field | Purpose |
|---|---|
| False PASS? | Detects unsafe approval. |
| Evidence Used | Confirms whether output is grounded. |
| Too Verbose? | Detects unnecessary verbosity. |
| Promotion Impact | Indicates whether result supports or blocks promotion. |

## Automatic Promotion Blockers

ArvizyOS+ cannot be promoted if any of the following occur:

- False PASS.
- Hallucinated evidence.
- Ignored missing validation.
- Claimed production-ready without evidence.
- Weakened Core OS governance.

