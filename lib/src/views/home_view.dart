import 'package:flutter/material.dart';
import 'package:tic_tac_toe/service_locator.dart';
import 'package:tic_tac_toe/src/animations/bounce_in_animation.dart';
import 'package:tic_tac_toe/src/common/constants/app_assets.dart';
import 'package:tic_tac_toe/src/common/constants/size_constants.dart';
import 'package:tic_tac_toe/src/components/btn.dart';
import 'package:tic_tac_toe/src/components/circle.dart';
import 'package:tic_tac_toe/src/components/cross.dart';
import 'package:tic_tac_toe/src/components/gradient_bg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:tic_tac_toe/src/services/sound_service.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';
import 'package:tic_tac_toe/src/themes/style.dart';
import 'package:tic_tac_toe/src/common/extensions/size_extensions.dart';
import 'package:tic_tac_toe/src/views/pick_side_view.dart';
import 'package:tic_tac_toe/src/views/settings_view.dart';

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
                child: Align(
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColors.white,
                      borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
                    ),
                    child: Image.asset(AppAssets.logo, width: Sizes.dimen_160.w),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Btn(
                      onTap: () {
                        // soundService.playSound('click');
                        Navigator.pushNamed(context, PickSideView.routeName);
                      },
                      height: Sizes.dimen_30.h,
                      width: Sizes.dimen_280.w,
                      borderRadius: Sizes.dimen_250.r,
                      child: Text(
                        AppLocalizations.of(context)!.singlePlayer,
                        style: TextStyles.btnText,
                      ),
                    ),
                    SizedBox(height: Sizes.dimen_6.h),
                    BounceInAnimation(
                      child: Btn(
                        onTap: () {
                          // soundService.playSound('click');
                        },
                        color: Colors.white,
                        height: Sizes.dimen_30.h,
                        width: Sizes.dimen_280.w,
                        borderRadius: Sizes.dimen_250.r,
                        child: Text(
                          AppLocalizations.of(context)!.localMultiplayer,
                          style: TextStyles.btnText,
                        ),
                      ),
                    ),
                    SizedBox(height: Sizes.dimen_6.h),
                    Btn(
                      onTap: () {
                        // soundService.playSound('click');
                      },
                      color: Colors.white,
                      height: Sizes.dimen_30.h,
                      width: Sizes.dimen_280.w,
                      borderRadius: Sizes.dimen_250.r,
                      child: Text(
                        AppLocalizations.of(context)!.onlineMode,
                        style: TextStyles.btnText,
                      ),
                    ),
                    SizedBox(height: Sizes.dimen_6.h),
                    Btn(
                      onTap: () {
                        // soundService.playSound('click');
                        Navigator.pushNamed(context, SettingsView.routeName);
                      },
                      color: Colors.white,
                      height: Sizes.dimen_30.h,
                      width: Sizes.dimen_280.w,
                      borderRadius: Sizes.dimen_250.r,
                      child: Text(
                        'Settings',
                        style: TextStyles.btnText,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
