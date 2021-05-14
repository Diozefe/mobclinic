import 'package:flutter/material.dart';

class BodySquad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          HeadDashboard(),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 16),
                    child: Container(
                      height: 150,
                      width: (MediaQuery.of(context).size.width / 2) - 24,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 8),
                    child: Container(
                      height: 150,
                      width: (MediaQuery.of(context).size.width / 2) - 24,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8, left: 16),
                    child: Container(
                      height: 150,
                      width: (MediaQuery.of(context).size.width / 2) - 24,
                      color: Colors.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 16, left: 8),
                    child: Container(
                      height: 150,
                      width: (MediaQuery.of(context).size.width / 2) - 24,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeadDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Row(
          children: [
            Container(
              height: 30,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Olá, Felipe Haussler',
                  style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
          child: Text(
              'Um simples texto informativo. Mais um texto informativo só que simples.'),
        ),
      ),
    ]);
  }
}
