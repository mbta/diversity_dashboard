defmodule DeiAppWeb.Router do
  use DeiAppWeb, :router
  import Phoenix.LiveView.Router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :auth do
    plug(DeiApp.UserManager.Pipeline)
  end

  pipeline :ensure_auth do
    plug(Guardian.Plug.EnsureAuthenticated)
  end

  # Maybe logged in routes
  scope "/", DeiAppWeb do
    pipe_through([:browser, :auth])

    live "/", PageLive, :index

    get("/login", SessionController, :new)
    post("/login", SessionController, :login)
    get("/logout", SessionController, :logout)

    live "/campaigns", CampaignLive.Index, :index
    live "/campaigns/new", CampaignLive.Index, :new
    live "/campaigns/:id/edit", CampaignLive.Index, :edit
    live "/campaigns/:id", CampaignLive.Show, :show
    live "/campaigns/:id/show/edit", CampaignLive.Show, :edit
  end

  # Definitely logged in scope
  scope "/", DeiAppWeb do
    pipe_through([:browser, :auth, :ensure_auth])

    get("/protected", PageController, :protected)
  end

  # Other scopes may use custom stacks.
  # scope "/api", DeiAppWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through(:browser)
      live_dashboard("/dashboard", metrics: DeiAppWeb.Telemetry)
    end
  end
end
