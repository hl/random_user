import Config

config :tesla, :adapter, {Tesla.Adapter.Finch, name: RandomUser.Finch}

config :random_user, RandomUser, RandomUser.API

config :random_user, RandomUser.API, base_url: "https://randomuser.me"
