defmodule TicketShop.EventTest do
  use TicketShop.ModelCase

  alias TicketShop.Event

  @valid_attrs %{description: "some content", name: "some content", number_of_tickets: 42, price: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
