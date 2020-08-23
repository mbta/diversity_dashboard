defmodule DeiApp.Responses.Response do
  use Ecto.Schema
  import Ecto.Changeset

  schema "responses" do
    field :compensation, :integer
    field :compensation_range, :string
    field :email, :string
    field :gender, :string
    field :hispanic_latinx, :boolean, default: false
    field :races, {:array, :string}
    field :tenure, :integer
    field :work_category, :string
    field :campaign_id, :id

    timestamps()
  end

  @doc false
  def changeset(response, attrs) do
    response
    |> cast(attrs, [:email, :gender, :races, :hispanic_latinx, :work_category, :tenure, :compensation, :compensation_range])
    |> validate_required([:email, :gender, :races, :hispanic_latinx, :work_category, :tenure, :compensation, :compensation_range])
  end
end
