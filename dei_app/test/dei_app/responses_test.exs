defmodule DeiApp.ResponsesTest do
  use DeiApp.DataCase

  alias DeiApp.Responses

  describe "responses" do
    alias DeiApp.Responses.Response

    @valid_attrs %{compensation: 42, compensation_range: "some compensation_range", email: "some email", gender: "some gender", hispanic_latinx: true, races: [], tenure: 42, work_category: "some work_category"}
    @update_attrs %{compensation: 43, compensation_range: "some updated compensation_range", email: "some updated email", gender: "some updated gender", hispanic_latinx: false, races: [], tenure: 43, work_category: "some updated work_category"}
    @invalid_attrs %{compensation: nil, compensation_range: nil, email: nil, gender: nil, hispanic_latinx: nil, races: nil, tenure: nil, work_category: nil}

    def response_fixture(attrs \\ %{}) do
      {:ok, response} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Responses.create_response()

      response
    end

    test "list_responses/0 returns all responses" do
      response = response_fixture()
      assert Responses.list_responses() == [response]
    end

    test "get_response!/1 returns the response with given id" do
      response = response_fixture()
      assert Responses.get_response!(response.id) == response
    end

    test "create_response/1 with valid data creates a response" do
      assert {:ok, %Response{} = response} = Responses.create_response(@valid_attrs)
      assert response.compensation == 42
      assert response.compensation_range == "some compensation_range"
      assert response.email == "some email"
      assert response.gender == "some gender"
      assert response.hispanic_latinx == true
      assert response.races == []
      assert response.tenure == 42
      assert response.work_category == "some work_category"
    end

    test "create_response/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Responses.create_response(@invalid_attrs)
    end

    test "update_response/2 with valid data updates the response" do
      response = response_fixture()
      assert {:ok, %Response{} = response} = Responses.update_response(response, @update_attrs)
      assert response.compensation == 43
      assert response.compensation_range == "some updated compensation_range"
      assert response.email == "some updated email"
      assert response.gender == "some updated gender"
      assert response.hispanic_latinx == false
      assert response.races == []
      assert response.tenure == 43
      assert response.work_category == "some updated work_category"
    end

    test "update_response/2 with invalid data returns error changeset" do
      response = response_fixture()
      assert {:error, %Ecto.Changeset{}} = Responses.update_response(response, @invalid_attrs)
      assert response == Responses.get_response!(response.id)
    end

    test "delete_response/1 deletes the response" do
      response = response_fixture()
      assert {:ok, %Response{}} = Responses.delete_response(response)
      assert_raise Ecto.NoResultsError, fn -> Responses.get_response!(response.id) end
    end

    test "change_response/1 returns a response changeset" do
      response = response_fixture()
      assert %Ecto.Changeset{} = Responses.change_response(response)
    end
  end
end
