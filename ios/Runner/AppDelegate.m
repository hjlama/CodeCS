//#include "AppDelegate.h"
//#include "GeneratedPluginRegistrant.h"
//
//
//@implementation AppDelegate
////@import Firebase
////
////- (BOOL)application:(UIApplication *)application
////    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
////  [GeneratedPluginRegistrant registerWithRegistry:self];
////  // Override point for customization after application launch.
////  return [super application:application didFinishLaunchingWithOptions:launchOptions];
////}
//
////  AppDelegate.m
//#import <FBSDKCoreKit/FBSDKCoreKit.h>
//
//- (BOOL)application:(UIApplication *)application
//didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//
//    [[FBSDKApplicationDelegate sharedInstance] application:application
//                             didFinishLaunchingWithOptions:launchOptions];
//    // Add any custom logic here.
//    return YES;
//}
//
//- (BOOL)application:(UIApplication *)application
//            openURL:(NSURL *)url
//            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
//
//    BOOL handled = [[FBSDKApplicationDelegate sharedInstance] application:application
//                                                                  openURL:url
//                                                        sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
//                                                               annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
//                    ];
//    // Add any custom logic here.
//    return handled;
//}
//
//
//@end

#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end