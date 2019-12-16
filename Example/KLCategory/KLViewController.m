//
//  KLViewController.m
//  KLCategory
//
//  Created by Kalanhall@163.com on 11/25/2019.
//  Copyright (c) 2019 Kalanhall@163.com. All rights reserved.
//

#import "KLViewController.h"
@import KLCategory;

@interface KLViewController ()

@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // NSLogger
    NSLogDebug(@"origin：%f Top：%f Bottom：%f Size：%f, %f", Auto(30), AutoTop(), AutoBottom(), self.view.kl_width, self.view.kl_height);
    NSLogInfo(@"Keychain：%@", UIDevice.kl_identifierByKeychain);
    NSLogWarn(@"Hello World!");
    NSLogError(@"Hello World!");
    
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
    
    // 字符串格式化
    NSLogDebug(@"%@", @"123456789.915".kl_decimalString);                          // 123456789.92
    NSLogDebug(@"%@", [NSString kl_decimalStringWithValue:123456789.915]);         // 123456789.92
    NSLogDebug(@"%@", @"123456789.915".kl_decimalStyleString);                     // 123,456,789.92
    NSLogDebug(@"%@", [NSString kl_decimalStyleStringWithValue:123456789.915]);    // 123,456,789.92
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
