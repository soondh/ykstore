//
//  UIColor+GP.m
//  GamePlatform
//
//  Created by luomz on 2017/12/12.
//  Copyright © 2017年 luomj. All rights reserved.
//

#import "UIColor+GPProject.h"

@implementation UIColor (GPProject)
// 主题色
+ (UIColor *)GP_main_color {
    return [UIColor colorWithMacHexString:@"#74bfb9"];
}

//背景色
+ (UIColor *)GP_backGround_color {
    return [UIColor colorWithMacHexString:@"#F2F2F2"];

}

// 主标题
+ (UIColor *)GP_title_color{
    return [UIColor colorWithMacHexString:@"#000000"];
}

// 标记的颜色
+ (UIColor *)GP_mark_color{
    return [UIColor colorWithMacHexString:@"#4e90af"];
}

// 选中的颜色
+ (UIColor *)GP_select_color{
    return [UIColor colorWithMacHexString:@"#459893"];
}

// 正文题色
+ (UIColor *)GP_content_color{
    return [UIColor colorWithMacHexString:@"#252525"];
}

// 次要文字的颜色
+ (UIColor *)GP_subContent_color{
    return [UIColor colorWithMacHexString:@"#3f3f3f"];
}

// 输入文字的颜色
+ (UIColor *)GP_inputText_color{
    return [UIColor colorWithMacHexString:@"#848484"];
}

// 辅助文字
+ (UIColor *)GP_supply_color{
    return [UIColor colorWithMacHexString:@"#a4a4a4"];
}

// 下标颜色
+ (UIColor *)GP_index_color {
    return [UIColor colorWithMacHexString:@"#686868"];
}

// 分割线
+ (UIColor *)GP_line_color{
    return [UIColor colorWithMacHexString:@"#ececec"];
}

+ (UIColor *)GP_button_select_color {
    return [UIColor colorWithMacHexString:@"#f9f9f9"];
}

// 输入框的颜色
+ (UIColor *)GP_inputBackGround_color{
    return [UIColor colorWithMacHexString:@"#ececec"];
}

// 橙色
+ (UIColor *) GP_orange_color {
    return [UIColor colorWithMacHexString:@"#f77810"];
}


//图片的默认颜色
+ (UIColor *) GP_image_default_color {
    return [UIColor colorWithMacHexString:@"#e6e6e6"];

}
@end
