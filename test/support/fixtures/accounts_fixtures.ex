defmodule Profile.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Profile.Accounts` context.
  """

  @doc """
  Generate a service_provider.
  """
  def service_provider_fixture(attrs \\ %{}) do
    {:ok, service_provider} =
      attrs
      |> Enum.into(%{
        county: "some county",
        description: "some description",
        email: "some email",
        first_name: "some first_name",
        image: "some image",
        middle_name: "some middle_name",
        organization: "some organization",
        password: "some password",
        phone_number: "some phone_number",
        profession: "some profession",
        service: "some service",
        social_media: "some social_media",
        surname: "some surname"
      })
      |> Profile.Accounts.create_service_provider()

    service_provider
  end
end
