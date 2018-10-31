//
//  GameDetailBusinessProtocol.h
//  YokaStore
//
//  Created by ykadmin on 2018/10/22.
//  Copyright © 2018年 ykadmin. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GameDetailBusinessProtocol <NSObject>
//headView
- (void)requestGameDetailWithCompleteBlock:(NSInteger)projId andCompleteBlock:(void(^)(NSArray *array, NSError *err)) completeBlock;

//package
-(void)requestGameDetailPackage:(NSInteger) projectId category:(NSString *)category tag:(NSString *) tag andCompleteBlock:(void(^)()) completeBlock failedBlock:(void(^)(NSArray *array, NSError *err)) failedBlock;

@end
