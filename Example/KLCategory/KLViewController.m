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
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
