import 'package:flutter/material.dart';
import 'package:tic_tac_toe/service_locator.dart';
import 'package:tic_tac_toe/src/animations/bounce_in_animation.dart';
import 'package:tic_tac_toe/src/components/btn.dart';
import 'package:tic_tac_toe/src/components/circle.dart';
import 'package:tic_tac_toe/src/components/cross.dart';
import 'package:tic_tac_toe/src/components/gradient_bg.dart';
import 'package:tic_tac_toe/src/services/sound_service.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';
import 'package:tic_tac_toe/src/views/pick_side_view.dart';

class HomeView extends StatelessWidget {
  final soundService = locator<SoundService>();

  HomeView({Key? key}) : super(key: key);

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      SizedBox(
                        width: 110.0,
                        height: 110.0,
                        child: Cross(crossWidth: 25.0),
                      ),
                      SizedBox(
                        width: 110.0,
                        height: 110.0,
                        child: Circle(circleWidth: 25.0),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Btn(
                    onTap: () {
                      // soundService.playSound('click');
                      Navigator.pushNamed(context, PickSideView.routeName);
                    },
                    height: 50,
                    width: 250,
                    borderRadius: 250,
                    child: const Text(
                      'Single Player',
                      style: TextStyle(color: CustomColors.textHeader, fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 14),
                  BounceInAnimation(
                    child: Btn(
                      onTap: () {
                        // soundService.playSound('click');
                      },
                      color: Colors.white,
                      height: 50,
                      width: 250,
                      borderRadius: 250,
                      child: const Text(
                        'Local Multiplayer',
                        style: TextStyle(color: CustomColors.textHeader, fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  Btn(
                    onTap: () {
                     // soundService.playSound('click');
                    },
                    color: Colors.white,
                    height: 50,
                    width: 250,
                    borderRadius: 250,
                    child: const Text(
                      'Online Mode',
                      style: TextStyle(color: CustomColors.textHeader, fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Btn(
                        onTap: () {
                         //  soundService.playSound('click');
                        },
                        color: Colors.white,
                        height: 50,
                        width: 50,
                        borderRadius: 30,
                        child: const Icon(
                          Icons.settings,
                          size: 30.0,
                          color: CustomColors.textHeader,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Btn(
                        onTap: () {},
                        color: Colors.white,
                        height: 50,
                        width: 50,
                        borderRadius: 30,
                        child: const Icon(
                          Icons.audiotrack_rounded,
                          size: 30.0,
                          color: CustomColors.textHeader,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Btn(
                        onTap: () {},
                        color: Colors.white,
                        height: 50,
                        width: 50,
                        borderRadius: 30,
                        child: const Icon(
                          Icons.star,
                          size: 30.0,
                          color: CustomColors.textHeader,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Btn(
                        onTap: () {},
                        color: Colors.white,
                        height: 50,
                        width: 50,
                        borderRadius: 30,
                        child: const Icon(
                          Icons.share,
                          size: 30.0,
                          color: CustomColors.textHeader,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
