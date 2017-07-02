//
//  UIView+ZZYView.m
//  LearningDemo
//
//  Created by 张中阳 on 2016/12/7.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "UIView+ZZYView.h"

@implementation UIView (ZZYView)

    @dynamic X;
    @dynamic Y;
    
    
- (void)setX:(CGFloat)X
{
    CGRect frame = self.frame;
    frame.origin.x = X;
    self.frame = frame;
}


- (void)setY:(CGFloat)Y
{
    CGRect frame = self.frame;
    frame.origin.y = Y;
    self.frame = frame;
}

- (void)setWidth:(CGFloat)Width
{
    CGRect frame = self.frame;
    frame.size.width = Width;
    self.frame = frame;
}


- (void)setHeight:(CGFloat)Height
{
    CGRect frame = self.frame;
    frame.size.height = Height;
    self.frame = frame;
}

- (CGFloat)X
{
    return self.frame.origin.x;
}

- (CGFloat)Y
{
    return self.frame.origin.y;
}

- (CGFloat)Width
{
    return self.frame.size.width;
}

- (CGFloat)Height
{
    return self.frame.size.height;
}


@end
