use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :opencast, Opencast.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :opencast, Opencast.Repo,
  adapter: Ecto.Adapters.Postgres,
  user: "postgres",
  database: "opencast_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox