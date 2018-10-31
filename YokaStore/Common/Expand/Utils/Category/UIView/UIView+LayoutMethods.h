//
//  UIView+LayoutMethods.h
//  TmallClient4iOS-Prime
//
//  Created by casa on 14/12/8.
//  Copyright (c) 2014年 casa. All rights reserved.
//

#import <UIKit/UIKit.h>

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define SCREEN_WIDTH ([[UIScreen mainScreen]bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen]bounds].size.height)
#define SCREEN_WITHOUT_STATUS_HEIGHT (SCREEN_HEIGHT - [[UIApplication sharedApplication] statusBarFrame].size.height)


////320 * 480
//#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960),[[UIScreen mainScreen] currentMode].size) : NO)
////320 * 568
//#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136),[[UIScreen mainScreen] currentMode].size) : NO)
////375 * 667
//#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334),[[UIScreen mainScreen] currentMode].size) : NO)
////414 * 736  1242 * 2208     1080 * 1920
//#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208),[[UIScreen mainScreen] currentMode].size) : NO)

@interface UIView (LayoutMethods)

// coordinator getters
- (CGFloat)nx_height;
- (CGFloat)nx_width;
- (CGFloat)nx_x;
- (CGFloat)nx_y;
- (CGSize)nx_size;
- (CGPoint)nx_origin;
- (CGFloat)nx_centerX;
- (CGFloat)nx_centerY;
- (CGFloat)nx_bottom;
- (CGFloat)nx_top;
- (CGFloat)nx_left;
- (CGFloat)nx_right;
//add_byAbei_at 7.6
- (CGPoint)nx_rightBottom;
- (CGPoint)nx_rightTop;
- (CGPoint)nx_leftTop;
- (CGPoint)nx_leftBottom;
//add_byAbei_at 7.6
- (void)setNx_x:(CGFloat)nx_x;
- (void)setNx_y:(CGFloat)nx_y;

//origin
- (void)setNx_origin:(CGPoint)nx_origin;
//right
- (void)setNx_right:(CGFloat)nx_right;

// height
- (void)setNx_height:(CGFloat)nx_height;
- (void)heightEqualToView:(UIView *)view;

// width
- (void)setNx_width:(CGFloat)nx_width;
- (void)widthEqualToView:(UIView *)view;

// center
- (void)setNx_centerX:(CGFloat)nx_centerX;
- (void)setNx_centerY:(CGFloat)nx_centerY;
- (void)centerXEqualToView:(UIView *)view;
- (void)centerYEqualToView:(UIView *)view;

// top, bottom, left, right
- (void)setNx_left:(CGFloat)nx_left;
- (void)setNx_bottom:(CGFloat)nx_bottom;
- (void)setNx_top:(CGFloat)nx_top;
- (void)top:(CGFloat)top FromView:(UIView *)view;
- (void)bottom:(CGFloat)bottom FromView:(UIView *)view;
- (void)left:(CGFloat)left FromView:(UIView *)view;
- (void)right:(CGFloat)right FromView:(UIView *)view;

- (void)topInContainer:(CGFloat)top shouldResize:(BOOL)shouldResize;
- (void)bottomInContainer:(CGFloat)bottom shouldResize:(BOOL)shouldResize;
- (void)leftInContainer:(CGFloat)left shouldResize:(BOOL)shouldResize;
- (void)rightInContainer:(CGFloat)right shouldResize:(BOOL)shouldResize;

- (void)topEqualToView:(UIView *)view;
- (void)bottomEqualToView:(UIView *)view;
- (void)leftEqualToView:(UIView *)view;
- (void)rightEqualToView:(UIView *)view;

// size
- (void)setNx_size:(CGSize)nx_size;
- (void)sizeEqualToView:(UIView *)view;

// imbueset
- (CGFloat)fillWidth;
- (CGFloat)fillHeight;
+ (CGFloat)fillWidth:(CGFloat)width;
+ (CGFloat)fillHeight:(CGFloat)height;
+ (CGFloat)Adapter:(CGFloat)value;
- (CGRect)fill;

- (UIView *)topSuperView;

@end

@protocol LayoutProtocol
@required
// put your layout code here
- (void)calculateLayout;
@end
