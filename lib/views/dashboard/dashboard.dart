import 'package:flutter/material.dart';
import 'package:mobclinic/components/cardProcedimentos_widget.dart';
import 'package:mobclinic/components/home/navigator.dart';
import 'package:mobclinic/global/globals.dart';
import 'package:flutter/services.dart';

const platform = MethodChannel('uk.spiralarm.display/metrics');

class DashboardHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Global.white,
      child: Container(
        color: Global.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: (MediaQuery.of(context).size.height) -
                  (MediaQuery.of(context).padding.top) -
                  120,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Lista de Procedimentos',
                        style: TextStyle(color: Global.mediumBlue),
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      children: [
                        CardProcedimentos(
                          titlecard: 'Limpeza de pele',
                          subtitlecard: 'Rosto, costa e peitos',
                          icon: Icons.arrow_forward_ios_rounded,
                        ),
                        CardProcedimentos(
                          titlecard: 'Limpeza de pele',
                          subtitlecard: 'Rosto, costa e peitos',
                          icon: Icons.arrow_forward_ios_rounded,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom),
              child: Container(
                height: 120 - MediaQuery.of(context).padding.bottom,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                        onTap: () {},
                        child: NavigatorHome(
                          title: 'Home',
                          icon: Icons.home_rounded,
                        )),
                    NavigatorHome(
                        title: 'Histórico de atendimento',
                        icon: Icons.description_rounded),
                    NavigatorHome(
                        title: 'Calendário', icon: Icons.event_rounded),
                    NavigatorHome(
                        title: 'Mensagens',
                        icon: Icons.question_answer_rounded),
                    NavigatorHome(
                        title: 'Anamnésia', icon: Icons.assignment_ind_rounded),
                    NavigatorHome(
                        title: 'Confirmar Agenda',
                        icon: Icons.playlist_add_check_rounded),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
