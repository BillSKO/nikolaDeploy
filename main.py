import time
import websocket

def on_message(ws, message):
    print(f"📩 Meddelande: {message}")

def on_error(ws, error):
    print(f"❌ Fel: {error}")

def on_close(ws, close_status_code, close_msg):
    print("🔒 Anslutning stängd.")

def on_open(ws):
    print("🚀 Anslutning öppen.")
    ws.send('{"msg_type":"ping"}')

if __name__ == "__main__":
    websocket.enableTrace(True)
    ws = websocket.WebSocketApp("wss://echo.websocket.org/",
                                on_open=on_open,
                                on_message=on_message,
                                on_error=on_error,
                                on_close=on_close)
    while True:
        try:
            ws.run_forever()
        except KeyboardInterrupt:
            break
        except Exception as e:
            print(f"⚠️ Återansluter efter fel: {e}")
            time.sleep(5)
