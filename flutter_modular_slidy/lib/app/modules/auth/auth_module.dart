import 'package:flutter_modular_slidy/app/modules/auth/auth_page.dart';
import 'package:flutter_modular_slidy/app/modules/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/page', child: (_, args) => AuthPage()),
  ];
}
