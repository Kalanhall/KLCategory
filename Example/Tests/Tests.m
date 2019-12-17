//
//  KLCategoryTests.m
//  KLCategoryTests
//
//  Created by Kalanhall@163.com on 11/25/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

@import XCTest;
@import KLCategory;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNSLogger
{
    // NSLogger
    NSLogDebug(@"origin：%f Top：%f Bottom：%f", Auto(30), AutoTop(), AutoBottom());
    NSLogInfo(@"Keychain：%@", UIDevice.kl_identifierByKeychain);
    NSLogWarn(@"Hello World!");
    NSLogError(@"Hello World!");
}

- (void)testNSDate
{
    // NSdate
    NSLogDebug(@"年：%@", @(NSDate.date.kl_year));
    NSLogDebug(@"月：%@", @(NSDate.date.kl_month));
    NSLogDebug(@"周：%@", @(NSDate.date.kl_week));
    NSLogDebug(@"日：%@", @(NSDate.date.kl_day));
    NSLogDebug(@"时间->字符串：%@", [NSDate.date kl_stringWithFormat:@"yyyy-MM-dd HH:mm:ss"]);
    
    // 时间戳转时分秒
    NSTimeInterval timestamp = NSDate.date.timeIntervalSince1970;
    NSLogDebug(@"时戳->字符串：%@", [NSDate kl_stringWithTimestamp:timestamp format:@"yyyy-MM-dd HH:mm:ss"]);
    timestamp = 25.51 * 60 * 60; // 1天1小时30分钟36秒
    NSLogDebug(@"天：%@", @([NSDate kl_dayWithTimestamp:timestamp]));
    NSLogDebug(@"时：%@", @([NSDate kl_hourWithTimestamp:timestamp]));
    NSLogDebug(@"分：%@", @([NSDate kl_minuteWithTimestamp:timestamp]));
    NSLogDebug(@"秒：%@", @([NSDate kl_secondWithTimestamp:timestamp]));
}

- (void)testTouchFaceID
{
    [NSObject kl_authWithLocalizedReason:@"请按下Home键" handle:^(BOOL success, NSError * _Nonnull error) {
        if (success) {
            NSLogDebug(@"解锁成功");
        } else {
            NSLogDebug(@"%@", error.localizedDescription);
        }
    }];
}

- (void)testNSString
{
    // 字符串格式化
    NSLogDebug(@"%@", @"123456789.915".kl_decimalString);                          // 123456789.92
    NSLogDebug(@"%@", [NSString kl_decimalStringWithValue:123456789.915]);         // 123456789.92
    NSLogDebug(@"%@", @"123456789.915".kl_decimalStyleString);                     // 123,456,789.92
    NSLogDebug(@"%@", [NSString kl_decimalStyleStringWithValue:123456789.915]);    // 123,456,789.92
    
    // 字符串操作
    NSLogDebug(@"%@", [NSString kl_documentPathWithFileName:@"MyFile"]);
    NSLogDebug(@"%@", @"Hello World".kl_reverseString);
    NSLogDebug(@"%@", @"你好 世界".kl_chinessToPinyin);
    NSLogDebug(@"是否是纯数字 %@", @(@"123.21".kl_isNumber));
    NSLogDebug(@"是否是金额 %@", @(@"1.0".kl_isMoneyNumber));
    
    // 系统方法
    NSLogDebug(@"大小写转换 %@", @"85sfds5x5d6eg".uppercaseString);
    NSLogDebug(@"大小写转换 %@", @"85SFDS5X5D6EG".lowercaseString);
}

@end

