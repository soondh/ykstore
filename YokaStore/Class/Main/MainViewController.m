//
//  MainViewController.m
//  YokaStore
//
//  Created by ykadmin on 2017/10/31.
//  Copyright © 2017年 ykadmin. All rights reserved.
//

#import "MainViewController.h"
#import "GameListViewController.h"
//#import "SettingViewController.h"

//#import "CollectionViewController.h"

@interface MainViewController ()
//@property (nonatomic, strong) ViewController *ReleaseVC;
//@property (nonatomic, strong) ViewController *DevelopVC;
//@property (nonatomic, strong) ViewController *SettingVC;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadSubViewController];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)loadSubViewController {


    GameListViewController *gamelistVC = [[GameListViewController alloc] init];
    //BuildTabViewController *DevelopVC = [[BuildTabViewController alloc] init];
    //self.DevelopVC = [self navigationWithRootVC:[ViewController new]];
    UINavigationController *gamelistNC = [[UINavigationController alloc] initWithRootViewController:gamelistVC];
    gamelistNC.tabBarItem.title = @"开发版";
    
    GameListViewController *SettingVC = [[GameListViewController alloc] init];
    //BuildTabViewController *DevelopVC = [[BuildTabViewController alloc] init];
    //self.DevelopVC = [self navigationWithRootVC:[ViewController new]];
    UINavigationController *SettingNC = [[UINavigationController alloc] initWithRootViewController:SettingVC];
    SettingNC.tabBarItem.title = @"设置";
/*
    SettingViewController *SettingVC = [[SettingViewController alloc] init];
    //self.SettingVC = [self navigationWithRootVC:[ViewController new]];
    UINavigationController *SettingNC = [[UINavigationController alloc] initWithRootViewController:SettingVC];
    SettingNC.tabBarItem.title = @"设置";
*/
    
//    NSArray *controllersArray = @[gamelistNC];
  NSArray *controllersArray = @[gamelistNC,SettingNC];
    [self setViewControllers:controllersArray animated:YES];
//
//    //self.tabBar.barTintColor = [UIColor redColor];
//    //self.viewControllers = @[self.ReleaseVC, self.DevelopVC, self.SettingVC];
//
//}
//
//- (UINavigationController *)navigationWithRootVC:(UIViewController *) VC {
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:VC];
//    return nav;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
