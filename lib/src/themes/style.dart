import 'package:flutter/material.dart';
import 'package:tic_tac_toe/src/common/extensions/size_extensions.dart';
import 'package:tic_tac_toe/src/common/constants/size_constants.dart';
import 'package:tic_tac_toe/src/themes/custom_colors.dart';

class Times {
  static const xshort = Duration(milliseconds: 100);
  static const short = Duration(milliseconds: 200);
  static const medium = Duration(milliseconds: 300);
  static const long = Duration(milliseconds: 500);
  static const xlong = Duration(milliseconds: 600);
}

class Fonts {
  static const String nunito = 'Nunito';
}

class TextStyles {
  static const TextStyle base = TextStyle(fontFamily: Fonts.nunito);

  static TextStyle get name => base.copyWith();

  static TextStyle get btnText => base.copyWith(
        fontSize: Sizes.dimen_24.sp,
        fontWeight: FontWeight.w700,
        color: CustomColors.black,
      );

  static TextStyle get modalTitle => base.copyWith(
        fontSize: Sizes.dimen_20.sp,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get modalContent => base.copyWith(
        fontSize: Sizes.dimen_16.sp,
        fontWeight: FontWeight.w600,
      );
}
