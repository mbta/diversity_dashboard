defmodule DeiApp.CampaignsTest do
  use DeiApp.DataCase

  alias DeiApp.Campaigns

  describe "campaigns" do
    alias DeiApp.Campaigns.Campaign

    @valid_attrs %{
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
      orm_receipt_message: nil,
      protection_code: nil,
      response_form_status: nil,
      salary_question_type: nil,
      should_allow_anonymous: nil,
      work_category_options: nil
    }

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
      assert campaign.about_form_message == "some about_form_message"
      assert campaign.dashboard_status == "some dashboard_status"
      assert campaign.form_receipt_message == "some form_receipt_message"
      assert campaign.protection_code == "some protection_code"
      assert campaign.response_form_status == "some response_form_status"
      assert campaign.salary_question_type == "some salary_question_type"
      assert campaign.should_allow_anonymous == true
      assert campaign.work_category_options == "some work_category_options"
    end

    test "create_campaign/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Campaigns.create_campaign(@invalid_attrs)
    end

    test "update_campaign/2 with valid data updates the campaign" do
      campaign = campaign_fixture()
      assert {:ok, %Campaign{} = campaign} = Campaigns.update_campaign(campaign, @update_attrs)
      assert campaign.about_form_message == "some updated about_form_message"
      assert campaign.dashboard_status == "some updated dashboard_status"
      assert campaign.form_receipt_message == "some updated form_receipt_message"
      assert campaign.protection_code == "some updated protection_code"
      assert campaign.response_form_status == "some updated response_form_status"
      assert campaign.salary_question_type == "some updated salary_question_type"
      assert campaign.should_allow_anonymous == false
      assert campaign.work_category_options == "some updated work_category_options"
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
