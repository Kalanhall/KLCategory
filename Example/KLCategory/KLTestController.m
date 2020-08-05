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
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation KLTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    self.dataSource = @[];
    
    self.timer = [NSTimer kl_scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer *timer) {
        NSLog(@"kl_scheduledTimerWithTimeInterval %@", NSDate.date);
    }];
    
    [self kl_observerNotificationName:@"name" completion:^(NSNotification *notification) {
        NSLogDebug(@"kl_observerNotificationName %@", notification);
    }];
    
    [NSNotificationCenter.defaultCenter postNotificationName:@"name" object:@"name..."];
    
    [self kl_observerObject:self.tableView forKeyPath:KeyPath(self.tableView, contentOffset) completion:^(id value) {
        NSLogDebug(@"%@", value);
    }];
}

- (void)dealloc
{
    [self.timer invalidate];
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
