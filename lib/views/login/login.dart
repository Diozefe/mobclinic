import 'package:flutter/material.dart';
import 'package:mobclinic/components/button.dart';
import 'package:mobclinic/components/forms/textInputLabel.dart';
import 'package:mobclinic/components/textfield_widget.dart';
import 'package:mobclinic/global/globals.dart';
import 'package:mobclinic/models/event_model.dart';
import 'package:mobclinic/views/login/logoLogin.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<HomeModel>(context);
    final size = MediaQuery.of(context).size;
    final bool keyBoardPress = MediaQuery.of(context).viewInsets.bottom > 0;
    final double heightBox = (MediaQuery.of(context).size.height / 4) - 40;
    final double paddinTop = MediaQuery.of(context).padding.top;
    return Material(
      color: Global.white,
      child: SingleChildScrollView(
        child: Stack(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate,
              top: keyBoardPress ? -size.height / 3.7 : 0.0,
              child: LogoLogin(),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: keyBoardPress ? 0.0 : heightBox + paddinTop),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: keyBoardPress ? paddinTop : 50,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        color: Global.black,
                        fontFamily: 'Inter-Variable',
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      'Digite suas credenciais para continuar',
                      style: TextStyle(
                        color: Global.black,
                        fontFamily: 'Lato-Regular',
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 11),
                    child: TextInputLabel(
                      text: 'Email',
                      fontSize: 12,
                    ),
                  ),
                  TextFieldWidget(
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                    prefixIconData: Icons.ac_unit_outlined,
                    sufifxIconData: model.isValid ? Icons.check : null,
                    onChanged: (value) {
                      model.isValidEmail(value);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 11),
                    child: TextInputLabel(
                      text: 'Senha',
                      fontSize: 12,
                    ),
                  ),
                  TextFieldWidget(
                    obscureText: model.isVisible ? false : true,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIconData: Icons.lock_outline,
                    sufifxIconData: model.isVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onChanged: (value) {
                      model.isValidEmail(value);
                    },
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                              color: Global.black,
                              fontFamily: 'Lato-Regular',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: ButtonMain(
                      text: 'Entrar',
                      onTap: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: ButtonMain(
                      isOffButton: true,
                      text: 'Eu não tenho conta',
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
