defmodule DeiAppWeb.ResponseLive.Index do
  use DeiAppWeb, :live_view

  alias DeiApp.Responses
  alias DeiApp.Responses.Response

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :responses, list_responses())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Response")
    |> assign(:response, Responses.get_response!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Response")
    |> assign(:response, %Response{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Responses")
    |> assign(:response, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    response = Responses.get_response!(id)
    {:ok, _} = Responses.delete_response(response)

    {:noreply, assign(socket, :responses, list_responses())}
  end

  defp list_responses do
    Responses.list_responses()
  end
end
