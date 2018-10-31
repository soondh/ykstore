//
//  GameDetailModel.h
//  YokaStore
//
//  Created by ykadmin on 2018/10/17.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameDetailModel : NSObject

@property (nonatomic,copy) NSString *description;
@property (nonatomic,strong) NSURL *icon;
@property (nonatomic,strong) NSURL *icon32;
@property (nonatomic,strong) NSURL *icon64;
@property (nonatomic,strong) NSURL *icon128;

@property (nonatomic,copy) NSString *latestAndroidFileSize;
@property (nonatomic,copy) NSString *latestAndroidGmtCreate;
@property (nonatomic,copy) NSString *latestAndroidGmtModified;
@property (nonatomic,copy) NSString *latestAndroidManualDescription;
@property (nonatomic,copy) NSString *latestAndroidManualVersion;
@property (nonatomic,copy) NSString *latestAndroidName;
@property (nonatomic,strong) NSURL *latestAndroidUrlOfDownload;
@property (nonatomic,strong) NSURL *latestAndroidUrlOfQrCode;
@property (nonatomic,copy) NSString *latestFileSize;
@property (nonatomic,copy) NSString *latestGmtCreate;
@property (nonatomic,copy) NSString *latestGmtModified;
@property (nonatomic,copy) NSString *latestIOSFileSize;
@property (nonatomic,copy) NSString *latestIOSGmtCreate;
@property (nonatomic,copy) NSString *latestIOSGmtModified;
@property (nonatomic,copy) NSString *latestIOSManualDescription;
@property (nonatomic,copy) NSString *latestIOSManualVersion;
@property (nonatomic,copy) NSString *latestIOSName;
@property (nonatomic,strong) NSURL*latestIOSUrlOfDownload;
@property (nonatomic,strong) NSURL *latestIOSUrlOfQrCode;
@property (nonatomic,copy) NSString *latestManualDescription;
@property (nonatomic,copy) NSString *latestManualVersion;
@property (nonatomic,strong) NSURL *latestUrlOfDownload;
@property (nonatomic,strong) NSURL *latestUrlOfQrCode;
@property (nonatomic,copy) NSString *pkey;
@property (nonatomic,assign) NSInteger projectId;
@property (nonatomic,copy) NSString *title;

@end
