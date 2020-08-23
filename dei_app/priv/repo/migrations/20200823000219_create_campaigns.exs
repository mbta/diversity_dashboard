defmodule DeiApp.Repo.Migrations.CreateCampaigns do
  use Ecto.Migration

  def change do
    create table(:campaigns) do
      add :is_anonymous, :boolean, default: false, null: false
      add :email, :string
      add :work_category, :text
      add :is_race_multiselect, :boolean, default: false, null: false
      add :is_compensation_requested, :boolean, default: false, null: false
      add :is_compensation_a_range, :boolean, default: false, null: false
      add :reference_gender_male, :integer
      add :reference_gender_female, :integer
      add :reference_gender_other, :integer
      add :reference_race_asian, :integer
      add :reference_race_black_or_african_american, :integer
      add :reference_race_native_american_or_alaskan_native, :integer
      add :reference_race_native_hawaiian_or_other_pacific_islander, :integer
      add :reference_race_white, :integer
      add :reference_race_other, :integer
      add :reference_ethnicity_hispanic_latinx, :integer

      timestamps()
    end

  end
end
