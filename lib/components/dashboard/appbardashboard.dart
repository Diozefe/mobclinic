import 'package:flutter/material.dart';
import 'package:mobclinic/components/dashboard/icons.dart';
import 'package:mobclinic/components/icons/myicons.dart';

class AppBarDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            children: [
              IconAppBar(
                onClick: () {},
                icon: Icons.list,
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconAppBar(
                onClick: () {},
                iconSvg: bell,
                right: 8,
              ),
              IconAppBar(
                onClick: () {},
                iconSvg: user,
                height: 50,
                width: 60,
              ),
            ],
          ),
        )
      ],
    );
  }
}
