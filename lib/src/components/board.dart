import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tic_tac_toe/service_locator.dart';
import 'package:tic_tac_toe/src/components/circle.dart';
import 'package:tic_tac_toe/src/components/cross.dart';
import 'package:tic_tac_toe/src/services/board_service.dart';
import 'package:tic_tac_toe/src/utils/enums.dart';

class Board extends StatefulWidget {
  const Board({Key? key}) : super(key: key);

  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  final boardService = locator<BoardService>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MapEntry<List<List<String>>, MapEntry<BoardState, String>>>(
      stream: Rx.combineLatest2(
        boardService.board$,
        boardService.boardState$,
        (List<List<String>> a, MapEntry<BoardState, String> b) => MapEntry(a, b),
      ),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }

        final List<List<String>> board = snapshot.data!.key;
        final MapEntry<BoardState, String> state = snapshot.data!.value;

        if (state.key == BoardState.done) {
          boardService.resetBoard();

          String title = 'Winner';

          if (state.value == '') {
            title = "Draw";
          }
        }
        return Container();
      },
    );
  }

  Widget _buildBox(int i, int j, item) {
    BoxBorder border = const Border();
    BorderSide borderStyle = const BorderSide(width: 1, color: Colors.black26);
    double height = 80;
    double width = 60;
    if (j == 1) {
      border = Border(right: borderStyle, left: borderStyle);
      height = width = 80;
    }
    if (i == 1) {
      border = Border(top: borderStyle, bottom: borderStyle);
    }
    if (i == 1 && j == 1) {
      border = Border(top: borderStyle, bottom: borderStyle, left: borderStyle, right: borderStyle);
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: border,
      ),
      height: height,
      width: width,
      child: Center(
        child: item == ' '
            ? null
            : item == 'X'
                ? const Cross()
                : const Circle(),
      ),
    );
  }
}
