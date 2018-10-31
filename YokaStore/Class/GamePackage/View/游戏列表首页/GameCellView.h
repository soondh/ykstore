//
//  GameViewCell.h
//  YokaStore
//
//  Created by ykadmin on 2017/11/30.
//  Copyright © 2017年 ykadmin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameCellView : UICollectionViewCell
@property(strong,nonatomic) UIImageView *imageV;
@property(strong,nonatomic) UILabel *titleLab;

- (void)setupUrl:(NSURL *) headUrl andName:(NSString *)name;
+ (CGFloat)defaultheight;
@end
