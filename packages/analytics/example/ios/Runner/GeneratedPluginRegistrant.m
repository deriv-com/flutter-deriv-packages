//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"

#if __has_include(<firebase_analytics/FLTFirebaseAnalyticsPlugin.h>)
#import <firebase_analytics/FLTFirebaseAnalyticsPlugin.h>
#else
@import firebase_analytics;
#endif

#if __has_include(<firebase_core/FLTFirebaseCorePlugin.h>)
#import <firebase_core/FLTFirebaseCorePlugin.h>
#else
@import firebase_core;
#endif

#if __has_include(<rudder_sdk_flutter/RudderSdkFlutterPlugin.h>)
#import <rudder_sdk_flutter/RudderSdkFlutterPlugin.h>
#else
@import rudder_sdk_flutter;
#endif

#if __has_include(<analytics/AnalyticsPlugin.h>)
#import <analytics/AnalyticsPlugin.h>
#else
@import analytics;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTFirebaseAnalyticsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseAnalyticsPlugin"]];
  [FLTFirebaseCorePlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseCorePlugin"]];
  [RudderSdkFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"RudderSdkFlutterPlugin"]];
  [AnalyticsPlugin registerWithRegistrar:[registry registrarForPlugin:@"AnalyticsPlugin"]];
}

@end
