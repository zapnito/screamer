defmodule Screamer.Router do
  use Screamer.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Screamer do
    pipe_through :api
  end
end
