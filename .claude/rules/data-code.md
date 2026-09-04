---
paths:
  - "src/db/**"
  - "prisma/**"
  - "drizzle/**"
  - "migrations/**"
  - "**/migrations/**"
  - "**/*.sql"
---

# Data & Migration Rules

- Every migration is reversible, or carries a comment explaining why it is
  forward-only and how to recover.
- No destructive change (drop column/table, type narrowing, NOT NULL on existing
  data) without an approved multi-step plan: add → backfill → switch reads →
  stop writes → drop, across separate deploys.
- Each new index names, in a comment, the query or access pattern it serves.
- Migrations do not contain application logic beyond data backfill. Large
  backfills are batched, not one statement over the whole table.
- Schema changes are additive-first so a rollback of app code still works against
  the new schema for at least one release.
- Foreign keys, uniqueness, and check constraints are expressed in the schema,
  not only in application code.
- Money as integer minor units; timestamps as `timestamptz`; enums as a lookup
  table or a DB enum, not free-text.
- Seed data and test fixtures live outside production migrations.

## Examples

**Correct**

```sql
-- 20260904_add_orders_status_idx.sql
-- Serves: GET /orders?status=... (dashboard filter), high-cardinality reads
CREATE INDEX CONCURRENTLY idx_orders_status ON orders (status);
```

**Incorrect**

```sql
ALTER TABLE orders DROP COLUMN legacy_total;   -- VIOLATION: destructive, no plan, not reversible
UPDATE orders SET status = 'migrated';         -- VIOLATION: unbatched full-table write in a migration
```
