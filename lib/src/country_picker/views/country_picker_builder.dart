import 'package:flutter/material.dart';
import 'package:flutter_widgets/src/country_picker/controller/country_picker_controller.dart';

typedef CountryPickerWidgetBuilder = Widget Function(
  BuildContext context,
  CountryPickerValues value,
);

class CountryPickerBuilder extends StatefulWidget {
  final CountryPickerController controller;
  final CountryPickerWidgetBuilder builder;

  const CountryPickerBuilder({
    super.key,
    required this.controller,
    required this.builder,
  });

  @override
  State<CountryPickerBuilder> createState() => _CountryPickerBuilderState();
}

class _CountryPickerBuilderState extends State<CountryPickerBuilder> {
  late VoidCallback _listener;

  _CountryPickerBuilderState() {
    _listener = () {
      setState(() {});
    };
  }

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_listener);
  }

  @override
  void dispose() {
    super.dispose();
    widget.controller.removeListener(_listener);
  }

  CountryPickerValues get value => widget.controller.value;

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, value);
  }
}

class CountryFlagImageAsset extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;

  const CountryFlagImageAsset({
    super.key,
    required this.path,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: height,
      width: width,
      filterQuality: FilterQuality.high,
      package: 'flutter_widgets',
    );
  }
}
