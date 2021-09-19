import '../screenutil/screenutil.dart';

extension SizeExtension on double {
  double get w => ScreenUtil().setWidth(this);

  double get h => ScreenUtil().setHeight(this);

  double get r => ScreenUtil().radius(this);

  double get sp => ScreenUtil().setSp(this);
}

// import 'package:tic_tac_toe/src/common/extensions/size_extensions.dart';
