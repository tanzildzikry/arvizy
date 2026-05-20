# ArvizyOS+ Failure Pattern Registry

## Purpose

Track failure patterns found during ArvizyOS+ testing.

## Failure Categories

| Failure Code | Description | Severity |
|---|---|---|
| FALSE_PASS | Agent gives PASS without evidence | CRITICAL |
| HALLUCINATED_EVIDENCE | Agent invents evidence not provided | CRITICAL |
| WEAK_EVIDENCE_DISCIPLINE | Agent ignores missing validation | HIGH |
| WRONG_ROUTING | Agent selects wrong mode | MEDIUM |
| ARCHITECTURE_OVERREACH | Agent makes architecture claim beyond evidence | HIGH |
| TOO_VERBOSE | Agent produces long answer without added control value | LOW/MEDIUM |
| MISSED_GRAIN_RISK | Agent fails to identify missing or unclear grain | HIGH |
| MISSED_RELATIONSHIP_RISK | Agent fails to detect relationship or cardinality risk | HIGH |
| SQL_DAX_MISALLOCATION | Agent puts SQL responsibility into DAX or vice versa | MEDIUM/HIGH |
| PROGRESS_OWNERSHIP_CONFLICT | Agent acts as source of truth without repo evidence | HIGH |

## Failure Log

| Date | Test ID | Failure Code | Description | Severity | Fix Required | Status |
|---|---|---|---|---|---|---|
| TBD | TBD | TBD | TBD | TBD | TBD | OPEN |

## Rule

Any CRITICAL failure blocks promotion to Candidate or Default.
