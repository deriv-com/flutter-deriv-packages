#import "FlutterDerivBlocManagerPlugin.h"
#if __has_include(<flutter_deriv_bloc_manager/flutter_deriv_bloc_manager-Swift.h>)
#import <flutter_deriv_bloc_manager/flutter_deriv_bloc_manager-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_deriv_bloc_manager-Swift.h"
#endif

@implementation FlutterDerivBlocManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterDerivBlocManagerPlugin registerWithRegistrar:registrar];
}
@end
