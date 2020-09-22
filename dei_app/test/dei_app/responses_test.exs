defmodule DeiApp.ResponsesTest do
  use DeiApp.DataCase

  alias DeiApp.Responses

  describe "responses" do
    alias DeiApp.Responses.Response

    @valid_attrs %{compensation_amount: 42, email: "some email", employment_type: "some employment_type", feedback: "some feedback", gender: "some gender", is_hispanic_latinx: true, may_include_salary: true, races: [], tenure: 42, work_category: "some work_category"}
    @update_attrs %{compensation_amount: 43, email: "some updated email", employment_type: "some updated employment_type", feedback: "some updated feedback", gender: "some updated gender", is_hispanic_latinx: false, may_include_salary: false, races: [], tenure: 43, work_category: "some updated work_category"}
    @invalid_attrs %{compensation_amount: nil, email: nil, employment_type: nil, feedback: nil, gender: nil, is_hispanic_latinx: nil, may_include_salary: nil, races: nil, tenure: nil, work_category: nil}

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
      assert response.compensation_amount == 42
      assert response.email == "some email"
      assert response.employment_type == "some employment_type"
      assert response.feedback == "some feedback"
      assert response.gender == "some gender"
      assert response.is_hispanic_latinx == true
      assert response.may_include_salary == true
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
      assert response.compensation_amount == 43
      assert response.email == "some updated email"
      assert response.employment_type == "some updated employment_type"
      assert response.feedback == "some updated feedback"
      assert response.gender == "some updated gender"
      assert response.is_hispanic_latinx == false
      assert response.may_include_salary == false
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
