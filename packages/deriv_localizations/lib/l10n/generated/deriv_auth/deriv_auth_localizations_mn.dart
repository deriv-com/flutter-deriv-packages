import 'deriv_auth_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Mongolian (`mn`).
class DerivAuthLocalizationsMn extends DerivAuthLocalizations {
  DerivAuthLocalizationsMn([String locale = 'mn']) : super(locale);

  @override
  String get labelNotAvailable => 'Боломжгүй байна';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app танай улсад байхгүй';
  }

  @override
  String get actionOk => 'ОК';

  @override
  String get warnNotAvailableCountries => 'Хэрэв танд ямар нэгэн асуулт байвал бидэнтэй холбогдоно уу ';

  @override
  String get labelLiveChat => 'Шууд чат';

  @override
  String get actionSignUpForFree => 'Үнэ төлбөргүй бүртгүүлнэ үү';

  @override
  String get actionLogin => 'Нэвтрэх';

  @override
  String get labelTwoFactorAuth => 'Давхар баталгаажуулалт';

  @override
  String get informEnterTwoFactorAuthCode => 'Утсан дээрх баталгаажуулалтын (authenticator) апп дээрээс 6 оронтой кодыг оруулна уу.';

  @override
  String get labelTwoFactorAuthenticationCode => '2FA код';

  @override
  String get actionProceed => 'Үргэлжлүүлэх';

  @override
  String get labelLogIn => 'Нэвтрэх';

  @override
  String get informLoginOptions => 'Эсвэл нэвтэрнэ үү';

  @override
  String get labelEmail => 'Имэйл';

  @override
  String get labelPassword => 'Нууц үг';

  @override
  String get actionForgotPassword => 'Нууц үгээ мартсан уу?';

  @override
  String get labelDontHaveAnAccountYet => 'Та хараахан бүртгүүлээгүй байна уу?';

  @override
  String get actionCreateANewAccount => 'Шинэ данс үүсгэх';

  @override
  String get informInvalidEmailFormat => 'Хүчин төгөлдөр имэйл хаяг оруулна уу';

  @override
  String get warnPasswordLength => 'Та 6-25 тэмдэгтийг оруулах ёстой.';

  @override
  String get labelResetPassword => 'Нууц үгээ тохируулах';

  @override
  String get labelChooseNewPass => 'Шинэ нууц үг сонгоно уу';

  @override
  String get labelCreatePass => 'Нууц үг';

  @override
  String get informYourPassHasBeenReset => 'Таны нууц үг шинэчлэгдлээ';

  @override
  String get informRedirectLogin => 'Та өөрийн шинэ нууц үгээрээ нэвтрэх хэрэгтэй. Хүлээгээрэй, бид таныг дахин чиглүүлье.';

  @override
  String get actionResetPass => 'Нууц үг өөрчлөх';

  @override
  String get informInvalidPasswordFormat => 'Нууц үгийг хүчин төгөлдөр форматаар оруулна уу';

  @override
  String get labelCheckEmail => 'И-мэйлээ шалгана уу';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'Бид нууц үгээ дахин тохируулах линктэй $email руу мессеж илгээсэн байна.';
  }

  @override
  String get informResetPassByEmail => 'Бид танд нууц үг шинэчлэх зааврыг имэйлээр илгээх болно.';

  @override
  String get labelSelectCountry => 'Та хаана амьдардаг вэ?';

  @override
  String get labelChooseCountry => 'Улсаа сонгоно уу';

  @override
  String get warnCountryNotAvailable => 'Харамсалтай байна. Танай улсад Deriv-ийг ашиглах боломжгүй байна.';

  @override
  String get actionNext => 'Дараагийн';

  @override
  String get labelEmailIssueHeader => 'Хэрэв бидний илгээсэн имэйл харагдахгүй байвал дараах зүйлсээс шалтгаалж байж болно:';

  @override
  String get labelEmailIssueSpam => 'Спам руу орсон байх (Заримдаа спам руу шилжиж олдохгүй болдог).';

  @override
  String get labelEmailIssueWrongEmail => 'Санамсаргүйгээр өөр имэйл хаяг өгсөн байх (Ихэвчлэн явуулах гэснээсээ өөр ажлын эсвэл хувийн имэйл илгээсэн байдаг).';

  @override
  String get labelEmailIssueTypo => 'Таны оруулсан имэйл хаяг нь буруу эсвэл үг үсгийн алдаатай байх (хамгийн их тохиолддог нь).';

  @override
  String get labelEmailIssueFirewall => 'Энэ хаяг руу имэйл илгээх боломжгүй байна (Ихэвчлэн галт хана (firewalls) эсвэл шүүлтүүр (filtering)-ээс шалтгаалдаг).';

  @override
  String get actionReenterEmail => 'Имэйлээ дахин оруулаад дахиад нэг оролдоно уу';

  @override
  String get labelKeepPassword => 'Нууц үг үүсгэж, дансаа хамгаалаарай';

  @override
  String get labelCreatePassword => 'Нууц үг үүсгэх';

  @override
  String get actionStartTrading => 'Арилжаа эхлүүлэх';

  @override
  String get actionPrevious => 'Өмнөх';

  @override
  String get labelSignUp => 'Бүртгүүлэх';

  @override
  String get labelOrSignUpWith => 'Эсвэл бүртгүүлнэ үү';

  @override
  String get labelReferralInfoTitle => 'Түншийн өгөгдмөл код';

  @override
  String get infoReferralInfoDescription => 'Deriv-ийн түншээс өгсөн үсэг, тоо бүхий кодыг зөвхөн имэйлээр бүртгүүлэх үед хэрэгцээтэй болно.';

  @override
  String get labelGotReferralCode => 'Өгөгдмөл кодтой байгаа юу?';

  @override
  String get labelHaveAccount => 'Та данстай байсан уу?';

  @override
  String get actionCreateAccount => 'Үнэ төлбөргүй демо данс нээх';

  @override
  String get informInvalidReferralCode => 'Таны оруулсан өгөгдмөл код хүчин төгөлдөр бус байна. Шалгаж үзээд дахин оролдоно уу.';

  @override
  String get labelVerifyYourEmail => 'И-мэйлээ баталгаажуулна уу';

  @override
  String get labelThanksEmail => 'Имэйлээ баталгаажуулсанд баярлалаа';

  @override
  String get informLetsContinue => 'Үргэлжлүүлье.';

  @override
  String get actionContinue => 'Үргэлжлүүлэх';

  @override
  String get labelSearchCountry => 'Улс хайх';

  @override
  String informVerificationEmailSent(String email) {
    return 'Бид таны акаунтыг идэвхжүүлэх холбоосоор $email руу мессеж илгээсэн байна.';
  }

  @override
  String get actionEmailNotReceived => 'Таны имэйлийг хүлээн авахгүй байна уу?';

  @override
  String get informPasswordPolicy => 'Таны нууц үг дараахыг агуулж байх ёстой:';

  @override
  String get informPasswordPolicyLength => '8-25 тэмдэгт';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Том ба жижиг үсэг';

  @override
  String get informPasswordPolicyNumber => 'Хамгийн багадаа нэг тоо';

  @override
  String get warnPasswordContainsSymbol => 'Хялбар бус нууц үг үүсгэхийн тулд тэмдэгтүүд ашиглана уу.';

  @override
  String get labelReferralCode => 'Өгөгдмөл код';

  @override
  String get actionTryAgain => 'Дахин үзээрэй';

  @override
  String get informInvalid2FACode => 'Таны оруулсан код буруу байна. Шалгаж үзээд дахин оролдоно уу.';

  @override
  String get informFailedAuthentication => 'Таны имэйл эсвэл нууц үг буруу байна. Та сошиал хаягаар бүртгүүлсэн үү? Шалгаж үзээд дахин оролдоно уу.';

  @override
  String get informDeactivatedAccount => 'Таны данс идэвхгүй болсон.';

  @override
  String get informFailedAuthorization => 'Зөвшөөрөл амжилтгүй болсон.';

  @override
  String get informInvalidResidence => 'Хүчингүй оршин суух газар.';

  @override
  String get informInvalidCredentials => 'Хүчингүй итгэмжлэл.';

  @override
  String get informMissingOtp => 'Нэг удаагийн нууц үг алга байна.';

  @override
  String get informSelfClosed => 'Таны данс хаагдсан байна.';

  @override
  String get informUnexpectedError => 'Гэнэтийн алдаа гарсан.';

  @override
  String get informUnsupportedCountry => 'Танай улс дэмжигддэггүй.';

  @override
  String get informExpiredAccount => 'Таны дансны хугацаа дууссан';

  @override
  String get labelCountryConsentBrazil => 'Бразил улсаас гадуур гаргасан OTC бүтээгдэхүүнийг арилжаалах Deriv-ийн данс нээлгэх хүсэлт гаргасныг үүгээр баталж байна. Дерив нь CVM-ээр зохицуулагддаггүй болохыг бүрэн ойлгож байна. Мөн Deriv-тэй холбогдож гадаадын компанитай харилцаа тогтоохыг зорьж байна.';

  @override
  String get informConnectionError => 'Холболтын алдаа. Дараа нь дахин оролдоно уу.';

  @override
  String get informSwitchAccountError => 'Дансны алдаа солих. Дараа нь дахин оролдоно уу.';

  @override
  String get labelDeveloper => 'Хөгжүүлэгч';

  @override
  String get labelEndpoint => 'Дуусах цэг';

  @override
  String get semanticEndpoint => 'Дуусах цэг';

  @override
  String get warnInvalidEndpoint => 'хүчин төгөлдөр бус дуусах цэг байна';

  @override
  String get labelApplicationID => 'Аппликейшн ID';

  @override
  String get semanticApplicationID => 'Аппликейшн ID';

  @override
  String get warnInvalidApplicationID => 'хүчин төгөлдөр бус аппликейшний ID байна';

  @override
  String get labelLanguage => 'Хэл';
}
