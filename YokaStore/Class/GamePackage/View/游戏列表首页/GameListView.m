//
//  GameListView.m
//  YokaStore
//
//  Created by ykadmin on 2018/1/29.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import "GameListView.h"
#import "GameCellView.h"
#import "GameListDataProtocol.h"
#import "GameListBusinessProtocol.h"
#import "GamePackageListItemViewModel.h"
#import "GameDetailViewController.h"
//#import "GameListBussinessProtocol.h"

@interface GameListView ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UICollectionView *collectionView;
@end

static NSString *cellReuseID = @"GameListViewCell";

@implementation GameListView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupUI];
    }
    return self;
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(headRefresh) name:game_list_refresh object:nil];
    
    [self addSubview:self.collectionView];
    
    [self setupRefresh];
    
}

- (void) setupRefresh {
    MJRefreshNormalHeader *refreshHead = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];
    refreshHead.arrowView.hidden = YES;
    
    self.collectionView.mj_header = refreshHead;
}

- (void) headRefresh {
    [self firstNetwork];
    
}
- (void)firstNetwork {
    [((id<GameListBusinessProtocol>) self.context.businessObject) requestGameListWithBlock:^(NSArray *array, BOOL flag) {
        [self.collectionView reloadData];
    }];
    [self.collectionView.mj_header endRefreshing];
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {

        CGFloat margin = 10.0f;
        CGFloat itemWidth = (self.frame.size.width - 4*margin)/3.0f;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(itemWidth, itemWidth+40);
        layout.sectionInset = UIEdgeInsetsMake(margin, margin, margin, margin);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[GameCellView class] forCellWithReuseIdentifier:cellReuseID];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"GameCellView"];

    }
    return _collectionView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger item = [((id<GameListDataProtocol>) self.context.dataHandler) getGameListArray].count;
    return item;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *dataSource;
    dataSource = [((id<GameListDataProtocol>) self.context.dataHandler) getGameListArray];
    
    //NSString *cellReuseID = @"GameListViewCell";
    GameCellView *cell = (GameCellView*)[collectionView dequeueReusableCellWithReuseIdentifier:cellReuseID forIndexPath:indexPath];
    if (! cell) {
        cell = [[GameCellView alloc] initWithFrame:CGRectZero];
    }
    if (indexPath.row >= 0) {
        GamePackageListItemViewModel *viewModel = dataSource[indexPath.row];
        [cell setupUrl:viewModel.iconUrl andName:viewModel.name];
    }

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    HHViewController *vc = [HHViewController new];
//    NSArray *dataSource;
//    dataSource = [((id<GameListDataProtocol>) self.context.dataHandler) getGameListArray];
//    GamePackageListItemViewModel *viewModel = dataSource[indexPath.row];
//    NSString *title = viewModel.name;
//    NSString *projKey = viewModel.projKey;
//    vc.title = title;
//    vc.projkey = projKey;
//
//    [self.viewController.navigationController pushViewController:vc animated:true];
    [((id<GameListBusinessProtocol>)self.context.businessObject) didSelectGameItemIndex:indexPath.row];
}

@end
