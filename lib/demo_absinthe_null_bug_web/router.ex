defmodule DemoAbsintheNullBugWeb.Router do
  use DemoAbsintheNullBugWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", DemoAbsintheNullBugWeb do
    pipe_through :api
  end
end
