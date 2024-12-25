#import <Foundation/Foundation.h>
#import <Cordova/CDVPlugin.h>

@interface SecureWindow : CDVPlugin

- (void)makeSecure:(CDVInvokedUrlCommand *)command;

@end

