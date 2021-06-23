# flutter_install_referer

This package if build for flutter to get install referer, such as channel info, install referer, downlaod time, and
any other custom info.

but you need extra steps and combain this package to finish the job. I will put the steps below.

* this package only work in android *

# steps

## 1. install this package
install this package in you project, and you can get your referer data as Map in this way:

```dart
Map<String,String> refererInfo = await FlutterInstallReferer.installReferer;
```
as you see, the data is a Map.

## 2. build apk
you can use command methods to build your project to apk file. because we will add extra data to the apk file later.
such as ：

```shell
 flutter build apk --split-per-abi
```

## 3. add your referer data to apk file
now, we need a command line tool `walle-cli` , [you can click here to see more info about this tool](https://github.com/Meituan-Dianping/walle/tree/master/walle-cli)

frist you need downlaod this tool in [here](https://github.com/Meituan-Dianping/walle/releases)

and then the basic command is :
```
java -jar walle-cli-all.jar put -c sky -e buildTime=20200620,info=hello /Users/Downloads/app.apk /Users/xxx/Downloads/newAPKFilePath.apk
```
- -c : channel, you can use as referer.
- -e : extra data, you can add any other data with `key=value` pair.
- `/Users/Downloads/app.apk`：the apk file path you build last step.
- `/Users/xxx/Downloads/newAPKFilePath.apk` new apk file path.

this command will complete super fast, actually you can repack the apk file to over 100 channels in milliseconds


## 4. install or share the new apk file
for test you can run `adb install /Users/xxx/Downloads/newAPKFilePath.apk`

and then you can get the Map data you need.

you can get something like this.

<img src="https://raw.githubusercontent.com/SpringMagnolia/flutter_install_referer/master/images/screenshot.jpg" width = "400" alt="screenshot" align=center />










