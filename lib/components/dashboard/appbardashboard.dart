import 'package:flutter/material.dart';
import 'package:mobclinic/components/dashboard/icons.dart';
import 'package:mobclinic/components/icons/myicons.dart';
import 'package:mobclinic/models/dashboard_model.dart';
import 'package:provider/provider.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modelDash = Provider.of<Dashboard>(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width / 2,
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  modelDash.isModify = false;
                },
                onDoubleTap: () {
                  modelDash.isModify = false;
                },
                child: IconAppBar(
                  icon: Icons.list,
                  height: 50,
                ),
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
                iconSvg: bell,
                width: 50,
                height: 60,
                left: 12,
                right: 12,
              ),
            ],
          ),
        )
      ],
    );
  }
}
