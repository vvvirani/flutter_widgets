import 'package:flutter/material.dart';

class StatefulWidgetWrapper extends StatefulWidget {
  final VoidCallback onInit;
  final Widget child;

  const StatefulWidgetWrapper({
    super.key,
    required this.onInit,
    required this.child,
  });
  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState extends State<StatefulWidgetWrapper> {
  @override
  void initState() {
    super.initState();
    widget.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
