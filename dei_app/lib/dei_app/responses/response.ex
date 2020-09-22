defmodule DeiApp.Responses.Response do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "responses" do
    field :compensation_amount, :integer
    field :email, :string
    field :employment_type, :string
    field :feedback, :string
    field :gender, :string
    field :is_hispanic_latinx, :boolean, default: false
    field :may_include_salary, :boolean, default: false
    field :races, {:array, :string}
    field :tenure, :integer
    field :work_category, :string
    field :campaign_id, :id

    timestamps()
  end

  @doc false
  def changeset(response, attrs) do
    response
    |> cast(attrs, [
      :email,
      :gender,
      :races,
      :is_hispanic_latinx,
      :employment_type,
      :work_category,
      :tenure,
      :compensation_amount,
      :may_include_salary,
      :feedback
    ])
    |> validate_required([
      :email,
      :gender,
      :races,
      :is_hispanic_latinx,
      :employment_type,
      :work_category,
      :tenure,
      :compensation_amount,
      :may_include_salary,
      :feedback
    ])
  end
end
