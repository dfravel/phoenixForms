# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_forms,
  ecto_repos: [PhoenixForms.Repo]

# Configures the endpoint
config :phoenix_forms, PhoenixFormsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qBL9xWfT6MAOIeEGmxfq5pjLsBT7VogcFA77Bl9JwLwR0LtKMAxmhMCNscgS+5IB",
  render_errors: [view: PhoenixFormsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixForms.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
