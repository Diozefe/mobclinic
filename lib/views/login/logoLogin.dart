import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobclinic/components/icons/myicons.dart';

class LogoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Container(
        height: MediaQuery.of(context).size.height / 4,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
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
