# flutter-deriv-packages

This repository contains private packages & plugins that are used by the company's products built in Flutter.

## Packages

| Name                                                            | Description                                                                       |
| --------------------------------------------------------------- | --------------------------------------------------------------------------------- |
| [form_builder](./packages/form_builder)                         | A simpler and cleaner way to create, validate and submit forms.                   |
| [analytics](./packages/analytics)                               | Used to collect and send analytical information to 'Firebase' and 'Segment'.      |
| [deriv_api_key_provider](./packages/deriv_api_key_provider)     | Used to provide deriv api key.                                                    |
| [deriv_banner](./packages/deriv_banner)                         | A widget to show banner in apps.                                                  |
| [deriv_bloc_manager](./packages/deriv_bloc_manager)             | Provides some tools to manage blocs.                                              |
| [deriv_lint](./packages/deriv_lint)                             | A Dart package that provides lint rules for Dart and Flutter.                     |
| [deriv_live_chat](./packages/deriv_live_chat)                   | A plugin for live chat SDK support to dart.                                       |
| [deriv_rudderstack](./packages/deriv_rudderstack)               | A plugin that add RudderStack SDK support to Flutter.                             |
| [deriv_signup_login](./packages/deriv_signup_login)             | A package for handling in app signup and login.                                   |
| [deriv_store_launcher](./packages/deriv_store_launcher)         | A plugin to lunch app stores base on platform and manufacturer.                   |
| [deriv_survicate](./packages/deriv_survicate)                   | A plugin for survicate SDK support to dart.                                       |
| [deriv_technical_analysis](./packages/deriv_technical_analysis) | A Dart package for Technical Analysis.                                            |
| [deriv_theme](./packages/deriv_theme)                           | A package that contains the theme used by Deriv products.                         |
| [deriv_ui](./packages/deriv_ui)                                 | A package to put all common deriv flutter widgets and themes.                     |
| [survey_monkey](./packages/survey_monkey)                       | Used to display a survey provided by surveyMonkey and returns completion results. |
| [update_checker](./packages/update_checker)                     | Check and retrieve update information from the server for the given package.      |


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
