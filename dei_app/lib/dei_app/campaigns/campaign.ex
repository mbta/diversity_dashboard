defmodule DeiApp.Campaigns.Campaign do
  use Ecto.Schema
  import Ecto.Changeset

  schema "campaigns" do
    field :email, :string
    field :is_anonymous, :boolean, default: false
    field :is_compensation_a_range, :boolean, default: false
    field :is_compensation_requested, :boolean, default: false
    field :is_race_multiselect, :boolean, default: false
    field :reference_ethnicity_hispanic_latinx, :integer
    field :reference_gender_female, :integer
    field :reference_gender_male, :integer
    field :reference_gender_other, :integer
    field :reference_race_asian, :integer
    field :reference_race_black_or_african_american, :integer
    field :reference_race_native_american_or_alaskan_native, :integer
    field :reference_race_native_hawaiian_or_other_pacific_islander, :integer
    field :reference_race_other, :integer
    field :reference_race_white, :integer
    field :work_category, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(campaign, attrs) do
    campaign
    |> cast(attrs, [:is_anonymous, :email, :work_category, :is_race_multiselect, :is_compensation_requested, :is_compensation_a_range, :reference_gender_male, :reference_gender_female, :reference_gender_other, :reference_race_asian, :reference_race_black_or_african_american, :reference_race_native_american_or_alaskan_native, :reference_race_native_hawaiian_or_other_pacific_islander, :reference_race_white, :reference_race_other, :reference_ethnicity_hispanic_latinx])
    |> validate_required([:is_anonymous, :email, :work_category, :is_race_multiselect, :is_compensation_requested, :is_compensation_a_range, :reference_gender_male, :reference_gender_female, :reference_gender_other, :reference_race_asian, :reference_race_black_or_african_american, :reference_race_native_american_or_alaskan_native, :reference_race_native_hawaiian_or_other_pacific_islander, :reference_race_white, :reference_race_other, :reference_ethnicity_hispanic_latinx])
  end
end
