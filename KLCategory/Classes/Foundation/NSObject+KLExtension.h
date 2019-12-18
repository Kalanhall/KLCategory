//
//  NSObject+KLExtension.h
//  KLCategory
//
//  Created by Logic on 2019/11/30.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (KLExtension)

CGFloat KLScreenWidth(void);      // 屏幕宽度
CGFloat KLScreenHeight(void);     // 屏幕高度
CGFloat KLAuto(CGFloat origin);   // 等比例缩放计算, 以375pt为基准值
CGFloat KLAutoStatus(void);       // 状态栏高度
CGFloat KLAutoTop(void);          // 导航栏高度
CGFloat KLAutoBottom(void);       // 选项栏高度
CGFloat KLAutoBottomInset(void);  // iPhoneX底部安全高度

BOOL KLIsphone(void);
BOOL KLIsphoneXabove(void);

/// 获取应用当前控制器
///
/// 注意：需要等到控制器viewDidAppear之后才能获取到正确的控制器
/// 使用：KLCurrentController()
/// @return 应用顶层控制器实例
UIViewController *KLCurrentController(void);

@end

NS_ASSUME_NONNULL_END
