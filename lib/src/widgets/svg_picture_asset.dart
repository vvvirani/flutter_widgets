import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgPictureAsset extends StatelessWidget {
  final String assetName;
  final String? package;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;
  final Widget Function(BuildContext)? placeholderBuilder;

  const SvgPictureAsset(
    this.assetName, {
    super.key,
    this.package,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.contain,
    this.placeholderBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      height: height,
      width: width,
      color: color,
      fit: fit,
      package: package,
      placeholderBuilder: placeholderBuilder,
    );
  }
}
