# flutter-deriv-packages

This repository contains private packages & plugins that are used by the company's products built in Flutter.

## Packages

| Name                                                                      | Description                                                                                                            |
| ------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------- |
| [analytics](./packages/analytics)                                         | Used to collect and send analytical information to 'Firebase' and 'Segment'.                                           |
| [deriv_auth](./packages/deriv_auth)                                       | A Dart package that provides Authentication logic for Deriv applications.                                              |
| [deriv_auth_ui](./packages/deriv_auth_ui)                                 | A Dart package that provides Authentication UI for Deriv applications.                                                 |
| [deriv_banner](./packages/deriv_banner)                                   | A widget to show banner in apps.                                                                                       |
| [deriv_bloc_manager](./packages/deriv_bloc_manager)                       | Provides some tools to manage blocs.                                                                                   |
| [deriv_datadog](./packages/deriv_datadog)                                 | A package that helps you monitor the performance and user interactions of your Flutter app by sending data to Datadog. |
| [deriv_date_range_picker](./packages/deriv_date_range_picker)             | Provides a widget that allows users to select a date range either by calendar mode or input mode.                      |
| [deriv_dependency_injector](./packages/deriv_dependency_injector)         | A package for handling dependency injection in Dart.                                                                   |
| [deriv_env](./packages/deriv_env)                                         | A package to load and store environment variables.                                                                     |
| [deriv_expandable_bottom_sheet](./packages/deriv_expandable_bottom_sheet) | A widget that helps to display an expandable bottom sheet.                                                             |
| [deriv_http_client](./packages/deriv_http_client)                         | A package that provides a wrapper for http package.                                                                    |
| [deriv_lint](./packages/deriv_lint)                                       | A Dart package that provides lint rules for Dart and Flutter.                                                          |
| [deriv_live_chat](./packages/deriv_live_chat)                             | A plugin for live chat SDK support to dart.                                                                            |
| [deriv_numpad](./packages/deriv_numpad)                                   | Number Pad Widget for number input.                                                                                    |
| [deriv_rudderstack](./packages/deriv_rudderstack)                         | A plugin that add RudderStack SDK support to Flutter.                                                                  |
| [deriv_signup_login](./packages/deriv_signup_login)                       | A package for handling in app signup and login.                                                                        |
| [deriv_store_launcher](./packages/deriv_store_launcher)                   | A plugin to lunch app stores base on platform and manufacturer.                                                        |
| [deriv_technical_analysis](./packages/deriv_technical_analysis)           | A Dart package for Technical Analysis.                                                                                 |
| [deriv_theme](./packages/deriv_theme)                                     | A package that contains the theme used by Deriv products.                                                              |
| [deriv_ui](./packages/deriv_ui)                                           | A package that contains the UI components used by Deriv products.                                                      |
| [deriv_utilities](./packages/deriv_utilities)                             | A package that contains the utilities including helper functions, mixins, and extensions.                              |
| [deriv_web_view](./packages/deriv_web_view)                               | Deriv web view package.                                                                                                |
| [form_builder](./packages/form_builder)                                   | A simpler and cleaner way to create, validate and submit forms.                                                        |
| [update_checker](./packages/update_checker)                               | Check and retrieve update information from the server for the given package.                                           |

# Add New Package in CI Configuration(config.yml)

This repository contains packages with CI configuration to run basic flutter commands, if we add new package under flutter-deriv-packages/packages we have to add package in .circleci/config.yml file.

Steps to add new package in config.yml

1. Open root of the package flutter-deriv-packages
2. Go to circleci/config.yml
3. Go to Steps and add

- run:
  working_directory: ~/flutter-deriv-packages/packages/[new_package_name]
  command: flutter pub get && flutter analyze && flutter test
  name: [new_package_name] analysis

4. Edit Commands as per new package requirements.
