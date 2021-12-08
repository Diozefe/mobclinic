import 'package:flutter/material.dart';
import 'package:mobclinic/components/forms/textInputLabel.dart';
import 'package:mobclinic/components/text_fields/textfield_widget.dart';
import 'package:mobclinic/models/event_model.dart';
import 'package:provider/provider.dart';

class Regiter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Home>(context);
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 11),
              child: TextInputLabel(
                text: 'Senha',
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
          ],
        ),
      ),
    );
  }
}
