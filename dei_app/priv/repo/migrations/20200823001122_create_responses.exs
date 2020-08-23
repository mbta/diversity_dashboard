defmodule DeiApp.Repo.Migrations.CreateResponses do
  use Ecto.Migration

  def change do
    create table(:responses) do
      add :email, :string
      add :gender, :string
      add :races, {:array, :string}
      add :hispanic_latinx, :boolean, default: false, null: false
      add :work_category, :string
      add :tenure, :integer
      add :compensation, :integer
      add :compensation_range, :string
      add :campaign_id, references(:campaigns, on_delete: :nothing)

      timestamps()
    end

    create index(:responses, [:campaign_id])
  end
end
