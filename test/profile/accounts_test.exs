defmodule Profile.AccountsTest do
  use Profile.DataCase

  alias Profile.Accounts

  describe "service_providers" do
    alias Profile.Accounts.Service_provider

    import Profile.AccountsFixtures

    @invalid_attrs %{county: nil, description: nil, email: nil, first_name: nil, image: nil, middle_name: nil, organization: nil, password: nil, phone_number: nil, profession: nil, service: nil, social_media: nil, surname: nil}

    test "list_service_providers/0 returns all service_providers" do
      service_provider = service_provider_fixture()
      assert Accounts.list_service_providers() == [service_provider]
    end

    test "get_service_provider!/1 returns the service_provider with given id" do
      service_provider = service_provider_fixture()
      assert Accounts.get_service_provider!(service_provider.id) == service_provider
    end

    test "create_service_provider/1 with valid data creates a service_provider" do
      valid_attrs = %{county: "some county", description: "some description", email: "some email", first_name: "some first_name", image: "some image", middle_name: "some middle_name", organization: "some organization", password: "some password", phone_number: "some phone_number", profession: "some profession", service: "some service", social_media: "some social_media", surname: "some surname"}

      assert {:ok, %Service_provider{} = service_provider} = Accounts.create_service_provider(valid_attrs)
      assert service_provider.county == "some county"
      assert service_provider.description == "some description"
      assert service_provider.email == "some email"
      assert service_provider.first_name == "some first_name"
      assert service_provider.image == "some image"
      assert service_provider.middle_name == "some middle_name"
      assert service_provider.organization == "some organization"
      assert service_provider.password == "some password"
      assert service_provider.phone_number == "some phone_number"
      assert service_provider.profession == "some profession"
      assert service_provider.service == "some service"
      assert service_provider.social_media == "some social_media"
      assert service_provider.surname == "some surname"
    end

    test "create_service_provider/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_service_provider(@invalid_attrs)
    end

    test "update_service_provider/2 with valid data updates the service_provider" do
      service_provider = service_provider_fixture()
      update_attrs = %{county: "some updated county", description: "some updated description", email: "some updated email", first_name: "some updated first_name", image: "some updated image", middle_name: "some updated middle_name", organization: "some updated organization", password: "some updated password", phone_number: "some updated phone_number", profession: "some updated profession", service: "some updated service", social_media: "some updated social_media", surname: "some updated surname"}

      assert {:ok, %Service_provider{} = service_provider} = Accounts.update_service_provider(service_provider, update_attrs)
      assert service_provider.county == "some updated county"
      assert service_provider.description == "some updated description"
      assert service_provider.email == "some updated email"
      assert service_provider.first_name == "some updated first_name"
      assert service_provider.image == "some updated image"
      assert service_provider.middle_name == "some updated middle_name"
      assert service_provider.organization == "some updated organization"
      assert service_provider.password == "some updated password"
      assert service_provider.phone_number == "some updated phone_number"
      assert service_provider.profession == "some updated profession"
      assert service_provider.service == "some updated service"
      assert service_provider.social_media == "some updated social_media"
      assert service_provider.surname == "some updated surname"
    end

    test "update_service_provider/2 with invalid data returns error changeset" do
      service_provider = service_provider_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_service_provider(service_provider, @invalid_attrs)
      assert service_provider == Accounts.get_service_provider!(service_provider.id)
    end

    test "delete_service_provider/1 deletes the service_provider" do
      service_provider = service_provider_fixture()
      assert {:ok, %Service_provider{}} = Accounts.delete_service_provider(service_provider)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_service_provider!(service_provider.id) end
    end

    test "change_service_provider/1 returns a service_provider changeset" do
      service_provider = service_provider_fixture()
      assert %Ecto.Changeset{} = Accounts.change_service_provider(service_provider)
    end
  end
end
