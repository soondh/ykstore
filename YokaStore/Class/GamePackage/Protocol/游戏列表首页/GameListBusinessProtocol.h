//
//  GameListBusinessProtocol.h
//  YokaStore
//
//  Created by ykadmin on 2018/1/29.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameListDataProtocol.h"
@protocol GameListBusinessProtocol <NSObject>

- (void)requestGameListWithBlock:(void(^)(NSArray *array, BOOL flag)) completeBlock;
- (void)didSelectGameItemIndex:(NSInteger) index;

@end
