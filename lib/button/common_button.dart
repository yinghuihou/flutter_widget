import 'package:flutter/material.dart';
import 'package:flutter_widget/res/jtcolors.dart';

/// 通用按钮
///
/// 实现了水波纹效果，可设置圆角，填充，高亮等效果。
///buttonText: 必传参数，button文案
///tapCallBack: 必传参数，点击处理
///borderRadius: 圆角大小
///isHighLight: 是否高亮,可以设置高亮和置灰时的背景颜色和文字颜色
///highLightBackgroundColor: 设置按钮高亮时的背景颜色
///disableBackgroundColor: 设置按钮置灰时的背景颜色
///highLightTextColor: 设置按钮高亮时的文字颜色
///disableTextColor: 设置按钮置灰时的文字颜色
///height: 按钮高度
///width: 按钮宽度
///isFill: 是否填充
///borderColor: 非填充时可通过borderColor设置边框颜色
///fontSize: 文案字体大小
///isBottom: 是否是底部吸底button
///splashColor: 设置水波纹颜色
///isGradient:是否是渐变背景
class CommonButton extends StatelessWidget {
  final String buttonText;
  final Function tapCallBack;
  final double borderRadius;
  final bool isHighLight;
  final Color highLightBackgroundColor;
  final Color disableBackgroundColor;
  final Color highLightTextColor;
  final Color disableTextColor;
  final double height;
  final double width;
  final bool isFill;
  final Color borderColor;
  final double fontSize;
  final bool isBottom;
  final Color splashColor;
  final bool isGradient;
  final EdgeInsetsGeometry margin;//自定义间距

  CommonButton({
    Key key,
    @required this.buttonText,
    @required this.tapCallBack,
    this.borderRadius = 4,
    this.borderColor = JTColors.main_blue,
    this.isHighLight: true,
    this.highLightBackgroundColor = JTColors.main_blue,
    this.disableBackgroundColor = JTColors.color_DFDFDF,
    this.highLightTextColor = JTColors.white,
    this.disableTextColor,
    this.height = 45,
    this.width = double.infinity,
    this.isFill = true,
    this.fontSize = 16,
    this.isBottom = false,
    this.splashColor,
    this.isGradient = true,
    this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: isBottom
          ? BoxDecoration(color: JTColors.white, boxShadow: [
              BoxShadow(color: JTColors.main_shadow, blurRadius: 2)
            ])
          : BoxDecoration(),
      padding: isBottom
          ? EdgeInsets.only(top: 10, bottom: 10, left: 16, right: 16)
          : EdgeInsets.zero,
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: isFill
              ? BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  gradient: isGradient
                      ? LinearGradient(
                          colors: [
                            JTColors.color_2739F1,
                            JTColors.color_448AFF
                          ],
                        )
                      : null,
                  color: isHighLight
                      ? highLightBackgroundColor
                      : disableBackgroundColor,
                )
              : BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  border: Border.all(color: borderColor, width: 1)),
          child: InkWell(
            onTap: () {
              if (tapCallBack != null) {
                tapCallBack();
              }
            },
            borderRadius: new BorderRadius.circular(borderRadius),
            splashColor: splashColor ?? Theme.of(context).splashColor,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                buttonText,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: isFill
                    ? TextStyle(
                        color: isHighLight
                            ? highLightTextColor
                            : disableTextColor ??
                                JTColors.black.withOpacity(0.16),
                        fontSize: fontSize)
                    : TextStyle(color: disableTextColor, fontSize: fontSize),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
