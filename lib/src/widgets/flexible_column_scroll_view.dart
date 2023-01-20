import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/widgets/safe_area_stateless_widget.dart';

class FlexibleColumnScrollView extends SafeAreaStatelessWidget {
  final EdgeInsets? padding;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  const FlexibleColumnScrollView({
    super.key,
    this.padding,
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  }) : super(top: false, bottom: false, left: false, right: false);

  const FlexibleColumnScrollView.withSafeArea({
    super.key,
    this.padding,
    required this.children,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
  }) : super(top: top, bottom: bottom, left: left, right: right);

  @override
  Widget build(BuildContext context) {
    Widget child = CustomScrollView(
      reverse: false,
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: Column(
              mainAxisSize: mainAxisSize,
              mainAxisAlignment: mainAxisAlignment,
              crossAxisAlignment: crossAxisAlignment,
              children: children,
            ),
          ),
        )
      ],
    );
    return SafeArea(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: child,
    );
  }
}
