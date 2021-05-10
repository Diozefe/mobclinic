import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobclinic/global/globals.dart';
import 'package:mobclinic/models/home_model.dart';
import 'package:mobclinic/components/textfield_widget.dart';
import 'package:mobclinic/components/button_widget.dart';
import 'package:mobclinic/components/wave_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final size = MediaQuery.of(context).size;
    final bool keyBoardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: Global.white,
      body: Stack(
        children: [
          Container(
            height: size.height - 200,
            color: Global.mediumBlue,
          ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOutQuad,
            top: keyBoardOpen ? -size.height / 3.7 : 0.0,
            child: WaveWidget(
              size: size,
              yOffset: size.height / 3.0,
              color: Global.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70),
            child: Row(
              /*COLOCAR LOGO*/
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'images/logo_mobclinic.png',
                    scale: 6,
                  ),
                ),
                /* Text(
                  'Login',
                  style: TextStyle(
                    color: Global.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                  ),
                ), */
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFieldWidget(
                  hintText: 'Email',
                  obscureText: false,
                  prefixIconData: Icons.mail_outline,
                  sufifxIconData: model.isValid ? Icons.check : null,
                  onChanged: (value) {
                    model.isValidEmail(value);
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFieldWidget(
                      hintText: 'Senha',
                      obscureText: model.isVisible ? false : true,
                      prefixIconData: Icons.lock_outline,
                      sufifxIconData: model.isVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Esqueceu a senha?',
                      style: TextStyle(
                        color: Global.mediumBlue,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                ButtonWidget(
                  onClick: () {},
                  title: 'Login',
                  hasBorder: false,
                ),
                SizedBox(
                  height: 10.0,
                ),
                ButtonWidget(
                  onClick: () {},
                  title: 'Sign Up',
                  hasBorder: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
