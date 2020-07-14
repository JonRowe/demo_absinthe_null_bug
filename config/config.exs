# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :demo_absinthe_null_bug, DemoAbsintheNullBugWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "LChE0IL7756IZ2g49ysALCe+SzvGBKXpPsKigRI8lVXyq+tsI+XThKGxOLuPdCEA",
  render_errors: [view: DemoAbsintheNullBugWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: DemoAbsintheNullBug.PubSub,
  live_view: [signing_salt: "xGONXcNU"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
