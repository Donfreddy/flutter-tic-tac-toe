import 'package:tic_tac_toe/src/views/single_player_game_view.dart';

enum GameDifficulty { easy, medium, hard }

abstract class AI {
  List<int> getMove(List<List<GameState>> board, int turns);

  List<List<int>> getEmptyCells(List<List<GameState>> board) {
    List<List<int>> emptyCells = <List<int>>[];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == GameState.blank) {
          emptyCells.add([i, j]);
        }
      }
    }
    return emptyCells;
  }
}
