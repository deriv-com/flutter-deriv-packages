import 'dart:developer' as dev;

import 'package:bloc/bloc.dart';
import 'package:flutter_deriv_api/api/common/website_status/website_status.dart';
import 'package:flutter_deriv_api/basic_api/generated/api.dart';

part 'website_status_state.dart';

/// Website Status cubit
///
/// Provides website status object.
class WebsiteStatusCubit extends Cubit<WebsiteStatusState> {
  /// Initializes websiteStatusCubit.
  WebsiteStatusCubit() : super(WebsiteStatusInitialState());

  /// Performs a subscription request to website status.
  Future<void> subscribe() async {
    try {
      WebsiteStatus.subscribeWebsiteStatus(
        const WebsiteStatusRequest(subscribe: true),
      ).listen((WebsiteStatus? event) =>
          emit(WebsiteStatusLoadedState(websiteStatus: event)));
    } on Exception catch (e) {
      dev.log('$WebsiteStatusCubit subscribe() error: $e');

      emit(WebsiteStatusErrorState(error: '$e'));
    }
  }

  @override
  Future<void> close() async {
    await WebsiteStatus.unsubscribeAllWebsiteStatus();

    return super.close();
  }
}
