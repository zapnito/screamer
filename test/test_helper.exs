ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Screamer.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Screamer.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Screamer.Repo)
