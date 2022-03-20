import 'package:flutter/material.dart';
import 'package:padroes_arquitetura/archs/mvc/login_repository.dart';
import 'package:padroes_arquitetura/archs/mvc/user_model.dart';

class LoginController {
  LoginController({
    required this.repository,
  });

  final LoginRepository repository;

  final formKey = GlobalKey<FormState>();
  final user = UserModel();

  void userEmail(String? value) {
    user.email = value;
  }

  void userPassword(String? value) {
    user.password = value;
  }

  Future<bool> doLogin() async {
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();

      try {
        return repository.doLogin(model: user);
      } catch(e) {
        return false;
      }
    }

    return false;
  }
}