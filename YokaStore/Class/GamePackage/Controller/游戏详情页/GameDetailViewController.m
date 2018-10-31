//
//  GameDetailViewController.m
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import "GameDetailViewController.h"
#import "GameDetailView.h";
#import "GameDetailDataHandler.h"
#import "GameDetailBusinessHandler.h"
#import "GameDetailHeadView.h"

@interface GameDetailViewController ()
@property (nonatomic,strong) GameDetailView *gameDetailView;
@property (nonatomic,strong) GameDetailHeadView *headView;
@property (nonatomic,strong) UIView *groundView;
@end

@implementation GameDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //context
    [self initContext];
    
    [self initView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)groundView {
    if (! _groundView) {
        _groundView = [[UIView alloc] initWithFrame:CGRectMake(0,  0, self.view.frame.size.width, self.view.frame.size.height)];
    }
    return _groundView;
}

- (void)initContext {
    //    self.business = [GameDetailBusinessHandle new];
    //    self.business.baseController = self;
    //
    //    self.data = [GameDetailDataHandle new];
    GameDetailBusinessHandler *business = [GameDetailBusinessHandler new];
    business.baseController = self;
    
    GameDetailDataHandler *data = [GameDetailDataHandler new];
    
    if (self.projectID > 0) {
        [data setDetailProjectID:self.projectID];
    }
    
    self.context = [[CDDContext alloc] initWithDataHandler:data withBusinessObject:business];
    
}
/*
- (void)initView {
    
    
    if (@available(iOS 11.0, *)) {
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    GameDetailView *view = [[GameDetailView alloc] initWithFrame:CGRectMake(0, NAVIGATIONBARH + STATUSBARH, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    view.context = self.context;
    self.gameDetailView = view;
    [self.view addSubview:view];
    
    [view firstNetWork];
    
    [self setLeftBarItemWithImage:@"back"];
    [self setRightBarItemWithImage:@"more"];
    
    NSAttributedString * titleAttribute =@{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont HelveticaNeueBoldFontSize:18]};
    [self.navigationController.navigationBar setTitleTextAttributes: titleAttribute];
    
}
*/

- (void)initView {
    if([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        self.edgesForExtendedLayout = UIRectEdgeTop;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    WEAKSELF
    //view
    self.gameDetailView = [[GameDetailView alloc] initWithFrame:CGRectMake(0, NAVIGATIONBARH + STATUSBARH, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //self.gameDetailView = [[GameDetailView alloc] initWithFrame:CGRectMake(0, TOPVIEWH, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    //self.gameDetailView = [[GameDetailView alloc] initWithFrame:self.groundView.bounds];
    self.gameDetailView.context = self.context;
    [self.gameDetailView firstNetWork];
    [self.view addSubview:self.gameDetailView];
    
}

- (void)dealloc {
    //[[NSNotificationCenter defaultCenter] removeObserver:self];
    
    self.context = nil;
    self.view.context = nil;
    self.view= nil;
}
@end
