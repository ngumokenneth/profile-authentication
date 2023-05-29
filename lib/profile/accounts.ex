defmodule Profile.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Profile.Repo

  alias Profile.Accounts.Service_provider

  @doc """
  Returns the list of service_providers.

  ## Examples

      iex> list_service_providers()
      [%Service_provider{}, ...]

  """
  def list_service_providers do
    Repo.all(Service_provider)
  end

  @doc """
  Gets a single service_provider.

  Raises `Ecto.NoResultsError` if the Service provider does not exist.

  ## Examples

      iex> get_service_provider!(123)
      %Service_provider{}

      iex> get_service_provider!(456)
      ** (Ecto.NoResultsError)

  """
  def get_service_provider!(id), do: Repo.get!(Service_provider, id)

  @doc """
  Creates a service_provider.

  ## Examples

      iex> create_service_provider(%{field: value})
      {:ok, %Service_provider{}}

      iex> create_service_provider(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_service_provider(attrs \\ %{}) do
    %Service_provider{}
    |> Service_provider.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a service_provider.

  ## Examples

      iex> update_service_provider(service_provider, %{field: new_value})
      {:ok, %Service_provider{}}

      iex> update_service_provider(service_provider, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_service_provider(%Service_provider{} = service_provider, attrs) do
    service_provider
    |> Service_provider.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a service_provider.

  ## Examples

      iex> delete_service_provider(service_provider)
      {:ok, %Service_provider{}}

      iex> delete_service_provider(service_provider)
      {:error, %Ecto.Changeset{}}

  """
  def delete_service_provider(%Service_provider{} = service_provider) do
    Repo.delete(service_provider)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking service_provider changes.

  ## Examples

      iex> change_service_provider(service_provider)
      %Ecto.Changeset{data: %Service_provider{}}

  """
  def change_service_provider(%Service_provider{} = service_provider, attrs \\ %{}) do
    Service_provider.changeset(service_provider, attrs)
  end
end
