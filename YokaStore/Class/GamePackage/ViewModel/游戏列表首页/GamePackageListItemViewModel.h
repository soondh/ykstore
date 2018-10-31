//
//  GamePackageListItemViewModel.h
//  YokaStore
//
//  Created by ykadmin on 2018/1/29.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GamePackageListItemViewModel : NSObject
@property (nonatomic,strong) NSURL *iconUrl;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,assign) NSInteger projId;

@end
