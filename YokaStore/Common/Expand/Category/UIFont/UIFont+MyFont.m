//
//  UIFont+MyFont.m
//  GamePlatform
//
//  Created by luomj on 2017/6/14.
//  Copyright © 2017年 luomj. All rights reserved.
//

#import "UIFont+MyFont.h"

@implementation UIFont (MyFont)
+(UIFont *)systemFontOfSize:(CGFloat)fontSize{
    
    //我是根据屏幕尺寸判断的设备，然后字体设置为0.8倍
    
    if (appWidth < 375) {

        fontSize = fontSize * 0.85 ;

    } else if (appWidth > 375) {
        fontSize = fontSize ;

    }
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightRegular];
//    return [UIFont fontWithName:@"Microsoft YaHei" size:fontSize];
    
    
}

+ (UIFont *)boldSystemFontOfSize:(CGFloat)fontSize{
    
    //我是根据屏幕尺寸判断的设备，然后字体设置为0.8倍 Copperplate-Light,
   // Copperplate,
   // Copperplate-Bold
    

    if (appWidth < 375) {

        fontSize = fontSize * 0.85 ;

    } else if (appWidth > 375) {
        fontSize = fontSize ;

    }
    return [UIFont systemFontOfSize:fontSize weight:UIFontWeightBold];

//    return [UIFont fontWithName:@"Microsoft YaHei Bold" size:fontSize];

    
}

@end



@implementation UIButton (myFont)

+ (void)load
{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode
{
    [self myInitWithCoder:aDecode];
    if (self) {
        CGFloat fontSize = self.titleLabel.font.pointSize;
        self.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    }
    return self;
}

@end

@implementation UILabel (myFont)

+ (void)load
{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode
{
    [self myInitWithCoder:aDecode];
    if (self) {
        CGFloat fontSize = self.font.pointSize;
        self.font = [UIFont systemFontOfSize:fontSize];
    }
    return self;
}

@end

@implementation UITextView (myFont)

+ (void)load
{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode
{
    [self myInitWithCoder:aDecode];
    if (self) {
        CGFloat fontSize = self.font.pointSize;
        self.font = [UIFont systemFontOfSize:fontSize];
    }
    return self;
}

@end

@implementation UITextField (myFont)

+ (void)load
{
    Method imp = class_getInstanceMethod([self class], @selector(initWithCoder:));
    Method myImp = class_getInstanceMethod([self class], @selector(myInitWithCoder:));
    method_exchangeImplementations(imp, myImp);
}

- (id)myInitWithCoder:(NSCoder*)aDecode
{
    [self myInitWithCoder:aDecode];
    if (self) {
        CGFloat fontSize = self.font.pointSize;
        self.font = [UIFont systemFontOfSize:fontSize];
    }
    return self;
}

@end
