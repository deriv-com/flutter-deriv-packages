part of 'web_view_page_cubit.dart';

/// Web view page abstract state.
abstract class WebViewPageState extends Equatable {
  /// Initializes [WebViewPageState].
  const WebViewPageState(this.progress);

  /// Web view page loading progress.
  final double progress;

  @override
  List<double> get props => <double>[progress];
}

/// Web view page initial state.
class WebViewPageInitialState extends WebViewPageState {
  /// Initializes [WebViewPageInitialState].
  const WebViewPageInitialState() : super(0);
}

/// Web view page update state.
class WebViewPageUpdateState extends WebViewPageState {
  /// Initializes [WebViewPageUpdateState].
  const WebViewPageUpdateState(double value) : super(value);
}
