import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_slidy/app/modules/auth/auth_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/auth', module: AuthModule())
  ];
  ///Acessamos o auth_page que é a página 
  ///dentro do submódulo do [AuthModule] pela
  ///rota /auth/page, ou seja, vai seguindo
  ///o caminho desde o pai para o módulo e pág
  ///que deseja-se chegar
}