defmodule KoshWeb.Router do
  alias KoshWeb.HomeLive
  use KoshWeb, :router

  import KoshWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {KoshWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :authenticated_api do
    plug KoshWeb.Plugs.AuthenticateApi
  end

  pipeline :authenticated_access_token do
    plug KoshWeb.Plugs.AuthenticateAccessToken
  end



  # Other scopes may use custom stacks.
  # scope "/api", KoshWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:kosh, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: KoshWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  # scope "/nolive", KoshWeb do
  #   pipe_through [:browser, :redirect_if_user_is_authenticated]

  #   get "/users/register", UserRegistrationController, :new
  #   post "/users/register", UserRegistrationController, :create
  #   get "/users/log_in", UserSessionController, :new
  #   post "/users/log_in", UserSessionController, :create
  #   get "/users/reset_password", UserResetPasswordController, :new
  #   post "/users/reset_password", UserResetPasswordController, :create
  #   get "/users/reset_password/:token", UserResetPasswordController, :edit
  #   put "/users/reset_password/:token", UserResetPasswordController, :update
  # end

  # scope "/nolive", KoshWeb do
  #   pipe_through [:browser, :require_authenticated_user]

  #   get "/users/settings", UserSettingsController, :edit
  #   put "/users/settings", UserSettingsController, :update
  #   get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
  # end

  # scope "/nolive", KoshWeb do
  #   pipe_through [:browser]

  #   delete "/users/log_out", UserSessionController, :delete
  #   get "/users/confirm", UserConfirmationController, :new
  #   post "/users/confirm", UserConfirmationController, :create
  #   get "/users/confirm/:token", UserConfirmationController, :edit
  #   post "/users/confirm/:token", UserConfirmationController, :update
  # end

  ## Auth routes for API
  # scope "/api", KoshWeb do
  #   pipe_through :api
  #   post "/auth/login", SessionControllerApi, :new
  # end

  # scope "/api", KoshWeb do
  #   pipe_through [:api, :authenticated_api]
  #   get "/auth/hi", SessionControllerApi, :say_hi
  # end

  ## Auth routes for Access Token
  # scope "/api/accesstoken", KoshWeb do
  #   pipe_through [:api, :authenticated_access_token]
  #   get "/hi", AccessTokenController, :say_hi
  # end

  scope "/", KoshWeb do
    pipe_through :browser

    # get "/", PageController, :home
    live "/", HomeLive1, :index

  end

  scope "/", KoshWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{KoshWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      # live "/users/register", UserRegistrationLive, :new
      # live "/users/log_in", UserLoginLive, :new
      live "/users/register", HomeLive1, :register
      live "/users/log_in", HomeLive1, :login
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
      live "/users/confirm/landing", UserConfirmationLandingLive, :index
    end

    post "/users/log_in", UserSessionLiveController, :create
  end

  scope "/", KoshWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [
        {KoshWeb.UserAuth, :ensure_authenticated},
        {KoshWeb.UserAuth, :ensure_authorized}
      ] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email
      # live "/testadmin", TestAdminRoleLive, :index
      # live "/gentoken", TokenGeneratorLive, :index
    end
  end

  scope "/", KoshWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{KoshWeb.UserAuth, :mount_current_user}] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end

  def route_info(method, path, host) do
    Phoenix.Router.route_info(__MODULE__, method, path, host)
  end
end
