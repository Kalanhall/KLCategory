//
//  KLTestController.m
//  KLCategory_Example
//
//  Created by Logic on 2020/1/7.
//  Copyright © 2020 Kalanhall@163.com. All rights reserved.
//

#import "KLTestController.h"
@import KLCategory;

@interface KLTestController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation KLTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self kl_observerObject:self.tableView forKeyPath:@"contentOffset" completion:^(id value) {
        NSLogDebug(@"%@", value);
    }];
    
    self.dataSource = @[];
    
    [self kl_observerNotificationName:@"name" completion:^(NSNotification *notification) {
        NSLogDebug(@"%@", notification);
    }];
    
    [NSNotificationCenter.defaultCenter postNotificationName:@"name" object:@"name..."];
}

- (void)dealloc
{
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mycell"];
    
    return cell;
}

@end
