//
//  GameListBusinessHandler.m
//  YokaStore
//
//  Created by ykadmin on 2018/1/29.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import "GameListBusinessHandler.h"
#import "GamePackageListItemViewModel.h"
#import "GameListModel.h"
#import "GameDetailViewController.h"
#import "GamePackageListItemViewModel.h"

@implementation GameListBusinessHandler

- (void)requestGameListWithBlock:(void(^)(NSArray *array, BOOL flag)) completeBlock {
    NSDictionary *para = nil;
    [BaseService GET:project_all parameters:para result:^(NSInteger stateCode, NSMutableArray *result, NSError *error) {
        if (stateCode == 0) {
            NSMutableArray *mulArray = [[NSMutableArray alloc] init];
            for (NSDictionary *dict in result) {
                GameListModel *dataModel = [GameListModel mj_objectWithKeyValues:dict];
                GamePackageListItemViewModel *viewModel= [[GamePackageListItemViewModel alloc] init];
                viewModel.iconUrl = dataModel.icon;
                viewModel.name = dataModel.title;
                viewModel.projId = dataModel.projectId;
                [mulArray addObject:viewModel];
            }
            [((id<GameListDataProtocol>)self.weakContext.dataHandler) deleteAllGameList];
            [((id<GameListDataProtocol>)self.weakContext.dataHandler) addGameListWithArray:mulArray];
            completeBlock(mulArray, YES);
        } else {
            completeBlock(nil, NO);
        }
    }];
}

- (void)didSelectGameItemIndex:(NSInteger)index {
    
    GameDetailViewController *vc = [[GameDetailViewController alloc] init];
    id<GameListDataProtocol> handle = (id<GameListDataProtocol>)self.weakContext.dataHandler;
    if (index < [handle getGameListArray].count) {
        GamePackageListItemViewModel *model = [handle getGameListArray][index];
        vc.icon = model.iconUrl;
        vc.projectID = model.projId;
        vc.title = model.name;
        
        [self.baseController.navigationController pushViewController:vc animated:true];
    }
    
}

@end
