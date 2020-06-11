defmodule FgHttpWeb.NewDeviceLive do
  @moduledoc """
  Manages LiveView for New Devices
  """

  use Phoenix.LiveView
  use Phoenix.HTML
  alias FgHttp.Util.FgCrypto
  alias FgHttpWeb.Router.Helpers, as: Routes

  def mount(_params, %{"device" => device}, socket) do
    if connected?(socket), do: initialize_vpn_config(socket)

    {:ok, assign(socket, :device, device)}
  end

  def create_device_link(socket, device) do
    path =
      Routes.device_path(
        socket,
        :create,
        device: [
          public_key: device.public_key,
          name: device.name,
          user_id: device.user_id
        ]
      )

    ~E"""
    <%= link("This looks good, verify and continue. ->", to: path, method: :post) %>
    """
  end

  def handle_info({:pubkey, pubkey}, socket) do
    device = %{socket.assigns.device | public_key: pubkey}

    {:noreply, assign(socket, :device, device)}
  end

  defp initialize_vpn_config(_socket) do
    # XXX: Establish link with FgVpn process and receive pubkey and IP
    pubkey = FgCrypto.rand_string()
    :timer.send_after(3000, self(), {:pubkey, pubkey})
  end
end
