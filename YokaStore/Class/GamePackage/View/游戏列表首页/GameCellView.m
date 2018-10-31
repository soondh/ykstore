//
//  GameViewCell.m
//  YokaStore
//
//  Created by ykadmin on 2017/11/30.
//  Copyright © 2017年 ykadmin. All rights reserved.
//

#import "GameCellView.h"

@implementation GameCellView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0,0,100,100)];
        _imageV.backgroundColor = [UIColor clearColor];
        [self addSubview:_imageV];
        
        _titleLab = [[UILabel alloc] initWithFrame:CGRectMake(0,100,100,20)];
        _titleLab.backgroundColor = [UIColor clearColor];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.font = [UIFont systemFontOfSize:13];
        [self addSubview:_titleLab];
    }
    
    return self;
}

- (void)setupUrl:(NSURL *)headUrl andName:(NSString *)name {
    [self.imageV sd_setImageWithURL:headUrl];
    self.titleLab.text = name;
}
@end
