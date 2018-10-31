//
//  GameListDataHandler.m
//  YokaStore
//
//  Created by ykadmin on 2018/1/29.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import "GameListDataHandler.h"

@interface GameListDataHandler ()
@property (nonatomic,strong) CDDMutableArray *gameList;
@end

@implementation GameListDataHandler

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.gameList = [[CDDMutableArray alloc] init];
    }
    return self;
}

//所有游戏列表
- (CDDMutableArray *)getGameListArray {
    return self.gameList;
}

- (void)addGameListWithArray:(NSArray *)array {
    [self.gameList addObjectsFromArray:array];
}

- (void)deleteAllGameList {
    [self.gameList removeAllObjects];
}

@end
