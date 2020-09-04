defmodule DeiApp.UserManager.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Argon2

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "users" do
    field(:password, :string)
    field(:email, :string)

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, password: Argon2.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset
end