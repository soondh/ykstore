//
//  AppDelegate.h
//  YokaStore
//
//  Created by ykadmin on 2018/1/29.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic,assign)BOOL allowRotation;
@property (nonatomic, retain) NSArray *apps;

@end

