import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/utils/enums.dart';


class SinglePlayerGameView extends StatefulWidget {
  const SinglePlayerGameView({Key? key}) : super(key: key);

  static const routeName = '/single_player_game_view';

  @override
  _SinglePlayerGameViewState createState() => _SinglePlayerGameViewState();
}

class _SinglePlayerGameViewState extends State<SinglePlayerGameView> with TickerProviderStateMixin {
  final activePlayer = GameState.x;
  final winner = GameState.blank;

  double _boardOpacity = 1.0;

  late Animation<double> _boardAnimation;
  late AnimationController _boardController;

  @override
  void initState() {
    super.initState();

    _boardController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _boardAnimation = Tween(begin: 1.0, end: 0.0).animate(_boardController)
      ..addListener(() {
        setState(() {
          _boardOpacity = _boardAnimation.value;
        });
      });
  }

  @override
  void dispose() {
    _boardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('1 Player'),
        ],
      ),
    );
  }
}
