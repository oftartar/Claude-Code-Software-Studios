# Data Model: <app or feature>

> Owner: data-modeler | DB: <engine> | ORM: <name> | Last updated: <date>

## Entities
### <Entity>
| Field | Type | Null | Default | Notes |
|-------|------|------|---------|-------|
| id | <uuid/text> | no | | opaque id |
| created_at | timestamptz | no | now() | |

- Purpose:
- Owner / lifecycle:
- Retention:

## Relationships
| From | To | Cardinality | FK direction | On delete |

## Constraints
- Unique: <cols>
- Check: <expression>
- Foreign keys: <list>

## Access Patterns
| Query (from spec R#) | Frequency | Index that serves it |

## Tenancy / Access Scoping
<How rows are scoped to a tenant/user and where that filter is enforced.>

## Migration Sequence
1. <migration> — reversible? — locking risk — depends on
2. …

<Destructive changes use: add → backfill (batched) → switch reads → stop writes → drop, across separate deploys.>
