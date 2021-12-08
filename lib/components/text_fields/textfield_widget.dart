import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobclinic/global/global_colors.dart';
import 'package:mobclinic/models/event_model.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIconData;
  final IconData? sufifxIconData;
  final bool obscureText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Color? labelStyleColor;

  const TextFieldWidget({
    Key? key,
    this.obscureText = false,
    this.onChanged,
    this.hintText,
    this.prefixIconData,
    this.sufifxIconData,
    this.keyboardType,
    this.labelStyleColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Home>(context);

    return TextField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: Global.black,
        fontSize: 14.0,
      ),
      cursorColor: Global.mainBlue,
      decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: Icon(
            prefixIconData,
            size: 18,
            color: Global.lightBlue,
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Global.lightBlue),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              model.isVisible = !model.isVisible;
            },
            child: Icon(
              sufifxIconData,
              size: 18,
              color: Global.mainBlue,
            ),
          ),
          labelStyle: TextStyle(color: labelStyleColor)),
    );
  }
}
