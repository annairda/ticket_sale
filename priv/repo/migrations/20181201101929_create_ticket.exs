defmodule TicketShop.Repo.Migrations.CreateTicket do
  use Ecto.Migration

  def change do
    create table(:ticket) do
      add :event_id, references(:events)
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :code, :string

      timestamps()
    end

  end
end
