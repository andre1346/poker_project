defmodule PokerWeb.Router do
  use PokerWeb.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PokerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

   end
  scope "/auth", Poker_project do
    pipe_through :browser

    get "/:provider", AuthController, :request
   get "/:provider/callback", AuthController, :callback
    end


  end



  # Other scopes may use custom stacks.
  # scope "/api", PokerWeb do
  #   pipe_through :api
  # end

