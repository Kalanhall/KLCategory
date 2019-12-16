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
    NSLogDebug(@"origin：%f Top：%f Bottom：%f Size：%f, %f", Auto(30), Auto_Top(), Auto_Bottom(), self.view.kl_width, self.view.kl_height);
    NSLogInfo(@"Keychain：%@", UIDevice.identifierByKeychain);
    NSLogWarn(@"Hello World!");
    NSLogError(@"Hello World!");
    
    // NSdate
    NSLogDebug(@"年：%@", @(NSDate.date.year));
    NSLogDebug(@"月：%@", @(NSDate.date.month));
    NSLogDebug(@"周：%@", @(NSDate.date.week));
    NSLogDebug(@"日：%@", @(NSDate.date.day));
    NSLogDebug(@"时间->字符串：%@", [NSDate.date stringWithFormat:@"yyyy-MM-dd HH:mm:ss"]);
    
    // 时间戳转时分秒
    NSTimeInterval timestamp = NSDate.date.timeIntervalSince1970;
    NSLogDebug(@"时戳->字符串：%@", [NSDate stringWithTimestamp:timestamp format:@"yyyy-MM-dd HH:mm:ss"]);
    timestamp = 25.51 * 60 * 60; // 1天1小时30分钟36秒
    NSLogDebug(@"天：%@", @([NSDate dayWithTimestamp:timestamp]));
    NSLogDebug(@"时：%@", @([NSDate hourWithTimestamp:timestamp]));
    NSLogDebug(@"分：%@", @([NSDate minuteWithTimestamp:timestamp]));
    NSLogDebug(@"秒：%@", @([NSDate secondWithTimestamp:timestamp]));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
