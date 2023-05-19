import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'date_range_localizations_en.dart';

/// Callers can lookup localized strings with an instance of DateRangeLocalizations
/// returned by `DateRangeLocalizations.of(context)`.
///
/// Applications need to include `DateRangeLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/date_range_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: DateRangeLocalizations.localizationsDelegates,
///   supportedLocales: DateRangeLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the DateRangeLocalizations.supportedLocales
/// property.
abstract class DateRangeLocalizations {
  DateRangeLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static DateRangeLocalizations of(BuildContext context) {
    return Localizations.of<DateRangeLocalizations>(context, DateRangeLocalizations)!;
  }

  static const LocalizationsDelegate<DateRangeLocalizations> delegate = _DateRangeLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en')
  ];

  /// No description provided for @labelStartDate.
  ///
  /// In en, this message translates to:
  /// **'Start Date'**
  String get labelStartDate;

  /// No description provided for @labelEndDate.
  ///
  /// In en, this message translates to:
  /// **'End Date'**
  String get labelEndDate;

  /// No description provided for @labelSelectedDateRange.
  ///
  /// In en, this message translates to:
  /// **'Selected Date Range'**
  String get labelSelectedDateRange;

  /// No description provided for @labelActionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get labelActionCancel;

  /// No description provided for @labelActionOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get labelActionOk;

  /// No description provided for @labelSemanticEditIcon.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get labelSemanticEditIcon;

  /// No description provided for @labelEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get labelEdit;

  /// No description provided for @labelSemanticConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get labelSemanticConfirm;

  /// No description provided for @labelConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get labelConfirm;

  /// No description provided for @labelSemanticCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get labelSemanticCalendar;

  /// No description provided for @labelCalendar.
  ///
  /// In en, this message translates to:
  /// **'Calendar'**
  String get labelCalendar;

  /// No description provided for @labelSemanticClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get labelSemanticClose;

  /// No description provided for @labelClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get labelClose;
}

class _DateRangeLocalizationsDelegate extends LocalizationsDelegate<DateRangeLocalizations> {
  const _DateRangeLocalizationsDelegate();

  @override
  Future<DateRangeLocalizations> load(Locale locale) {
    return SynchronousFuture<DateRangeLocalizations>(lookupDateRangeLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en'].contains(locale.languageCode);

  @override
  bool shouldReload(_DateRangeLocalizationsDelegate old) => false;
}

DateRangeLocalizations lookupDateRangeLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return DateRangeLocalizationsEn();
  }

  throw FlutterError(
    'DateRangeLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
