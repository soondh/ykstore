//
//  GameDetailPackageCell.m
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import "GameDetailPackageCell.h"
#import "HTTPClient.h"


#define name_font  [UIFont GP_2d_title_font]
#define name_color     [UIColor GP_title_color]
#define name_heithgt  15


#define time_label_width    65

#define image_width      40
#define image_height    40

#define left_to_edge  10
#define top_to_edge    15
#define right_to_edge   10
#define botton_to_edge   15
#define d_width    10
#define d_height        5

#define view_edge    UIEdgeInsetsMake(0, 10, 10, 10)
#define d_height        5
#define d_width         10

// headImageView
#define headImgv_width     GTFixWidthFlaot(80)

// name
#define name_font    [UIFont GP_3d_title_font]
#define name_height     (headImgv_width/4.1)

//download_button
#define download_button_font  [UIFont GP_supply_text_font]
#define download_button_width      55


@interface GameDetailPackageCell()
@property (nonatomic,strong) UIImageView *mImageView;
@property (nonatomic,strong) UILabel *packageName;
@property (nonatomic,strong) UILabel *updateTimeLabel;
@property (nonatomic,strong) UIButton *downloadButton;
@property (nonatomic,strong) UILabel *manifest;
@end


@implementation GameDetailPackageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier  {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    //imageView
    
    //namelabel
    self.packageName = [[UnderLineLabel alloc] init];
    self.packageName.textColor = name_color;
    self.packageName.font =  name_font;
    self.packageName.numberOfLines = 0;
    [self.packageName sizeToFit];
    [self addSubview:self.packageName];
    [self.packageName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).offset((top_to_edge));
        make.leading.equalTo(self.mas_leading).offset((left_to_edge));
        make.height.mas_equalTo((GTFixWidthFlaot(name_heithgt)));
    }];
    
    //namelabel
    self.manifest = [[UnderLineLabel alloc] init];
    
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
    
    self.downloadButton.backgroundColor = [UIColor GP_main_color];
    [self.downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.top.equalTo(self.nameLabel.mas_top);
        make.trailing.equalTo(self.mas_trailing).offset(-(view_edge.right));
        make.height.mas_equalTo((name_height));
        make.width.mas_equalTo((download_button_width));
        make.bottom.mas_equalTo(self.mas_bottom).offset(-(view_edge.bottom));
    }];
    
    
}


- (void)setPackageModel:(GameDetailPackageItemModel *)packageModel isFirstCell:(BOOL)isFirst{
    _packageModel = packageModel;
    self.packageName.text = packageModel.packageName;
    self.manifest.text = [packageModel.downloadUrl absoluteString];
    
}

//- (void)updateTitle:(NSString *)packName {
//    self.packageName.text = packName;
//}

//- (void)updateManifest:(NSString *)manifest {
//    self.manifest.text = [@"itms-services://?action=download-manifest&url=" stringByAppendingString:manifest];
//    //NSLog(@"%@",self.manifest.text);
//    //[self.manifest setText:[[NSString alloc] initWithFormat:manifest]];
//}

+ (CGFloat)defaultHeight {
    return (top_to_edge + GTFixHeightFlaot(image_height)  + botton_to_edge);
}

- (void)clickDown:(UIButton *)btn {
    [btn setBackgroundColor:[UIColor orangeColor]];
}


- (void)clickUp:(UIButton *)btn {
    [btn setBackgroundColor:[UIColor GP_main_color]];
    //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self.manifest text]]];
    //若用户未安装https证书，先提示用户安装证书
    NSString *plistHTTPSUrl = [[self.manifest text] substringFromIndex:46];
    //NSLog(@"%@",plistHTTPSUrl);
    
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    
    [mgr GET:plistHTTPSUrl parameters:nil progress:^(NSProgress *downloadProgress) {
        NSLog(@"progress");
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"response");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        //未安装证书error code -999(安装证书也会有error，error code为-1006，所以下载也在这个分支处理) NSlog(@"%@",error);
        if (error.code == -999) {
            UIAlertView *crtNotInstall = [[UIAlertView alloc] initWithTitle:@"服务器证书未安装" message:@"该证书为内部服务器下载服务证书，没有信息泄露风险，是否前往安装？(安装后前往‘通用’-‘关于本机’-‘证书信任设置’中信任本证书)" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [crtNotInstall show];
        } else {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[self.manifest text]] options:@{}completionHandler:nil];
        }
    }];
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    switch (buttonIndex) {
        case 0:
            break;
        case 1:
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:caCrtUrl] options:@{}completionHandler:nil];
        default:
            break;
    }
}


@end
