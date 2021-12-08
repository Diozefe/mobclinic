import 'package:flutter/material.dart';
import 'package:mobclinic/global/global_colors.dart';

class ButtonRecentAcess extends StatelessWidget {
  const ButtonRecentAcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxWidthScreen = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: InkWell(
        onTap: () => {},
        child: Container(
          height: 48,
          width: maxWidthScreen,
          decoration: BoxDecoration(
            color: Global.primary_color,
            border: Border.all(color: Global.primary_color, width: 0),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              'PRÉ-ATENDIMENTO',
              style: TextStyle(
                color: Global.text_white_color,
                fontFamily: 'Roboto',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
