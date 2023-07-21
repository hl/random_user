import Config

config :tesla, :adapter, {Tesla.Adapter.Finch, name: RandomUser.Finch}

config :random_user, RandomUser, RandomUser.Client

config :random_user, RandomUser.Client, base_url: "https://randomuser.me"
