import 'package:flutter/material.dart';
import 'package:mobclinic/global/globals.dart';
import 'package:mobclinic/models/home_model.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData sufifxIconData;
  final bool obscureText;
  final Function onChanged;

  const TextFieldWidget({
    Key key,
    this.hintText,
    this.prefixIconData,
    this.sufifxIconData,
    this.obscureText,
    this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);

    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      style: TextStyle(
        color: Global.mediumBlue,
        fontSize: 14.0,
      ),
      cursorColor: Global.mediumBlue,
      decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: Icon(
            prefixIconData,
            size: 18,
            color: Global.mediumBlue,
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Global.mediumBlue),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              model.isVisible = !model.isVisible;
            },
            child: Icon(
              sufifxIconData,
              size: 18,
              color: Global.mediumBlue,
            ),
          ),
          labelStyle: TextStyle(color: Global.mediumBlue)),
    );
  }
}
