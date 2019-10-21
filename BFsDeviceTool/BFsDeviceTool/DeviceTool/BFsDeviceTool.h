//
//  BFsDeviceTool.h
//  BFsDeviceTool
//
//  Created by BFsAlex on 2019/10/16.
//  Copyright © 2019 BFsAlex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BFsDeviceTool : NSObject

+ (instancetype)defaultInstance;

#pragma mark - Orientation
+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation;
#pragma mark - Device version
/*
 大于等于versionNum版本
 */
+ (BOOL)equalToOrLaterThanVersionNum:(CGFloat)versionNum;
/*
 大于versionNum版本
 */
+ (BOOL)laterThanVersionNum:(CGFloat)versionNum;
/*
 小于versionNum版本
 */
+ (BOOL)lowerThanVersionNum:(CGFloat)versionNum;
/*
 申请定位权限
 */
+ (BOOL)requireLocationAuthor;

@end

NS_ASSUME_NONNULL_END
