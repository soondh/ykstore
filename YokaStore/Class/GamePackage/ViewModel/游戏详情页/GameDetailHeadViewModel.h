//
//  GameDetailHeadViewModel.h
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameDetailHeadViewModel : NSObject
@property (nonatomic, assign) NSInteger projectID;
@property (nonatomic, strong) NSURL *adImageUrl;
@property (nonatomic, strong) NSURL *gameImageIconUrl;
@property (nonatomic, copy) NSString *gameName;
@property (nonatomic, copy) NSString *updateTime;
@property (nonatomic, strong) NSURL *downloadUrl;
@end
