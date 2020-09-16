defmodule DeiApp.Campaigns.Campaign do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "campaigns" do
    field :about_form_message, :string
    field :dashboard_status, :string
    field :form_receipt_message, :string
    field :protection_code, :string
    field :response_form_status, :string
    field :salary_question_type, :string
    field :should_allow_anonymous, :boolean, default: false
    field :work_category_options, :string
    field :user_id, :id

    timestamps()
  end

  @doc false
  def changeset(campaign, attrs) do
    campaign
    |> cast(attrs, [
      :should_allow_anonymous,
      :salary_question_type,
      :response_form_status,
      :dashboard_status,
      :work_category_options,
      :about_form_message,
      :form_receipt_message,
      :protection_code
    ])
    |> validate_required([
      :should_allow_anonymous,
      :salary_question_type,
      :response_form_status,
      :dashboard_status,
      :work_category_options,
      :about_form_message,
      :form_receipt_message,
      :protection_code
    ])
  end
end
