import 'package:flutter_deriv_bloc_manager/manager.dart';

abstract class MainCubitEventListener extends BaseEventListener {
  void onLoading();
  void onLoaded();
}
