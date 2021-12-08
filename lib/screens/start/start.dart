import 'package:flutter/material.dart';
import 'package:mobclinic/components/buttons/button_recent_acess.dart';
import 'package:mobclinic/components/text/text_walcome_user.dart';
import 'package:mobclinic/global/global_colors.dart';

import 'drawer/drawer_start.dart';

class StartScrenn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double maxWidthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Global.white,
      appBar: AppBar(
        backgroundColor: Global.white,
        shadowColor: Global.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Global.mediumBlue),
      ),
      drawer: DrawerStart(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    //User Name
                    child: TextWelcomeUser('Diozefe'),
                  ),
                  Text(
                    'Boas vindas',
                    style: TextStyle(
                        color: Global.text_primary_color,
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ), //Boas vindas
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Global.disabled_color,
          ), //Line
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 32),
            child: Text(
              'ACESSOS RECENTES',
              style: TextStyle(
                color: Global.text_primary_color,
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                ButtonRecentAcess(),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Global.primary_color,
        foregroundColor: Global.white,
      ),
    );
  }
}
