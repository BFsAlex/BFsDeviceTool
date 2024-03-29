//
//  ViewController.m
//  BFsDeviceTool
//
//  Created by BFsAlex on 2019/10/16.
//  Copyright © 2019 BFsAlex. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "BFsDeviceTool.h"
#import <CoreLocation/CoreLocation.h>


@interface ViewController (){
    CLLocationManager *_locManager;
}
@property (nonatomic, weak) UIButton *orientationBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configSubviews];
//    [self registerOrientationStatusNotification];
}

- (void)viewWillAppear:(BOOL)animated {
    
    if ([self requireLocationAuthor]) {
        NSLog(@"已获取定位授权");
    } else {
        NSLog(@"未获取定位授权");
    }
//    _locManager = [[CLLocationManager alloc] init];
//    [_locManager requestAlwaysAuthorization];
}

- (void)configSubviews {
    //
    UIButton *orientationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:orientationBtn];
    orientationBtn.frame = CGRectMake(0, 0, 100, 60);
    orientationBtn.center = self.view.center;
    [orientationBtn setTitle:@"转屏" forState:UIControlStateNormal];
    [orientationBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [orientationBtn addTarget:self action:@selector(actionOrientationBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.orientationBtn = orientationBtn;
}

#pragma mark 设备版本

- (BOOL)requireLocationAuthor {
    
//    if ([BFsDeviceTool lowerThanVersionNum:13.f]) {
//        return true;
//    }
    
    
    return [BFsDeviceTool requireLocationAuthor];
}

/*
 手动控制转屏
 */
- (void)actionOrientationBtn:(UIButton *)sender {
    
    AppDelegate *appDelegate = [self getAppDelegate];
    UIInterfaceOrientation targetOrientation;
    if (appDelegate.allowRotation) {
        appDelegate.allowRotation = NO;
        targetOrientation = UIInterfaceOrientationPortrait;
    } else {
        appDelegate.allowRotation = YES;
        targetOrientation = UIInterfaceOrientationLandscapeRight;
    }
    [BFsDeviceTool switchNewOrientation:targetOrientation];
}

#pragma mark - 监听转屏状态

- (void)registerOrientationStatusNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(deviceOrientationDidChange:) name:UIDeviceOrientationDidChangeNotification object:nil];
}

- (void)deviceOrientationDidChange:(NSNotification *)noti {
    //
    UIDeviceOrientation curOrientation = [UIDevice currentDevice].orientation;
        
    NSLog(@"cur orientation:%ld", curOrientation);
    self.orientationBtn.center = self.view.center;
}

#pragma mark -

- (id)getAppDelegate {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    return appDelegate;
}

@end
