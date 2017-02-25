use Mix.Config

config :poker_player,
  ecto_repos: [Poker_player.Repo]

# Configures the endpoint
 config :poker_player, Poker_player.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "97u/bd26ZVUmB8LP/LwiRfR4/Xc26YUFGLOLwNjdEfvXB2OxdN7hreMQFOPLfhoa",
  render_errors: [view: Poker_player.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Poker_player.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :ueberauth, Ueberauth,
    providers: [
    facebook: { Ueberauth.Strategy.Facebook, [ opt1: "value", opts2: "value" ] },
    github: { Ueberauth.Strategy.Github, [ opt1: "value", opts2: "value" ] }
  ]

  config :ueberauth, Ueberauth.Strategy.Github.OAuth,
    client_id: "8f9a311f75a435783db8",
    client_secret: "a882cdfd6e31ac295e1a3028273f91b3e000f7ea"

