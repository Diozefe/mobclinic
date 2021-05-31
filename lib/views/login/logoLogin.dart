import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobclinic/components/icons/myicons.dart';

class LogoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool keyboardpress = MediaQuery.of(context).viewInsets.bottom > 0;
    final double heightBox = (MediaQuery.of(context).size.height / 4) - 40;
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Container(
        height: keyboardpress ? 0.0 : heightBox,
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: SvgPicture.asset(
                iconLogo,
                height: 40,
                width: 40,
              ),
            ),
            SvgPicture.asset(
              logoMobclinic,
              height: 23,
              width: 140,
            ),
          ],
        ),
      ),
    );
  }
}
