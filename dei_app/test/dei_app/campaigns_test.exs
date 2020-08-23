defmodule DeiApp.CampaignsTest do
  use DeiApp.DataCase

  alias DeiApp.Campaigns

  describe "campaigns" do
    alias DeiApp.Campaigns.Campaign

    @valid_attrs %{email: "some email", is_anonymous: true, is_compensation_a_range: true, is_compensation_requested: true, is_race_multiselect: true, reference_ethnicity_hispanic_latinx: 42, reference_gender_female: 42, reference_gender_male: 42, reference_gender_other: 42, reference_race_asian: 42, reference_race_black_or_african_american: 42, reference_race_native_american_or_alaskan_native: 42, reference_race_native_hawaiian_or_other_pacific_islander: 42, reference_race_other: 42, reference_race_white: 42, work_category: "some work_category"}
    @update_attrs %{email: "some updated email", is_anonymous: false, is_compensation_a_range: false, is_compensation_requested: false, is_race_multiselect: false, reference_ethnicity_hispanic_latinx: 43, reference_gender_female: 43, reference_gender_male: 43, reference_gender_other: 43, reference_race_asian: 43, reference_race_black_or_african_american: 43, reference_race_native_american_or_alaskan_native: 43, reference_race_native_hawaiian_or_other_pacific_islander: 43, reference_race_other: 43, reference_race_white: 43, work_category: "some updated work_category"}
    @invalid_attrs %{email: nil, is_anonymous: nil, is_compensation_a_range: nil, is_compensation_requested: nil, is_race_multiselect: nil, reference_ethnicity_hispanic_latinx: nil, reference_gender_female: nil, reference_gender_male: nil, reference_gender_other: nil, reference_race_asian: nil, reference_race_black_or_african_american: nil, reference_race_native_american_or_alaskan_native: nil, reference_race_native_hawaiian_or_other_pacific_islander: nil, reference_race_other: nil, reference_race_white: nil, work_category: nil}

    def campaign_fixture(attrs \\ %{}) do
      {:ok, campaign} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Campaigns.create_campaign()

      campaign
    end

    test "list_campaigns/0 returns all campaigns" do
      campaign = campaign_fixture()
      assert Campaigns.list_campaigns() == [campaign]
    end

    test "get_campaign!/1 returns the campaign with given id" do
      campaign = campaign_fixture()
      assert Campaigns.get_campaign!(campaign.id) == campaign
    end

    test "create_campaign/1 with valid data creates a campaign" do
      assert {:ok, %Campaign{} = campaign} = Campaigns.create_campaign(@valid_attrs)
      assert campaign.email == "some email"
      assert campaign.is_anonymous == true
      assert campaign.is_compensation_a_range == true
      assert campaign.is_compensation_requested == true
      assert campaign.is_race_multiselect == true
      assert campaign.reference_ethnicity_hispanic_latinx == 42
      assert campaign.reference_gender_female == 42
      assert campaign.reference_gender_male == 42
      assert campaign.reference_gender_other == 42
      assert campaign.reference_race_asian == 42
      assert campaign.reference_race_black_or_african_american == 42
      assert campaign.reference_race_native_american_or_alaskan_native == 42
      assert campaign.reference_race_native_hawaiian_or_other_pacific_islander == 42
      assert campaign.reference_race_other == 42
      assert campaign.reference_race_white == 42
      assert campaign.work_category == "some work_category"
    end

    test "create_campaign/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Campaigns.create_campaign(@invalid_attrs)
    end

    test "update_campaign/2 with valid data updates the campaign" do
      campaign = campaign_fixture()
      assert {:ok, %Campaign{} = campaign} = Campaigns.update_campaign(campaign, @update_attrs)
      assert campaign.email == "some updated email"
      assert campaign.is_anonymous == false
      assert campaign.is_compensation_a_range == false
      assert campaign.is_compensation_requested == false
      assert campaign.is_race_multiselect == false
      assert campaign.reference_ethnicity_hispanic_latinx == 43
      assert campaign.reference_gender_female == 43
      assert campaign.reference_gender_male == 43
      assert campaign.reference_gender_other == 43
      assert campaign.reference_race_asian == 43
      assert campaign.reference_race_black_or_african_american == 43
      assert campaign.reference_race_native_american_or_alaskan_native == 43
      assert campaign.reference_race_native_hawaiian_or_other_pacific_islander == 43
      assert campaign.reference_race_other == 43
      assert campaign.reference_race_white == 43
      assert campaign.work_category == "some updated work_category"
    end

    test "update_campaign/2 with invalid data returns error changeset" do
      campaign = campaign_fixture()
      assert {:error, %Ecto.Changeset{}} = Campaigns.update_campaign(campaign, @invalid_attrs)
      assert campaign == Campaigns.get_campaign!(campaign.id)
    end

    test "delete_campaign/1 deletes the campaign" do
      campaign = campaign_fixture()
      assert {:ok, %Campaign{}} = Campaigns.delete_campaign(campaign)
      assert_raise Ecto.NoResultsError, fn -> Campaigns.get_campaign!(campaign.id) end
    end

    test "change_campaign/1 returns a campaign changeset" do
      campaign = campaign_fixture()
      assert %Ecto.Changeset{} = Campaigns.change_campaign(campaign)
    end
  end
end
