import 'package:flutter/material.dart';
import 'package:mobclinic/global/globals.dart';

class TextInputLabel extends StatelessWidget {
  final String text;
  final double fontSize;
  const TextInputLabel({Key key, this.text, this.fontSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Global.black,
        fontFamily: 'Lato-Regular',
        fontSize: fontSize,
      ),
    );
  }
}
