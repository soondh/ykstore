//
//  GameDetailView.m
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import "GameDetailView.h"
#import "HZSigmentView.h"
#import "GameDetailHeadView.h"
#import "GameDetailPackageCell.h"
#import "GameDetailPackageItemModel.h"

// sectionHead
#define section_head_height     44
#define section_footer_height     35

// view
#define view_edge    UIEdgeInsetsMake(0, 10, 10, 10)

#define line_view_height            5

#define backGroundColor   [UIColor whiteColor]

typedef NS_ENUM(NSInteger, headViewType)
{
    headViewTypeNormal,
    headViewTypeHung,
    headViewTypeNotNeed
};

@interface GameDetailView()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate,HZSigmentViewDelegate>
@property (nonatomic,strong) HZSigmentView *segmentView;
@property (nonatomic,strong) GameDetailHeadView *headView;
@property (nonatomic,strong) MJRefreshAutoNormalFooter *footerRefreshView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIView *tableviewSectionView;
@property (nonatomic,strong) UIView *topHungView;
@property (nonatomic, strong) MJRefreshNormalHeader *headerRefreshView;
@end

@implementation GameDetailView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.context = nil;
    self.headView.context = nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.type == DEV) {
        NSArray *data_dev = [((id<GameDetailDataProtocol>)self.context.dataHandler) getDevPackage];
            return data_dev.count;
        } else if (self.type == STABLE) {
            NSArray *data_dev = [((id<GameDetailDataProtocol>)self.context.dataHandler) getStablePackage];
            return data_dev.count;
        } else if (self.type == OTHER) {
            NSArray *data_dev = [((id<GameDetailDataProtocol>)self.context.dataHandler) getOtherPackage];
            return data_dev.count;
        }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger height_cell = [GameDetailPackageCell defaultHeight];
    return height_cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type == DEV) {
        return [self getCellOfDevIndex:indexPath andTableView:tableView ];
    } else if (self.type == STABLE) {
        return [self getCellOfStableIndex:indexPath andTableView:tableView];
    } else if (self.type == OTHER) {
        return [self getCellOfOtherIndex:indexPath andTableView:tableView];
    }
    return nil;
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (self.viewController.navigationItem.titleView == nil) {
        self.viewController.navigationItem.titleView = self.titleLabel;
    }
    if (self.viewController.navigationController.topViewController != self.viewController) {
        return;
    }
    
    // 透明处理
    static headViewType isHung = 6;
    headViewType currentFlag = headViewTypeNotNeed;
    float postion_head = [GameDetailHeadView defaultHeight]; // - app_top_height;
    if (scrollView.contentOffset.y < postion_head ) {
        currentFlag = headViewTypeNormal;
        if (self.tag != 123) {
            self.tag = 123;
            self.titleLabel.text = @"";
            [self.segmentView removeFromSuperview];
            [self.tableviewSectionView addSubview:self.segmentView];
            self.topHungView.hidden = YES;
        }
        //[self.viewController.navigationController.navigationBar lt_setBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0]];
        
    } else {
        currentFlag = headViewTypeHung;
        if (self.tag != 321) {
            self.tag = 321;
            [self.segmentView removeFromSuperview];
            [self.topHungView addSubview:self.segmentView];
            self.topHungView.hidden = NO;
            //[self.viewController.navigationController.navigationBar lt_setBackgroundColor:[UIColor whiteColor]];
            self.titleLabel.text = [((id<GameDetailDataProtocol>)self.context.dataHandler) getDetailHeaderView].gameName;
        }
    }
    
    // 伸缩效果
    
    if (scrollView.contentOffset.y < 0) {
        self.headView.tag = 100;
        [self.headView scrollviewDidScrollViewOffset:scrollView.contentOffset.y]; ;
    } else {
        if (self.headView.tag == 101) {
            return;
        }
        self.headView.tag = 101;
        [self.headView scrollviewDidScrollViewOffset:0]; ;
        
    }
    
    if (isHung != currentFlag) {
        
    }
    isHung = currentFlag;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return [self tableviewSectionView];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return section_head_height;
    }
    return 1;
}

- (UIView *)tableviewSectionView {
    if (! _tableviewSectionView) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, (section_head_height ))];
        view.backgroundColor = backGroundColor;
        _tableviewSectionView = view;
        
    }
    return _tableviewSectionView;
    
}


- (UIView *)topHungView {
    if (! _topHungView) {
        //UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, app_top_height, self.frame.size.width, (section_head_height ))];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, (section_head_height ))];
        view.backgroundColor = backGroundColor;
        _topHungView = view;
        
    }
    return _topHungView;
}


-(void)segment:(HZSigmentView *)sengment didSelectColumnIndex:(NSInteger)index {
    switch (index) {
        case 1:
            self.type = DEV;
            self.tableView.mj_header = self.headerRefreshView;
            break;
        case 2:
            self.type = STABLE;
            self.tableView.mj_header = self.headerRefreshView;
            
            break;
        case 3:
            self.type = OTHER;
            self.tableView.mj_header = self.headerRefreshView;
            break;
        default:
            break;
    }
    [self.tableView.mj_footer resetNoMoreData];
    [self.tableView reloadData];
}



- (UITableViewCell *)getCellOfDevIndex:(NSIndexPath *) indexPath andTableView:(UITableView *) tableView {
    NSArray *comms =  [((id<GameDetailDataProtocol>)self.context.dataHandler) getDevPackage];
    NSString *cellDevReuse = @"GameDetailPackageCell";
    GameDetailPackageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellDevReuse];
    if ( cell == nil) {
        cell = [[GameDetailPackageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellDevReuse];
    }
    GameDetailPackageItemModel *packageModel = [GameDetailPackageItemModel new];
    packageModel = comms[indexPath.row];
    
        
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setPackageModel:packageModel isFirstCell:(indexPath.row == 0 ? YES : NO)];
    return  cell;
    
}

- (UITableViewCell *)getCellOfStableIndex:(NSIndexPath *) indexPath andTableView:(UITableView *) tableView {
    NSArray *comms =  [((id<GameDetailDataProtocol>)self.context.dataHandler) getStablePackage];
    NSString *cellStableReuse = @"GameDetailPackageCell";
    GameDetailPackageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStableReuse];
    if ( cell == nil) {
        cell = [[GameDetailPackageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStableReuse];
    }
    GameDetailPackageItemModel *packageModel = [GameDetailPackageItemModel new];
    packageModel = comms[indexPath.row];
    
    
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setPackageModel:packageModel isFirstCell:(indexPath.row == 0 ? YES : NO)];
    return  cell;
    
}

- (UITableViewCell *)getCellOfOtherIndex:(NSIndexPath *) indexPath andTableView:(UITableView *) tableView {
    NSArray *comms =  [((id<GameDetailDataProtocol>)self.context.dataHandler) getOtherPackage];
    NSString *cellOtherReuse = @"GameDetailPackageCell";
    GameDetailPackageCell *cell = [tableView dequeueReusableCellWithIdentifier:cellOtherReuse];
    if ( cell == nil) {
        cell = [[GameDetailPackageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellOtherReuse];
    }
    GameDetailPackageItemModel *packageModel = [GameDetailPackageItemModel new];
    packageModel = comms[indexPath.row];
    
    
    cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setPackageModel:packageModel isFirstCell:(indexPath.row == 0 ? YES : NO)];
    return  cell;
    
}


- (void)refreshHeadData {
    NSInteger projId = [((id<GameDetailDataProtocol>)self.context.dataHandler) getDetailProjectID];
    [((id<GameDetailBusinessProtocol>)self.context.businessObject) requestGameDetailWithCompleteBlock:projId andCompleteBlock:^(NSArray *array, NSError *err) {
        self.headView.headViewModel = [(id<GameDetailDataProtocol>) (self.context.dataHandler ) getDetailHeaderView];
    }];
}

- (void)firstNetWork {
    [self.tableView.mj_footer resetNoMoreData];
    
    self.type = DEV;
    NSInteger projId = [((id<GameDetailDataProtocol>)self.context.dataHandler) getDetailProjectID];
    [((id<GameDetailBusinessProtocol>)self.context.businessObject) requestGameDetailPackage:projId category:@"iOS" tag:@"DEV" andCompleteBlock:^{
        [self.tableView reloadData];
    } failedBlock:^(NSArray *array, NSError *err) {
        
    }];
    
    [((id<GameDetailBusinessProtocol>)self.context.businessObject) requestGameDetailPackage:projId category:@"iOS" tag:@"STABLE" andCompleteBlock:^{

    } failedBlock:^(NSArray *array, NSError *err) {
        
    }];
    
    [((id<GameDetailBusinessProtocol>)self.context.businessObject) requestGameDetailPackage:projId category:@"iOS" tag:@"OTHER" andCompleteBlock:^{
 
    } failedBlock:^(NSArray *array, NSError *err) {
        
    }];
    [self refreshHeadData];
}


- (void)setupUI {
    
    self.backgroundColor = [UIColor whiteColor];
    self.type = DEV;
    [self addSubview:self.tableView];
    self.tableView.tableHeaderView = self.headView;
    
    [self.tableviewSectionView addSubview:self.segmentView];
    [self setupRefresh];
    
    [self addSubview:self.topHungView];
    self.topHungView.hidden  = YES;
    
}

- (void)setupRefresh {
    MJRefreshNormalHeader *refreshHead = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headRefresh)];
    refreshHead.arrowView.hidden = YES;
    
    self.tableView.mj_header = refreshHead;
    self.headerRefreshView = refreshHead;
}

- (void)headRefresh {
    NSInteger projId = [((id<GameDetailDataProtocol>)self.context.dataHandler) getDetailProjectID];
    
    [self.tableView.mj_footer resetNoMoreData];
    if (self.type == DEV) {
        [((id<GameDetailBusinessProtocol>)self.context.businessObject) requestGameDetailPackage:projId category:@"iOS" tag:@"DEV" andCompleteBlock:^{
            [self.tableView.mj_header endRefreshing];
            [self.tableView reloadData];
        } failedBlock:^(NSArray *array, NSError *err) {
            [self.tableView.mj_header endRefreshing];
        }];
    } else if (self.type == STABLE) {
        [((id<GameDetailBusinessProtocol>)self.context.businessObject) requestGameDetailPackage:projId category:@"iOS" tag:@"STABLE" andCompleteBlock:^{
            [self.tableView.mj_header endRefreshing];
        } failedBlock:^(NSArray *array, NSError *err) {
            [self.tableView.mj_header endRefreshing];
        }];
    } else if (self.type == OTHER) {
        [((id<GameDetailBusinessProtocol>)self.context.businessObject) requestGameDetailPackage:projId category:@"iOS" tag:@"OTHER" andCompleteBlock:^{
            [self.tableView.mj_header endRefreshing];
        } failedBlock:^(NSArray *array, NSError *err) {
            [self.tableView.mj_header endRefreshing];
        }];
    }
    
}



- (UITableView *)tableView {
    if (! _tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, appWidth, appHeight) style:UITableViewStyleGrouped];
        [_tableView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.clipsToBounds = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.separatorColor = [UIColor GP_line_color];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.estimatedRowHeight =  0;
        if (@available(iOS 11.0, *)) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, app_bottom_height + BottomLineHeight , 0);
            self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
        } else {
            self.viewController.automaticallyAdjustsScrollViewInsets = NO;
        }
        [_tableView registerClass:[GameDetailPackageCell class] forCellReuseIdentifier:@"GameDetailPackageCell"];
    }
    return _tableView;
}



- (HZSigmentView *)segmentView {
    if (!_segmentView) {
        _segmentView = [[HZSigmentView alloc] initWithOrgin:CGPointMake(0, 0) andHeight:(section_head_height)];
        _segmentView.delegate = self;
        _segmentView.titleArry = @[@"dev",@"stable",@"other"];
        _segmentView.bottomLineWidth = 40;
        _segmentView.bottomLineColor = [UIColor GP_supply_color];
        // 设置标题选中时的颜色
        _segmentView.titleColorNormal =[UIColor GP_supply_color];
        //设置标题未选中的颜色
        _segmentView.titleColorSelect = [UIColor GP_select_color];
        // 默认选中第几项
        _segmentView.defaultIndex = 1;
        //设置标题字体大小
        _segmentView.titleFont = [UIFont GP_subContent_font];
        
        _segmentView.bottomLineColor =[UIColor colorWithMacHexString:@"#f2f2f2"] ;
        _segmentView.titleLineColor = [UIColor GP_main_color];
        
    }
    return _segmentView;
}

- (GameDetailHeadView *)headView {
    if (! _headView) {
        _headView = [[GameDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, self.size.width, [GameDetailHeadView defaultHeight])];
    }
    return _headView;
}

- (void)setType:(GamePackageType)type {
    _type = type;
    self.headView.type = type;
    
}

@end
