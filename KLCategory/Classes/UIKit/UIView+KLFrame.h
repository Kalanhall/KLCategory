//
//  UIView+KLFrame.h
//  KLCategory
//
//  Created by Logic on 2019/12/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (KLFrame)

@property (assign, nonatomic) CGFloat kl_x;
@property (assign, nonatomic) CGFloat kl_y;
@property (assign, nonatomic) CGFloat kl_width;
@property (assign, nonatomic) CGFloat kl_height;
@property (assign, nonatomic) CGSize  kl_size;
@property (assign, nonatomic) CGFloat kl_centerX;
@property (assign, nonatomic) CGFloat kl_centerY;

@end

NS_ASSUME_NONNULL_END
