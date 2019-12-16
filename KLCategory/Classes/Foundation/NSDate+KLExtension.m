//
//  NSDate+KLExtension.m
//  KLCategory
//
//  Created by Logic on 2019/12/16.
//

#import "NSDate+KLExtension.h"

@implementation NSDate (KLExtension)

- (NSUInteger)day
{ return [NSDate day:self]; }

- (NSUInteger)month
{ return [NSDate month:self]; }

- (NSUInteger)year
{ return [NSDate year:self]; }

- (NSUInteger)hour
{ return [NSDate hour:self]; }

- (NSUInteger)minute
{ return [NSDate minute:self]; }

- (NSUInteger)second
{ return [NSDate second:self]; }

+ (NSUInteger)year:(NSDate *)date
{ return [self componentsWithUnit:NSCalendarUnitYear date:date].year; }

+ (NSUInteger)month:(NSDate *)date
{ return [self componentsWithUnit:NSCalendarUnitMonth date:date].month; }

+ (NSUInteger)day:(NSDate *)date
{ return [self componentsWithUnit:NSCalendarUnitDay date:date].day; }

+ (NSUInteger)hour:(NSDate *)date
{ return [self componentsWithUnit:NSCalendarUnitHour date:date].hour; }

+ (NSUInteger)minute:(NSDate *)date
{ return [self componentsWithUnit:NSCalendarUnitMinute date:date].minute; }

+ (NSUInteger)second:(NSDate *)date
{ return [self componentsWithUnit:NSCalendarUnitSecond date:date].second; }

+ (NSDateComponents *)componentsWithUnit:(NSCalendarUnit)unit date:(NSDate *)date
{ return [NSCalendar.currentCalendar components:unit fromDate:date]; }

- (BOOL)isToday
{ return [self isSameDay:[NSDate date]]; }

- (BOOL)isSameDay:(NSDate *)anotherDate
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components1 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                fromDate:self];
    NSDateComponents *components2 = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay)
                                                fromDate:anotherDate];
    return (components1.year == components2.year
            &&
            components1.month == components2.month
            &&
            components1.day == components2.day);
}

- (NSString *)stringWithFormat:(NSString *)format secondsFromGMT:(NSInteger)time
{
    NSDateFormatter *formatter = NSDateFormatter.alloc.init;
    [formatter setDateFormat:format];
    formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:time * 3600];
    return [formatter stringFromDate:NSDate.date];
}

- (NSString *)stringWithFormat:(NSString *)format
{ return [self stringWithFormat:format secondsFromGMT:8]; }

+ (NSString *)stringWithTimestamp:(NSInteger)timestamp format:(NSString *)format secondsFromGMT:(NSInteger)time
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:time * 3600];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+ (NSString *)stringWithTimestamp:(NSInteger)timestamp format:(NSString *)format
{ return [self stringWithTimestamp:timestamp format:format secondsFromGMT:8]; }

+ (NSInteger)dayWithTimestamp:(NSInteger)timestamp
{ return timestamp / 3600 / 24; }

+ (NSInteger)hourWithTimestamp:(NSInteger)timestamp
{ return timestamp / 3600 % 24; }

+ (NSInteger)minuteWithTimestamp:(NSInteger)timestamp
{ return timestamp % 3600 / 60; }

+ (NSInteger)secondWithTimestamp:(NSInteger)timestamp
{ return timestamp % 3600 % 60; }

@end
