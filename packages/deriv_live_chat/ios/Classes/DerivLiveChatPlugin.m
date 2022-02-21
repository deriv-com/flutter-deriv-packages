#import "DerivLiveChatPlugin.h"
#if __has_include(<deriv_live_chat/deriv_live_chat-Swift.h>)
#import <deriv_live_chat/deriv_live_chat-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "deriv_live_chat-Swift.h"
#endif

@implementation DerivLiveChatPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDerivLiveChatPlugin registerWithRegistrar:registrar];
}
@end
