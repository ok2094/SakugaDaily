# SakugaDaily

Anilist bot

## Setup

### Get authorization code

https://anilist.co/api/v2/oauth/authorize?client_id={your_client_id}&response_type=code

create `config/secret.exs`:

```elixir
use Mix.Config

config :sakugadaily,
  client_id: "your_client_id",
  client_secret: "your_client_secret",
  auth_code: "authorization code from the link above"
```

Then you can start the app. You need to supply a new `auth_code` everytime you start the bot.

### Todo

Docs