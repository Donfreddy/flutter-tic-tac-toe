import 'package:flutter/material.dart';
import 'package:tic_tac_toe/service_locator.dart';
import 'package:tic_tac_toe/src/animations/bounce_in_animation.dart';
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
                flex: 1,
                child: Align(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: Sizes.dimen_110.w,
                        height: Sizes.dimen_110.h,
                        child: Cross(crossWidth: Sizes.dimen_24.w),
                      ),
                      SizedBox(
                        width: Sizes.dimen_110.w,
                        height: Sizes.dimen_110.h,
                        child: Circle(circleWidth: Sizes.dimen_24.w),
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
                    height: Sizes.dimen_50.h,
                    width: Sizes.dimen_250.w,
                    borderRadius: Sizes.dimen_250.r,
                    child: Text(
                      AppLocalizations.of(context)!.singlePlayer,
                      style: TextStyles.btnText,
                    ),
                  ),
                  SizedBox(height: Sizes.dimen_14.h),
                  BounceInAnimation(
                    child: Btn(
                      onTap: () {
                        // soundService.playSound('click');
                      },
                      color: Colors.white,
                      height: Sizes.dimen_50.h,
                      width: Sizes.dimen_250.w,
                      borderRadius: Sizes.dimen_250.r,
                      child: Text(
                        AppLocalizations.of(context)!.localMultiplayer,
                        style: TextStyles.btnText,
                      ),
                    ),
                  ),
                  SizedBox(height: Sizes.dimen_14.h),
                  Btn(
                    onTap: () {
                      // soundService.playSound('click');
                    },
                    color: Colors.white,
                    height: Sizes.dimen_50.h,
                    width: Sizes.dimen_250.w,
                    borderRadius: Sizes.dimen_250.r,
                    child: Text(
                      AppLocalizations.of(context)!.onlineMode,
                      style: TextStyles.btnText,
                    ),
                  ),
                  SizedBox(height: Sizes.dimen_60.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Btn(
                        onTap: () {
                          //  soundService.playSound('click');
                          Navigator.pushNamed(context, SettingsView.routeName);
                        },
                        color: Colors.white,
                        height: Sizes.dimen_50.h,
                        width: Sizes.dimen_50.w,
                        borderRadius: Sizes.dimen_30.r,
                        child: Icon(
                          Icons.settings,
                          size: Sizes.dimen_30.sp,
                          color: CustomColors.textHeader,
                        ),
                      ),
                      SizedBox(width: Sizes.dimen_10.w),
                      Btn(
                        onTap: () {},
                        color: Colors.white,
                        height: Sizes.dimen_50.h,
                        width: Sizes.dimen_50.w,
                        borderRadius: Sizes.dimen_30.r,
                        child: Icon(
                          Icons.audiotrack_rounded,
                          size: Sizes.dimen_30.sp,
                          color: CustomColors.textHeader,
                        ),
                      ),
                      SizedBox(width: Sizes.dimen_10.w),
                      Btn(
                        onTap: () {},
                        color: Colors.white,
                        height: Sizes.dimen_50.h,
                        width: Sizes.dimen_50.w,
                        borderRadius: Sizes.dimen_30.r,
                        child: Icon(
                          Icons.star,
                          size: Sizes.dimen_30.sp,
                          color: CustomColors.textHeader,
                        ),
                      ),
                      SizedBox(width: Sizes.dimen_10.w),
                      Btn(
                        onTap: () {},
                        color: Colors.white,
                        height: Sizes.dimen_50.h,
                        width: Sizes.dimen_50.w,
                        borderRadius: Sizes.dimen_30.r,
                        child: Icon(
                          Icons.share,
                          size: Sizes.dimen_30.sp,
                          color: CustomColors.textHeader,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.dimen_30.h),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
