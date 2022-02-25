import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'web_view_page_state.dart';

/// Web view page bloc.
class WebViewPageCubit extends Cubit<WebViewPageState> {
  /// Initializes [WebViewPageCubit].
  WebViewPageCubit() : super(const WebViewPageInitialState());

  /// Update the state of the [WebViewPageCubit].
  void updateProgressState(double progress) =>
      emit(WebViewPageUpdateState(progress));
}
