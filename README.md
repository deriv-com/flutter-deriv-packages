# flutter-deriv-packages

This repository contains private packages & plugins that are used by the company's products built in Flutter.

### <span style="color:green">GIT HOOK</span>

<span style="color:orange">This Hook will check for Semantic versioning commit convention</span></br>
1- Please download commit-msg file from githooks/commit-msg.</br>
2- Run the command below.</br>

```BASH
cp $HOME/Downloads/commit-msg $HOME/.git/hooks/commit-msg \
  && chmod +x $HOME/.git/hooks/commit-msg
```

## Using the packages

Each package has been released as git tag with convention as **packageName-vVersionNumber**`(Example: deriv_auth-v7.0.15)`. To use the package, add the following to your pubspec.yaml file:

```yaml
deriv_ui:
  git:
    url: https://github.com/deriv-com/flutter-deriv-packages.git
    path: packages/deriv_ui
    ref: deriv_ui-v0.1.2+3 #your prefered version
```

## Packages

| Name                                                                      | Description                                                                                                                                           | Version                                                           |
| ------------------------------------------------------------------------- |-------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------|
| [analytics](./packages/analytics)                                         | Used to collect and send analytical information to 'Firebase',  'Rudderstack' and 'Datadog'.                                                          | [v4.2.0](./packages/analytics/CHANGELOG.md)                       |                                        | [v4.2.0](./packages/analytics/CHANGELOG.md)                       |
| [deriv_auth](./packages/deriv_auth)                                       | A Dart package that provides Authentication logic for Deriv applications.                                                                             | [v7.0.15 ](./packages/deriv_auth/CHANGELOG.md)                    |
| [deriv_banner](./packages/deriv_banner)                                   | A widget to show banner in apps.                                                                                                                      | [v0.0.1+2](./packages/deriv_banner/CHANGELOG.md)                  |
| [deriv_bloc_manager](./packages/deriv_bloc_manager)                       | Provides some tools to manage blocs.                                                                                                                  | [v0.0.1](./packages/deriv_bloc_manager/CHANGELOG.md)              |
| [deriv_datadog](./packages/deriv_datadog)                                 | A package that helps you monitor the performance and user interactions of your Flutter app by sending data to Datadog.                                | [v0.0.2](./packages/deriv_datadog/CHANGELOG.md)                   |
| [deriv_date_range_picker](./packages/deriv_date_range_picker)             | Provides a widget that allows users to select a date range either by calendar mode or input mode.                                                     | [v0.0.1+14](./packages/deriv_date_range_picker/CHANGELOG.md)       |
| [deriv_dependency_injector](./packages/deriv_dependency_injector)         | A package for handling dependency injection in Dart.                                                                                                  | [v1.0.2](./packages/deriv_dependency_injector/CHANGELOG.md)       |
| [deriv_env](./packages/deriv_env)                                         | A package to load and store environment variables.                                                                                                    | [v0.0.1+2](./packages/deriv_env/CHANGELOG.md)                     |
| [deriv_expandable_bottom_sheet](./packages/deriv_expandable_bottom_sheet) | A widget that helps to display an expandable bottom sheet.                                                                                            | [v0.0.2+2](./packages/deriv_expandable_bottom_sheet/CHANGELOG.md) |
| [deriv_http_client](./packages/deriv_http_client)                         | A package that provides a wrapper for http package.                                                                                                   | [v2.1.0](./packages/deriv_http_client/CHANGELOG.md)               |
| [deriv_lint](./packages/deriv_lint)                                       | A Dart package that provides lint rules for Dart and Flutter.                                                                                         | [v1.0.1](./packages/deriv_lint/CHANGELOG.md)                      |
| [deriv_live_chat](./packages/deriv_live_chat)                             | A plugin for live chat SDK support to dart.                                                                                                           | [v0.0.2+1](./packages/deriv_live_chat/CHANGELOG.md)                 |
| [deriv_language_selector](./packages/deriv_language_selector)             | A package to handle language change of the app.                                                                                                       | [v0.0.4+4](./packages/deriv_language_selector/CHANGELOG.md)       |
| [deriv_localizations](./packages/deriv_localizations)                     | A Package that contains the localization arb(coming from Crowdin) and dart generated files for flutter_deriv_packages.                                | [v1.7.3](./packages/deriv_localizations/CHANGELOG.md)             |
| [deriv_numpad](./packages/deriv_numpad)                                   | Number Pad Widget for number input.                                                                                                                   | [v1.1.13](./packages/deriv_numpad/CHANGELOG.md)                    |
| [deriv_rudderstack](./packages/deriv_rudderstack)                         | A plugin that add RudderStack SDK support to Flutter.                                                                                                 | [v1.3.1](./packages/deriv_rudderstack/CHANGELOG.md)               |
| [deriv_store_launcher](./packages/deriv_store_launcher)                   | A plugin to launch app stores base on platform and manufacturer.                                                                                      | [v0.0.2+1](./packages/deriv_store_launcher/CHANGELOG.md)          |
| [deriv_technical_analysis](./packages/deriv_technical_analysis)           | A Dart package for Technical Analysis.                                                                                                                | [v1.1.2](./packages/deriv_technical_analysis/CHANGELOG.md)        |
| [deriv_theme](./packages/deriv_theme)                                     | A package that contains the theme used by Deriv products.                                                                                             | [v3.0.1](./packages/deriv_theme/CHANGELOG.md)                     |
| [deriv_ui](./packages/deriv_ui)                                           | A package that contains the UI components used by Deriv products.                                                                                     | [v0.1.2+3](./packages/deriv_ui/CHANGELOG.md)                      |
| [deriv_utilities](./packages/deriv_utilities)                             | A package that contains the utilities including helper functions, mixins, and extensions.                                                             | [v1.0.0](./packages/deriv_utilities/CHANGELOG.md)                 |
| [deriv_websocket](./packages/deriv_web_socket_client)                     | A package that provides a easy to use websocket client.                                                                                               | [v1.0.1](./packages/deriv_web_socket_client/CHANGELOG.md)         |
| [deriv_web_view](./packages/deriv_web_view)                               | Deriv web view package.                                                                                                                               | [v0.2.2+6](./packages/deriv_web_view/CHANGELOG.md)                |
| [deriv_widgetbook](./packages/deriv_widgetbook)                           | Storybook for Deriv UI Widgets and Components                                                                                                         | [v0.0.2+40](./packages/deriv_widgetbook/CHANGELOG.md)             |
| [form_builder](./packages/form_builder)                                   | A simpler and cleaner way to create, validate and submit forms.                                                                                       | [v1.0.0+1](./packages/form_builder/CHANGELOG.md)                  |
| [update_checker](./packages/update_checker)                               | Check and retrieve update information from the server for the given package.                                                                          | [v3.1.2](./packages/update_checker/CHANGELOG.md)                  |
| [deriv_feature_flag](./packages/deriv_feature_flag)                       | A package to provide feature flag functionality for apps.                                                                                             | [v0.1.2+1](./packages/deriv_feature_flag/CHANGELOG.md)              |
| [deriv_mobile_chart_wrapper](./packages/deriv_mobile_chart_wrapper)       | A wrapper package around package _**deriv_chart**_ to implement any functionality specific to mobile and can be wrapped around the main chart package. | [v0.1.13+1](./packages/deriv_mobile_chart_wrapper/CHANGELOG.md)      |
| [deriv_cipher](./packages/deriv_cipher)       | A package to encrypt and decrypt data using AES encryption.| [v0.0.3](./packages/deriv_cipher/CHANGELOG.md)                    |


## Environment Setup

We use [Melos](https://pub.dev/packages/melos) to manage the multiple packages in this repository. To get started, install Melos globally:

```bash
dart pub global activate melos
```

Running `pub get` on all packages, run:

```bash
melos bootstrap
```

`Analyze` and `Test` has already been configured in `melos.yaml` so you can do the following:

<b>Running `flutter analyze` on all packages:</b>

```bash
melos run analyze
```

<b>Running `flutter test` on all packages: </b>

```bash
melos run test --no-select
```

If you'd like to run any other command on all packages, you can configure it in `melos.yaml` or run it directly with melos:

```bash
$ melos exec --\
    your command here
```
