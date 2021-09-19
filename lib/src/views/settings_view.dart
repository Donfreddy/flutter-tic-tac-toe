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
            buildModal(context, 'title', 'content');
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
            SizedBox(height: Sizes.dimen_10.h),
            Text(
              content,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(height: Sizes.dimen_10.h),
            Container(
              width: double.infinity.w,
              color: Colors.black.withOpacity(0.04),
              height: 1,
            ),
            SizedBox(height: Sizes.dimen_10.h),
            Row(
              children: [
                if (!hasTwoBtn) Container(),
                Visibility(
                  visible: hasTwoBtn,
                  child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: Image.asset(
                      AppAssets.checkMark,
                      width: Sizes.dimen_30.w,
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
                    width: Sizes.dimen_30.w,
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
