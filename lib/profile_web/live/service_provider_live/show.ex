defmodule ProfileWeb.Service_providerLive.Show do
  use ProfileWeb, :live_view

  alias Profile.Accounts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:service_provider, Accounts.get_service_provider!(id))}
  end

  defp page_title(:show), do: "Show Service provider"
  defp page_title(:edit), do: "Edit Service provider"
end
