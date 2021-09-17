import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/src/views/pick_side_view.dart';
import 'package:tic_tac_toe/src/views/select_difficulty.dart';
import 'package:tic_tac_toe/src/views/settings_view.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';
import 'package:tic_tac_toe/src/views/home_view.dart';
import 'package:tic_tac_toe/src/views/single_player_game_view.dart';
import 'package:tic_tac_toe/src/views/two_player_game_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Game',
      theme: ThemeData(
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
        canvasColor: CustomColors.greyBackground,
      ),
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case HomeView.routeName:
                return HomeView();
              case PickSideView.routeName:
                return const PickSideView();
              case SinglePlayerGameView.routeName:
                return const SinglePlayerGameView();
              case TwoPlayerGameView.routeName:
                return const TwoPlayerGameView();
              case SelectDifficulty.routeName:
                return const SelectDifficulty();
              case SettingsView.routeName:
                return const SettingsView();
              case '':
                return Container();
              default:
                return HomeView();
            }
          },
        );
      },
    );
  }
}
