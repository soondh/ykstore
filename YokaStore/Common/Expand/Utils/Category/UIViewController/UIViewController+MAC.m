//
//  UIViewController+MAC.m
//  WeiSchoolTeacher
//
//  Created by MacKun on 15/12/16.
//  Copyright © 2015年 MacKun. All rights reserved.
//

#import "UIViewController+MAC.h"
#import "UIImage+Additions.h"
#import <objc/runtime.h>
#import <SDWebImage/UIButton+WebCache.h>

@implementation UIViewController(MAC)


-(void)showAlertMessage:(NSString*)message
{
    [self showAlertMessage:message titile:@"提示"];

}
-(void)showAlertMessage:(NSString*)message titile:(NSString *)title{
    MMPopupItemHandler block = ^(NSInteger index){
        NSLog(@"clickd %@ button",@(index));
    };
    NSArray *items =
    @[MMItemMake(@"确定", MMItemTypeHighlight, block)];
    
    MMAlertView *alertView = [[MMAlertView alloc] initWithTitle:title
                                                         detail:message
                                                          items:items];
    
    [alertView show];
}
-(void)showAlertMessage:(NSString *)message title:(NSString *)title clickArr:(NSArray *)arr click:(MMPopupItemHandler) clickIndex{
    if (!arr||arr.count<=0) {
        return;
    }
   __block NSMutableArray *items = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [items addObject:MMItemMake(obj, MMItemTypeHighlight, clickIndex)];
    }];
    MMAlertView *alertView = [[MMAlertView alloc] initWithTitle:title
                                                         detail:message
                                                          items:items];
    [alertView show];
}
-(void)showSheetTitle:(NSString *)title clickArr:(NSArray *)arr click:(MMPopupItemHandler)clickIndex{
    if (!arr||arr.count<=0) {
        return;
    }

    __block NSMutableArray *items = [NSMutableArray array];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [items addObject:MMItemMake(obj, MMItemTypeHighlight, clickIndex)];
    }];
    [[[MMSheetView alloc] initWithTitle:title
                                  items:items] show];
};

- (void)setLeftBarItemWithString:(NSString*)string
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    /**
     *  设置frame只能控制按钮的大小
     */
    btn.frame= CGRectMake(0, 0, 40, 44);
    btn.imageEdgeInsets = UIEdgeInsetsMake(11, 0,11, 20);
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn.imageView.clipsToBounds = YES;
    [btn setTitle:string  forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize: 17.0];
    [btn addTarget:self action:@selector(leftBarItemAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = -15;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, btn_right, nil];

//    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc]initWithTitle:string style:UIBarButtonItemStylePlain target:self action:@selector(leftBarItemAction:)];
//    self.navigationItem.leftBarButtonItem  = leftButtonItem;
    
}
- (void)setLeftBarItemWithImage:(NSString *)imageName
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    /**
     *  设置frame只能控制按钮的大小
     */
    btn.frame= CGRectMake(0, 0, 40, 44);
    btn.imageEdgeInsets = UIEdgeInsetsMake(11, 0,11, 20);
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn.imageView.clipsToBounds = YES;
    [btn setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(leftBarItemAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = -15;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, btn_right, nil];

//    UIBarButtonItem *leftButtonItem =  [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStyleDone target:self action:@selector(leftBarItemAction:)];;
//    self.navigationItem.leftBarButtonItem=leftButtonItem;
}


- (void)setLeftRoundBarItemWithUrl:(NSURL *)imageUrl andActions:(SEL) selector {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    /**
     *  设置frame只能控制按钮的大小
     */
    btn.frame= CGRectMake(0, 0, 40, 44);
    btn.imageEdgeInsets = UIEdgeInsetsMake(11, 0,11, 20);
    btn.imageView.contentMode = UIViewContentModeScaleToFill;
    btn.imageView.layer.cornerRadius = 10;
     btn.imageView.layer.masksToBounds = YES;
    [btn sd_setImageWithURL:imageUrl forState:UIControlStateNormal];
    [btn addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = -15;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, btn_right, nil];
}


- (void)setRightBarItemWithString:(NSString*)string
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    /**
     *  设置frame只能控制按钮的大小
     */
    btn.frame= CGRectMake(0, 0, 40, 44);
    btn.imageEdgeInsets = UIEdgeInsetsMake(11, 20,11, 0);
    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn.imageView.clipsToBounds = YES;

    [btn setTitle:string  forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize: 17.0];
    [btn addTarget:self action:@selector(rightBarItemAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = -15;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, btn_right, nil];

//    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:string style:UIBarButtonItemStylePlain target:self action:@selector(rightBarItemAction:)];
//    self.navigationItem.rightBarButtonItem  = rightButtonItem;
}
- (void)setRightBarItemWithImage:(NSString *)imageName{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    /**
     *  设置frame只能控制按钮的大小
     */
    btn.frame= CGRectMake(0, 0, 40, 44);
    btn.imageEdgeInsets = UIEdgeInsetsMake(11, 20,11, 0);

    btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    btn.imageView.clipsToBounds = YES;

    [btn setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(rightBarItemAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *btn_right = [[UIBarButtonItem alloc] initWithCustomView:btn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    /**
     *  width为负数时，相当于btn向右移动width数值个像素，由于按钮本身和边界间距为5pix，所以width设为-5时，间距正好调整
     *  为0；width为正数时，正好相反，相当于往左移动width数值个像素
     */
    negativeSpacer.width = -15;
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, btn_right, nil];
//    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStyleDone target:self action:@selector(rightBarItemAction:)];
//    self.navigationItem.rightBarButtonItem = rightItem;
}




- (void)setRightBarItemImage:(UIImage *)imgage title:(NSString *)str{
    UIImage *img=[imgage imageTintedWithColor:[UIColor whiteColor]];
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setFrame:CGRectMake(0, 0, 60, 25)];
    [leftButton setImage:img forState:UIControlStateNormal];
    [leftButton setImage:img forState:UIControlStateHighlighted];
     [leftButton setTitle:str forState:UIControlStateNormal];
    [leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(rightBarItemAction:)forControlEvents:UIControlEventTouchUpInside];

    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    negativeSpacer.width = -15;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,barButton];
}

/**
 *  设置右侧两个图片的形式
 */
- (void)setRightBarItemWithImage1:(UIImage *)image1
                       andAction1:(SEL) action1
                           image2:(UIImage *)image2
                       andAction2:(SEL) action2 {
    
    UIButton *leftButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton1 setFrame:CGRectMake(0, 0, 30, 44)];
    [leftButton1 setImage:image1 forState:UIControlStateNormal];
    [leftButton1 setImage:image1 forState:UIControlStateHighlighted];
    [leftButton1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton1 addTarget:self action: action1 forControlEvents:UIControlEventTouchUpInside];
    leftButton1.imageEdgeInsets = UIEdgeInsetsMake(22, 5, 0, 15);

    UIButton *leftButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton2 setFrame:CGRectMake(30, 0, 30, 44)];
    [leftButton2 setImage:image2 forState:UIControlStateNormal];
    [leftButton2 setImage:image2 forState:UIControlStateHighlighted];
    [leftButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton2 addTarget:self action: action2 forControlEvents:UIControlEventTouchUpInside];
    leftButton2.imageEdgeInsets = UIEdgeInsetsMake(22, 5, 0, 15);

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [view addSubview:leftButton1];
    [view addSubview:leftButton2];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:view];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    negativeSpacer.width = -20;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,barButton];
    
}


/**
 *  设置右侧两个图片的形式带消息提示
 */
- (void)setRightBarItemWithImage1:(UIImage *)image1
                       andAction1:(SEL) action1
                      isNeedBage1:(BOOL) isNeed1
                           image2:(UIImage *)image2
                       andAction2:(SEL) action2
                      isNeedBage2:(BOOL) isNeed2{
    
    UIButton *leftButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton1 setFrame:CGRectMake(0, 0, 30, 44)];
    leftButton1.imageEdgeInsets = UIEdgeInsetsMake(11, 20,11, 0);

    [leftButton1 setImage:image1 forState:UIControlStateNormal];
    [leftButton1 setImage:image1 forState:UIControlStateHighlighted];
    [leftButton1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton1 addTarget:self action: action1 forControlEvents:UIControlEventTouchUpInside];
    if (isNeed1) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(18, 5, 12, 12)];;
        label.backgroundColor = [UIColor redColor];
        label.layer.cornerRadius = 6;
        label.layer.masksToBounds = YES;
        label.textAlignment = NSTextAlignmentCenter;
        [leftButton1 addSubview:label];
        label.font = [UIFont systemFontOfSize:9];
        label.textColor = [UIColor whiteColor];
        self.bageLabel1 = label;
    }
    
    
    UIButton *leftButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton2 setFrame:CGRectMake(30, 0, 30, 44)];
    [leftButton2 setImage:image2 forState:UIControlStateNormal];
    [leftButton2 setImage:image2 forState:UIControlStateHighlighted];
    leftButton2.imageEdgeInsets = UIEdgeInsetsMake(11, 20,11, 0);

    [leftButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton2 addTarget:self action: action2 forControlEvents:UIControlEventTouchUpInside];
    if (isNeed2) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(18, 5, 12, 12)];;
        label.backgroundColor = [UIColor redColor];
        [leftButton2 addSubview:label];
        label.layer.cornerRadius = 6;
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.masksToBounds = YES;
        label.font = [UIFont systemFontOfSize:10];
        label.textColor = [UIColor whiteColor];
        self.bageLabel2 = label;
    }

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [view addSubview:leftButton1];
    [view addSubview:leftButton2];
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:view];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    negativeSpacer.width = -15;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,barButton];
    
}

- (void)setRightBarItemWithImage1:(UIImage *)image1
                       andAction1:(SEL) action1
                      isNeedBage1:(BOOL) isNeed1{
    
    UIButton *leftButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton1 setFrame:CGRectMake(0, 0, 30, 44)];
    leftButton1.imageEdgeInsets = UIEdgeInsetsMake(11, 10,11, 0);
    
    [leftButton1 setImage:image1 forState:UIControlStateNormal];
    [leftButton1 setImage:image1 forState:UIControlStateHighlighted];
    [leftButton1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [leftButton1 addTarget:self action: action1 forControlEvents:UIControlEventTouchUpInside];
    if (isNeed1) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(18, 5, 12, 12)];;
        label.backgroundColor = [UIColor redColor];
        label.layer.cornerRadius = 6;
        label.layer.masksToBounds = YES;
        label.textAlignment = NSTextAlignmentCenter;
        [leftButton1 addSubview:label];
        label.font = [UIFont systemFontOfSize:9];
        label.textColor = [UIColor whiteColor];
        self.bageLabel1 = label;
    }
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton1];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    negativeSpacer.width = -15;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,barButton];

}

- (UILabel *)bageLabel1 {
    return objc_getAssociatedObject(self, @selector(bageLabel1));
}

- (void)setBageLabel1:(UILabel *)bageLabel1 {
    objc_setAssociatedObject(self, @selector(bageLabel1), bageLabel1, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UILabel *)bageLabel12{
    return objc_getAssociatedObject(self, @selector(bageLabel2));
}

- (void)setbageLabel2:(UILabel *)bageLabel2 {
    objc_setAssociatedObject(self, @selector(bageLabel2), bageLabel2, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark 左右两侧NavBarItem事件相应

- (void)leftBarItemAction:(UIBarButtonItem *)gesture
{
    if(self.navigationController.viewControllers.count>1)
    {
        [self.view endEditing:YES];
        [self.navigationController popViewControllerAnimated:YES];
    }else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
- (void)rightBarItemAction:(UIBarButtonItem *)gesture
{
    
}

#pragma mark - TabBarItem

-(void)setTabBarItemImage:(NSString *)imageName selectedImage:(NSString *)selectImageName title:(NSString *)titleString{
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc ]init];
    tabBarItem.title=titleString;
    tabBarItem.image=[[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.selectedImage=[[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2);
    tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11 weight:UIFontWeightThin], NSForegroundColorAttributeName:[UIColor appBlackColor],NSBackgroundColorAttributeName:[UIColor appMainColor]} forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:11 weight:UIFontWeightThin], NSForegroundColorAttributeName:[UIColor appMainColor],NSBackgroundColorAttributeName:[UIColor appSelectMainColor]} forState:UIControlStateFocused];

    self.tabBarItem=tabBarItem;
}

@end
