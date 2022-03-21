import 'package:flutter/material.dart';
import 'package:padroes_arquitetura/archs/mvc/login_repository.dart';
import 'package:padroes_arquitetura/archs/mvp/login_presenter.dart';
import 'package:padroes_arquitetura/home_page.dart';

class LoginPageMVP extends StatefulWidget {
  const LoginPageMVP({ Key? key }) : super(key: key);

  @override
  State<LoginPageMVP> createState() => _LoginPageMVPState();
}

class _LoginPageMVPState extends State<LoginPageMVP> implements LoginPageContract {
  // final _formKey = GlobalKey<FormState>();
  // UserModel user = UserModel();

  late LoginPresenter presenter;

  @override
  void initState() {
    super.initState();

    presenter = LoginPresenter(
      repository: LoginRepository(),
      viewContract: this,
    );
  }

  @override 
  void loginManager() {
    setState(() {});
  }

  @override
  void loginSuccess() {
    Navigator.of(context)
      .pushReplacement(
        MaterialPageRoute(
          builder: (_) => const HomePage(),
        )
      );
  }

  @override
  void loginError() {
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
        key: presenter.formKey,
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
                onSaved: presenter.userEmail,
                validator: (value) {
                  if (value?.isEmpty ?? false) {
                    return 'Campo não pode ser nulo';
                  } else if (!value!.contains('@')) {
                    return 'E-mail não é válido';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10,),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                ),
                onSaved: presenter.userPassword,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Campo não pode ser nulo';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                child: const Text('ENTER'),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 80)
                  ),
                ),
                onPressed: presenter.isLoading ? null : () async {
                  presenter.doLogin();
                }, 
              )
            ],
          ),
        ),
      ),
    );
  }
}