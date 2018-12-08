defmodule TicketShop.Event do
  use TicketShop.Web, :model

  schema "events" do
    field :name, :string
    field :description, :string
    field :number_of_tickets, :integer
    field :price, :float
    has_many :tickets, TicketShop.Ticket

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :description, :number_of_tickets, :price])
    |> validate_required([:name, :description, :number_of_tickets, :price])
    |> validate_number(:number_of_tickets, greater_than: 0)
    |> validate_number(:price, greater_than_or_equal_to: 0)
  end
end
