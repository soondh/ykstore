//
//  UIView+LayoutMethods.m
//  TmallClient4iOS-Prime
//
//  Created by casa on 14/12/8.
//  Copyright (c) 2014年 casa. All rights reserved.
//

#import "UIView+LayoutMethods.h"


@implementation UIView (LayoutMethods)

// coordinator getters
- (CGFloat)nx_height
{
    return self.frame.size.height;
}

- (CGFloat)nx_width
{
    return self.frame.size.width;
}

- (CGFloat)nx_x
{
    return self.frame.origin.x;
    
}

- (void)setNx_x:(CGFloat)nx_x{
    self.frame = CGRectMake(nx_x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setNx_y:(CGFloat)nx_y
{
    self.frame = CGRectMake(self.frame.origin.x, nx_y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)nx_y
{
    return self.frame.origin.y;
}

- (CGSize)nx_size
{
    return self.frame.size;
}

- (CGPoint)nx_origin
{
    return self.frame.origin;
}

- (CGFloat)nx_centerX
{
    return self.center.x;
}

- (CGFloat)nx_centerY
{
    return self.center.y;
}

- (CGFloat)nx_bottom
{
    return self.frame.size.height + self.frame.origin.y;
}

- (CGFloat)nx_left
{
    return self.frame.origin.x;
}

- (CGFloat)nx_right
{
    return self.frame.size.width + self.frame.origin.x;
}

- (CGFloat)nx_top
{
    return self.frame.origin.y;
}

//origin
- (void)setNx_origin:(CGPoint)nx_origin
{
    CGRect frame = self.frame;
    frame.origin = nx_origin;
    self.frame = frame;
}

//right
- (void)setNx_right:(CGFloat)nx_right
{
    CGRect frame = self.frame;
    frame.origin.x = nx_right - frame.size.width;
    self.frame = frame;
}

//add_byAbei_at7.6
- (CGPoint)nx_rightBottom
{
    CGPoint point;
    point.x = self.frame.size.width + self.frame.origin.x;
    point.y = self.frame.size.height + self.frame.origin.y;
    return point;
}

- (CGPoint)nx_rightTop
{
    CGPoint point;
    point.x = self.frame.origin.x + self.frame.size.width;
    point.y = self.frame.origin.y;
    return point;
}

-(CGPoint)nx_leftBottom
{
    CGPoint point;
    point.x = self.frame.origin.x;
    point.y = self.frame.size.height + self.frame.origin.y;
    return point;
}

-(CGPoint)nx_leftTop
{
    return self.frame.origin;
}


//end_byAbei_at7.6

// height
- (void)setNx_height:(CGFloat)nx_height
{
    CGRect newFrame = CGRectMake(self.nx_x, self.nx_y, self.nx_width, nx_height);
    self.frame = newFrame;
}

- (void)heightEqualToView:(UIView *)view
{
    self.nx_height = view.nx_height;
}

// width
- (void)setNx_width:(CGFloat)nx_width
{
    CGRect newFrame = CGRectMake(self.nx_x, self.nx_y, nx_width, self.nx_height);
    self.frame = newFrame;
}

- (void)widthEqualToView:(UIView *)view
{
    self.nx_width = view.nx_width;
}

// center
- (void)setNx_centerX:(CGFloat)nx_centerX
{
    CGPoint center = CGPointMake(self.nx_centerX, self.nx_centerY);
    center.x = nx_centerX;
    self.center = center;
}

- (void)setNx_centerY:(CGFloat)nx_centerY
{
    CGPoint center = CGPointMake(self.nx_centerX, self.nx_centerY);
    center.y = nx_centerY;
    self.center = center;
}

- (void)centerXEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.nx_centerX = centerPoint.x;
}

- (void)centerYEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewCenterPoint = [superView convertPoint:view.center toView:self.topSuperView];
    CGPoint centerPoint = [self.topSuperView convertPoint:viewCenterPoint toView:self.superview];
    self.nx_centerY = centerPoint.y;
}

// top, bottom, left, right
- (void)setNx_bottom:(CGFloat)nx_bottom {
    CGRect frame = self.frame;
    frame.origin.y = nx_bottom - frame.size.height;
    self.frame = frame;
}

-(void)setNx_top:(CGFloat)nx_top
{
    CGRect frame = self.frame;
    frame.origin.y = nx_top;
    self.frame = frame;
}
- (void)setNx_left:(CGFloat)nx_left
{
    CGRect frame = self.frame;
    frame.origin.x = nx_left;
    self.frame = frame;
    
}


- (void)top:(CGFloat)top FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.nx_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.nx_y = newOrigin.y + top + view.nx_height;
}

- (void)bottom:(CGFloat)bottom FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.nx_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.nx_y = newOrigin.y - bottom - self.nx_height;
}

- (void)left:(CGFloat)left FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.nx_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.nx_x = newOrigin.x - left - self.nx_width;
}

- (void)right:(CGFloat)right FromView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.nx_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.nx_x = newOrigin.x + right + view.nx_width;
}

- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.nx_height = self.nx_y - top + self.nx_height;
    }
    self.nx_y = top;
}

- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.nx_height = self.superview.nx_height - bottom - self.nx_y;
    } else {
        self.nx_y = self.superview.nx_height - self.nx_height - bottom;
    }
}

- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.nx_width = self.nx_x - left + self.superview.nx_width;
    }
    self.nx_x = left;
}

- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize
{
    if (shouldResize) {
        self.nx_width = self.superview.nx_width - right - self.nx_x;
    } else {
        self.nx_x = self.superview.nx_width - self.nx_width - right;
    }
}

- (void)topEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.nx_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.nx_y = newOrigin.y;
}

- (void)bottomEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.nx_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.nx_y = newOrigin.y + view.nx_height - self.nx_height;
}

- (void)leftEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.nx_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.nx_x = newOrigin.x;
}

- (void)rightEqualToView:(UIView *)view
{
    UIView *superView = view.superview ? view.superview : view;
    CGPoint viewOrigin = [superView convertPoint:view.nx_origin toView:self.topSuperView];
    CGPoint newOrigin = [self.topSuperView convertPoint:viewOrigin toView:self.superview];
    
    self.nx_x = newOrigin.x + view.nx_width - self.nx_width;
}

// size
- (void)setNx_size:(CGSize)nx_size
{
    self.frame = CGRectMake(self.nx_x, self.nx_y, nx_size.width, nx_size.height);
}

- (void)sizeEqualToView:(UIView *)view
{
    self.frame = CGRectMake(self.nx_x, self.nx_y, view.nx_width, view.nx_height);
}


////320 * 480
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960),[[UIScreen mainScreen] currentMode].size) : NO)
////320 * 568
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size) : NO)
////375 * 667
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334),[[UIScreen mainScreen] currentMode].size) : NO)
////414 * 736  1242 * 2208     1080 * 1920
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1080, 1920),[[UIScreen mainScreen] currentMode].size) : NO)
// imbueset
- (CGFloat)fillWidth
{
    CGFloat scaleW ;
    if (isRetina) {
        scaleW = 1.0;
        self.nx_width = scaleW * self.nx_width;
    }else if (iPhone5){
        scaleW = 1.0;
        self.nx_width = scaleW * self.nx_width;
    }else if (iPhone6){
        scaleW = 1.171875;
        self.nx_width = scaleW * self.nx_width;
    }else if (iPhone6Plus){
        scaleW = 1.29375;
        self.nx_width = scaleW * self.nx_width;
    }
    return self.nx_width;
    //    self.width = self.superview.width;
}

- (CGFloat)fillHeight
{
    CGFloat scaleH ;
    if (isRetina) {
        scaleH = 0.8450;
        self.nx_height = scaleH * self.nx_height;
    }else if (iPhone5){
        scaleH = 1.0;
        self.nx_height= scaleH * self.nx_height;
    }else if (iPhone6){
        scaleH = 1.17429577;
        self.nx_height = scaleH * self.nx_height;
    }else if (iPhone6Plus){
        scaleH = 1.2957;
        self.nx_height = scaleH * self.nx_height;
    }
    return  self.nx_height;
    //self.height = self.superview.height;
}

//适应宽度
+ (CGFloat)fillWidth:(CGFloat)width
{
    CGFloat scaleW ;
    if (isRetina) {
        scaleW = 1.0;
        width = scaleW * width;
    }else if (iPhone5){
        scaleW = 1.0;
        width = scaleW * width;
    }else if (iPhone6){
        scaleW = 1.171875;
        width = scaleW * width;
    }else if (iPhone6Plus){
        scaleW = 1.29375;
        width = scaleW * width;
    }
    return width;
    
}
//适应高度
+ (CGFloat)fillHeight:(CGFloat)height
{
    CGFloat scaleH ;
    if (isRetina) {
        scaleH = 0.8450;
        height = scaleH * height;
    }else if (iPhone5){
        scaleH = 1.0;
        
        height = scaleH * height;
    }else if (iPhone6){
        scaleH = 1.17429577;
        
        height =  scaleH * height;
    }else if (iPhone6Plus){
        scaleH = 1.2957;
        
        height = scaleH * height;
    }
    return  height;
    
}
+ (CGFloat)Adapter:(CGFloat)value{
    return [[NSString stringWithFormat:@"%.0f",(([UIScreen mainScreen].bounds.size.width/375.0f))*(value)]floatValue];
}

- (CGRect)fill
{
    //self.frame = CGRectMake(0, 0, self.superview.width, self.superview.height);
    self.frame = CGRectMake(0, 0, self.fillWidth, self.fillHeight);
    return self.frame;
}

- (UIView *)topSuperView
{
    UIView *topSuperView = self.superview;
    
    if (topSuperView == nil) {
        topSuperView = self;
    } else {
        while (topSuperView.superview) {
            topSuperView = topSuperView.superview;
        }
    }
    
    return topSuperView;
}

@end
