import 'package:flutter/material.dart';
import 'package:mobclinic/global/global_colors.dart';

class TextTitleScreen extends StatelessWidget {
  final String titlename;
  const TextTitleScreen(this.titlename, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titlename,
      style: TextStyle(
        color: Global.text_primary_color,
        fontFamily: 'Roboto',
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
