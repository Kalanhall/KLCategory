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

@property (weak, nonatomic) IBOutlet UIButton *statusBtn;


@end

@implementation KLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = UIColor.whiteColor;
    
    // see Tests.m
    
    // UI Test
    self.statusBtn.kl_shadowColor = UIColor.blackColor;
    // 更新透明度
    self.statusBtn.kl_shadowOpacity = 0.2;
    // 更新位移
    self.statusBtn.kl_shadowOffset = CGSizeMake(3, 3);
    
    self.statusBtn.kl_badgeValue = @"8";
    
    [self.statusBtn kl_layoutWithStyle:KLLayoutStyleImageTop margin:5];
    
    [self.statusBtn kl_controlEvents:UIControlEventTouchUpInside completion:^(UIButton * _Nonnull sender) {
        NSLogAlert(@"Hello World");
    }];
    
    NSLogInfos(@"MAC地址：%@", UIDevice.kl_macAddress);
    
    UIImageView *bg = UIImageView.new;
    bg.frame = (CGRect){20, 80, 200, 100};
//    bg.image = [UIImage imageNamed:@"backg"];
    bg.image = [[UIImage imageNamed:@"backg"].kl_convertToGrayImage kl_imageWithCornerRadius:10];
    [self.view addSubview:bg];
    
    UILabel *lb = UILabel.new;
    lb.text = @"测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字测试文字";
    lb.numberOfLines = 0;
    lb.textColor = UIColor.blackColor;
    lb.frame = (CGRect){20, 180, 200, 100};
    lb.layer.borderWidth = 1;
    [self.view addSubview:lb];
    // 字间距
    [lb kl_setColumnspace:1];
    // 行间距
    [lb kl_setRowspace:1];
    
    // 添加点击事件
    __weak typeof(self) ws = self;
    [self.view kl_setTapCompletion:^(UITapGestureRecognizer *tapGesture) {
//        NSLogAlert(@"Hello World");
        [ws.navigationController pushViewController:KLViewController.new animated:YES];
    }];
    
    [self.view kl_setLongPressCompletion:^(UILongPressGestureRecognizer *tapGesture) {
        NSLogAlert(@"Hello World");
    }];
}


@end
