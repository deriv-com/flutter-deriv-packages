import 'package:deriv_mobile_chart_wrapper/deriv_mobile_chart_wrapper.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/components/components.dart';
import 'package:deriv_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RSISettingPage extends StatefulWidget {
  const RSISettingPage({super.key});

  @override
  State<RSISettingPage> createState() => _RSISettingPageState();
}

class _RSISettingPageState extends State<RSISettingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ThemeProvider.margin16),
      child: Column(
        children: [
          GlowingContainer(
            child: Column(
              children: [
                ColorSelector(title: 'RSI', color: Colors.white),
                SizedBox(height: ThemeProvider.margin16),
                OptionSelector(
                    label: 'Source',
                    options: ['Close', 'Open', 'High', 'Low'],
                    onOptionSelected: (index) {})
              ],
            ),
          ),
          SizedBox(height: ThemeProvider.margin24),
          GlowingContainer(child: SizedBox.expand()),
        ],
      ),
    );
  }
}
