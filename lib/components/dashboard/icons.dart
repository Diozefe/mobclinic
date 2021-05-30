import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobclinic/global/globals.dart';

class IconAppBar extends StatelessWidget {
  final IconData icon;
  final String iconSvg;
  final double height;
  final double width;
  final double left;
  final double right;

  const IconAppBar({
    Key key,
    this.icon,
    this.iconSvg,
    this.height,
    this.width,
    this.left = 16,
    this.right = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Global.white,
      child: Container(
        height: height,
        width: width,
        child: Padding(
          padding: EdgeInsets.only(left: left, right: right),
          child: icon != null
              ? Icon(
                  icon,
                  color: Global.mediumBlue,
                )
              : SvgPicture.asset(
                  iconSvg,
                  color: Global.mediumBlue,
                ),
        ),
      ),
    );
  }
}
