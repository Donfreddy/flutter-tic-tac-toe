import 'ai.dart';

class EasyAI extends AI {
  @override
  List<List<int>> getMove(List<List<String>> board, {int? turns}) {
    var emptyCells = getEmptyCells(board);
    return emptyCells;
  }
}

EasyAI easyAI = EasyAI();
