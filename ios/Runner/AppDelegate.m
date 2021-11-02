#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.

    FlutterViewController* controller = (FlutterViewController*)self.window.rootViewController;

    FlutterMethodChannel* channel = [FlutterMethodChannel
                                     methodChannelWithName:@"demo.gawkat.com/info"
                                     binaryMessenger:controller];

    [channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {

        NSString *from = call.arguments[@"from"];

        if ([@"getMessage" isEqualToString:call.method]) {
            NSString *message = @"iOS says greetings to ";
            NSString *returnMessage = [message stringByAppendingString:from];

            result(returnMessage);

            //UIApplication *mySafari = [UIApplication sharedApplication];
            //NSURL *myURL = [[NSURL alloc]initWithString:@"https://flutter.io"];
            //[mySafari openURL:myURL];
        }

    }];

    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
