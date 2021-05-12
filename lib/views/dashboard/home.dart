import 'package:flutter/material.dart';
import 'package:mobclinic/components/bottomNavigator_widget.dart';
import 'package:mobclinic/components/cardProcedimentos_widget.dart';
import 'package:mobclinic/global/globals.dart';

class DashboardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Global.white,
      appBar: AppBar(
        backgroundColor: Global.white,
        shadowColor: Global.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          padding: const EdgeInsets.all(8.0),
          children: [
            CardProcedimentos(
              titlecard: 'Limpeza de pele',
              subtitlecard: 'Rosto, costa e peitos',
              icon: Icons.arrow_forward_ios_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
