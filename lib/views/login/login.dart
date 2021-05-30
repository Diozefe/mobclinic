import 'package:flutter/material.dart';
import 'package:mobclinic/global/globals.dart';
import 'package:mobclinic/views/login/logoLogin.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Global.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LogoLogin(),
        ],
      ),
    );
  }
}
