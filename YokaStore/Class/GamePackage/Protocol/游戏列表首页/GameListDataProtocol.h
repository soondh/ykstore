//
//  GameListDataProtocol.h
//  YokaStore
//
//  Created by ykadmin on 2018/1/29.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameListDataProtocol <NSObject>

//所有游戏列表
- (CDDMutableArray*) getGameListArray;
- (void)addGameListWithArray:(NSArray*)array;
- (void)deleteAllGameList;

@end
