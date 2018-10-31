//
//  GameDetailPackageCell.h
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UnderLineLabel.h"
#import "GameDetailPackageItemModel.h"

@interface GameDetailPackageCell : UITableViewCell
@property (nonatomic,strong) GameDetailPackageItemModel *packageModel;

- (void)clickDown:(UIButton *)btn;
- (void)clickUp:(UIButton *)btn;
- (void)updateTitle:(NSString *)packName;
- (void)updateManifest:(NSString *)manifest;
+ (CGFloat)defaultHeight;
- (void)setPackageModel:(GameDetailPackageItemModel *)packageModel isFirstCell:(BOOL) isFirst;

@end
