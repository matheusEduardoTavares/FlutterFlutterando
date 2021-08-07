extension on String {
  String get name => 'Jacob';
  String concat(String c) => this + c;
}

void main() {
  final _var = 'abcd';
  print(_var); ///abcd
  print(_var.name); ///Jacob

  final _name = 'Jacob';
  print(_name.concat(' Moura'));
}