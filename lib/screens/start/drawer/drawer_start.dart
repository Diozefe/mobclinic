import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mobclinic/components/text/text_menu_option.dart';
import 'package:mobclinic/global/global_colors.dart';
import 'package:mobclinic/screens/pre_service/preservice.dart';

class DrawerStart extends StatelessWidget {
  const DrawerStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          InkWell(
            onTap: () => {debugPrint('perfil clicado')},
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Global.secundary_color,
              ),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/profile/profile.jpeg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(40),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                            blurRadius: 5,
                            spreadRadius: 0,
                          )
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Diozefe Morais',
                          style: TextStyle(
                            color: Global.white,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(height: 6),
                        Text(
                          'Atendente',
                          style: TextStyle(
                            color: Global.white,
                            fontSize: 14,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 24, right: 0),
            title: TextMenuOption('Pré-atendimento'),
            leading: Icon(
              MdiIcons.noteEdit,
              color: Global.icons_primary_color,
              size: 24,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PreServiceScreen()));
            },
          ),
          ListTile(
              contentPadding: EdgeInsets.only(left: 24, right: 0),
              title: TextMenuOption('Confirmar agenda'),
              leading: Icon(
                Icons.event_available_sharp,
                color: Global.icons_primary_color,
                size: 24,
              )),
          ListTile(
            contentPadding: EdgeInsets.only(left: 24, right: 0),
            title: TextMenuOption('Lista de procedimentos'),
            leading: Icon(
              Icons.format_list_bulleted_sharp,
              color: Global.icons_primary_color,
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
