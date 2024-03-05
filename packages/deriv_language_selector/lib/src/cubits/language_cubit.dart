// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:deriv_ui/deriv_ui.dart';

// part 'language_state.dart';

// /// Language Bloc that manages the language localization in the app.
// class LanguageCubit extends Cubit<LanguageState> {
//   /// Instantiate [LanguageCubit].
//   LanguageCubit({
//     required this.websiteStatusCubit,
//     required this.connectionBloc,
//     this.languageService,
//   }) : super(LanguageLoadedState(Languages.getDefault)) {
//     languageService ??= LanguageService();
//     _loadCurrentLanguage();

//     // TODO(waqas): To be used in future when we wanna fetch available languages from server.
//     // languageService?.getSupportedLanguagesFromServer();
//   }

//   /// Website Status Cubit.
//   final WebsiteStatusCubit websiteStatusCubit;

//   /// Connection Cubit.
//   final ConnectionCubit connectionBloc;

//   /// Language service.
//   LanguageService? languageService;

//   /// Updates the language.
//   Future<void> updateLanguage(
//     Language language,
//   ) async {
//     await languageService?.loadAndSetLanguage(language);
//     emit(LanguageLoadedState(language));
//     languageService
//         ?.reconnectToServerWithNewLanguage(language.locale!.languageCode);
//   }

//   Future<void> _loadCurrentLanguage() async {
//     final Language language = await Languages.getCurrent;
//     await updateLanguage(language);
//   }
// }
