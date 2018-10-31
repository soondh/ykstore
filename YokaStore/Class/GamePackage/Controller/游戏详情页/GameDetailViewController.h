//
//  GameDetailViewController.h
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameDetailViewController : UIViewController
@property (nonatomic,assign) NSInteger projectID;
@property (nonatomic,assign) NSString *gameName;
@property (nonatomic,strong) NSURL *icon;

@end
