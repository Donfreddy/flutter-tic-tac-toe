import 'package:flutter/foundation.dart';
import 'package:tic_tac_toe/src/common/constants/app_constant.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketsNotifications {
  static final WebSocketsNotifications _sockets = WebSocketsNotifications._internal();

  factory WebSocketsNotifications() {
    return _sockets;
  }

  WebSocketsNotifications._internal();

  late IOWebSocketChannel _channel;

  bool _isOn = false;
  final ObserverList<Function> _listeners = ObserverList<Function>();

  // Initialization of the WebSockets connection with the server
  initCommunication() async {
    try {
      _channel = IOWebSocketChannel.connect(SERVER_ADDRESS);

      _channel.stream.listen(_onReceptionOfMessageFromServer);
    } catch (e) {
      //
    }
  }

  // Close WebSockets communication
  reset() {
    _channel.sink.close();
    _isOn = false;
  }

  //Sends message to server
  send(String message) {
    if (_isOn) {
      _channel.sink.add(message);
    }
  }

  // Management of the routines to call when receiving messages from the server
  addListener(Function callback) {
    _listeners.add(callback);
  }

  removeListener(Function callback) {
    _listeners.remove(callback);
  }

  /// Calling all methods to listen for incoming messages
  _onReceptionOfMessageFromServer(message) {
    _isOn = true;
    for (var callback in _listeners) {
      callback(message);
    }
  }
}

WebSocketsNotifications sockets = WebSocketsNotifications();
