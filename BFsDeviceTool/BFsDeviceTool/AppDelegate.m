//
//  AppDelegate.m
//  BFsDeviceTool
//
//  Created by BFsAlex on 2019/10/16.
//  Copyright © 2019 BFsAlex. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {

    if (self.allowRotation) {
        // 横屏
        return UIInterfaceOrientationMaskLandscape;
    } else {
        // 竖屏
        return UIInterfaceOrientationMaskPortrait;
    }
}

@end
