defmodule TicketShop.TicketController do
  use TicketShop.Web, :controller
  alias TicketShop.Ticket
  alias TicketShop.Event

  def index(conn, _params) do
    tickets = Repo.all(Ticket)
    render conn, "index.html", tickets: tickets
  end

  def create(conn, %{"event_id" => event_id, "ticket" => ticket_params}) do
    event = Repo.get(Event, event_id)
    changeset = Ticket.changeset(%Ticket{event: event}, ticket_params)

    case Repo.insert(changeset) do
      {:ok, _ticket} ->
        conn
        |> put_flash(:info, "Ticket created successfully.")
        |> redirect(to: ticket_path(conn, :index))
      {:error, changeset} ->
        IO.puts changeset
        render(conn, "new.html", changeset: changeset)
    end
  end

  def new(conn, %{"event_id" => event_id}) do
    new_ticket = Ticket.changeset(%Ticket{})
    render conn, "new.html", changeset: new_ticket, event_id: event_id
  end
end
