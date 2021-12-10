import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobclinic/components/text/form/text_form_title.dart';
import 'package:mobclinic/components/text/text_title_screen.dart';
import 'package:mobclinic/components/text_fields/text_field_form_widget.dart';
import 'package:mobclinic/components/text_fields/textfield_widget.dart';
import 'package:mobclinic/global/global_colors.dart';

class CreateScheduleScheen extends StatelessWidget {
  const CreateScheduleScheen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.utc(
        DateTime.now().year, DateTime.now().month, DateTime.now().day);
    return Scaffold(
      backgroundColor: Global.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Global.primary_color,
        ),
        backgroundColor: Global.white,
        shadowColor: Global.white,
        elevation: 0,
        title: TextTitleScreen('Criar Marcação'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.chevron_left_sharp,
            size: 35,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24, right: 24),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 32),
              TextFormTitleField('CPF do Cliente'),
              SizedBox(height: 5),
              TextFielForm(
                hintText: 'Ex. 11122233344',
                prefixIcon: Icons.badge_sharp,
                maxLength: 11,
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 5),
              TextFormTitleField('Procedimento'),
              SizedBox(height: 5),
              TextFielForm(
                hintText: 'Ex. Limpeza de pele',
                prefixIcon: Icons.search_sharp,
              ),
              SizedBox(height: 5),
              TextFormTitleField('Profissional'),
              SizedBox(height: 5),
              TextFielForm(
                hintText: 'Ex. Maria Isabel',
                prefixIcon: Icons.search_sharp,
              ),
              SizedBox(height: 5),
              TextFormTitleField('Data'),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 24,
                    child: TextFielForm(
                      keyboardType: TextInputType.datetime,
                      hintText:
                          '${today.day.toString()}/${today.month.toString()}/${today.year.toString()}',
                      prefixIcon: Icons.today_sharp,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              TextFormTitleField('Hora'),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 24,
                    child: TextFielForm(
                        keyboardType: TextInputType.datetime,
                        hintText: '00:00',
                        prefixIcon: Icons.schedule_sharp),
                  ),
                ],
              ),
              SizedBox(height: 5),
              TextFormTitleField('Observação'),
              SizedBox(height: 5),
              TextFielForm(
                maxLines: 2,
                maxLength: 70,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: 36,
                  child: Text(
                    'CRIAR MARCAÇÃO',
                    style: TextStyle(
                      color: Global.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
