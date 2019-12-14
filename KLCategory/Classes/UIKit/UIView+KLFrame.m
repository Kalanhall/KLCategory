//
//  UIView+KLFrame.m
//  KLCategory
//
//  Created by Logic on 2019/12/2.
//

#import "UIView+KLFrame.h"

@implementation UIView (KLFrame)

- (void)setKl_x:(CGFloat)kl_x
{
    self.frame = CGRectMake(kl_x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)kl_x
{
    return self.frame.origin.x;
}

- (void)setKl_y:(CGFloat)kl_y
{
    self.frame = CGRectMake(self.frame.origin.x, kl_y, self.frame.size.width, self.frame.size.height);
}

- (CGFloat)kl_y
{
    return self.frame.origin.y;
}

- (void)setKl_width:(CGFloat)kl_width
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, kl_width, self.frame.size.height);
}

- (CGFloat)kl_width
{
    return self.frame.size.width;
}

- (void)setKl_height:(CGFloat)kl_height
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, kl_height);
}

- (CGFloat)kl_height
{
    return self.frame.size.height;
}

- (void)setKl_size:(CGSize)kl_size
{
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, kl_size.width, kl_size.height);
}

- (CGSize)kl_size
{
    return self.frame.size;
}

- (void)setKl_centerX:(CGFloat)kl_centerX
{
    self.center = CGPointMake(kl_centerX, self.center.y);
}

- (CGFloat)kl_centerX
{
    return self.center.x;
}

- (void)setKl_centerY:(CGFloat)kl_centerY
{
    self.center = CGPointMake(self.center.x, kl_centerY);
}

- (CGFloat)kl_centerY
{
    return self.center.y;
}

@end
