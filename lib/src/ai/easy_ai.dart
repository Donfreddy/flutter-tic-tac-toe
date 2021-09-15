import 'package:tic_tac_toe/src/views/single_player_game_view.dart';

import 'ai.dart';

class EasyAI extends AI {
  @override
  List<int> getMove(List<List<GameState>> board, int turns) {
    var emptyCells = getEmptyCells(board);
    return emptyCells[0];
  }
}
