defmodule HelloWeb.RoomChannel do
  use HelloWeb, :channel

  def join("room:lobby", _message, socket) do
    {:ok, %{}, socket}
  end

  def join("room:" <> _private_room_id, _message, _socket) do
    raise "called"
    {:error, %{reason: "Unauthorized"}}
  end

  def handle_out(event, payload, socket) do
    push(socket, event, payload)
    {:noreply, socket}
  end

  def broadcast_change(_change) do
    HelloWeb.Endpoint.broadcast("room:lobby", "change", %{a: "b"})
  end
end
