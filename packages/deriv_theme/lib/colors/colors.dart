// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart' hide Colors;

import 'light_theme.dart';
import 'dark_theme.dart';

class Colors {
  Colors({
    this.isDark = true,
  });

  final bool isDark;

  Map<String, Color> get light => lightTheme;

  Map<String, Color> get dark => darkTheme;

  Color get coral => _fetchColor('coral');

  Color get blue => _fetchColor('blue');

  Color get orange => _fetchColor('orange');

  Color get night => _fetchColor('night');

  Color get prominent => _fetchColor('prominent');

  Color get general => _fetchColor('general');

  Color get lessProminent => _fetchColor('lessProminent');

  Color get disabled => _fetchColor('disabled');

  Color get active => _fetchColor('active');

  Color get hover => _fetchColor('hover');

  Color get secondary => _fetchColor('secondary');

  Color get primary => _fetchColor('primary');

  Color get information => _fetchColor('information');

  Color get success => _fetchColor('success');

  Color get warning => _fetchColor('warning');

  Color get danger => _fetchColor('danger');

  Color get green => _fetchColor('green');

  Color get overlay => _fetchColor('overlay');

  Color get disabledWallet => _fetchColor('disabledWallet');

  Color get demoCardBackground => _fetchColor('demoCardBackground');

  Color get realCardBackground => _fetchColor('realCardBackground');

  Color get tradersHubDemoBegin => _fetchColor('tradersHubDemoBegin');

  Color get tradersHubDemoEnd => _fetchColor('tradersHubDemoEnd');

  Color get tradersHubRealBegin => _fetchColor('tradersHubRealBegin');

  Color get tradersHubRealEnd => _fetchColor('tradersHubRealEnd');

  Color get usdWalletBegin => _fetchColor('usdWalletBegin');

  Color get usdWalletEnd => _fetchColor('usdWalletEnd');

  Color get audWalletBegin => _fetchColor('audWalletBegin');

  Color get audWalletEnd => _fetchColor('audWalletEnd');

  Color get eurWalletBegin => _fetchColor('eurWalletBegin');

  Color get eurWalletEnd => _fetchColor('eurWalletEnd');

  Color get btcWalletBegin => _fetchColor('btcWalletBegin');

  Color get btcWalletEnd => _fetchColor('btcWalletEnd');

  Color get ethWalletBegin => _fetchColor('ethWalletBegin');

  Color get ethWalletEnd => _fetchColor('ethWalletEnd');

  Color get ltcWalletBegin => _fetchColor('ltcWalletBegin');

  Color get ltcWalletEnd => _fetchColor('ltcWalletEnd');

  Color get usdtWalletBegin => _fetchColor('usdtWalletBegin');

  Color get usdtWalletEnd => _fetchColor('usdtWalletEnd');

  Color get usdcWalletBegin => _fetchColor('usdcWalletBegin');

  Color get usdcWalletEnd => _fetchColor('usdcWalletEnd');

  Color get demoWalletBegin => _fetchColor('demoWalletBegin');

  Color get demoWalletEnd => _fetchColor('demoWalletEnd');

  Color get badgeBackgroundColor => _fetchColor('badgeBackgroundColor');

  Color get badgeTextColor => _fetchColor('badgeTextColor');

  Color get solidGreen => _fetchColor('solidGreen');

  Color get opacityGreen => _fetchColor('opacityGreen');

  Color get solidRed => _fetchColor('solidRed');

  Color get opacityRed => _fetchColor('opacityRed');

  Color get solidBlue => _fetchColor('solidBlue');

  Color get opacityBlue => _fetchColor('opacityBlue');

  Color get solidOrange => _fetchColor('solidOrange');

  Color get opacityOrange => _fetchColor('opacityOrange');

  Color _fetchColor(String name) => (isDark ? dark[name] : light[name])!;
}
