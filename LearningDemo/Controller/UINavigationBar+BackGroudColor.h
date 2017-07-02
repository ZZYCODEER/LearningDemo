//
//  UINavigationBar+BackGroudColor.h
//  LearningDemo
//
//  Created by 张中阳 on 2016/12/5.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (BackGroudColor)

@property (nonatomic, strong) UIView *gradientView;

- (void)zzySetBackGroudColor:(UIColor *)backGroudColor;

- (void)zzyReset;

@end
