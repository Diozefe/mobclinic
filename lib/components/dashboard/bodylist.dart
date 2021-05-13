import 'package:flutter/material.dart';
import 'package:mobclinic/components/dashboard/bodySquad.dart';

class BodyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeadDashboard(),
        ListView(
          shrinkWrap: true,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 16),
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width - 32,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 16),
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width - 32,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 16),
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width - 32,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8, left: 16),
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width - 32,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
