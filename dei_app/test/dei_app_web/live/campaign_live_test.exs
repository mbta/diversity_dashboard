defmodule DeiAppWeb.CampaignLiveTest do
  use DeiAppWeb.ConnCase

  import Phoenix.LiveViewTest

  alias DeiApp.Campaigns

  @create_attrs %{
    about_form_message: "some about_form_message",
    dashboard_status: "some dashboard_status",
    form_receipt_message: "some form_receipt_message",
    protection_code: "some protection_code",
    response_form_status: "some response_form_status",
    salary_question_type: "some salary_question_type",
    should_allow_anonymous: true,
    work_category_options: "some work_category_options"
  }
  @update_attrs %{
    about_form_message: "some updated about_form_message",
    dashboard_status: "some updated dashboard_status",
    form_receipt_message: "some updated form_receipt_message",
    protection_code: "some updated protection_code",
    response_form_status: "some updated response_form_status",
    salary_question_type: "some updated salary_question_type",
    should_allow_anonymous: false,
    work_category_options: "some updated work_category_options"
  }
  @invalid_attrs %{
    about_form_message: nil,
    dashboard_status: nil,
    form_receipt_message: nil,
    protection_code: nil,
    response_form_status: nil,
    salary_question_type: nil,
    should_allow_anonymous: nil,
    work_category_options: nil
  }

  defp fixture(:campaign) do
    {:ok, campaign} = Campaigns.create_campaign(@create_attrs)
    campaign
  end

  defp create_campaign(_) do
    campaign = fixture(:campaign)
    %{campaign: campaign}
  end

  describe "Index" do
    setup [:create_campaign]

    test "lists all campaigns", %{conn: conn, campaign: campaign} do
      {:ok, _index_live, html} = live(conn, Routes.campaign_index_path(conn, :index))

      assert html =~ "Listing Campaigns"
      assert html =~ campaign.about_form_message
    end

    test "saves new campaign", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.campaign_index_path(conn, :index))

      assert index_live |> element("a", "New Campaign") |> render_click() =~
               "New Campaign"

      assert_patch(index_live, Routes.campaign_index_path(conn, :new))

      assert index_live
             |> form("#campaign-form", campaign: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#campaign-form", campaign: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.campaign_index_path(conn, :index))

      assert html =~ "Campaign created successfully"
      assert html =~ "some about_form_message"
    end

    test "updates campaign in listing", %{conn: conn, campaign: campaign} do
      {:ok, index_live, _html} = live(conn, Routes.campaign_index_path(conn, :index))

      assert index_live |> element("#campaign-#{campaign.id} a", "Edit") |> render_click() =~
               "Edit Campaign"

      assert_patch(index_live, Routes.campaign_index_path(conn, :edit, campaign))

      assert index_live
             |> form("#campaign-form", campaign: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#campaign-form", campaign: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.campaign_index_path(conn, :index))

      assert html =~ "Campaign updated successfully"
      assert html =~ "some updated about_form_message"
    end

    test "deletes campaign in listing", %{conn: conn, campaign: campaign} do
      {:ok, index_live, _html} = live(conn, Routes.campaign_index_path(conn, :index))

      assert index_live |> element("#campaign-#{campaign.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#campaign-#{campaign.id}")
    end
  end

  describe "Show" do
    setup [:create_campaign]

    test "displays campaign", %{conn: conn, campaign: campaign} do
      {:ok, _show_live, html} = live(conn, Routes.campaign_show_path(conn, :show, campaign))

      assert html =~ "Show Campaign"
      assert html =~ campaign.about_form_message
    end

    test "updates campaign within modal", %{conn: conn, campaign: campaign} do
      {:ok, show_live, _html} = live(conn, Routes.campaign_show_path(conn, :show, campaign))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Campaign"

      assert_patch(show_live, Routes.campaign_show_path(conn, :edit, campaign))

      assert show_live
             |> form("#campaign-form", campaign: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#campaign-form", campaign: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.campaign_show_path(conn, :show, campaign))

      assert html =~ "Campaign updated successfully"
      assert html =~ "some updated about_form_message"
    end
  end
end
