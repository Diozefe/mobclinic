import 'package:flutter/material.dart';
import 'package:mobclinic/global/global_colors.dart';

class TextWelcomeUser extends StatelessWidget {
  final String name;
  const TextWelcomeUser(this.name, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Olá, ',
          style: TextStyle(
            color: Global.text_primary_color,
            fontSize: 32,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          name,
          style: TextStyle(
              color: Global.text_primary_color,
              fontSize: 32,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
