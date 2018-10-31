//
//  GameListViewController.m
//  YokaStore
//
//  Created by ykadmin on 2018/1/30.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import "GameListViewController.h"
#import "GameListDataHandler.h"
#import "GameListBusinessHandler.h"
#import "GameListView.h"
//#import "HHViewController.h"
#import "GamePackageListItemViewModel.h"

@interface GameListViewController ()

@end

@implementation GameListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initContext];
    
    [self initView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initContext {
    GameListBusinessHandler *business = [GameListBusinessHandler new];
    business.baseController = self;
    
    GameListDataHandler *data = [GameListDataHandler new];
    self.context = [[CDDContext alloc] initWithDataHandler:data withBusinessObject:business];
    
}

- (void)dealloc {
    self.context = nil;
    self.view.context = nil;
    self.view= nil;
}

- (void)initView {
    self.navigationItem.title = @"Yoka Store";
    self.view.backgroundColor = [UIColor whiteColor];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    GameListView *view = [[GameListView alloc] initWithFrame:self.view.bounds];
    view.context = self.context;
    [self.view addSubview:view];
    [view firstNetwork];
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    HHViewController *vc = [HHViewController new];
//    NSArray *dataSource;
//    dataSource = [((id<GameListDataProtocol>) self.context.dataHandler) getGameListArray];
//    GamePackageListItemViewModel *viewModel = dataSource[indexPath.row];
//    NSString *title = viewModel.name;
//    NSString *projKey = viewModel.projKey;
//    vc.title = title;
//    vc.projkey = projKey;
//    [self.navigationController pushViewController:vc animated:true];
//}


@end
