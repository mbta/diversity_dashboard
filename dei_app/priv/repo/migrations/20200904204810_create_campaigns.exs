defmodule DeiApp.Repo.Migrations.CreateCampaigns do
  use Ecto.Migration

  def change do
    create table(:campaigns) do
      add(:should_allow_anonymous, :boolean, default: false, null: false)
      add(:email, :string)
      add(:salary_question_type, :string, null: false)
      add(:response_form_status, :string, null: false)
      add(:dashboard_status, :string, null: false)
      add(:work_category_options, :text)
      add(:about_form_message, :text)
      add(:form_receipt_message, :text)
      add(:protection_code, :string)
      add(:user_id, references(:users, on_delete: :nothing))

      timestamps()
    end

    create(index(:campaigns, [:user_id]))
  end
end
