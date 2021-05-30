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
    /**---------------PEGGANDO PROVIDER----------------- */
    final model = Provider.of<HomeModel>(context);
    /**------------------------------------------------- */
    final size = MediaQuery.of(context).size;
    final bool keyBoardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: Global.white,
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 400),
            curve: Curves.easeInOutQuad,
            top: keyBoardOpen ? -size.height / 3.7 : 0.0,
            child: Container(
              // height: size.height / 3,
              color: Global.mediumBlue,
              width: size.width,
              height: keyBoardOpen ? 200 : (size.height / 2),
              child: Padding(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  /*COLOCAR LOGO*/
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'images/logo_mobclinic.png',
                          scale: 6,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextFieldWidget(
                  keyboardType: TextInputType.emailAddress,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            Text(
                              'Lembre de mim',
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Esqueceu a senha?',
                          style: TextStyle(
                            color: Global.mediumBlue,
                          ),
                        ),
                      ],
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
