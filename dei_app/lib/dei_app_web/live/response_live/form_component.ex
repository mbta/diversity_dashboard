defmodule DeiAppWeb.ResponseLive.FormComponent do
  use DeiAppWeb, :live_component

  alias DeiApp.Responses

  @impl true
  def update(%{response: response} = assigns, socket) do
    changeset = Responses.change_response(response)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"response" => response_params}, socket) do
    changeset =
      socket.assigns.response
      |> Responses.change_response(response_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"response" => response_params}, socket) do
    save_response(socket, socket.assigns.action, response_params)
  end

  defp save_response(socket, :edit, response_params) do
    case Responses.update_response(socket.assigns.response, response_params) do
      {:ok, _response} ->
        {:noreply,
         socket
         |> put_flash(:info, "Response updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_response(socket, :new, response_params) do
    case Responses.create_response(response_params) do
      {:ok, _response} ->
        {:noreply,
         socket
         |> put_flash(:info, "Response created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
