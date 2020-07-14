defmodule DemoAbsintheNullBugWeb.Router do
  use DemoAbsintheNullBugWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api
    forward "/graphql", Absinthe.Plug, schema: DemoAbsintheNullBug.Schema
  end
end
