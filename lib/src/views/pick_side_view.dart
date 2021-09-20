import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/service_locator.dart';
import 'package:tic_tac_toe/src/common/constants/size_constants.dart';
import 'package:tic_tac_toe/src/components/btn.dart';
import 'package:tic_tac_toe/src/common/extensions/size_extensions.dart';
import 'package:tic_tac_toe/src/components/circle.dart';
import 'package:tic_tac_toe/src/components/cross.dart';
import 'package:tic_tac_toe/src/components/gradient_bg.dart';
import 'package:tic_tac_toe/src/services/board_service.dart';
import 'package:tic_tac_toe/src/services/sound_service.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';
import 'package:tic_tac_toe/src/themes/style.dart';
import 'package:tic_tac_toe/src/views/single_player_game_view.dart';

class PickSideView extends StatefulWidget {
  const PickSideView({Key? key}) : super(key: key);

  static const routeName = '/pick_side_view';

  @override
  _PickSideViewState createState() => _PickSideViewState();
}

class _PickSideViewState extends State<PickSideView> {
  final soundService = locator<SoundService>();
  final boardService = locator<BoardService>();

  String groupValue = 'X';
  void setGroupvalue(value) {
    setState(() {
      groupValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientBG(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(
                'Pick who goes first?',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 26,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: groupValue == 'X' ? CustomColors.white : CustomColors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
                        ),
                        child: SizedBox(
                          width: Sizes.dimen_140.w,
                          height: Sizes.dimen_80.h,
                          child: Cross(crossWidth: Sizes.dimen_24.w),
                        ),
                      ),
                      Radio(
                        onChanged: (String? e) => setGroupvalue('X'),
                        // activeColor: MyTheme.orange,
                        value: 'X',
                        groupValue: groupValue,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'First',
                          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: groupValue == 'O' ? CustomColors.white : CustomColors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
                        ),
                        child: SizedBox(
                          width: Sizes.dimen_140.w,
                          height: Sizes.dimen_80.h,
                          child: Circle(circleWidth: Sizes.dimen_24.w),
                        ),
                      ),
                      Radio(
                        onChanged: (String? e) => setGroupvalue('O'),
                        // activeColor: MyTheme.orange,
                        value: 'O',
                        groupValue: groupValue,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Second',
                          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w700, fontSize: 16),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Btn(
                onTap: () {
                  // soundService.playSound('click');
                  boardService.resetBoard();
                  boardService.setStart(groupValue);
                  if (groupValue == 'O') {
                    boardService.player$.add('X');
                    boardService.botMove();
                  }

                  Navigator.pushNamed(context, SinglePlayerGameView.routeName);
                },
                color: Colors.white,
                height: Sizes.dimen_30.h,
                width: Sizes.dimen_280.w,
                borderRadius: Sizes.dimen_250.r,
                child: Text(
                  'continue',
                  style: TextStyles.btnText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
