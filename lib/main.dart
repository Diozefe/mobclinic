import 'package:flutter/material.dart';

void main() {
  runApp(MobClinic());
}

class MobClinic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        accentColor: Colors.blue[300],
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[500],
            textTheme: ButtonTextTheme.accent),
      ),
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  double _cardStateEmail = 0;
  double _cardStateSenha = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Image.asset(
                'images/logo-mobclinic.jpg',
                scale: 15,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Card(
              elevation: _cardStateEmail,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: TextField(
                  onTap: () {
                    setState(() {
                      _cardStateSenha = 0;
                      _cardStateEmail = 10;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Email ou CPF',
                    border: UnderlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
          Card(
            elevation: _cardStateSenha,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onTap: () {
                  setState(() {
                    _cardStateSenha = 10;
                    _cardStateEmail = 0;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
          ),
          ElevatedButton(
            child: Text(
              'Entrar',
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              setState(() {
                _cardStateSenha = 0;
                _cardStateEmail = 0;
              });
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}
