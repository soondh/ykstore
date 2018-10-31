//
//  UIView+NoResult.h
//  GamePlatform
//
//  Created by luomj on 2017/5/26.
//  Copyright © 2017年 luomj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoRsultView : UIView
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong) UIImage *imageHightImage;
@property (nonatomic,strong) UIImage *normalImage;
@property (nonatomic,strong) UIButton *button;
@end

@interface UIView (NoResult)
@property (nonatomic,strong) NoRsultView *groundView;
@property (nonatomic,strong) UIView *groundFullView;

@property (nonatomic, strong) void(^tryBlock)();

- (void)showDefaultNetworkNoResultWithBlock:(void(^)()) tryBlock;

- (void)showNoResultWithImage:(UIImage *)image  highLighrImage:(UIImage *)highLightImage andText:(NSString *)text WithBlock:(void(^)()) tryBlock ;

- (void)showNoResultWithImage:(UIImage *)image  highLighrImage:(UIImage *)highLightImage andText:(NSString *)text andFrame:(CGRect)frame WithBlock:(void(^)()) tryBlock;

- (void)showNoResultWithImage:(UIImage *)image  highLighrImage:(UIImage *)highLightImage andText:(NSString *)text buttonText:(NSString *)buttonText WithBlock:(void(^)()) tryBlock;
- (void)hideNoResult;



// 全部
- (void)showNoDataOrNetworkFullImage:(UIImage *) image;
//带frame 的设置
- (void)showNoDataOrNetworkFullImage:(UIImage *) image withFrame:(CGRect) frame;
- (void)hideNoDataOrNetworkFullImage;
@end

