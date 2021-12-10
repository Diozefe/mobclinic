import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobclinic/global/global_colors.dart';

/**
 * [prefixIcon] espera um icone literal Ex.: Icons.icon
 */
class TextFielForm extends StatelessWidget {
  final String? hintText;
  final IconData? prefixIcon;
  final int? maxLength;
  final int? maxLines;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  const TextFielForm(
      {Key? key,
      this.hintText,
      this.prefixIcon,
      this.onChanged,
      this.maxLength,
      this.keyboardType,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      style: TextStyle(
        color: Global.text_primary_color,
        fontSize: 15,
      ),
      keyboardType: keyboardType,
      onChanged: (context) {},
      maxLength: maxLength,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Global.input_off_color,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: Global.input_primary_color,
            width: 1,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Global.input_off_color,
        ),
        prefixIcon: prefixIcon != null
            ? Icon(
                prefixIcon,
                size: 24,
                color: Global.primary_color,
              )
            : null,
        filled: false,
      ),
    );
  }
}
