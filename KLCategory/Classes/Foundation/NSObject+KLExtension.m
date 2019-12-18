//
//  NSObject+KLExtension.m
//  KLCategory
//
//  Created by Logic on 2019/11/30.
//

#import "NSObject+KLExtension.h"

@implementation NSObject (KLExtension)

CGFloat KLScreenWidth(void) {
    return UIScreen.mainScreen.bounds.size.width;
}

CGFloat KLScreenHeight(void) {
    return UIScreen.mainScreen.bounds.size.height;
}

CGFloat KLAuto(CGFloat origin) {
    
    if (UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return origin;
    }
    
    CGFloat base = 375.0;
    CGFloat width = MIN(KLScreenWidth(), KLScreenHeight());
    
    CGFloat divisor = pow(10.0, MAX(0, 3));
    return round((origin * (width / base) * divisor)) / divisor;
}

CGFloat KLAutoStatus(void) {
    return UIApplication.sharedApplication.statusBarFrame.size.height;
}

CGFloat KLAutoTop(void) {
    return UIApplication.sharedApplication.statusBarFrame.size.height + 44.0;
}

CGFloat KLAutoBottomInset(void) {
    CGFloat botomInset = 0;
    if (@available(iOS 11.0, *)) {
        UIWindow *window = UIApplication.sharedApplication.delegate.window;
        botomInset = window.safeAreaInsets.bottom;
    }
    return botomInset;
}

CGFloat KLAutoBottom(void) {
    return KLAutoBottomInset() + 49.0;
}

BOOL KLIsphone(void) {
    return UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone;
}

BOOL KLIsphoneXabove(void) {
    return KLAutoBottomInset() > 0;
}

UIViewController *KLCurrentController(void)
{
     UIView *tempView;
     for (UIView *subview in UIApplication.sharedApplication.keyWindow.subviews.reverseObjectEnumerator) {
         if ([subview isKindOfClass:NSClassFromString(@"UILayoutContainerView")]) {
             tempView = subview;
             break;
         }
     }
     BOOL(^canNext)(UIResponder *) = ^(UIResponder *responder){
         if (![responder isKindOfClass:[UIViewController class]]) {
             return YES;
         } else if ([responder isKindOfClass:[UINavigationController class]]) {
             return YES;
         } else if ([responder isKindOfClass:[UITabBarController class]]) {
             return YES;
         } else if ([responder isKindOfClass:NSClassFromString(@"UIInputWindowController")]) {
             return YES;
         }
         return NO;
     };
     UIResponder *nextResponder = tempView.nextResponder;
     while (canNext(nextResponder)) {
         tempView = tempView.subviews.firstObject;
         if (!tempView) {
             return nil;
         }
         nextResponder = tempView.nextResponder;
     }
     UIViewController *currentVC = (UIViewController *)nextResponder;
     if (currentVC) {
         return currentVC;
     }
    return nil;
}

@end
