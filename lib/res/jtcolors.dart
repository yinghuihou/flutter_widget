import 'package:flutter/material.dart';

class JTColors {
  /// 所有的颜色数量不多，避免对颜色定义过详细。
  /// 使用color_ARGB形式，对特殊/很通用的颜色用类似main_shadow定义，
  /// 对于有透明度的纯RGB，用withOpacity，如Colors.white.withOpacity(0.6)。
  ///
  static const Color primary_color = main_blue;
  static const Color accent_color = Color(0xFF888888);
  static const Color background_color = white;
  static const Color default_text_color = color_757575;

  static const Color main_shadow = Color(0xFFE1E1E1);
  static const Color text_clicked_blue = Color(0x1A3B26ED);
  static const Color grey_divider_line = Color(0xFFF2F2F2);
  static const Color refresh_indicator_color = main_blue;
  static const Color text_blue_color = main_blue;

  static const Color main_blue = Color(0xFF3F51B5);
  static const Color transparent = Color(0x00FFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);

  static const Color color_4B5FFE = Color(0xFF4B5FFE);
  static const Color color_1E1E1E = Color(0xFF1E1E1E);
  static const Color color_F2F2F4 = Color(0xFFF2F2F4);
  static const Color color_F44336 = Color(0xFFF44336);
  static const Color color_448AFF = Color(0xFF448AFF);
  static const Color color_2739F1 = Color(0xFF2739F1);
  static const Color color_F3F4F7 = Color(0xFFF3F4F7);
  static const Color color_757575 = Color(0xFF757575);
  static const Color color_212121 = Color(0xFF212121);
  static const Color color_F5F5F5 = Color(0xFFF5F5F5);
  static const Color color_FF5252 = Color(0xFFFF5252);
  static const Color color_BDBDBD = Color(0xFFBDBDBD);
  static const Color color_DFDFDF = Color(0xFFDFDFDF);
  static const Color color_DDDDDD = Color(0xFFDDDDDD);
  static const Color color_B2B2B2 = Color(0xFFB2B2B2);
  static const Color color_687283 = Color(0xFF687283);
  static const Color color_1B1B4B = Color(0xFF1B1B4B);
  static const Color color_BDC0C5 = Color(0xFFBDC0C5);
  static const Color color_EFEFF4 = Color(0xFFEFEFF4);
  static const Color color_A6ACB5 = Color(0xFFA6ACB5);
  static const Color color_3B26ED = Color(0xFF3B26ED);
  static const Color color_F2F2F2 = Color(0xFFF2F2F2);
  static const Color color_3F51B5 = Color(0xFF3F51B5);
  static const Color color_0F0F0F = Color(0xFF0F0F0F);
  static const Color color_D8D8D8 = Color(0xFFD8D8D8);
  static const Color color_333333 = Color(0xFF333333);
  static const Color color_666666 = Color(0xFF666666);
  static const Color color_FFF9C4 = Color(0xFFFFF9C4);
  static const Color color_FF9800 = Color(0xFFFF9800);
}
