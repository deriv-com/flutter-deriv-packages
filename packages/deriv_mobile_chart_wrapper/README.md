A wrapper package around package _**deriv_chart**_ to implement any functionality specific to mobile and can be wrapped around the main chart package.
Since the main [chart package](https://github.com/regentmarkets/flutter-chart) is used in both mobile app and the web platform, for any feature that is specific to mobile, to keep the size of the main chart package small, we implement it in this package.

## Features
Menu and interfaces to add/remove indicators and drawing tools.

## Dependencies
- [deriv_chart](https://github.com/regentmarkets/flutter-chart)
- [deriv_theme](https://github.com/regentmarkets/flutter-deriv-packages/tree/master/packages/deriv_theme)
- [deriv_localizations](https://github.com/regentmarkets/flutter-deriv-packages/tree/master/packages/deriv_localizations)
- [deriv_ui](https://github.com/regentmarkets/flutter-deriv-packages/tree/master/packages/deriv_ui)

## Get started
Adding the depedency:
```
dependencies:
  deriv_mobile_chart_wrapper:
    git:
      url: git@github.com:deriv-com/flutter-deriv-packages.git
      path: packages/deriv_mobile_chart_wrapper
      ref: [latest_version]
```
