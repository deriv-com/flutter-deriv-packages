import 'deriv_auth_localizations.dart';

/// The translations for Vietnamese (`vi`).
class DerivAuthLocalizationsVi extends DerivAuthLocalizations {
  DerivAuthLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get labelNotAvailable => 'Không tồn tại';

  @override
  String warnNotAvailableCountriesTitle(String app) {
    return '$app không có sẵn ở quốc gia của bạn';
  }

  @override
  String get actionOk => 'Ok';

  @override
  String get warnNotAvailableCountries => 'Nếu bạn có bất kỳ câu hỏi nào, hãy liên hệ với chúng tôi qua ';

  @override
  String get labelLiveChat => 'Live chat';

  @override
  String get actionSignUpForFree => 'Đăng ký miễn phí';

  @override
  String get actionLogin => 'Đăng nhập';

  @override
  String get labelTwoFactorAuth => 'Xác thực hai yếu tố';

  @override
  String get informEnterTwoFactorAuthCode => 'Nhập mã gồm 6 số từ ứng dụng xác thực trên điện thoại của bạn.';

  @override
  String get labelTwoFactorAuthenticationCode => 'mã 2FA';

  @override
  String get actionProceed => 'Xử lý';

  @override
  String get labelLogIn => 'Đăng nhập';

  @override
  String get informLoginOptions => 'Hoặc đăng nhập với';

  @override
  String get labelEmail => 'Email';

  @override
  String get labelPassword => 'Mật khẩu';

  @override
  String get actionForgotPassword => 'Quên mật khẩu?';

  @override
  String get labelDontHaveAnAccountYet => 'Chưa có tài khoản?';

  @override
  String get actionCreateANewAccount => 'Tạo một tài khoản mới';

  @override
  String get informInvalidEmailFormat => 'Nhập địa chỉ email hợp lệ';

  @override
  String get warnPasswordLength => 'Bạn nên nhập từ 8-25 ký tự.';

  @override
  String get labelResetPassword => 'Đặt lại mật khẩu';

  @override
  String get labelChooseNewPass => 'Chọn mật khẩu mới';

  @override
  String get labelCreatePass => 'Mật khẩu';

  @override
  String get informYourPassHasBeenReset => 'Mật khẩu của bạn đã được đặt lại';

  @override
  String get informRedirectLogin => 'Bạn sẽ cần đăng nhập bằng mật khẩu mới của mình. Chờ đã, chúng tôi đang chuyển hướng bạn.';

  @override
  String get actionResetPass => 'Đặt lại mật khẩu';

  @override
  String get informInvalidPasswordFormat => 'Vui lòng nhập một định dạng mật khẩu hợp lệ';

  @override
  String get labelCheckEmail => 'Hãy kiểm tra email của bạn';

  @override
  String informSendResetPasswordEmail(String email) {
    return 'Chúng tôi đã gửi tin nhắn $email với một liên kết để đặt lại mật khẩu của bạn.';
  }

  @override
  String get informResetPassByEmail => 'Chúng tôi sẽ gửi email hướng dẫn đổi mật khẩu cho bạn.';

  @override
  String get labelSelectCountry => 'Bạn sống ở đâu?';

  @override
  String get labelChooseCountry => 'Chọn quốc gia';

  @override
  String get warnCountryNotAvailable => 'Rất tiếc, Deriv không có mặt ở quốc gia của bạn.';

  @override
  String get actionNext => 'Tiếp theo';

  @override
  String get labelEmailIssueHeader => 'Nếu sau vài phút bạn không nhận được email từ chúng tôi, một vài điều sau có thể đã xảy ra:';

  @override
  String get labelEmailIssueSpam => 'Email có thể đã bị chuyển vào hòm thư spam (Đôi lúc dữ liệu bị lạc mất trong đó).';

  @override
  String get labelEmailIssueWrongEmail => 'Bạn đã vô tình đưa cho chúng tôi một tài khoản email khác (Thường là một tài khoản cho công việc hoặc cá nhân thay vì tài khoản mà bạn định sử dụng).';

  @override
  String get labelEmailIssueTypo => 'Địa chỉ email bạn nhập bị nhầm hoặc có lỗi chính tả (hay xảy ra với chúng tôi).';

  @override
  String get labelEmailIssueFirewall => 'Chúng tôi không thể chuyển email đến địa chỉ này (Thường là do tường lửa hoặc bộ lọc).';

  @override
  String get actionReenterEmail => 'Nhập lại email của bạn và thử lại';

  @override
  String get labelKeepPassword => 'Bảo vệ tài khoản của bạn an toàn với mật khẩu';

  @override
  String get labelCreatePassword => 'Tạo một mật khẩu';

  @override
  String get actionStartTrading => 'Bắt đầu giao dịch';

  @override
  String get actionPrevious => 'Trước';

  @override
  String get labelSignUp => 'Đăng kí';

  @override
  String get labelOrSignUpWith => 'Hoặc đang ký với';

  @override
  String get labelReferralInfoTitle => 'Mã giới thiệu Affiliate';

  @override
  String get infoReferralInfoDescription => 'Mã chữ và số được cung cấp bởi một đơn vị liên kết Deriv, chỉ áp dụng cho đăng ký qua email.';

  @override
  String get labelGotReferralCode => 'Bạn có mã giới thiệu?';

  @override
  String get labelHaveAccount => 'Đã có tài khoản?';

  @override
  String get actionCreateAccount => 'Tạo tài khoản thử nghiệm miễn phí';

  @override
  String get informInvalidReferralCode => 'Mã giới thiệu bạn đã nhập không hợp lệ. Vui lòng kiểm tra và thử lại.';

  @override
  String get labelVerifyYourEmail => 'Xác minh email của bạn';

  @override
  String get labelThanksEmail => 'Cảm ơn đã xác thực email của bạn';

  @override
  String get informLetsContinue => 'Hãy tiếp tục.';

  @override
  String get actionContinue => 'Tiếp tục';

  @override
  String get labelSearchCountry => 'Tìm kiếm quốc gia';

  @override
  String informVerificationEmailSent(String email) {
    return 'Chúng tôi đã gửi tin nhắn $email với một liên kết để kích hoạt tài khoản của bạn.';
  }

  @override
  String get actionEmailNotReceived => 'Không nhận được email?';

  @override
  String get informPasswordPolicy => 'Mật khẩu của bạn phải có:';

  @override
  String get informPasswordPolicyLength => '8-25 ký tự';

  @override
  String get informPasswordPolicyLowerAndUpper => 'Chữ hoa và chữ thường';

  @override
  String get informPasswordPolicyNumber => 'Ít nhất một số';

  @override
  String get warnPasswordContainsSymbol => 'Sử dụng các ký hiệu cho mật khẩu mạnh.';

  @override
  String get labelReferralCode => 'Mã giới thiệu';

  @override
  String get actionTryAgain => 'Thử lại';

  @override
  String get informInvalid2FACode => 'Mã bạn nhập không hợp lệ. Kiểm tra và thử lại.';

  @override
  String get informFailedAuthentication => 'Email hoặc mật khẩu của bạn có thể không chính xác. Bạn đã đăng ký với một tài khoản xã hội chưa? Kiểm tra và thử lại.';

  @override
  String get informDeactivatedAccount => 'Tài khoản của bạn bị vô hiệu hóa.';

  @override
  String get informFailedAuthorization => 'Ủy quyền không thành công.';

  @override
  String get informInvalidResidence => 'Nơi cư trú không hợp lệ.';

  @override
  String get informInvalidCredentials => 'Thông tin đăng nhập không hợp lệ.';

  @override
  String get informMissingOtp => 'Thiếu mật khẩu một lần.';

  @override
  String get informSelfClosed => 'Tài khoản này của bạn đã bị vô hiệu hóa.';

  @override
  String get informUnexpectedError => 'Đã có lỗi bất ngờ xảy ra.';

  @override
  String get informUnsupportedCountry => 'Đất nước của bạn không được hỗ trợ.';

  @override
  String get informExpiredAccount => 'Tài khoản của bạn đã hết hạn';

  @override
  String get labelCountryConsentBrazil => 'Tôi xác nhận rằng yêu cầu mở tài khoản của tôi với Deriv để giao dịch các sản phẩm OTC được phát hành và cung cấp độc quyền bên ngoài Brazil là do tôi thực hiện. Tôi hoàn toàn hiểu rằng Deriv không bị quản lý bởi CVM và thông qua Deriv, tôi dự định thiết lập quan hệ với một công ty nước ngoài.';

  @override
  String get informConnectionError => 'Lỗi kết nối. Vui lòng thử lại sau.';

  @override
  String get informSwitchAccountError => 'Chuyển đổi lỗi tài khoản. Vui lòng thử lại sau.';

  @override
  String get labelDeveloper => 'Nhà phát triển';

  @override
  String get labelEndpoint => 'Điểm kết thúc';

  @override
  String get semanticEndpoint => 'Điểm kết thúc';

  @override
  String get warnInvalidEndpoint => 'điểm cuối không hợp lệ';

  @override
  String get labelApplicationID => 'Mã đăng ký';

  @override
  String get semanticApplicationID => 'Mã đăng ký';

  @override
  String get warnInvalidApplicationID => 'mã đăng ký không hợp lệ';

  @override
  String get labelLanguage => 'Ngôn ngữ';
}
