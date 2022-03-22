import 'dart:async';
import 'package:padroes_arquitetura/archs/mvc/login_repository.dart';
import 'package:padroes_arquitetura/archs/mvc/user_model.dart';

class LoginViewModel {
  LoginViewModel({
    required this.repository,
  });

  final LoginRepository repository;

  final _isLoading$ = StreamController<bool>();
  Sink<bool> get isLoadingIn => _isLoading$.sink;
  Stream<bool> get isLoadingOut => _isLoading$.stream;

  final _isLogin$ = StreamController<UserModel>();
  Sink<UserModel> get isLoginIn => _isLogin$.sink;
  Stream<bool> get isLoginOut => _isLogin$.stream.asyncMap<bool>(
    login
  );

  Future<bool> login(UserModel user) async {
    bool isLogin;
    isLoadingIn.add(true);

    try {
      isLogin = await repository.doLogin(model: user);
    }
    catch (e) {
      isLogin = false;
    }

    isLoadingIn.add(false);
    return isLogin;
  }

  void dispose() {
    _isLoading$.close();
    _isLogin$.close();
  }
}