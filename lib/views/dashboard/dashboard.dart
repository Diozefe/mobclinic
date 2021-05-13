import 'package:flutter/material.dart';
import 'package:mobclinic/components/dashboard/appbardashboard.dart';
import 'package:mobclinic/global/globals.dart';

class DashboardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Global.white,
        shadowColor: Global.white,
        elevation: 0,
        actions: [
          AppBarDashboard(),
        ],
      ),
    );
  }
}
