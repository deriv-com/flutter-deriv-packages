# deriv_survicate

A plugin for run survicate surveys on iOS and Android platforms.

## Getting started

To use this plugin, add `deriv_survicate` as a dependency in your `pubspec.yaml` file. Import `package:deriv_survicate/deriv_survicate.dart` and instantiate `DerivSurvicate`.

### Android integration

Configure your workspace key in `AndroidManifest.xml` file.

```xml
<application
    android:name=".MyApp"
>
    ...
    <meta-data android:name="com.survicate.surveys.workspaceKey" android:value="WORKSPACE_KEY"/>
</application>
```

### iOS integration

Add workspace key to your `Info.plist` file. Create the `Survicate` Dictionary and define the `WorkspaceKey` String in `Survicate` Dictionary.

```xml
<plist version="1.0">
<dict>
	...
	<key>Survicate</key>
	<dict>
	    <key>WorkspaceKey</key>
	    <string>WORKSPACE_KEY</string>
	</dict>
	...
</dict>
</plist>
```

## Example

There is an [example](./example) app that demonstrates how to use the plugin.
