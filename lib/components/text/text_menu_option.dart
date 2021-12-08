import 'package:flutter/material.dart';
import 'package:mobclinic/global/global_colors.dart';

class TextMenuOption extends StatelessWidget {
  final String text;
  const TextMenuOption(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-1.3, 0),
      child: Text(
        text,
        style: TextStyle(
          color: Global.text_primary_color,
          fontFamily: 'Roboto',
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
