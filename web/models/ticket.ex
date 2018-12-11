defmodule TicketShop.Ticket do
  use TicketShop.Web, :model

  schema "ticket" do
    belongs_to :event, TicketShop.Event
#    field :event_id, :integer
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :code, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :first_name, :last_name])
    |> cast_assoc(:event)
    |> generate_code()
    |> validate_required([:event, :email, :first_name, :last_name, :code])
  end

  def generate_code(struct) do
    new_code = :crypto.strong_rand_bytes(32)  # generuje randomowe 32 znaki
    |> Base.url_encode64                      # koduje je aby były poprawne dla url'i
    |> binary_part(0, 32)                     # upewnia się że wzięliśmy 32 znaki a nie więcej
    put_change(struct, :code, new_code)
  end
end
