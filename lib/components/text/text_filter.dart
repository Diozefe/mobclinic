import 'package:flutter/material.dart';

class TextFilter extends StatelessWidget {
  final String? textFilterName;
  final Color? color;
  const TextFilter({
    this.textFilterName,
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 22),
      child: Text(
        textFilterName!,
        style: TextStyle(
          color: color,
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
