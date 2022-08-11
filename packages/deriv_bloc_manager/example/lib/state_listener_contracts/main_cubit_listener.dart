import 'package:flutter_deriv_bloc_manager/manager.dart';

abstract class MainCubitStateListener extends BaseStateListener {
  void onLoading();
  void onLoaded();
}
