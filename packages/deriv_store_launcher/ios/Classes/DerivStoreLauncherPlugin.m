#import "DerivStoreLauncherPlugin.h"
#if __has_include(<deriv_store_launcher/deriv_store_launcher-Swift.h>)
#import <deriv_store_launcher/deriv_store_launcher-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "deriv_store_launcher-Swift.h"
#endif

@implementation DerivStoreLauncherPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDerivStoreLauncherPlugin registerWithRegistrar:registrar];
}
@end
