import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:update_checker/update_event.dart';
import 'package:update_checker/update_info.dart';
import 'package:update_checker/update_state.dart';
import 'package:update_checker/src/firebase_utils.dart';

/// UpdateCheckBloc helps in retrieving Update Information from Firebase.
/// [UpdateCheckStart] event can be used to fetch the Update Information.
/// This event is added by default when UpdateCheckBloc is initialised.
/// Use [UpdateCheckCancel] event to cancel the request.
/// And [UpdateCheckMarkSeen] event when update alert has been shown to user.
class UpdateCheckBloc extends Bloc<UpdateCheckEvent, UpdateCheckState> {
  bool _updateCancelled = false;
  FirebaseUtils firebaseUtils;

  /// Constructor for [UpdateCheckBloc].
  /// An optional mock [FirebaseUtils] instance can be provided for testing.
  /// For normal use don't provide fbUtils, it will be constructed itself.
  UpdateCheckBloc({FirebaseUtils fbUtils}) : super(UpdateNotAvailable()) {
    this.firebaseUtils = fbUtils ?? FirebaseUtils();
    this.add(UpdateCheckStart());
  }

  @override
  Stream<UpdateCheckState> mapEventToState(UpdateCheckEvent event) async* {
    if (event is UpdateCheckStart) {
      _updateCancelled = false;
      this.add(UpdateCheckInProgress());
    } else if (event is UpdateCheckInProgress) {
      UpdateInfo info = await firebaseUtils.getUpdateInfo();
      if (info != null && !_updateCancelled) {
        yield UpdateAvailable(info);
      } else {
        yield UpdateNotAvailable();
      }
    } else if (event is UpdateCheckCancel) {
      _updateCancelled = true;
      yield UpdateCancelled();
    } else if (event is UpdateCheckMarkSeen) {
      yield UpdateSeen();
    } else if (event is UpdateCheckMarkDismiss) {
      yield UpdateDismissed();
    }
  }
}
