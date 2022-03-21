import 'package:flutter/material.dart';
import 'package:padroes_arquitetura/archs/mvc/login_repository.dart';
import 'package:padroes_arquitetura/archs/mvc/user_model.dart';

abstract class LoginPageContract {
  void loginSuccess();
  void loginError();
  void loginManager();
}

class LoginPresenter {
  LoginPresenter({
    required this.repository,
    required this.viewContract,
  });

  final LoginRepository repository;
  final LoginPageContract viewContract;

  final formKey = GlobalKey<FormState>();
  final user = UserModel();

  var isLoading = false;

  void userEmail(String? value) {
    user.email = value;
  }

  void userPassword(String? value) {
    user.password = value;
  }

  Future<void> doLogin() async {
    isLoading = true;
    viewContract.loginManager();

    var isLogin = false;
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();

      try {
        isLogin = await repository.doLogin(model: user);
      } catch(e) {
        isLogin = false;
      }

      if (isLogin) {
        viewContract.loginSuccess();
      }
      else {
        viewContract.loginError();
      }
    }

    isLoading = false;
    viewContract.loginManager();
  }
}