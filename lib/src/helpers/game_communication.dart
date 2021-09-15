import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:tic_tac_toe/src/helpers/web_sockets_notifications.dart';

class GameCommunication {
  final ObserverList<Function> _listeners = ObserverList<Function>();
  static final GameCommunication _game = GameCommunication._internal();

  String _playerName = '';
  String playerID = '';

  factory GameCommunication() {
    return _game;
  }

  GameCommunication._internal() {
    //
    sockets.initCommunication();

    sockets.addListener(_onMessageReceived);
  }

  String get playerName => _playerName;

  // Management of all messages from the server
  _onMessageReceived(serverMessage) {
    Map message = json.decode(serverMessage);

    switch (message['action']) {
      case 'connect':
        playerID = message['data'];
        break;
      default:
        for (var callback in _listeners) {
          callback(message);
        }
        break;
    }
  }

  send(String action, String data) {
    if (action == 'join') {
      _playerName = data;
    }

    sockets.send(json.encode({'action': action, 'data': data}));
  }

  addListener(Function callback) {
    _listeners.add(callback);
  }

  removeListener(Function callback) {
    _listeners.remove(callback);
  }
}

GameCommunication game = GameCommunication();
