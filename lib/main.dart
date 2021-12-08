import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mobclinic/screens/start/start.dart';
import 'global/global_colors.dart';
import 'models/dashboard_model.dart';
import 'models/event_model.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Global.primary_color,
    ),
  );
  initializeDateFormatting().then((_) => runApp(MobClinic()));
}

class MobClinic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Home(),
        ),
        ChangeNotifierProvider(
          create: (context) => Dashboard(),
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
        home: StartScrenn(),
      ),
    );
  }
}
