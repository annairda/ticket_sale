defmodule TicketShop.TicketTest do
  use TicketShop.ModelCase

  alias TicketShop.Ticket

  @valid_attrs %{code: "some content", email: "some content", event_id: 42, first_name: "some content", last_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Ticket.changeset(%Ticket{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Ticket.changeset(%Ticket{}, @invalid_attrs)
    refute changeset.valid?
  end
end
