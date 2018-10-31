//
//  UIColor+GP.h
//  GamePlatform
//
//  Created by luomz on 2017/12/12.
//  Copyright © 2017年 luomj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (GPProject)

// 主题色
+ (UIColor *)GP_main_color;

//背景色
+ (UIColor *)GP_backGround_color;

// 主标题
+ (UIColor *)GP_title_color;

// 标记的颜色
+ (UIColor *)GP_mark_color;

// 选中的颜色
+ (UIColor *)GP_select_color;

// 正文题色
+ (UIColor *)GP_content_color;

// 次要文字的颜色
+ (UIColor *)GP_subContent_color;

// 输入文字的颜色
+ (UIColor *)GP_inputText_color;

// 辅助文字
+ (UIColor *)GP_supply_color;

// 分割线
+ (UIColor *)GP_line_color;

// 输入框的颜色
+ (UIColor *)GP_inputBackGround_color;

//下标颜色
+ (UIColor *)GP_index_color;


// 按钮选定颜色
+ (UIColor *)GP_button_select_color;




// 各种颜色
// 橙色
+ (UIColor *) GP_orange_color;


// 图片的默认颜色
+ (UIColor *) GP_image_default_color;
@end
