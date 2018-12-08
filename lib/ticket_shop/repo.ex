defmodule TicketShop.Repo do
  use Ecto.Repo, 
    otp_app: :ticket_shop,
    adapter: Ecto.Adapters.Postgres
end
