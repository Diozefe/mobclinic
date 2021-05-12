import 'package:flutter/material.dart';
import 'package:mobclinic/global/globals.dart';

class NavigatorHome extends StatelessWidget {
  final String title;
  final IconData icon;

  const NavigatorHome({Key key, @required this.title, @required this.icon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 100,
          color: Global.mediumBlue,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 40,
                  color: Global.white,
                ),
                Text(
                  title,
                  style: TextStyle(color: Global.white),
                ),
              ],
            ),
          )),
    );
  }
}
