//
//  UINavigationBar+BackGroudColor.m
//  LearningDemo
//
//  Created by 张中阳 on 2016/12/5.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "UINavigationBar+BackGroudColor.h"
#import <objc/runtime.h>

static void *gradientKey = @"gradientKey";
@implementation UINavigationBar (BackGroudColor)

- (UIView *)gradientView
{
    return objc_getAssociatedObject(self, gradientKey);
}

- (void)setGradientView:(UIView *)gradientView
{
    objc_setAssociatedObject(self, gradientKey, gradientView, OBJC_ASSOCIATION_RETAIN);
}

- (void)zzySetBackGroudColor:(UIColor *)backGroudColor
{
    if (!self.gradientView) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self setShadowImage:[UIImage new]];
        self.gradientView = [[UIView alloc] initWithFrame:CGRectMake(0, -20, CGRectGetWidth(self.bounds), 64)];
        [self insertSubview:self.gradientView atIndex:0];
    }
    
    self.gradientView.backgroundColor = backGroudColor;
    
}

- (void)zzyReset
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.gradientView removeFromSuperview];
    self.gradientView = nil;
}



@end
