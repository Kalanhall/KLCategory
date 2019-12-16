//
//  NSDate+KLExtension.h
//  KLCategory
//
//  Created by Logic on 2019/12/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (KLExtension)

/// 年
- (NSUInteger)year;
/// 月
- (NSUInteger)month;
/// 日
- (NSUInteger)day;
/// 时
- (NSUInteger)hour;
/// 分
- (NSUInteger)minute;
/// 秒
- (NSUInteger)second;

/// 计算日期对应的年份
+ (NSUInteger)year:(NSDate *)date;
/// 计算日期对应的月份
+ (NSUInteger)month:(NSDate *)date;
/// 计算日期对应的日期
+ (NSUInteger)day:(NSDate *)date;
/// 计算日期对应的小时
+ (NSUInteger)hour:(NSDate *)date;
/// 计算日期对应的分钟
+ (NSUInteger)minute:(NSDate *)date;
/// 计算日期对应的秒数
+ (NSUInteger)second:(NSDate *)date;

/// 是否是今天
- (BOOL)isToday;

/// 时间戳转字符串
///
/// @Param format 格式化符 yyyy-MM-dd HH:mm:ss
/// @Param time 自定义时区，东八区 = 8
///
/// @Return 时间字符串
- (NSString *)stringWithFormat:(NSString *)format secondsFromGMT:(NSInteger)time;
/// 时间戳转字符串，默认东八区时间
- (NSString *)stringWithFormat:(NSString *)format;

/// 时间戳转字符串
///
/// @Param timestamp 时间戳，秒，服务器一般为毫秒需要 timestamp/1000
/// @Param format 格式化符 yyyy-MM-dd HH:mm:ss
/// @Param time 自定义时区，东八区 = 8
///
/// @Return 时间字符串
+ (NSString *)stringWithTimestamp:(NSInteger)timestamp format:(NSString *)format secondsFromGMT:(NSInteger)time;
/// 时间戳转字符串，默认东八区时间
+ (NSString *)stringWithTimestamp:(NSInteger)timestamp format:(NSString *)format;

/// 时间戳转时分秒，用于倒计时场景
+ (NSInteger)dayWithTimestamp:(NSInteger)timestamp;
+ (NSInteger)hourWithTimestamp:(NSInteger)timestamp;
+ (NSInteger)minuteWithTimestamp:(NSInteger)timestamp;
+ (NSInteger)secondWithTimestamp:(NSInteger)timestamp;

@end

NS_ASSUME_NONNULL_END
