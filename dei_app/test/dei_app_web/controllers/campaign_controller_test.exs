defmodule DeiAppWeb.CampaignControllerTest do
  use DeiAppWeb.ConnCase

  alias DeiApp.Campaigns

  @create_attrs %{email: "some email", is_anonymous: true, is_compensation_a_range: true, is_compensation_requested: true, is_race_multiselect: true, reference_ethnicity_hispanic_latinx: 42, reference_gender_female: 42, reference_gender_male: 42, reference_gender_other: 42, reference_race_asian: 42, reference_race_black_or_african_american: 42, reference_race_native_american_or_alaskan_native: 42, reference_race_native_hawaiian_or_other_pacific_islander: 42, reference_race_other: 42, reference_race_white: 42, work_category: "some work_category"}
  @update_attrs %{email: "some updated email", is_anonymous: false, is_compensation_a_range: false, is_compensation_requested: false, is_race_multiselect: false, reference_ethnicity_hispanic_latinx: 43, reference_gender_female: 43, reference_gender_male: 43, reference_gender_other: 43, reference_race_asian: 43, reference_race_black_or_african_american: 43, reference_race_native_american_or_alaskan_native: 43, reference_race_native_hawaiian_or_other_pacific_islander: 43, reference_race_other: 43, reference_race_white: 43, work_category: "some updated work_category"}
  @invalid_attrs %{email: nil, is_anonymous: nil, is_compensation_a_range: nil, is_compensation_requested: nil, is_race_multiselect: nil, reference_ethnicity_hispanic_latinx: nil, reference_gender_female: nil, reference_gender_male: nil, reference_gender_other: nil, reference_race_asian: nil, reference_race_black_or_african_american: nil, reference_race_native_american_or_alaskan_native: nil, reference_race_native_hawaiian_or_other_pacific_islander: nil, reference_race_other: nil, reference_race_white: nil, work_category: nil}

  def fixture(:campaign) do
    {:ok, campaign} = Campaigns.create_campaign(@create_attrs)
    campaign
  end

  describe "index" do
    test "lists all campaigns", %{conn: conn} do
      conn = get(conn, Routes.campaign_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Campaigns"
    end
  end

  describe "new campaign" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.campaign_path(conn, :new))
      assert html_response(conn, 200) =~ "New Campaign"
    end
  end

  describe "create campaign" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.campaign_path(conn, :create), campaign: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.campaign_path(conn, :show, id)

      conn = get(conn, Routes.campaign_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Campaign"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.campaign_path(conn, :create), campaign: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Campaign"
    end
  end

  describe "edit campaign" do
    setup [:create_campaign]

    test "renders form for editing chosen campaign", %{conn: conn, campaign: campaign} do
      conn = get(conn, Routes.campaign_path(conn, :edit, campaign))
      assert html_response(conn, 200) =~ "Edit Campaign"
    end
  end

  describe "update campaign" do
    setup [:create_campaign]

    test "redirects when data is valid", %{conn: conn, campaign: campaign} do
      conn = put(conn, Routes.campaign_path(conn, :update, campaign), campaign: @update_attrs)
      assert redirected_to(conn) == Routes.campaign_path(conn, :show, campaign)

      conn = get(conn, Routes.campaign_path(conn, :show, campaign))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, campaign: campaign} do
      conn = put(conn, Routes.campaign_path(conn, :update, campaign), campaign: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Campaign"
    end
  end

  describe "delete campaign" do
    setup [:create_campaign]

    test "deletes chosen campaign", %{conn: conn, campaign: campaign} do
      conn = delete(conn, Routes.campaign_path(conn, :delete, campaign))
      assert redirected_to(conn) == Routes.campaign_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.campaign_path(conn, :show, campaign))
      end
    end
  end

  defp create_campaign(_) do
    campaign = fixture(:campaign)
    %{campaign: campaign}
  end
end
