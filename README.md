# SakugaDaily

Anilist bot

## Setup

`config/secret.exs`

```elixir
use Mix.Config

config :sakugadaily,
  client_id: "your_client_id",
  client_secret: "your_client_secret",
  bearer_token: "the bearer token"
```
things probably gonna change to support auto renew