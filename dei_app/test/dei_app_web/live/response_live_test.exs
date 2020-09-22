defmodule DeiAppWeb.ResponseLiveTest do
  use DeiAppWeb.ConnCase

  import Phoenix.LiveViewTest

  alias DeiApp.Responses

  @create_attrs %{compensation_amount: 42, email: "some email", employment_type: "some employment_type", feedback: "some feedback", gender: "some gender", is_hispanic_latinx: true, may_include_salary: true, races: [], tenure: 42, work_category: "some work_category"}
  @update_attrs %{compensation_amount: 43, email: "some updated email", employment_type: "some updated employment_type", feedback: "some updated feedback", gender: "some updated gender", is_hispanic_latinx: false, may_include_salary: false, races: [], tenure: 43, work_category: "some updated work_category"}
  @invalid_attrs %{compensation_amount: nil, email: nil, employment_type: nil, feedback: nil, gender: nil, is_hispanic_latinx: nil, may_include_salary: nil, races: nil, tenure: nil, work_category: nil}

  defp fixture(:response) do
    {:ok, response} = Responses.create_response(@create_attrs)
    response
  end

  defp create_response(_) do
    response = fixture(:response)
    %{response: response}
  end

  describe "Index" do
    setup [:create_response]

    test "lists all responses", %{conn: conn, response: response} do
      {:ok, _index_live, html} = live(conn, Routes.response_index_path(conn, :index))

      assert html =~ "Listing Responses"
      assert html =~ response.email
    end

    test "saves new response", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.response_index_path(conn, :index))

      assert index_live |> element("a", "New Response") |> render_click() =~
               "New Response"

      assert_patch(index_live, Routes.response_index_path(conn, :new))

      assert index_live
             |> form("#response-form", response: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#response-form", response: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.response_index_path(conn, :index))

      assert html =~ "Response created successfully"
      assert html =~ "some email"
    end

    test "updates response in listing", %{conn: conn, response: response} do
      {:ok, index_live, _html} = live(conn, Routes.response_index_path(conn, :index))

      assert index_live |> element("#response-#{response.id} a", "Edit") |> render_click() =~
               "Edit Response"

      assert_patch(index_live, Routes.response_index_path(conn, :edit, response))

      assert index_live
             |> form("#response-form", response: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#response-form", response: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.response_index_path(conn, :index))

      assert html =~ "Response updated successfully"
      assert html =~ "some updated email"
    end

    test "deletes response in listing", %{conn: conn, response: response} do
      {:ok, index_live, _html} = live(conn, Routes.response_index_path(conn, :index))

      assert index_live |> element("#response-#{response.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#response-#{response.id}")
    end
  end

  describe "Show" do
    setup [:create_response]

    test "displays response", %{conn: conn, response: response} do
      {:ok, _show_live, html} = live(conn, Routes.response_show_path(conn, :show, response))

      assert html =~ "Show Response"
      assert html =~ response.email
    end

    test "updates response within modal", %{conn: conn, response: response} do
      {:ok, show_live, _html} = live(conn, Routes.response_show_path(conn, :show, response))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Response"

      assert_patch(show_live, Routes.response_show_path(conn, :edit, response))

      assert show_live
             |> form("#response-form", response: @invalid_attrs)
             |> render_change() =~ "can&apos;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#response-form", response: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.response_show_path(conn, :show, response))

      assert html =~ "Response updated successfully"
      assert html =~ "some updated email"
    end
  end
end
