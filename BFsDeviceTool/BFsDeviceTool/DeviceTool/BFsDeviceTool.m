//
//  BFsDeviceTool.m
//  BFsDeviceTool
//
//  Created by BFsAlex on 2019/10/16.
//  Copyright © 2019 BFsAlex. All rights reserved.
//

#import "BFsDeviceTool.h"
#import <CoreLocation/CoreLocation.h>

@interface BFsDeviceTool ()
@property (nonatomic, strong) CLLocationManager *locManager;

@end

@implementation BFsDeviceTool

+ (instancetype)defaultInstance {
    
    static BFsDeviceTool *deviceTool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        deviceTool = [[BFsDeviceTool alloc] init];
    });
    
    return deviceTool;
}

- (CLLocationManager *)locManager {
    
    if (!_locManager) {
        _locManager = [[CLLocationManager alloc] init];
    }
    
    return _locManager;
}

#pragma mark -

+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector  = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val = interfaceOrientation;
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}

+ (BOOL)equalToOrLaterThanVersionNum:(CGFloat)versionNum {
    
    CGFloat curVersion = [self currentSystemVersion];
    
    return curVersion >= versionNum;
}

+ (BOOL)laterThanVersionNum:(CGFloat)versionNum {
    
    CGFloat curVersion = [self currentSystemVersion];
    
    return curVersion > versionNum;
}

+ (BOOL)lowerThanVersionNum:(CGFloat)versionNum {
    
    CGFloat curVersion = [self currentSystemVersion];
    
    return curVersion < versionNum;
}

+ (BOOL)requireLocationAuthor {
    
    CLAuthorizationStatus curStatus = [CLLocationManager authorizationStatus];
    if (curStatus == kCLAuthorizationStatusAuthorizedAlways
        || curStatus == kCLAuthorizationStatusAuthorizedWhenInUse) {
        return YES;
    } else {
        [[BFsDeviceTool defaultInstance].locManager requestAlwaysAuthorization];
        return NO;
    }
}

#pragma mark - Private

+ (CGFloat)currentSystemVersion {
    
    CGFloat curVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
    return curVersion;
}

@end
