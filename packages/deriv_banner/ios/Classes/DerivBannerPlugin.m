#import "DerivBannerPlugin.h"
#if __has_include(<deriv_banner/deriv_banner-Swift.h>)
#import <deriv_banner/deriv_banner-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "deriv_banner-Swift.h"
#endif

@implementation DerivBannerPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDerivBannerPlugin registerWithRegistrar:registrar];
}
@end
