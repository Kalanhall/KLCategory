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
    NSLogDebug(@"origin:%f Top:%f Bottom:%f Size:%f, %f", Auto(30), Auto_Top(), Auto_Bottom(), self.view.kl_width, self.view.kl_height);
    NSLogDebug(@"%@", UIDevice.identifierByKeychain);
    NSLogError(@"Hello World!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
