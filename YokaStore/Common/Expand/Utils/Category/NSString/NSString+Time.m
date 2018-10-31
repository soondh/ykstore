//
//  NSString+Time.m
//  GamePlatform
//
//  Created by luomj on 2017/6/22.
//  Copyright © 2017年 luomj. All rights reserved.
//

#import "NSString+Time.h"
#import "NSDate+Extend.h"
static NSDateFormatter *fmt = nil;
static  NSCalendar *calendar = nil;


@implementation NSString (Time)
+ (NSString *)showTimeString:(NSString *)time
{
    if(!time) return @"";
    
    if (!fmt) {
        fmt = [[NSDateFormatter alloc] init];
    }
    // 如果是真机调试，转换这种欧美时间，需要设置locale
    //fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    
    // 设置日期格式（声明字符串里面每个数字和单词的含义）
    // E:星期几
    // M:月份
    // d:几号(这个月的第几天)
    // H:24小时制的小时
    // m:分钟
    // s:秒
    // y:年
    fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";   // yyyy-MMM-dd HH:mm:ss
    //    _created_at = @"Tue Sep 30 17:06:25 +0600 2014";
    
    // 创建日期
    NSDate *createDate = [fmt dateFromString:time];
    // 当前时间
    NSDate *now = [NSDate date];
    
    // 日历对象（方便比较两个日期之间的差距）
    if (!calendar) {
        calendar   = [NSCalendar currentCalendar];

    }
    // NSCalendarUnit枚举代表想获得哪些差值
    static NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    // 计算两个日期之间的差值
    NSDateComponents *cmps = [calendar components:unit fromDate:createDate toDate:now options:0];
    
    if ([createDate isThisYear]) { // 今年
       /*
        if ([createDate isMoreThanThreeSmallerThenTen]) {//3 - 10天
            //得到与当前时间差
            NSTimeInterval  timeInterval = [createDate timeIntervalSinceNow];
            timeInterval = -timeInterval;
            //标准时间和北京时间差8个小时
            //            timeInterval = timeInterval - 8*60*60;
            long temp = 0;
            NSString *result;
            result = [NSString stringWithFormat:@"%ld天前",(temp = timeInterval / 24 / 60 / 60)];
            
            return result;
        }else if ([createDate isThedayBeforeYesterday]){//前天
            
            fmt.dateFormat = @"前天";
            return [fmt stringFromDate:createDate];
            
        }else */
        if ([createDate isYesterday]) { // 昨天
            fmt.dateFormat = @"昨天";
            return [fmt stringFromDate:createDate];
        } else if ([createDate isToday]) { // 今天
            if (cmps.hour >= 1) {
                return [NSString stringWithFormat:@"%d小时前", (int)cmps.hour];
            } else if (cmps.minute >= 1) {
                return [NSString stringWithFormat:@"%d分钟前", (int)cmps.minute];
            } else {
                return @"刚刚";
            }
        } else { // 今年的其他日子
            fmt.dateFormat = @"MM-dd";
            return [fmt stringFromDate:createDate];
        }
    } else { // 非今年
        fmt.dateFormat = @"yyyy-MM-dd";
        return [fmt stringFromDate:createDate];
    }
    
    
}
@end
