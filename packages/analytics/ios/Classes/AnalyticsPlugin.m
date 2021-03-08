#import "AnalyticsPlugin.h"
#if __has_include(<analytics/analytics-Swift.h>)
#import <analytics/analytics-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "analytics-Swift.h"
#endif

@implementation AnalyticsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAnalyticsPlugin registerWithRegistrar:registrar];
}
@end
