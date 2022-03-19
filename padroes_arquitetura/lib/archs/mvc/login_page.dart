import 'package:flutter/material.dart';
import 'package:padroes_arquitetura/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  void _loginSuccess() {
    Navigator.of(context)
      .pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        )
      );
  }

  void _loginError() {
    ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(
        content: Text('Login Error'),
        backgroundColor: Colors.red,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'email'
                ),
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Campo não pode ser nulo';
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}