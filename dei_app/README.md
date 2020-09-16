# DeiApp

## Database stuff

1. Set create databases for dev and test

   ```
   mix ecto.create
   MIX_ENV=test mix ecto.create
   ```

1. Add pgcrypto extension to both databases

   ```
   psql dei_dashboard
   CREATE EXTENSION pgcrypto;
   \q

   psql dei_dashboard_test
   CREATE EXTENSION pgcrypto;
   \q
   ```

1. Run migrations

   ```
   mix ecto.migrate
   MIX_ENV=test mix ecto.migrate
   ```

Command for adding a user:

```
DeiApp.UserManager.create_user(%{email: "x@x.com", password: "secret"})
```

## Generic Readme

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Install Node.js dependencies with `npm install` inside the `assets` directory
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

- Official website: https://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Forum: https://elixirforum.com/c/phoenix-forum
- Source: https://github.com/phoenixframework/phoenix
