import 'package:flutter/material.dart';
import 'package:padroes_arquitetura/archs/mvc/login_controller.dart';
import 'package:padroes_arquitetura/archs/mvc/login_repository.dart';
import 'package:padroes_arquitetura/home_page.dart';

class LoginPageMVC extends StatefulWidget {
  const LoginPageMVC({ Key? key }) : super(key: key);

  @override
  State<LoginPageMVC> createState() => _LoginPageMVCState();
}

class _LoginPageMVCState extends State<LoginPageMVC> {
  // final _formKey = GlobalKey<FormState>();
  // UserModel user = UserModel();
  final controller = LoginController(
    repository: LoginRepository(),
  );

  var isLoading = false;

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
        key: controller.formKey,
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
                onSaved: controller.userEmail,
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
                onSaved: controller.userPassword,
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
                onPressed: isLoading ? null : () async {
                  setState(() {
                    isLoading = true;
                  });

                  if (await controller.doLogin()) {
                    _loginSuccess();
                  }
                  else {
                    _loginError();
                  }

                  setState(() {
                    isLoading = false;
                  });
                }, 
              )
            ],
          ),
        ),
      ),
    );
  }
}