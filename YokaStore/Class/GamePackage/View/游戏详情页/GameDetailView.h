//
//  GameDetailView.h
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameDetailHeadViewModel.h"
#import "GameDetailDataProtocol.h"
#import "GameDetailBusinessProtocol.h"
#import "GamePackageType.h"

#define NAVIGATIONBARH [UINavigationController new].navigationBar.size.height
#define STATUSBARH [UIApplication sharedApplication].statusBarFrame.size.height

@interface GameDetailView : UIView <CDDMutableArrayDelegate>
@property (nonatomic, strong) GameDetailHeadViewModel *headerViewModel;
@property (nonatomic, assign) GamePackageType type;
@property (nonatomic, strong) UITableView *tableView;

-(void)firstNetWork;
@end
