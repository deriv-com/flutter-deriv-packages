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

  Color _fetchColor(String name) => (isDark ? dark[name] : light[name])!;
}
