import 'package:tic_tac_toe/src/common/models/move.dart';
import 'package:tic_tac_toe/src/utils/enums.dart';

class Test {
  // This function returns true if there are moves
  // remaining on the board. It returns false if
  // there are no moves left to play.
  bool isMovesLeft(List<List<GameState>> board) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == GameState.blank) {
          return true;
        }
      }
    }
    return false;
  }

  /// This will return the best possible move for the player
  getBestMove(List<List<GameState>> board) {
    // try all possible moves
    List<int> newBoard;
    // will contain our next best score
    Move bestMove = Move(score: -10000, move: -1);

    return bestMove;
  }

  /// Returns the best possible score for a certain board condition.
  /// This method implements the stopping condition.
  getBestScore(List<List<GameState>> board, int currentPlayer) {}

  getVictoryStream() {}
}


/**
 * https://course.elementsofai.com/2/3
 * https://www.pico.net/kb/what-algorithm-for-a-tic-tac-toe-game-can-i-use-to-determine-the-best-move-for-the-ai/
 * https://cs50.harvard.edu/ai/2020/projects/0/tictactoe/
 * https://www.geeksforgeeks.org/minimax-algorithm-in-game-theory-set-3-tic-tac-toe-ai-finding-optimal-move/
 * 
 * https://github.com/CodingTrain/website/tree/main/CodingChallenges/CC_154_Tic_Tac_Toe_Minimax
 * 
 * https://github.com/jakubjaniec/tictactoe
 */