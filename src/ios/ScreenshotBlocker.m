#import "ScreenshotBlocker.h"
#import <UIKit/UIKit.h>
@interface ScreenshotBlocker() {
    CDVInvokedUrlCommand * _eventCommand;
}
@end

@implementation ScreenshotBlocker

- (void)makeSecure:(CDVInvokedUrlCommand *)command {
  /*  dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = self.viewController.view.window;
        if (!window) {
            [self showDebugMessage:@"Error: Main window is unavailable."];
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Main window unavailable"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            return;
        }

        if (@available(iOS 11.0, *)) {
            // Detect screen capture on iOS 11+
            if ([UIScreen mainScreen].isCaptured) {
                [self showDebugMessage:@"Success: Screenshot protection enabled (iOS 11+)."];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Screenshot protection enabled"];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            } else {
                [self showDebugMessage:@"Error: Failed to detect screenshot capture (iOS 11+)."];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Failed to detect screenshot capture"];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        } else {
            // Fallback for iOS versions below 11.0
            [self showDebugMessage:@"Success: Blur effect applied for screenshot protection (iOS < 11)."];
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Blur effect applied"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    });
}*/

// Helper method to display debug messages as alerts
- (void)showDebugMessage:(NSString *)message {
    /*  dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *viewController = self.viewController;
        if (!viewController) return;

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Debug Message"
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        [viewController presentViewController:alert animated:YES completion:nil];
    });*/
}

@end
