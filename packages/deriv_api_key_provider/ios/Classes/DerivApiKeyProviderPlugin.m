#import "DerivApiKeyProviderPlugin.h"
#if __has_include(<deriv_api_key_provider/deriv_api_key_provider-Swift.h>)
#import <deriv_api_key_provider/deriv_api_key_provider-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "deriv_api_key_provider-Swift.h"
#endif

@implementation DerivApiKeyProviderPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDerivApiKeyProviderPlugin registerWithRegistrar:registrar];
}
@end
