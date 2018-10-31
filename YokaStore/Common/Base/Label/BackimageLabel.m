//
//  BackimageLabel.m
//  GamePlatform
//
//  Created by luomj on 2017/7/5.
//  Copyright © 2017年 luomj. All rights reserved.
//

#import "BackimageLabel.h"
@interface BackimageLabel()
@end

@implementation BackimageLabel



- (void)layoutSubviews {
    [super layoutSubviews];
    
    if (self.image) {
        self.imageView.image = self.image;
        self.imageView.contentMode = UIViewContentModeScaleToFill;
    }
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        [self addSubview:_imageView];
    }
    return _imageView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
