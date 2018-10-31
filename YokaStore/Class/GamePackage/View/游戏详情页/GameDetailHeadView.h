//
//  GameDetailHeadView.h
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamePackageType.h"
#import "GameDetailHeadViewModel.h"

@interface GameDetailHeadView : UIView

- (void)scrollviewDidScrollViewOffset:(float) offset;
+ (CGFloat)defaultHeight;

@property (nonatomic,strong) GameDetailHeadViewModel *headViewModel;

@property (nonatomic,assign) GamePackageType type;


@end
