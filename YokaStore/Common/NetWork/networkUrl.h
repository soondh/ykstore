//
//  networkUrl.h
//  YokaStore
//
//  Created by ykadmin on 2017/12/1.
//  Copyright © 2017年 ykadmin. All rights reserved.
//

#ifndef networkUrl_h
#define networkUrl_h
#import "YSConfigue.h"


#define YokaStore_server_url         [YSConfigue serverIP]

#define  kHost(A)   [NSString stringWithFormat:@"%@%@",[YSConfigue serverIP],A]

//首页 --游戏列表
#define project_all    @"/qa/dispatcher/project"


//详情 --游戏详情
#define project_detail    @"/qa/dispatcher/project/"

//游戏列表 --版本列表
#define game_version_list    @"/qa/dispatcher/version/all"

//版本列表 --安装包列表
#define package_list    @"/qa/dispatcher/package"

//登录
#define user_login    @“qa/dispatcher/user/login”


//https证书地址
#define caCrtUrl  @"http://qa.sanguosha.com/httpsCer/ca.crt"

#endif /* networkUrl_h */
