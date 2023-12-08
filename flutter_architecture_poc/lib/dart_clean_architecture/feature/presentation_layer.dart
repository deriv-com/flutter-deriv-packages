import '../core/bloc_manager.dart';
import 'interactor_layer.dart';

class ExtendedBloc extends Bloc implements StateListener {
  ExtendedBloc(super.service);

  Future<void> getData() async => service.getData();

  @override
  void onChangeState() => throw UnimplementedError();
}

class Bloc {
  Bloc(this.service);

  final BaseFeatureService service;
}

class Widget {}

class Page {
  Page(this.bloc, this.widgets);

  final ExtendedBloc bloc;
  final List<Widget> widgets;
}
