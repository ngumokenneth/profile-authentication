defmodule Profile.Repo.Migrations.CreateServiceProviders do
  use Ecto.Migration

  def change do
    create table(:service_providers) do
      add :email, :string
      add :password, :string
      add :first_name, :string
      add :middle_name, :string
      add :surname, :string
      add :phone_number, :string
      add :county, :string
      add :social_media, :string
      add :image, :string
      add :service, :string
      add :organization, :string
      add :profession, :string
      add :description, :string

      timestamps()
    end
  end
end
