//
//  GameDetailDataHandler.m
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import "GameDetailDataHandler.h"
#import "GameDetailHeadViewModel.h"

@interface GameDetailDataHandler()
@property (nonatomic,strong) GameDetailHeadViewModel *headViewModel;
@property (nonatomic,strong) CDDMutableArray *gameDetailDevPackage;
@property (nonatomic,strong) CDDMutableArray *gameDetailStablePackage;
@property (nonatomic,strong) CDDMutableArray *gameDetailOtherPackage;
@property (nonatomic,assign) NSInteger projectID;
@end

@implementation GameDetailDataHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.headViewModel = [[GameDetailHeadViewModel alloc] init];
        self.gameDetailDevPackage = [[CDDMutableArray alloc] init];
        self.gameDetailStablePackage = [[CDDMutableArray alloc] init];
        self.gameDetailOtherPackage = [[CDDMutableArray alloc] init];
    }
    return self;
}

//总的header
-(void)setDetailHeaderView:(GameDetailHeadViewModel *)viewModel {
    self.headViewModel = viewModel;
}
-(GameDetailHeadViewModel *)getDetailHeaderView {
    return self.headViewModel;
}

//dev
- (void)removeAllDevPackage {
    [self.gameDetailDevPackage removeAllObjects];
}

- (void)addDevPackageWithArray:(NSArray *)array {
    [self.gameDetailDevPackage addObjectsFromArray:array];
}

-(CDDMutableArray *)getDevPackage {
    return self.gameDetailDevPackage;
}

//stable
- (void)removeAllStablePackage {
    [self.gameDetailStablePackage removeAllObjects];
}

- (void)addStablePackageWithArray:(NSArray *)array {
    [self.gameDetailStablePackage addObjectsFromArray:array];
}

-(CDDMutableArray *)getStablePackage {
    return self.gameDetailStablePackage;
}

//other
- (void)removeAllOtherPackage {
    [self.gameDetailOtherPackage removeAllObjects];
}

- (void)addOtherPackageWithArray:(NSArray *)array {
    [self.gameDetailOtherPackage addObjectsFromArray:array];
}

-(CDDMutableArray *)getOtherPackage {
    return self.gameDetailOtherPackage;
}

//projectID
- (NSInteger)getDetailProjectID {
    return self.projectID;
}
- (void)setDetailProjectID:(NSInteger)projectID {
    self.projectID = projectID;
}
@end
