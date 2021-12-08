import 'package:flutter/material.dart';
import 'package:mobclinic/global/global_colors.dart';

class ButtonMain extends StatelessWidget {
  final String? text;
  final Function()? onTap;
  final bool? isOffButton;

  const ButtonMain({
    Key? key,
    this.text,
    this.onTap,
    this.isOffButton = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              color: isOffButton! ? Global.red : Global.white,
              fontFamily: 'Lato-Regular',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        decoration: BoxDecoration(
            color: isOffButton! ? Global.white : Global.mainBlue,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            border:
                isOffButton! ? Border.all(color: Global.red, width: 1) : null),
      ),
    );
  }
}
