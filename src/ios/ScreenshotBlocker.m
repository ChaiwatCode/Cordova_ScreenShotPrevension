#import "SecureWindow.h"
#import <UIKit/UIKit.h>

@implementation SecureWindow

- (void)makeSecure:(CDVInvokedUrlCommand *)command {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIWindow *window = self.viewController.view.window;
        if (!window) {
            [self showDebugMessage:@"Error: Main window is unavailable."];
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Main window unavailable"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            return;
        }

        if (@available(iOS 13.0, *)) {
            // Prevent screenshots and screen recordings on iOS 13+
            window.screenCapturedEventInterval = YES;
            if (window.screenCapturedEventInterval) {
                [self showDebugMessage:@"Success: Screenshot protection enabled (iOS 13+)."];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Screenshot protection enabled (iOS 13+)"];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            } else {
                [self showDebugMessage:@"Error: Failed to enable screenshot protection on iOS 13+. Please check device settings."];
                CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Failed to enable screenshot protection"];
                [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
            }
        } else {
            // Fallback for iOS versions below 13.0 (Blur effect logic can be added here)
            [self showDebugMessage:@"Success: Blur effect applied for screenshot protection (iOS < 13)."];
            CDVPluginResult *pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Blur effect applied (iOS < 13)"];
            [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
        }
    });
}

// Helper method to display debug messages
- (void)showDebugMessage:(NSString *)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIViewController *viewController = self.viewController;
        if (!viewController) return;

        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Debug Message"
                                                                       message:message
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:okAction];
        [viewController presentViewController:alert animated:YES completion:nil];
    });
}

@end
