//
//  UIViewController+KLTrackLog.m
//  KLExtensions
//
//  Created by Logic on 2019/11/20.
//

#import "UIViewController+KLTrackLog.h"

#ifdef DEBUG
#import "NSLogger.h"
#import "KLRuntime.h"
#import "NSObject+UIKit.h"
#endif

@interface UIViewController ()


@end

@implementation UIViewController (KLTrackLog)

#ifdef DEBUG

+ (void)load {
    KLExchangeImplementations(self, @selector(viewDidLoad), self, @selector(kl_viewDidLoad));
    KLExchangeImplementations(self, NSSelectorFromString(@"dealloc"), self, @selector(kl_dealloc));
}

- (void)kl_viewDidLoad {
    if (self.trackLogEnable) NSLogNotice(@"%@ viewDidLoad", self);
    [self kl_viewDidLoad];
}

- (void)kl_dealloc {
    if (self.trackLogEnable) NSLogNotice(@"%@ dealloc", self);
    [self kl_dealloc];
}

#endif

@end
