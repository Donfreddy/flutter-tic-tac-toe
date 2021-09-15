import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/components/btn.dart';
import 'package:tic_tac_toe/src/components/circle.dart';
import 'package:tic_tac_toe/src/components/cross.dart';
import 'package:tic_tac_toe/src/components/gradient_bg.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return GradientBG(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Align(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          SizedBox(
                            width: 90.0,
                            height: 90.0,
                            child: Cross(),
                          ),
                          SizedBox(
                            width: 90.0,
                            height: 90.0,
                            child: Circle(),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          SizedBox(
                            width: 90.0,
                            height: 90.0,
                            child: Circle(),
                          ),
                          SizedBox(
                            width: 90.0,
                            height: 90.0,
                            child: Cross(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Btn(
                        onTap: () {},
                        height: 60,
                        width: 250,
                        borderRadius: 250,
                        color: Colors.white,
                        gradient: const [CustomColors.headerCircle, CustomColors.headerGreyLight],
                        child: const Text(
                          'Single Player',
                          style: TextStyle(color: CustomColors.textWhite, fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Btn(
                        onTap: () {},
                        color: Colors.white,
                        gradient: const [CustomColors.headerCircle, CustomColors.headerGreyLight],
                        height: 60,
                        width: 250,
                        borderRadius: 250,
                        child: const Text(
                          'Multiplayer',
                          style: TextStyle(color: CustomColors.textWhite, fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(height: 60),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Btn(
                            onTap: () {},
                            color: Colors.white,
                            gradient: const [CustomColors.headerCircle, CustomColors.headerGreyLight],
                            height: 50,
                            width: 50,
                            borderRadius: 30,
                            child: const Icon(
                              Icons.settings,
                              size: 30.0,
                              color: CustomColors.textWhite,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Btn(
                            onTap: () {},
                            color: Colors.white,
                            gradient: const [CustomColors.headerCircle, CustomColors.headerGreyLight],
                            height: 50,
                            width: 50,
                            borderRadius: 30,
                            child: const Icon(
                              Icons.audiotrack_rounded,
                              size: 30.0,
                              color: CustomColors.textWhite,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
