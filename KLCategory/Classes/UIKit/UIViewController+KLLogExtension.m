//
//  UIViewController+LogKLExtension.m
//  KLExtensions
//
//  Created by Logic on 2019/11/20.
//

#import "UIViewController+KLLogExtension.h"
#import "NSLogger.h"
#import <objc/runtime.h>

@implementation UIViewController (KLLogKLExtension)

#ifdef DEBUG
+ (void)load {
    Method m1 = class_getInstanceMethod(self, @selector(viewDidLoad));
    Method m2 = class_getInstanceMethod(self, @selector(kl_viewDidLoad));
    method_exchangeImplementations(m1, m2);
    
    Method m3 = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
    Method m4 = class_getInstanceMethod(self, @selector(kl_dealloc));
    method_exchangeImplementations(m3, m4);
}

- (void)kl_viewDidLoad {
    NSLogNotice(@"%@ viewDidLoad", self);
    [self kl_viewDidLoad];
}

- (void)kl_dealloc {
    NSLogNotice(@"%@ dealloc", self);
    [self kl_dealloc];
}

#endif

@end
