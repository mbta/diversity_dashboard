defmodule DeiApp.Repo.Migrations.CreateResponses do
  use Ecto.Migration

  def change do
    create table(:responses) do
      add :email, :string
      add :gender, :string
      add :races, {:array, :string}
      add :is_hispanic_latinx, :boolean, default: false, null: false
      add :employment_type, :string
      add :work_category, :string
      add :tenure, :integer
      add :compensation_amount, :integer
      add :may_include_salary, :boolean, default: false, null: false
      add :feedback, :text
      add :campaign_id, references(:campaigns, on_delete: :nothing)

      timestamps()
    end

    create index(:responses, [:campaign_id])
  end
end
