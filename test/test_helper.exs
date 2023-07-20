Mox.defmock(RandomUserMock, for: RandomUser)
Application.put_env(:random_user, RandomUser, RandomUserMock)

ExUnit.start()
