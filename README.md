# SakugaDaily

Anilist bot

## Setup

### Get authorization code

https://anilist.co/api/v2/oauth/authorize?client_id={your_client_id}&response_type=code

`config/secret.exs`

```elixir
use Mix.Config

config :sakugadaily,
  client_id: "your_client_id",
  client_secret: "your_client_secret",
  auth_code: "authorization code from the link above"
```
things probably gonna change to support auto renew