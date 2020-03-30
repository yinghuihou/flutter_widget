import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

/// JTImageView用来展示图片,本地图片和网络图片
///
/// placeholder为图片加载过程中的占位图，仅限于加载网络图片时候使用
/// 设置边框时候，图片的实际大小值等于设置的宽高 - 边框宽度,设置为圆形图时候，会忽略圆角大小，无论是否设置
class JTImageWidget extends StatelessWidget {
  ///展示图片的地址，可以是本地文件名，或者网络图片路径
  final String imageUrl;

  ///图片格式，默认为webp，可以自定义png，jpg等
  final String imageFormat;

  ///占位图，本地资源文件名字
  final String placeholder;

  final double width;

  final double height;

  ///是否是圆形图片
  final bool isCircle;

  ///图片边框大小，默认无
  final double borderWidth;

  ///图片边框颜色，默认无
  final Color borderColor;

  ///图片边框阴影，默认无
  final BoxShadow shadow;

  ///图片圆角大小
  final double borderRadius;

  /// 图片填充方式
  final BoxFit fit;

  /// 图片内部padding
  final EdgeInsetsGeometry padding;

  /// 图片外部margin
  final EdgeInsetsGeometry margin;

  const JTImageWidget({
    Key key,
    @required this.imageUrl,
    this.imageFormat = "webp",
    this.placeholder,
    this.width = 40,
    this.height = 40,
    this.padding,
    this.margin,
    this.isCircle = false,
    this.borderWidth,
    this.borderColor = const Color(0xFFBDBDBD),
    this.borderRadius,
    this.shadow,
    this.fit = BoxFit.fill,
  })  : assert(width != null),
        assert(height != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
            shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
            border: (borderWidth != null && borderColor != null)
                ? Border.all(color: borderColor, width: borderWidth)
                : null,
            borderRadius: (!isCircle && borderRadius != null)
                ? BorderRadius.circular(borderRadius + (borderWidth ?? 0))
                : null,
            boxShadow: shadow != null ? [shadow] : null),
        child: isCircle
            ? ClipOval(
                child: getImageView(),
              )
            : (borderRadius != null
                ? ClipRRect(
                    child: getImageView(),
                    borderRadius: BorderRadius.circular(borderRadius),
                  )
                : getImageView()));
  }

  Widget getImageView() {
    if (isNotEmpty(placeholder) && imageUrl.startsWith("http")) {
      ///带有占位图的网络图片加载
      return FadeInImage.assetNetwork(
        placeholder: 'assets/images/${placeholder}.${imageFormat}',
        image: imageUrl,
        width: width,
        height: height,
        alignment: Alignment.center,
        fit: fit,
      );
    } else if (imageUrl.startsWith("http")) {
      ///网络图片加载
      return Image.network(
        imageUrl,
        width: width,
        height: height,
        alignment: Alignment.center,
        fit: fit,
      );
    } else {
      ///本地图片加载
      return Image.asset(
        'assets/images/${imageUrl}.${imageFormat}',
        width: width,
        height: height,
        alignment: Alignment.center,
        fit: fit,
      );
    }
  }
}
