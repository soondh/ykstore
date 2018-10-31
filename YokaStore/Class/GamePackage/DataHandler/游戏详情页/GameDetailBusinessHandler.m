//
//  GameDetailBusinessHandler.m
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import "GameDetailBusinessHandler.h"
#import "GameDetailModel.h"
#import "GameDetailHeadViewModel.h"
#import "GameDetailPackageItemModel.h"
#import "GameDetailDataProtocol.h"
#import "PackageListAllModel.h"

#define  version_bar_array    @[@"开发版本",@"稳定版本",@"特殊版本"]

@implementation GameDetailBusinessHandler


- (void)requestGameDetailWithCompleteBlock:(NSInteger)projId andCompleteBlock:(void (^)(NSArray *, NSError *))completeBlock {
    id<GameDetailDataProtocol> handler = (id<GameDetailDataProtocol>)self.weakContext.dataHandler;
    NSString *url = [project_detail stringByAppendingString:[NSString stringWithFormat:@"%ld",projId]];
    [BaseService GET:url parameters:nil result:^(NSInteger stateCode, NSDictionary *result, NSError *error) {
        if (stateCode == 0 && error == nil) {
            GameDetailModel *model = [GameDetailModel mj_objectWithKeyValues:result];
            GameDetailHeadViewModel *viewModel = [GameDetailHeadViewModel new];
            viewModel.projectID = model.projectId;
            viewModel.gameName = model.latestIOSName;
            
            NSTimeInterval time=[model.latestIOSGmtModified doubleValue]/1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
            NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
            //设定时间格式,这里可以设置成自己需要的格式
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
            NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
            viewModel.updateTime = currentDateStr;
            
            //viewModel.updateTime = model.latestIOSGmtModified;
            viewModel.downloadUrl = model.latestIOSUrlOfDownload;
            viewModel.gameImageIconUrl = model.icon;
            
            [((id<GameDetailDataProtocol>)self.weakContext.dataHandler) setDetailHeaderView:viewModel];
            if (completeBlock) {
                completeBlock(nil,error);
            }
        } else {
            if (completeBlock) {
                completeBlock(nil,error);
            }
        }
    }];
    
}


- (void)requestGameDetailPackage:(NSInteger)projectId category:(NSString *)category tag:(NSString *)tag andCompleteBlock:(void (^)())completeBlock failedBlock:(void (^)(NSArray *, NSError *))failedBlock{
    id<GameDetailDataProtocol> handler = (id<GameDetailDataProtocol>)self.weakContext.dataHandler;
    
    NSDictionary *param = @{@"projectId":[NSString stringWithFormat:@"%ld",projectId],
                            @"category":category,
                            @"tag":tag
                            };
    [BaseService GET:package_list parameters:param result:^(NSInteger stateCode, NSMutableArray *result, NSError *error) {
        if (error.code == 0 || error == nil) {
            NSMutableArray *mulArray = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in result) {
                PackageListAllModel *item = [PackageListAllModel mj_objectWithKeyValues:dict];
                GameDetailPackageItemModel *packageModel = [GameDetailPackageItemModel new];
                packageModel.packageName = item.originalFileName;
                
                NSTimeInterval time=[item.gmtModified doubleValue]/1000;//传入的时间戳str如果是精确到毫秒的记得要/1000
                NSDate *detailDate=[NSDate dateWithTimeIntervalSince1970:time];
                NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; //实例化一个NSDateFormatter对象
                //设定时间格式,这里可以设置成自己需要的格式
                [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
                NSString *currentDateStr = [dateFormatter stringFromDate: detailDate];
                packageModel.updateTime = currentDateStr;
                
                //packageModel.updateTime = item.gmtModified;
                packageModel.downloadUrl = item.urlOfDownload;
                
                [mulArray addObject:packageModel];
            }
            
            if ([tag isEqualToString:@"DEV"]) {
                [handler removeAllDevPackage];
                [handler addDevPackageWithArray:mulArray];
            } else {
                if ([tag isEqualToString:@"STABLE"]) {
                    [handler removeAllStablePackage];
                    [handler addStablePackageWithArray:mulArray];
                } else {
                    if ([tag isEqualToString:@"OTHER"]) {
                        [handler removeAllOtherPackage];
                        [handler addOtherPackageWithArray:mulArray];
                    }
                }
            }
            
            if (mulArray.count) {
                if (completeBlock) {
                    completeBlock(mulArray, nil);
                }
            } else {
                if (completeBlock) {
                    completeBlock(mulArray, nil);
                }
            }
        } else {
            if (failedBlock) {
                failedBlock(result,error);
            }
        }
    }];
    
}

@end
