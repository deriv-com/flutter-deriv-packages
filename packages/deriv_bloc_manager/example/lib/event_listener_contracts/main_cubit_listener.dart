import 'package:flutter_deriv_bloc_manager/event_listener_contracts/base_event_listener.dart';

abstract class MainCubitEventListener extends BaseEventListener {
  void onLoading();
  void onLoaded();
}
