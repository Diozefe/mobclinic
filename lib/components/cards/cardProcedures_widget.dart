import 'package:flutter/material.dart';
import 'package:mobclinic/global/global_colors.dart';

class CardProcedimentos extends StatelessWidget {
  final String? titlecard;
  final String? subtitlecard;
  final IconData? icon;

  const CardProcedimentos(
      {Key? key, this.titlecard, this.subtitlecard, this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListTile(
          title: Text(titlecard!),
          subtitle: Text(subtitlecard!),
          leading: Icon(
            Icons.list_alt,
            size: 35,
          ),
          trailing: Icon(
            icon,
            color: Global.mediumBlue,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
