import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/extensions/widget_ex.dart';
import 'package:flutter_widgets/src/utils/image_shape_radius.dart';

class NetworkImageView extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;
  final ImageShapeRadius radius;
  final Widget? placeholder;
  final Widget? errorWidget;

  const NetworkImageView({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.radius = ImageShapeRadius.zero,
    this.placeholder,
    this.errorWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? imageUrl = url;
    return imageUrl != null
        ? CachedNetworkImage(
            imageUrl: imageUrl,
            height: height,
            width: width,
            imageBuilder: (context, image) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: _borderRadius(),
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
              );
            },
            placeholder: (context, url) {
              return placeholder ?? _buildDefaultPlaceHolder().toShimmer();
            },
            errorWidget: (context, url, error) {
              return errorWidget ?? _buildDefaultPlaceHolder();
            },
          )
        : placeholder ?? _buildDefaultPlaceHolder();
  }

  Widget _buildDefaultPlaceHolder() {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: _borderRadius(),
      ),
    );
  }

  BorderRadius _borderRadius() {
    double borderRadius =
        radius.value == double.infinity ? (height ?? 0) / 2 : radius.value;
    return BorderRadius.circular(borderRadius);
  }
}
