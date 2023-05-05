part of 'grouped_list_view.dart';

class _GroupedListViewController {
  final StreamController<int> _streamController = StreamController<int>();

  int _currentGroupIndex = 0;

  int get currentGroupIndex => _currentGroupIndex;

  set currentGroupIndex(int value) =>
      _streamController.sink.add(_currentGroupIndex = value);

  Stream<int> get stream => _streamController.stream;

  void dispose() => _streamController.close();
}
