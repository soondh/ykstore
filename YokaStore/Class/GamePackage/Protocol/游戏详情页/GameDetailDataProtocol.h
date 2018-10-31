//
//  GameDetailDataProtocol.h
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameDetailHeadViewModel.h"

@protocol GameDetailDataProtocol <NSObject>
//总的headView
- (void)setDetailHeaderView:(GameDetailHeadViewModel *) viewModel;
- (GameDetailHeadViewModel *)getDetailHeaderView;

//安装包页 Dev
-(void)removeAllDevPackage;
-(void)addDevPackageWithArray:(NSArray *) array;
-(CDDMutableArray *)getDevPackage;

//安装包页 Stable
-(void)removeAllStablePackage;
-(void)addStablePackageWithArray:(NSArray *) array;
-(CDDMutableArray *)getStablePackage;

//安装包页 Other
-(void)removeAllOtherPackage;
-(void)addOtherPackageWithArray:(NSArray *) array;
-(CDDMutableArray *)getOtherPackage;

//projectID
- (NSInteger)getDetailProjectID;
- (void)setDetailProjectID:(NSInteger) projectID;
@end
