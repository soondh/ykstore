//
//  UITableViewCell+CustomSeparateLine.m
//  GamePlatform
//
//  Created by luomj on 2017/6/23.
//  Copyright © 2017年 luomj. All rights reserved.
//

#import "UITableViewCell+CustomSeparateLine.h"
#import <objc/runtime.h>


@implementation UITableViewCell (CustomSeparateLine)
- (NSInteger)topHeight {
    return [objc_getAssociatedObject(self, @selector(topHeight)) integerValue];
}

- (NSInteger)bottonHeight {
    return [objc_getAssociatedObject(self, @selector(bottonHeight)) integerValue];
}

- (void)setTopHeight:(NSInteger)topHeight {
    objc_setAssociatedObject(self, @selector(topHeight), @(topHeight), OBJC_ASSOCIATION_ASSIGN);
}


- (void)setBottonHeight:(NSInteger)bottonHeight {
    objc_setAssociatedObject(self, @selector(bottonHeight), @(bottonHeight), OBJC_ASSOCIATION_ASSIGN);
    
}

- (void)setFrame:(CGRect)frame {
    
    frame.origin.y += [self topHeight];
    frame.size.height -= [self topHeight] + [self bottonHeight];;    
    [super setFrame:frame];
}
@end
