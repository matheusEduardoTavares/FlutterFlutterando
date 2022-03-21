import 'package:padroes_arquitetura/archs/mvc/user_model.dart';

class LoginRepository {
  Future<bool> doLogin({
    required UserModel model,
  }) async {
    //API CONNECTION

    await Future.delayed(const Duration(seconds: 2));
    return model.email == 'mzodiac115@gmail.com' 
      && model.password == '123';
  }
}