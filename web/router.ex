defmodule TicketShop.Router do
  use TicketShop.Web, :router

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

  scope "/", TicketShop do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
    resources "/events", EventController
    resources "/tickets", TicketController, only: [:index] 
    get "/tickets/new/:event_id", TicketController, :new
    post "/tickets/:event_id", TicketController, :create
  end

  # Other scopes may use custom stacks.
  # scope "/api", TicketShop do
  #   pipe_through :api
  # end
end
