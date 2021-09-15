import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/components/gradient_bg.dart';

class SelectDifficulty extends StatefulWidget {
  const SelectDifficulty({Key? key}) : super(key: key);

  static const routeName = '/select_difficulty';

  @override
  _SelectDifficultyState createState() => _SelectDifficultyState();
}

class _SelectDifficultyState extends State<SelectDifficulty> {
  @override
  Widget build(BuildContext context) {
    return GradientBG(
      child: Scaffold(
        body: Container(),
      ),
    );
  }
}
