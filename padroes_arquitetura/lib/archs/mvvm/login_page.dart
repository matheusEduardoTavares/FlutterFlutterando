import 'package:flutter/material.dart';
import 'package:padroes_arquitetura/archs/mvc/login_repository.dart';
import 'package:padroes_arquitetura/archs/mvc/user_model.dart';
import 'package:padroes_arquitetura/archs/mvvm/login_viewmodel.dart';
import 'package:padroes_arquitetura/home_page.dart';

class LoginPageMVVM extends StatefulWidget {
  const LoginPageMVVM({ Key? key }) : super(key: key);

  @override
  State<LoginPageMVVM> createState() => _LoginPageMVVMState();
}

class _LoginPageMVVMState extends State<LoginPageMVVM> {
  final _formKey = GlobalKey<FormState>();
  final viewModel = LoginViewModel(
    repository: LoginRepository(),
  );
  final user = UserModel();

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
  void initState() {
    super.initState();

    viewModel.isLoadingOut.listen((isLogin) {
      if (isLogin) {
        _loginSuccess();
      }
      else {
        _loginError();
      }
    });
  }

  @override
  void dispose() {
    viewModel.dispose();
    _formKey.currentState!.dispose();

    super.dispose();
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
                onSaved: (value) {
                  user.email = value;
                },
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
                onSaved: (value) {
                  user.password = value;
                },
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Campo não pode ser nulo';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 30,),
              StreamBuilder<bool>(
                stream: viewModel.isLoadingOut,
                initialData: false,
                builder: (context, snapshot) {
                  bool isLoading = snapshot.data ?? false;

                  return ElevatedButton(
                    child: const Text('ENTER'),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 80)
                      ),
                    ),
                    onPressed: isLoading ? null : () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState!.save();

                        viewModel.isLoginIn.add(user);
                      }
                    }, 
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}