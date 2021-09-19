abstract class AI {
  List<List<int>> getMove(List<List<String>> board, {int? turns});

  List<List<int>> getEmptyCells(List<List<String>> board) {
    List<List<int>> emptyCells = <List<int>>[];
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board.length; j++) {
        if (board[i][j] == ' ') {
          emptyCells.add([i, j]);
        }
      }
    }
    return emptyCells;
  }
}
