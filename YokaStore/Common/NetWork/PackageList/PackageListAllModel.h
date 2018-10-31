//
//  PackageListAllModel.h
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PackageListAllModel : NSObject
@property (nonatomic,copy) NSString *bundleDebugRelease;
@property (nonatomic,copy) NSString *bundleExinfo;
@property (nonatomic,copy) NSString *bundleIconPath;
@property (nonatomic,copy) NSString *bundleIdentifier;
@property (nonatomic,copy) NSString *bundleName;
@property (nonatomic,copy) NSString *bundleVersion;
@property (nonatomic,copy) NSString *category;
@property (nonatomic,copy) NSString *fileMd5;
@property (nonatomic,copy) NSString *fileSize;
@property (nonatomic,copy) NSString *gmtCreate;
@property (nonatomic,copy) NSString *gmtModified;
@property (nonatomic,copy) NSString *manualDescription;
@property (nonatomic,copy) NSString *manualVersion;
@property (nonatomic,copy) NSString *originalFileName;
@property (nonatomic,copy) NSString *packageId;
@property (nonatomic,copy) NSString *projectId;
@property (nonatomic,copy) NSString *tag;
@property (nonatomic,strong) NSURL *urlOfDownload;
@property (nonatomic,strong) NSURL *urlOfQrCode;

@end
