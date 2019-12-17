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
    
    // see Tests.m
    
    // UI Test
//    [self.statusBtn kl_layoutWithStatus:(KLLayoutStatusNormal) margin:5];
    [self.statusBtn kl_layoutWithStatus:(KLLayoutStatusImageTop) margin:5];
//    [self.statusBtn kl_layoutWithStatus:(KLLayoutStatusImageBottom) margin:5];
//    [self.statusBtn kl_layoutWithStatus:(KLLayoutStatusImageRight) margin:5];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
