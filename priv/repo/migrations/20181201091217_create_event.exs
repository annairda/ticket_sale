defmodule TicketShop.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :name, :string
      add :description, :text
      add :number_of_tickets, :integer
      add :price, :float

      timestamps()
    end

  end
end
