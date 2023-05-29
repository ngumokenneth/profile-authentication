defmodule ProfileWeb.Service_providerLive.Index do
  use ProfileWeb, :live_view

  alias Profile.Accounts
  alias Profile.Accounts.Service_provider

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :service_providers, list_service_providers())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Service provider")
    |> assign(:service_provider, Accounts.get_service_provider!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Service provider")
    |> assign(:service_provider, %Service_provider{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Service providers")
    |> assign(:service_provider, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    service_provider = Accounts.get_service_provider!(id)
    {:ok, _} = Accounts.delete_service_provider(service_provider)

    {:noreply, assign(socket, :service_providers, list_service_providers())}
  end

  defp list_service_providers do
    Accounts.list_service_providers()
  end
end
