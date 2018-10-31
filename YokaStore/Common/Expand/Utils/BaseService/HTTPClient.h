//
//  HTTPClient.h
//  WeSchool
//
//  Created by MacKun on 15/8/26.
//  Copyright (c) 2015年 MacKun. All rights reserved.
//


#import "AFNetworking.h"

#define network_status_change_notification    @"network_status_change_notification"
@interface HTTPClient : AFHTTPSessionManager

+(instancetype)sharedHTTPClient;

/**
 *  是否连接网络
 * */
-(BOOL)isReachable;

+ (HTTPClient *)getHttpsClient;
@end
