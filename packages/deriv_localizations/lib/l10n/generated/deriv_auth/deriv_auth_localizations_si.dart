import 'deriv_auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class DerivAuthLocalizationsSi extends DerivAuthLocalizations {
  DerivAuthLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get labelNotAvailable => 'ලබා ගත නොහැක';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app ඔබේ රටේ නොමැත';
  }

  @override
  String get actionOk => 'හරි';

  @override
  String get warnNotAvailableCountries => 'ඔබට කිසියම් ප්රශ්නයක් ඇත්නම්, අප අමතන්න ';

  @override
  String get labelLiveChat => 'සජීවී කතාබස්';

  @override
  String get actionSignUpForFree => 'නොමිලේ ලියාපදිංචි වන්න';

  @override
  String get actionLogin => 'පුරනය වන්න';

  @override
  String get labelTwoFactorAuth => 'ද්වි-සාධක සත්‍යාපනය';

  @override
  String get informEnterTwoFactorAuthCode => 'ඔබේ දුරකථනයේ සත්යාපන යෙදුමෙන් ඉලක්කම් 6 ක කේතය ඇතුළත් කරන්න.';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA කේතය';

  @override
  String get actionProceed => 'ඉදිරියට යන්න';

  @override
  String get labelLogIn => 'පුරනය වන්න';

  @override
  String get informLoginOptions => 'නැතහොත් සමඟ ලොග් වන්න';

  @override
  String get labelEmail => 'ඊ-තැපෑල';

  @override
  String get labelPassword => 'මුරපදය';

  @override
  String get actionForgotPassword => 'මුරපදය අමතක ද?';

  @override
  String get labelDontHaveAnAccountYet => 'තවම ගිණුමක් නැද්ද?';

  @override
  String get actionCreateANewAccount => 'නව ගිණුමක් සාදන්න';

  @override
  String get informInvalidEmailFormat => 'වලංගු විද්යුත් තැපැල් ලිපිනයක් ඇතුළත් කරන්න';

  @override
  String get warnPasswordLength => 'ඔබ අක්ෂර 8-25 ක් ඇතුළත් කළ යුතුය.';

  @override
  String get labelResetPassword => 'මුරපදය නැවත සකස් කරන්න';

  @override
  String get labelChooseNewPass => 'නව මුරපදයක් තෝරන්න';

  @override
  String get labelCreatePass => 'මුරපදය';

  @override
  String get informYourPassHasBeenReset => 'ඔබගේ මුරපදය නැවත සකසා ඇත';

  @override
  String get informRedirectLogin => 'ඔබට ඔබගේ නව මුරපදය සමඟ ලොග් විය යුතුය. ඉතින්, අපි ඔයාව හරවා යවනවා.';

  @override
  String get actionResetPass => 'මගේ මුරපදය යළි සකසන්න';

  @override
  String get informInvalidPasswordFormat => 'කරුණාකර වලංගු මුරපද ආකෘතියක් ඇතුළත්';

  @override
  String get labelCheckEmail => 'ඔබේ ඊ-තැපෑල පරීක්ෂා කරන්න​';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'ඔබගේ මුරපදය නැවත සකස් කිරීම සඳහා සබැඳියක් $email සහිතව අපි වෙත පණිවිඩයක් යවා ඇත්තෙමු.';
  }

  @override
  String get informResetPassByEmail => 'ඔබේ මුරපදය යළි සැකසීමට අවශ්‍ය උපදෙස් අපි ඔබට ඊ-තැපෑලෙන් එවන්නෙමු.';

  @override
  String get labelSelectCountry => 'ඔබ ජීවත් වන්නේ කොහේද?';

  @override
  String get labelChooseCountry => 'රට තෝරන්න';

  @override
  String get warnCountryNotAvailable => 'අවාසනාවකට මෙන්, ඩෙරිව් ඔබේ රටේ නොලැබේ.';

  @override
  String get actionNext => 'ඊළඟ';

  @override
  String get labelEmailIssueHeader => 'මිනිත්තු කිහිපයක් ඇතුළත ඔබට අපෙන් ඊ-තැපෑලක් නොලැබුණොත්, පහත සඳහන් දේවල් සිදු විය හැක:';

  @override
  String get labelEmailIssueSpam => 'ඊ-තැපෑල ඔබේ අයාචිත තැපැල් ෆෝල්ඩරයේ ඇත (සමහර ඊ-තැපැල් ඒ වෙත යොමු වෙයි).';

  @override
  String get labelEmailIssueWrongEmail => 'ඔබ අහම්බෙන් අපට වෙනත් ඊ-තැපැල් ලිපිනයක් ලබා දී ඇත​ (සාමාන්‍යයෙන් ඔබ අදහස් කරන එක වෙනුවට කාර්යාලීය හෝ පෞද්ගලික ඊ තැපැල් ලිපිනයක්).';

  @override
  String get labelEmailIssueTypo => 'ඔබ ඇතුළත් කළ​ ඊ-තැපැල් ලිපිනයේ වැරදීමක් හෝ මුද්‍රණ දෝෂයක් ඇත (බොහෝ අයට මෙය සිදු වේ).';

  @override
  String get labelEmailIssueFirewall => 'අපිට මේ ලිපිනයට ඊමේල් එක බාර දෙන්න බැහැ (සාමාන්යයෙන් ෆයර්වෝල් හෝ ෆිල්ටිං නිසා).';

  @override
  String get actionReenterEmail => 'ඔබගේ ඊ-තැපෑල නැවත ඇතුළත් කර නැවත උත්සාහ කරන්න';

  @override
  String get labelKeepPassword => 'මුරපදයකින් ඔබේ ගිණුම සුරක්ෂිතව තබා ගන්න';

  @override
  String get labelCreatePassword => 'මුරපදයක් සාදන්න';

  @override
  String get actionStartTrading => 'ගනුදෙනු ආරම්භ කරන්න';

  @override
  String get actionPrevious => 'පෙර';

  @override
  String get labelSignUp => 'ලියාපදිංචි වන්න';

  @override
  String get labelOrSignUpWith => 'නැතහොත් ලියාපදිංචි වන්න';

  @override
  String get labelReferralInfoTitle => 'අනුබද්ධ යොමු කේතය';

  @override
  String get infoReferralInfoDescription => 'ඊමේල් ලියාපදිංචි කිරීම් සඳහා පමණක් අදාළ වන ඩෙරිව් අනුබද්ධ සමාගමක් විසින් සපයනු ලබන අක්ෂර කේතයක්.';

  @override
  String get labelGotReferralCode => 'යොමු කේතයක් තිබේද?';

  @override
  String get labelHaveAccount => 'දැනටමත් ගිණුමක් තිබේද?';

  @override
  String get actionCreateAccount => 'නොමිලේ ආදර්ශන ගිණුමක් සාදන්න';

  @override
  String get informInvalidReferralCode => 'ඔබ ඇතුළත් කළ යොමු කේතය අවලංගු වේ. පරීක්ෂා කර නැවත උත්සාහ කරන්න.';

  @override
  String get labelVerifyYourEmail => 'ඔබගේ විද්යුත් තැපෑල තහවුරු';

  @override
  String get labelThanksEmail => 'ඔබගේ විද්යුත් තැපෑල සත්යාපනය කිරීම ගැන ස්ත';

  @override
  String get informLetsContinue => 'අපි දිගටම කරගෙන යමු.';

  @override
  String get actionContinue => 'ඉදිරියට යන්න';

  @override
  String get labelSearchCountry => 'රට සොයන්න';

  @override
  String informVerificationEmailSent(String email) {
    return 'ඔබගේ ගිණුම සක්රිය කිරීම සඳහා සබැඳියක් ස $email හිතව අපි වෙත පණිවිඩයක් යවා ඇත්තෙමු.';
  }

  @override
  String get actionEmailNotReceived => 'ඔබගේ ඊ-තැපෑල ලැබුණේ නැද්ද?';

  @override
  String get informPasswordPolicy => 'ඔබගේ මුරපදය තිබිය යුතුය:';

  @override
  String get informPasswordPolicyLength => 'අක්ෂර 8-25';

  @override
  String get informPasswordPolicyLowerAndUpper => 'ඉහළ සහ පහළ අකුරු';

  @override
  String get informPasswordPolicyNumber => 'අවම වශයෙන් එක් අංකයක්';

  @override
  String get warnPasswordContainsSymbol => 'ශක්තිමත් මුරපදය සඳහා සංකේත භාවිතා කරන්න.';

  @override
  String get labelReferralCode => 'යොමු කේතය';

  @override
  String get actionTryAgain => 'නැවත උත්සාහ කරන්න';

  @override
  String get informInvalid2FACode => 'ඔබ ඇතුළත් කළ කේතය අවලංගු වේ. පරීක්ෂා කර නැවත උත්සාහ කරන්න.';

  @override
  String get informFailedAuthentication => 'ඔබගේ විද්යුත් තැපෑල හෝ මුරපදය වැරදි විය හැකිය. ඔබ සමාජ ගිණුමක් සමඟ ලියාපදිංචි වූවාද? පරීක්ෂා කර නැවත උත්සාහ කරන්න.';

  @override
  String get informDeactivatedAccount => 'ඔබගේ ගිණුම අක්රිය කර ඇත.';

  @override
  String get informFailedAuthorization => 'බලය අසාර්ථක විය.';

  @override
  String get informInvalidResidence => 'අවලංගු පදිංචිය.';

  @override
  String get informInvalidCredentials => 'අවලංගු අක්තපත්ර';

  @override
  String get informMissingOtp => 'එක් වරක් මුරපදය අතුරුදහන් වේ.';

  @override
  String get informSelfClosed => 'ඔබේ ගිණුම වසා ඇත.';

  @override
  String get informUnexpectedError => 'අනපේක්ෂිත දෝෂයක් ඇති විය.';

  @override
  String get informUnsupportedCountry => 'ඔබේ රට සහයෝගය නොදක්වයි.';

  @override
  String get informExpiredAccount => 'ඔබගේ ගිණුම කල් ඉකුත් වී ඇත';

  @override
  String get labelCountryConsentBrazil => 'බ්‍රසීලයෙන් පිටතදී නිකුත් කරන ලද සහ පිරිනමන OTC නිෂ්පාදන ගනුදෙනු කිරීමට Deriv සමඟ ගිණුමක් විවෘත කිරීම සඳහා වන මගේ ඉල්ලීම මා විසින් ආරම්භ කරන ලද බව මෙයින් තහවුරු කරමි. Deriv CVM මඟින් නියාමනය නොවන බව මට හොඳින් වැටහෙන අතර Deriv වෙත පිවිසීමෙන් මම විදේශීය සමාගමක් සමඟ සබඳතාවක් පිහිටුවීමට අදහස් කරමි.';

  @override
  String get informConnectionError => 'සම්බන්ධතා දෝෂය. කරුණාකර පසුව නැවත උත්සාහ කරන්න.';

  @override
  String get informSwitchAccountError => 'ගිණුම් දෝෂය මාරු කරන්න. කරුණාකර පසුව නැවත උත්සාහ කරන්න.';

  @override
  String get labelDeveloper => 'සංවර්ධක';

  @override
  String get labelEndpoint => 'අන්ත ලක්ෂ්‍යය';

  @override
  String get semanticEndpoint => 'අන්ත ලක්ෂ්‍යය';

  @override
  String get warnInvalidEndpoint => 'අවලංගු අවසාන ලක්ෂ්යය';

  @override
  String get labelApplicationID => 'අයදුම් හැඳුනුම්පත';

  @override
  String get semanticApplicationID => 'අයදුම් හැඳුනුම්පත';

  @override
  String get warnInvalidApplicationID => 'අවලංගු යෙදුම් හැඳුනු';

  @override
  String get labelLanguage => 'භාෂාව';
}
