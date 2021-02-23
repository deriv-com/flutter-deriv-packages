#import "DerivSurvicatePlugin.h"
#if __has_include(<deriv_survicate/deriv_survicate-Swift.h>)
#import <deriv_survicate/deriv_survicate-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "deriv_survicate-Swift.h"
#endif

@implementation DerivSurvicatePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDerivSurvicatePlugin registerWithRegistrar:registrar];
}
@end
