defmodule Sakugadaily.Utils.Auth do
  use OAuth2.Strategy

  @auth_url "https://anilist.co/api/v2"

  def initialize do
    OAuth2.Client.new(
      strategy: __MODULE__,
      client_id: Application.get_env(:sakugadaily, :client_id),
      client_secret: Application.get_env(:sakugadaily, :client_secret),
      site: @auth_url,
      token_url: "/oauth/token",
      redirect_uri: "https://anilist.co/api/v2/oauth/pin"
    )
    |> OAuth2.Client.put_serializer("application/json", Jason)
    |> OAuth2.Client.get_token(code: Application.get_env(:sakugadaily, :auth_code))
  end

  def get_token(client, params, headers) do
    client
    |> put_param(:client_secret, client.client_secret)
    |> put_headers([{"accept", "application/json"}, {"content-type", "application/json"}])
    |> OAuth2.Strategy.AuthCode.get_token(params, headers)
  end
end
