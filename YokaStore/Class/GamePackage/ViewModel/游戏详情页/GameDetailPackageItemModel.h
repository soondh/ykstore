//
//  GameDetailPackageItemModel.h
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameDetailPackageItemModel : NSObject
@property (nonatomic,copy) NSString *packageName;
@property (nonatomic,copy) NSString *updateTime;
@property (nonatomic,strong) NSURL *downloadUrl;
@end
