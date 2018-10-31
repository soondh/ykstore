//
//  UIFont+GP.m
//  GamePlatform
//
//  Created by luomz on 2017/12/12.
//  Copyright © 2017年 luomj. All rights reserved.
//

#import "UIFont+GPProject.h"

@implementation UIFont (GPProject)

// 标题
+ (UIFont *)GP_title_font {
   return [UIFont systemFontOfSize:19];
}

// 2标题
+ (UIFont *)GP_2d_title_font{
    return [UIFont systemFontOfSize:18];
}

// 3标题
+ (UIFont *)GP_3d_title_font{
    return [UIFont systemFontOfSize:17];
}

// 正文
+ (UIFont *)GP_content_font{
    return [UIFont systemFontOfSize:16];
}

// 次要文字

+ (UIFont *)GP_subContent_font{
    return [UIFont systemFontOfSize:15];
}

// 辅助文字
+ (UIFont *)GP_supply_text_font{
    return [UIFont systemFontOfSize:14];
}

// tabar 的字体
+ (UIFont *)GP_tabbar_font{
    return [UIFont systemFontOfSize:12];
}

// 下标
+ (UIFont *)GP_index_font{
    return [UIFont systemFontOfSize:11];
}
@end
