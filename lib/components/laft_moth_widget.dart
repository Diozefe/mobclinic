import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ModefyDetector extends StatelessWidget {
  final Widget? child;
  final TextFormatter? textFormatter;
  final Function(DateTime, dynamic)? onTap;

  const ModefyDetector({
    Key? key,
    this.child = const Text('Simple Text'),
    this.textFormatter,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return child!;
  }
}
