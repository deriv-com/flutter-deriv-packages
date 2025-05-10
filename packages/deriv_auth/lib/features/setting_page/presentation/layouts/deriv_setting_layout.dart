import 'package:deriv_auth/core/extensions/context_extension.dart';
import 'package:deriv_auth/core/helpers/endpoint_helper.dart';
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
    this.features,
    Key? key,
  }) : super(key: key);

  /// Update flavor configurations
  final Function({required String endpoint, required String appId})
      updateFlavorConfigs;

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

  /// Feature flag widget that should be listed in the setting page.
  final Widget? features;

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
  Widget build(BuildContext context) => widget.features != null
      ? WillPopScope(
          onWillPop: () async {
            final String endpoint = _endpointController.text.isNotEmpty
                ? _endpointController.text
                : defaultEndpoint;
            final String appId = _appIdController.text.isNotEmpty
                ? _appIdController.text
                : defaultAppId;
            await Future.wait(<Future<void>>[
              await widget.saveValues(endpoint: endpoint, appId: appId),
              await widget.updateFlavorConfigs(
                  endpoint: endpoint, appId: appId),
            ]);
            return true;
          },
          child: Scaffold(
            key: const ValueKey<String>('app_settings_page'),
            appBar: AppBar(
              elevation: ThemeProvider.zeroMargin,
              title: Text(widget.appLabel),
              leading: const BackButton(
                key: ValueKey<String>('app_settings_page_back_button'),
              ),
            ),
            body: widget.features,
          ),
        )
      : _buildBasicAppSettings();

  Widget _buildBasicAppSettings() => WillPopScope(
        onWillPop: () async {
          final String endpoint = _endpointController.text.isNotEmpty
              ? _endpointController.text
              : defaultEndpoint;
          final String appId = _appIdController.text.isNotEmpty
              ? _appIdController.text
              : defaultAppId;

          // Save Values to shared preferences
          await widget.saveValues(endpoint: endpoint, appId: appId);

          // Update Flavor Configurations before dismissing the page
          await widget.updateFlavorConfigs(endpoint: endpoint, appId: appId);

          return true;
        },
        child: Scaffold(
          key: const ValueKey<String>('app_settings_page'),
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
                _endpointTextInput,
                const SizedBox(height: ThemeProvider.margin16),
                _appIdTextInput,
                const SizedBox(width: ThemeProvider.margin08),
                _buildEnvironmentSwitcher,
              ],
            ),
          ),
        ),
      );

  Widget get _buildEnvironmentSwitcher => widget.setAppEnv != null &&
          widget.getAppEnv != null
      ? FutureBuilder<PackageInfo>(
          future: packageInfo,
          builder: (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
            if (snapshot.hasData &&
                (snapshot.data?.packageName == widget.devApp ||
                    snapshot.data?.packageName == widget.stagingApp)) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ThemeProvider.margin16),
                child: Row(
                  children: <Widget>[
                    const Text('Production environment'),
                    const SizedBox(width: ThemeProvider.margin08),
                    FutureBuilder<bool>(
                        future: widget.getAppEnv,
                        builder: (BuildContext context,
                            AsyncSnapshot<bool?> snapshot) {
                          if (snapshot.hasData) {
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
          })
      : const SizedBox.shrink();

  Widget get _title => Padding(
        padding: const EdgeInsets.only(
          left: ThemeProvider.margin12,
          top: ThemeProvider.margin24,
        ),
        child: Text(
          context.derivAuthLocalization.labelDeveloper,
          style: context.theme.textStyle(
            textStyle: TextStyles.body1Bold,
            color: context.theme.colors.coral,
          ),
        ),
      );

  Widget get _endpointTextInput => _buildTextInputField(
        label: context.derivAuthLocalization.labelEndpoint,
        semantic: context.derivAuthLocalization.semanticEndpoint,
        controller: _endpointController,
        validator: (String? value) => hasOnlySmallLettersAndNumberInput(value!)
            ? null
            : context.derivAuthLocalization.warnInvalidEndpoint,
      );

  Widget get _appIdTextInput => _buildTextInputField(
        label: context.derivAuthLocalization.labelApplicationID,
        semantic: context.derivAuthLocalization.semanticApplicationID,
        controller: _appIdController,
        validator: (String? value) => hasOnlyNumberInput(value!)
            ? null
            : context.derivAuthLocalization.warnInvalidApplicationID,
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
