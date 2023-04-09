## Requirements

`sqlcg` requires [sqlc](https://github.com/kyleconroy/sqlc), [dbmate](https://github.com/amacneil/dbmate), and [Docker](https://hub.docker.com/_/mysql/).

A `sqlc.yaml` file. Example:

```yaml
version: "2"
sql:
  - engine: "mysql"
    queries: "db/queries.sql"
    schema: "db/schema.sql"
    gen:
      go:
        package: "todos"
        out: "repository/mysql/todos"
        emit_empty_slices: true
```

## Intent

`sqlc` [references dbmate](https://docs.sqlc.dev/en/latest/howto/ddl.html), but doesn't demonstrate a useful workflow incorporating it.

`sqlcg` allows a more iterative, interactive approach.

It:

1. Launches `mysql:5.7` database.
2. Waits for it to accept connections.
3. Runs the database migrations.
4. Generates the Go code via sqlc.
5. Connects to mysql shell for testing. (Optional with >=2 arguments.)
6. Stops docker container.

## Tips

Create a `sqlcg` link somewhere in your path to make invoking this easier.

## Future?

Postgres and SQLite database integration is likely.

Let me know in an issue if you'd like something else.
