defmodule ProfileWeb.Service_providerLiveTest do
  use ProfileWeb.ConnCase

  import Phoenix.LiveViewTest
  import Profile.AccountsFixtures

  @create_attrs %{county: "some county", description: "some description", email: "some email", first_name: "some first_name", image: "some image", middle_name: "some middle_name", organization: "some organization", password: "some password", phone_number: "some phone_number", profession: "some profession", service: "some service", social_media: "some social_media", surname: "some surname"}
  @update_attrs %{county: "some updated county", description: "some updated description", email: "some updated email", first_name: "some updated first_name", image: "some updated image", middle_name: "some updated middle_name", organization: "some updated organization", password: "some updated password", phone_number: "some updated phone_number", profession: "some updated profession", service: "some updated service", social_media: "some updated social_media", surname: "some updated surname"}
  @invalid_attrs %{county: nil, description: nil, email: nil, first_name: nil, image: nil, middle_name: nil, organization: nil, password: nil, phone_number: nil, profession: nil, service: nil, social_media: nil, surname: nil}

  defp create_service_provider(_) do
    service_provider = service_provider_fixture()
    %{service_provider: service_provider}
  end

  describe "Index" do
    setup [:create_service_provider]

    test "lists all service_providers", %{conn: conn, service_provider: service_provider} do
      {:ok, _index_live, html} = live(conn, Routes.service_provider_index_path(conn, :index))

      assert html =~ "Listing Service providers"
      assert html =~ service_provider.county
    end

    test "saves new service_provider", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.service_provider_index_path(conn, :index))

      assert index_live |> element("a", "New Service provider") |> render_click() =~
               "New Service provider"

      assert_patch(index_live, Routes.service_provider_index_path(conn, :new))

      assert index_live
             |> form("#service_provider-form", service_provider: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#service_provider-form", service_provider: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.service_provider_index_path(conn, :index))

      assert html =~ "Service provider created successfully"
      assert html =~ "some county"
    end

    test "updates service_provider in listing", %{conn: conn, service_provider: service_provider} do
      {:ok, index_live, _html} = live(conn, Routes.service_provider_index_path(conn, :index))

      assert index_live |> element("#service_provider-#{service_provider.id} a", "Edit") |> render_click() =~
               "Edit Service provider"

      assert_patch(index_live, Routes.service_provider_index_path(conn, :edit, service_provider))

      assert index_live
             |> form("#service_provider-form", service_provider: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#service_provider-form", service_provider: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.service_provider_index_path(conn, :index))

      assert html =~ "Service provider updated successfully"
      assert html =~ "some updated county"
    end

    test "deletes service_provider in listing", %{conn: conn, service_provider: service_provider} do
      {:ok, index_live, _html} = live(conn, Routes.service_provider_index_path(conn, :index))

      assert index_live |> element("#service_provider-#{service_provider.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#service_provider-#{service_provider.id}")
    end
  end

  describe "Show" do
    setup [:create_service_provider]

    test "displays service_provider", %{conn: conn, service_provider: service_provider} do
      {:ok, _show_live, html} = live(conn, Routes.service_provider_show_path(conn, :show, service_provider))

      assert html =~ "Show Service provider"
      assert html =~ service_provider.county
    end

    test "updates service_provider within modal", %{conn: conn, service_provider: service_provider} do
      {:ok, show_live, _html} = live(conn, Routes.service_provider_show_path(conn, :show, service_provider))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Service provider"

      assert_patch(show_live, Routes.service_provider_show_path(conn, :edit, service_provider))

      assert show_live
             |> form("#service_provider-form", service_provider: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#service_provider-form", service_provider: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.service_provider_show_path(conn, :show, service_provider))

      assert html =~ "Service provider updated successfully"
      assert html =~ "some updated county"
    end
  end
end
