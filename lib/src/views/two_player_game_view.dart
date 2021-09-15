import 'package:flutter/material.dart';

class TwoPlayerGameView extends StatefulWidget {
  const TwoPlayerGameView({Key? key}) : super(key: key);

  static const routeName = '/two_player_game_view';

  @override
  _TwoPlayerGameViewState createState() => _TwoPlayerGameViewState();
}

class _TwoPlayerGameViewState extends State<TwoPlayerGameView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('2 Players'),
        ],
      ),
    );
  }
}
