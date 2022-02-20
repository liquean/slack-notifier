class SocketService
  require 'faye/websocket'
  require 'eventmachine'
  require 'json'

  def start_socket
    EM.run do
      ws = Faye::WebSocket::Client.new('ws://localhost:8080/')
      ws.on :message do |event|
        data = JSON.parse(event.data)
        manager = InventoryManager.new(data['store'], data['model'], data['inventory'])
        manager.create_entry
      end
    end
  end
end
