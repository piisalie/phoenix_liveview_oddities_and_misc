# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :diff_liveview_repo_case,
  ecto_repos: [DiffLiveviewRepoCase.Repo]

# Configures the endpoint
config :diff_liveview_repo_case, DiffLiveviewRepoCaseWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "y7jjwVjb/OZzGwxLC9F3QL4NwEDiM04lP5sKbl8CA25/SEv5OGI98H0b1qDfjL/S",
  render_errors: [view: DiffLiveviewRepoCaseWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: DiffLiveviewRepoCase.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :diff_liveview_repo_case, DiffLiveviewRepoCaseWeb.Endpoint,
  live_view: [
    signing_salt: "VERY_SECRET_AND_SECURE"
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
