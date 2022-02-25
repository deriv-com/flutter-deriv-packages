part of 'website_status_cubit.dart';

/// Base state for website status cubit.
abstract class WebsiteStatusState {
  /// Initializes WebsiteStatusState.
  WebsiteStatusState({
    required this.websiteStatus,
  });

  /// Website status object.
  WebsiteStatus? websiteStatus;
}

/// Website status cubit initial state
class WebsiteStatusInitialState extends WebsiteStatusState {
  /// Initializes website status initial state.
  WebsiteStatusInitialState() : super(websiteStatus: null);
}

/// Website status loaded state
///
/// This state is emitted when website status subscription returns a new value.
class WebsiteStatusLoadedState extends WebsiteStatusState {
  /// Initializes website status loaded state.
  WebsiteStatusLoadedState({WebsiteStatus? websiteStatus})
      : super(websiteStatus: websiteStatus);
}

/// This event is emitted is if an error happened throughout the process.
class WebsiteStatusErrorState extends WebsiteStatusState {
  /// Initializes website status error state.
  WebsiteStatusErrorState({required this.error}) : super(websiteStatus: null);

  /// WebsiteStatus exception.
  final String? error;
}
