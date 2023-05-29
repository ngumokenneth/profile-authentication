defmodule ProfileWeb.Service_providerLive.FormComponent do
  use ProfileWeb, :live_component

  alias Profile.Accounts

  @impl true
  def update(%{service_provider: service_provider} = assigns, socket) do
    changeset = Accounts.change_service_provider(service_provider)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"service_provider" => service_provider_params}, socket) do
    changeset =
      socket.assigns.service_provider
      |> Accounts.change_service_provider(service_provider_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"service_provider" => service_provider_params}, socket) do
    save_service_provider(socket, socket.assigns.action, service_provider_params)
  end

  defp save_service_provider(socket, :edit, service_provider_params) do
    case Accounts.update_service_provider(socket.assigns.service_provider, service_provider_params) do
      {:ok, _service_provider} ->
        {:noreply,
         socket
         |> put_flash(:info, "Service provider updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_service_provider(socket, :new, service_provider_params) do
    case Accounts.create_service_provider(service_provider_params) do
      {:ok, _service_provider} ->
        {:noreply,
         socket
         |> put_flash(:info, "Service provider created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
