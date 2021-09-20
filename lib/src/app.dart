import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/common/constants/app_constant.dart';
import 'package:tic_tac_toe/src/common/screenutil/screenutil.dart';
import 'package:tic_tac_toe/src/themes/style.dart';
import 'package:tic_tac_toe/src/views/pick_side_view.dart';
import 'package:tic_tac_toe/src/views/select_difficulty.dart';
import 'package:tic_tac_toe/src/views/settings_view.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tic_tac_toe/src/views/home_view.dart';
import 'package:tic_tac_toe/src/views/single_player_game_view.dart';
import 'package:tic_tac_toe/src/views/two_player_game_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: APP_NAME,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('fr', ''),
      ],
      theme: ThemeData(
        canvasColor: CustomColors.greyBackground,
        fontFamily: Fonts.nunito,
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
                return Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Not found route for:'),
                      Text(
                        routeSettings.name ?? '',
                        style: const TextStyle(color: CustomColors.r),
                      ),
                    ],
                  ),
                );
            }
          },
        );
      },
    );
  }
}
