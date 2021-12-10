import 'package:flutter/cupertino.dart';
import 'package:mobclinic/global/global_colors.dart';

class TextFormTitleField extends StatelessWidget {
  final String textField;
  const TextFormTitleField(
    this.textField, {
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      textField,
      style: TextStyle(
        color: Global.text_primary_color,
        fontSize: 15,
        fontFamily: 'Roboto',
      ),
    );
  }
}
