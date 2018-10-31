//
//  UIView+NoResult.m
//  GamePlatform
//
//  Created by luomj on 2017/5/26.
//  Copyright © 2017年 luomj. All rights reserved.
//

#import "UIView+NoResult.h"
#import <objc/runtime.h>




@implementation NoRsultView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        float imageWidth = 100;
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width/2 - imageWidth/2, self.bounds.size.height/2 - imageWidth, imageWidth, imageWidth)];
        
        self.imageView.contentMode = UIViewContentModeScaleToFill;
        self.imageView.clipsToBounds = YES;
        [self addSubview:self.imageView];
        
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame) + 20, self.bounds.size.width, 30)];
        self.textLabel.textColor = [UIColor lightGrayColor];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.numberOfLines = 0;
        
        self.textLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:self.textLabel];
        
        
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(0.25 * self.frame.size.width, CGRectGetMaxY(self.textLabel.frame) + 30, 0.5 * self.frame.size.width, 40)];
        self.button.layer.cornerRadius = 5;
        self.button.layer.masksToBounds = YES;
        self.button.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:self.button];
        
    }
    return self;
}

- (void)layoutSubviews {
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = self.normalImage;
        self.textLabel.textColor = [UIColor lightGrayColor];
        
    });
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = self.imageHightImage;
        
        self.textLabel.textColor = [UIColor lightGrayColor];
        
    });
    
}

@end


@implementation UIView (NoResult)

- (void)setGroundView:(NoRsultView *)groundView {
    objc_setAssociatedObject(self, @selector(groundView), groundView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NoRsultView *)groundView {
    return objc_getAssociatedObject(self, @selector(groundView));
}


- (void)setGroundFullView:(UIView *)groundFullView {
    objc_setAssociatedObject(self, @selector(groundFullView), groundFullView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)groundFullView {
    return objc_getAssociatedObject(self, @selector(groundFullView));
}

- (void (^)())tryBlock {
    return objc_getAssociatedObject(self, @selector(tryBlock));
    
}

- (void)setTryBlock:(void (^)())tryBlock {
    objc_setAssociatedObject(self, @selector(tryBlock), tryBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}
- (void)showDefaultNetworkNoResultWithBlock:(void(^)()) tryBlock {
    [self showNoResultWithImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"noResult_circle" ofType:@"png"]] highLighrImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"noResult_circle" ofType:@"png"]] andText:@"加载数据失败，请点击重试" WithBlock:tryBlock];
}

- (void)showNoResultWithImage:(UIImage *)image  highLighrImage:(UIImage *)highLightImage andText:(NSString *)text WithBlock:(void(^)()) tryBlock {
    if (! self.groundView) {
        self.groundView = [[NoRsultView alloc] initWithFrame:self.bounds];
        self.groundView.backgroundColor = self.backgroundColor;
        [self addTapGestrueRecongnize:self.groundView];
        
    }
    self.tryBlock = tryBlock;
    self.groundView.button.hidden = YES;
    self.groundView.imageView.image = image;
    self.groundView.normalImage = image;
    self.groundView.imageHightImage = highLightImage;
    self.groundView.textLabel.text = text;
    [self addSubview:self.groundView];
    [self bringSubviewToFront:self.groundView];
    
    self.groundView.userInteractionEnabled = YES;
    
}

- (void)showNoResultWithImage:(UIImage *)image  highLighrImage:(UIImage *)highLightImage andText:(NSString *)text andFrame:(CGRect)frame WithBlock:(void(^)()) tryBlock {
    if (! self.groundView) {
        self.groundView = [[NoRsultView alloc] initWithFrame:frame];
        self.groundView.backgroundColor = self.backgroundColor;
        [self addTapGestrueRecongnize:self.groundView];
        
    }
    self.groundView.frame= frame;
    self.tryBlock = tryBlock;
    self.groundView.button.hidden = YES;
    self.groundView.imageView.image = image;
    self.groundView.normalImage = image;
    self.groundView.imageHightImage = highLightImage;
    self.groundView.textLabel.text = text;
    [self addSubview:self.groundView];
    [self bringSubviewToFront:self.groundView];
    
    self.groundView.userInteractionEnabled = YES;
    
}

- (void)showNoResultWithImage:(UIImage *)image  highLighrImage:(UIImage *)highLightImage andText:(NSString *)text buttonText:(NSString *)buttonText WithBlock:(void(^)()) tryBlock {
    if (! self.groundView) {
        self.groundView = [[NoRsultView alloc] initWithFrame:self.bounds];
        self.groundView.backgroundColor = self.backgroundColor;
        
        [self addTapGestrueRecongnize:self.groundView.button];
        
    }
    self.groundView.frame = self.bounds;
    self.tryBlock = tryBlock;
    self.groundView.button.hidden = NO;
    [self.groundView.button setTitle:buttonText forState:UIControlStateNormal];
    self.groundView.imageView.image = image;
    self.groundView.normalImage = image;
    self.groundView.imageHightImage = highLightImage;
    self.groundView.textLabel.text = text;
    [self addSubview:self.groundView];
    [self bringSubviewToFront:self.groundView];
    
    //  self.groundView.userInteractionEnabled = YES;
    
}
- (void)hideNoResult {
    [self.groundView removeFromSuperview];
    self.groundView = nil;
}



- (void)addTapGestrueRecongnize:(UIView *) view {
    view.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGRAction:)];
    [view addGestureRecognizer:tapGR];
    
    UILongPressGestureRecognizer *longGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(tapGRAction:)];
    [view addGestureRecognizer:longGR];
}

- (void)tapGRAction:(UIGestureRecognizer *)tapGR {
    if (tapGR.state == UIGestureRecognizerStateBegan) {
    } else {
        self.groundView.textLabel.textColor = [UIColor lightGrayColor];
        
        if (self.tryBlock != nil) {
            self.tryBlock();
        }
    }
    
}

- (void)showNoDataOrNetworkFullImage:(UIImage *) image {
    [self showNoDataOrNetworkFullImage:image withFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
}

- (void)showNoDataOrNetworkFullImage:(UIImage *) image withFrame:(CGRect) frame{
    if (! self.groundFullView) {
        self.groundFullView = [[UIView alloc] initWithFrame:frame];
        self.groundFullView.backgroundColor = self.backgroundColor;
    }
    self.groundFullView.frame = frame;
    UIImageView *imageView  = [self.groundFullView viewWithTag:100001];
    if (!imageView) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.tag = 100001;
        [self.groundFullView addSubview:imageView];
    }
    imageView.frame = self.groundFullView.bounds;
    
    imageView.image = image;
    [self addSubview:self.groundFullView];
}

- (void)hideNoDataOrNetworkFullImage {
    [self.groundFullView removeFromSuperview];
    self.groundFullView = nil;
}
@end

