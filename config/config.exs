# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :katchups_api,
  ecto_repos: [KatchupsApi.Repo]

# Configures the endpoint
config :katchups_api, KatchupsApiWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: KatchupsApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: KatchupsApi.PubSub,
  live_view: [signing_salt: "6ABZ5wm+"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :katchups_api, KatchupsApi.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Guardian config details

guardian_secret_key =
  System.get_env("GUARDIAN_SECRET_KEY") ||
    raise """
    environment variable GUARDIAN_SECRET_KEY is missing.
    """

config :katchups_api, KatchupsApi.Guardian,
  issuer: "katchups_api",
  secret_key: guardian_secret_key

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
