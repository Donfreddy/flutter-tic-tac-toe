import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter/services.dart';
import 'package:tic_tac_toe/src/common/constants/app_assets.dart';
import 'package:tic_tac_toe/src/common/constants/size_constants.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';
import 'package:tic_tac_toe/src/themes/style.dart';
import 'package:tic_tac_toe/src/common/extensions/size_extensions.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  static const routeName = '/settings_view';

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // ignore: prefer_single_quotes
            buildModal(context, 'F.A.Q', """
RULES FOR TIC-TAC-TOE

1. The game is played on a grid that's 3 squares by 3 squares.

2. You are X, your friend (or the computer in this case) is O. Players take turns putting their marks in empty squares.

3. The first player to get 3 of her marks in a row (up, down, across, or diagonally) is the winner.

4. When all 9 squares are full, the game is over. If no player has 3 marks in a row, the game ends in a tie.

RÈGLES POUR LE TIC-TAC-TOE

1. Le jeu se joue sur une grille de 3 cases par 3 cases.

2. Vous êtes X, votre ami (ou l'ordinateur dans ce cas) est O. Les joueurs placent à tour de rôle leurs marques dans les cases vides.

3. Le premier joueur qui obtient 3 de ses marques dans une rangée (vers le haut, vers le bas, à travers ou en diagonale) est le gagnant.

4. Lorsque les 9 cases sont pleines, la partie est terminée. Si aucun joueur ne dispose de trois marques consécutives, le jeu se termine par une égalité.
             """);
          },
          child: const Text('Open Modal'),
        ),
      ),
    );
  }

  Future buildModal(BuildContext context, String title, String content, {bool hasTwoBtn = true}) {
    return showModal(
      context: context,
      configuration: const FadeScaleTransitionConfiguration(
        transitionDuration: Times.medium,
        reverseTransitionDuration: Times.short,
      ),
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.dimen_12.r),
        ),
        title: Center(
          child: Text(
            title,
            style: TextStyles.modalTitle,
          ),
        ),
        titlePadding: const EdgeInsets.all(Sizes.dimen_20),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: Sizes.dimen_20) + const EdgeInsets.only(bottom: Sizes.dimen_14),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity.w,
              color: Colors.black.withOpacity(0.04),
              height: 1,
            ),
            // SizedBox(height: Sizes.dimen_10.h),
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: Sizes.dimen_2.h),
                    child: Text(
                      content,
                      style: TextStyles.modalContent,
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(height: Sizes.dimen_10.h),
            Container(
              width: double.infinity.w,
              color: Colors.black.withOpacity(0.04),
              height: 1,
            ),
            SizedBox(height: Sizes.dimen_6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (!hasTwoBtn) Container(),
                Visibility(
                  visible: hasTwoBtn,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Image.asset(
                      AppAssets.checkMark,
                      width: Sizes.dimen_40.w,
                      color: CustomColors.r,
                    ),
                    onPressed: () async {
                      HapticFeedback.vibrate();
                      Navigator.pop(context);
                    },
                  ),
                ),
                IconButton(
                  padding: const EdgeInsets.all(0),
                  icon: Image.asset(
                    AppAssets.close,
                    width: Sizes.dimen_40.w,
                    color: CustomColors.g,
                  ),
                  onPressed: () {
                    HapticFeedback.vibrate();
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
