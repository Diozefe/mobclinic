import 'package:flutter/material.dart';
import 'package:mobclinic/components/dashboard/appbardashboard.dart';
import 'package:mobclinic/components/dashboard/bodySquad.dart';
import 'package:mobclinic/components/dashboard/bodylist.dart';
import 'package:mobclinic/global/globals.dart';
import 'package:mobclinic/models/dashboard_model.dart';
import 'package:provider/provider.dart';

class DashboardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final modelDash = Provider.of<DashboardModel>(context);
    return Scaffold(
      backgroundColor: Global.white,
      appBar: AppBar(
        backgroundColor: Global.white,
        shadowColor: Global.white,
        elevation: 0,
        actions: [
          AppBarDashboard(),
        ],
        iconTheme: IconThemeData(color: Global.mediumBlue),
      ),
      body: Stack(children: [
        modelDash.getIsModified() ? BodySquad() : BodyList(),
      ]),
    );
  }

  Widget modifyBody(Widget widget) {
    return widget;
  }
}
