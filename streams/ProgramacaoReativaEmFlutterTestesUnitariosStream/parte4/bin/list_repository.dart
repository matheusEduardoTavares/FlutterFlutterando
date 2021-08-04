class ListRepository {
  final list = [
    'Jacob', 'Deivão', 'Vilson', 'André',
  ];

  List<String> filter(String text) {
    text = text.toLowerCase();
    return list.where((item) => item.toLowerCase().contains(text)).toList();
  }
}