defmodule DeiAppWeb.LiveHelpers do
  import Phoenix.LiveView.Helpers

  @doc """
  Renders a component inside the `DeiAppWeb.ModalComponent` component.

  The rendered modal receives a `:return_to` option to properly update
  the URL when the modal is closed.

  ## Examples

      <%= live_modal @socket, DeiAppWeb.CampaignLive.FormComponent,
        id: @campaign.id || :new,
        action: @live_action,
        campaign: @campaign,
        return_to: Routes.campaign_index_path(@socket, :index) %>
  """
  def live_modal(socket, component, opts) do
    path = Keyword.fetch!(opts, :return_to)
    modal_opts = [id: :modal, return_to: path, component: component, opts: opts]
    live_component(socket, DeiAppWeb.ModalComponent, modal_opts)
  end
end
