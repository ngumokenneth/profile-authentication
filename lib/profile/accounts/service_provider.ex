defmodule Profile.Accounts.Service_provider do
  use Ecto.Schema
  import Ecto.Changeset

  schema "service_providers" do
    field :county, :string
    field :description, :string
    field :email, :string
    field :first_name, :string
    field :image, :string
    field :middle_name, :string
    field :organization, :string
    field :password, :string
    field :phone_number, :string
    field :profession, :string
    field :service, :string
    field :social_media, :string
    field :surname, :string

    timestamps()
  end

  @doc false
  def changeset(service_provider, attrs) do
    service_provider
    |> cast(attrs, [:email, :password, :first_name, :middle_name, :surname, :phone_number, :county, :social_media, :image, :service, :organization, :profession, :description])
    |> validate_required([:email, :password, :first_name, :middle_name, :surname, :phone_number, :county, :social_media, :image, :service, :organization, :profession, :description])
  end
end
