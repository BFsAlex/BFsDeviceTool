//
//  BFsDeviceTool.m
//  BFsDeviceTool
//
//  Created by BFsAlex on 2019/10/16.
//  Copyright © 2019 BFsAlex. All rights reserved.
//

#import "BFsDeviceTool.h"

@implementation BFsDeviceTool

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

@end
