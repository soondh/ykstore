//
//  GameDetailHeadView.m
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import "GameDetailHeadView.h"


#define view_edge    UIEdgeInsetsMake(0, 10, 10, 10)
#define d_height        5
#define d_width         10

// adImageView
#define adImage_height    140

// headImageView
#define headImgv_width          GTFixWidthFlaot(80)

// name
#define name_font    [UIFont GP_3d_title_font]
#define name_color   [UIColor whiteColor]
#define name_height     (headImgv_width/4.1)
#define name_to_image   12

#define info_height         17

// memberNumLabel
#define content_font   [UIFont systemFontOfSize:12]
#define content_color   [UIColor whiteColor]


// scoreLabel
#define score_font   [UIFont boldSystemFontOfSize:24]
#define score_color   [UIColor whiteColor]

//updateTime
#define updateTime_font    [UIFont GP_content_font]
#define updateTime_color   [UIColor whiteColor]
#define updateTime_height     (headImgv_width/4.1)

//download_button
#define download_button_font  [UIFont GP_supply_text_font]
#define download_button_width      55


@interface GameDetailHeadView()
@property (nonatomic,strong) CAGradientLayer *maskLayer;
@property (nonatomic,strong) UIImageView *ADImageView;
@property (nonatomic,strong) UIImageView *headImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIButton *downloadButton;
@property (nonatomic,strong) UILabel *updateTime;
@property (nonatomic,strong) UILabel *manifest;
@property (nonatomic, assign) float content_offset;

- (void)clickDown:(UIButton *)btn;
- (void)clickUp:(UIButton *)btn;

@end


@implementation GameDetailHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    self.maskLayer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height - self.content_offset);
    [CATransaction commit];
    
    
}


-(void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    
    //ADImageView
    self.ADImageView = [[UIImageView alloc] init];
    
    [self addSubview:self.ADImageView];
    self.ADImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.ADImageView.clipsToBounds = YES;
    self.ADImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"personDynamic" ofType:@"png"]];
    //self.ADImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"background" ofType:@"png"]];
    [self.ADImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.leading.equalTo(self.mas_leading);
        make.trailing.equalTo(self.mas_trailing);
        make.bottom.mas_equalTo(0);
    }];
    
    //headImageView
    self.headImageView = [[UIImageView alloc] init];
    [self addSubview:_headImageView];
    self.headImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.headImageView.clipsToBounds = YES;
    self.headImageView.layer.cornerRadius = headImgv_width/2;
    
    //[self.headImageView sd_setImageWithURL:@"http://qa.sanguosha.com/qa/dispatcher/staticHdfsResource?fileName=cd51467dcf4d1b35.png"];
    //self.headImageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"sgsol" ofType:@"png"]];
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset((view_edge.top));
        make.width.mas_equalTo((headImgv_width));
        make.height.mas_equalTo((headImgv_width));
        make.leading.mas_equalTo(10);
        //make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    
    // nameLabel
    self.nameLabel = [[UILabel alloc] init];
    
    self.nameLabel.textColor = name_color;
    self.nameLabel.font = name_font;
    //self.nameLabel.text = [NSString stringWithFormat:@"最新稳定版:%@",@"1.30.1"];
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset((view_edge.top)+10);
        make.leading.equalTo(self.headImageView.mas_trailing).offset(2*d_width);
        make.width.mas_lessThanOrEqualTo(self.mas_width).multipliedBy(0.8);
    }];
    
    
    // updateTime
    self.updateTime = [[UILabel alloc] init];
    
    self.updateTime.textColor = updateTime_color;
    self.updateTime.font = updateTime_font;
    //self.updateTime.text = [NSString stringWithFormat:@"更新时间:%@",@"2018-07-02"];
    [self addSubview:self.updateTime];
    [self.updateTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset((view_edge.bottom));
        make.leading.equalTo(self.headImageView.mas_trailing).offset(2*d_width);
        make.width.mas_lessThanOrEqualTo(self.mas_width).multipliedBy(0.8);
    }];
    
    //downloadButton
    
    self.downloadButton = [[UIButton alloc] init];
    [self addSubview:self.downloadButton];
    self.downloadButton.hidden = NO;
    self.downloadButton.titleLabel.font = download_button_font;
    self.downloadButton.titleLabel.textColor = [UIColor blackColor];
    self.downloadButton.layer.cornerRadius = (name_height)/2;
    self.downloadButton.layer.masksToBounds = YES;
    self.downloadButton.titleLabel.text = @"下载";
    [self.downloadButton setTitle:@"下载" forState:UIControlStateNormal];
    [self.downloadButton setEnabled:YES];
    [self.downloadButton addTarget:self action:@selector(clickDown:) forControlEvents:UIControlEventTouchDown];
    [self.downloadButton addTarget:self action:@selector(clickUp:) forControlEvents:UIControlEventTouchUpInside];
    
    //    [self.downloadButton addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
    //        if (weakSelf.attentionBlock != nil) {
    //            weakSelf.attentionBlock();
    //        }
    //    }];
    self.downloadButton.backgroundColor = [UIColor GP_main_color];
    [self.downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.equalTo(self.nameLabel.mas_top);
        make.trailing.equalTo(self.mas_trailing).offset(-(view_edge.right));
        make.height.mas_equalTo((name_height));
        make.width.mas_equalTo((download_button_width));
        make.bottom.mas_equalTo(self.mas_bottom).offset(-(view_edge.bottom));
    }];
    
    self.manifest = [[UILabel alloc] init];
    //[self.manifest setText:[[NSString alloc] initWithFormat:@"itms-services://?action=download-manifest&url=https://qa.sanguosha.com/qa/dispatcher/plist/b99e1726db66e755/manifest.plist"]];
    //[self.manifest setText:[[NSString alloc] initWithFormat:@"https://10.225.136.151/qa/dispatcher/plist/b99e1726db66e755.plist"]];
    //[self.manifest setText:[[NSString alloc] initWithFormat:@"itms-services://?action=download-manifest&url=https://10.225.136.151/qa/dispatcher/plist/fe4c651f2f5c59e0/fe4c651f2f5c59e0.plist"]];
    [self addSubview:self.manifest];
}


#pragma mark private methods

- (void)setHeadViewModel:(GameDetailHeadViewModel *)headViewModel {
    _headViewModel = headViewModel;

    self.nameLabel.text = not_null_string(headViewModel.gameName);
    
    self.updateTime.text = not_null_string(headViewModel.updateTime);
    
    self.manifest.text = not_null_string([headViewModel.downloadUrl absoluteString]);
    
    [self.headImageView sd_setImageWithURL:headViewModel.gameImageIconUrl];
    
}

#pragma mark getter and setter
- (void)clickDown:(UIButton *)btn {
    [btn setBackgroundColor:[UIColor orangeColor]];
}


- (void)clickUp:(UIButton *)btn {
    [btn setBackgroundColor:[UIColor GP_main_color]];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self.manifest text]]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self.manifest text]] options:@{}completionHandler:nil];
    //NSLog(@"tableView clicked");
}

- (void)scrollviewDidScrollViewOffset:(float) offset {
    //    [self.ADImageView mas_updateConstraints:^(MASConstraintMaker *make) {
    //        make.top.equalTo(self.mas_top).offset(offset);
    //    }];
    //self.frame = CGRectMake(self.frame.origin.x, - offset, self.frame.size.width, self.frame.size.height);
    if (offset > 0) {
        self.frame = CGRectMake(self.frame.origin.x, - (offset + 182) , self.frame.size.width, self.frame.size.height);
    }
    //self.frame = CGRectMake(self.frame.origin.x, - (offset + 182) , self.frame.size.width, self.frame.size.height);
}


+ (CGFloat)defaultHeight {
    return adImage_height;
}

@end
