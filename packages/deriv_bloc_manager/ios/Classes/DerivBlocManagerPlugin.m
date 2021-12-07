#import "DerivBlocManagerPlugin.h"
#if __has_include(<deriv_bloc_manager/deriv_bloc_manager-Swift.h>)
#import <deriv_bloc_manager/deriv_bloc_manager-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "deriv_bloc_manager-Swift.h"
#endif

@implementation DerivBlocManagerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDerivBlocManagerPlugin registerWithRegistrar:registrar];
}
@end
