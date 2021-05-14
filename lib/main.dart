import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobclinic/models/dashboard_model.dart';
import 'package:mobclinic/models/home_model.dart';
import 'package:mobclinic/views/dashboard/dashboard.dart';
import 'package:mobclinic/views/preservice/calendar_services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(MobClinic());
}

class MobClinic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => DashboardModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.blue[700],
          accentColor: Colors.blue[300],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[500],
            textTheme: ButtonTextTheme.accent,
          ),
        ),
        home: DashboardHome(),
      ),
    );
  }
}
