import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/helpers/game_communication.dart';
import 'package:tic_tac_toe/src/views/game_view.dart';

class StartView extends StatefulWidget {
  const StartView({Key? key}) : super(key: key);

  @override
  _StartViewState createState() => _StartViewState();
}

class _StartViewState extends State<StartView> {
  final TextEditingController _name = TextEditingController();
  late String playerName;
  List<dynamic> playersList = <dynamic>[];

  @override
  void initState() {
    super.initState();

    game.addListener(_onGameDataReceived);
  }

  @override
  void dispose() {
    game.removeListener(_onGameDataReceived);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TicTacToe'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              _buildJoin(),
              const Text('List of players:'),
              _playersList(),
            ],
          ),
        ),
      ),
    );
  }

  _onGameDataReceived(message) {
    switch (message["action"]) {
      case "players_list":
        playersList = message["data"];

        // force rafraîchissement
        setState(() {});
        break;

      case '_game':
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => GamePage(
                opponentName: message["data"], // Nom de l'adversaire
                character: 'O',
              ),
            ));
        break;
    }
  }

  Widget _buildJoin() {
    if (game.playerName != "") {
      return Container();
    }
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            controller: _name,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Enter your name',
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              icon: const Icon(Icons.person),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _onGameJoin,
              child: const Text('Join...'),
            ),
          ),
        ],
      ),
    );
  }

  _onGameJoin() {
    game.send('join', _name.text);

    /// Forcer un rafraîchissement
    setState(() {});
  }

  Widget _playersList() {
    if (game.playerName == "") {
      return Container();
    }

    List<Widget> children = playersList.map((playerInfo) {
      return ListTile(
        title: Text(playerInfo["name"]),
        trailing: ElevatedButton(
          onPressed: () {
            _onPlayGame(playerInfo["name"], playerInfo["id"]);
          },
          child: const Text('Play'),
        ),
      );
    }).toList();

    return Column(
      children: children,
    );
  }

  _onPlayGame(String opponentName, String opponentId) {
    game.send('_game', opponentId);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => GamePage(
            opponentName: opponentName,
            character: 'X',
          ),
        ));
  }
}
