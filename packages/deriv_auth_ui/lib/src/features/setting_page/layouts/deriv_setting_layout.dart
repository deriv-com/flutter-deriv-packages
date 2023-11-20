import 'package:deriv_auth_ui/src/core/extensions/context_extension.dart';
import 'package:deriv_auth_ui/src/core/helpers/endpoint_helper.dart';
import 'package:deriv_theme/deriv_theme.dart';
import 'package:deriv_ui/utils/regex_helpers.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// Login setting page
///
/// This page is used to apply necessary QA configurations for login process
/// Two fields can be set in this page 'endpoint' and 'app_id'
/// The applied values stored for future usage
class DerivSettingLayout extends StatefulWidget {
  /// Login Setting Page Constructor
  const DerivSettingLayout({
    required this.updateFlavorConfigs,
    required this.appLabel,
    required this.saveValues,
    this.endpoint = defaultEndpoint,
    this.appId = defaultAppId,
    this.devApp = 'com.deriv.app.dev',
    this.stagingApp = 'com.deriv.app.staging',
    this.getAppEnv,
    this.setAppEnv,
    Key? key,
  }) : super(key: key);

  /// Update flavor configurations
  final Future<void> updateFlavorConfigs;

  /// Save values to shared preferences
  final Function({required String endpoint, required String appId}) saveValues;

  /// End Point
  final String endpoint;

  /// App Id
  final String appId;

  /// Application label
  final String appLabel;

  /// Dev flavor app.
  final String devApp;

  /// Staging flavor app.
  final String stagingApp;

  /// Gets environment variable
  final Future<bool>? getAppEnv;

  /// Sets environment variable
  final Future<void> Function({required bool value})? setAppEnv;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<DerivSettingLayout> {
  final TextEditingController _endpointController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Future<PackageInfo> packageInfo;

  @override
  void initState() {
    super.initState();
    packageInfo = PackageInfo.fromPlatform();

    _endpointController.text = widget.endpoint;
    _appIdController.text = widget.appId;
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          // Save Values to shared preferences
          widget.saveValues(
            endpoint: _endpointController.text.isNotEmpty
                ? _endpointController.text
                : defaultEndpoint,
            appId: _appIdController.text.isNotEmpty
                ? _appIdController.text
                : defaultAppId,
          );

          // Update Flavor Configurations before dismissing the page
          await widget.updateFlavorConfigs;
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: ThemeProvider.zeroMargin,
            title: Text(widget.appLabel),
          ),
          body: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                _title,
                const SizedBox(height: ThemeProvider.margin16),
                _endpoint,
                const SizedBox(height: ThemeProvider.margin16),
                _appId,
                const SizedBox(width: ThemeProvider.margin08),
                _buildEnvironmentSwitcher,
              ],
            ),
          ),
        ),
      );

  Widget get _buildEnvironmentSwitcher => FutureBuilder<PackageInfo>(
      future: packageInfo,
      builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
        if (snapshot.hasData &&
            (snapshot.data?.packageName == widget.devApp ||
                snapshot.data?.packageName == widget.stagingApp)) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: ThemeProvider.margin16),
            child: Row(
              children: <Widget>[
                const Text('Production environment'),
                const SizedBox(width: ThemeProvider.margin08),
                FutureBuilder<bool>(
                    future: widget.getAppEnv,
                    builder:
                        (BuildContext context, AsyncSnapshot<bool?> snapshot) {
                      if (snapshot.hasData && widget.setAppEnv != null) {
                        return Switch(
                          value: snapshot.data ?? false,
                          onChanged: (bool val) {
                            setState(() {
                              widget.setAppEnv!(value: val);
                            });
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    })
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      });

  Widget get _title => Padding(
        padding: const EdgeInsets.only(
          left: ThemeProvider.margin12,
          top: ThemeProvider.margin24,
        ),
        child: Text(
          context.localization.labelDeveloper,
          style: context.theme.textStyle(
            textStyle: TextStyles.body1Bold,
            color: context.theme.colors.coral,
          ),
        ),
      );

  Widget get _endpoint => _buildTextInputField(
        label: context.localization.labelEndpoint,
        semantic: context.localization.semanticEndpoint,
        controller: _endpointController,
        validator: (String? value) => hasOnlySmallLettersAndNumberInput(value!)
            ? null
            : context.localization.warnInvalidEndpoint,
      );

  Widget get _appId => _buildTextInputField(
        label: context.localization.labelApplicationID,
        semantic: context.localization.semanticApplicationID,
        controller: _appIdController,
        validator: (String? value) => hasOnlyNumberInput(value!)
            ? null
            : context.localization.warnInvalidApplicationID,
      );

  Widget _buildTextInputField({
    required String label,
    required String semantic,
    required TextEditingController controller,
    required FormFieldValidator<String> validator,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: ThemeProvider.margin16),
        child: Semantics(
          label: semantic,
          explicitChildNodes: true,
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.theme.colors.lessProminent,
                ),
              ),
              labelText: label,
              labelStyle: TextStyle(color: context.theme.colors.lessProminent),
              border: const OutlineInputBorder(),
            ),
            controller: controller,
            onChanged: (_) => _formKey.currentState!.validate(),
            validator: validator,
          ),
        ),
      );
}
