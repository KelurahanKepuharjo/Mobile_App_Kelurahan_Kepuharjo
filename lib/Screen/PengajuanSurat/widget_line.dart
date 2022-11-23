import 'package:flutter/material.dart';
import 'package:kepuharjo_app/Shared/shared.dart';

class WidgetDivider extends StatefulWidget {
  const WidgetDivider({Key key}) : super(key: key);

  @override
  State<WidgetDivider> createState() => _WidgetDividerState();
}

class _WidgetDividerState extends State<WidgetDivider> {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Color(0xFFE9E9E9),
      height: 0,
      thickness: 1,
      indent: 10,
      endIndent: 10,
    );
  }
}
