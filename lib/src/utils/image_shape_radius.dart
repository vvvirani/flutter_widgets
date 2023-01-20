class ImageShapeRadius {
  const ImageShapeRadius._(this.value);

  final double value;

  static const ImageShapeRadius circle = ImageShapeRadius._(double.infinity);

  static const ImageShapeRadius zero = ImageShapeRadius._(0);

  const ImageShapeRadius.circular({double radius = 0}) : value = radius;
}
