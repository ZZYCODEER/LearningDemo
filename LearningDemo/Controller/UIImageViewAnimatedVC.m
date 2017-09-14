//
//  UIImageViewAnimatedVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/9/14.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "UIImageViewAnimatedVC.h"

@interface UIImageViewAnimatedVC ()

@end

@implementation UIImageViewAnimatedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIImageView *gifView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:gifView];
    
    NSMutableArray *imageArray = [NSMutableArray array];
    for (NSUInteger i = 0; i <= 4; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg", i]];
        [imageArray addObject:image];
    }
    gifView.animationImages = imageArray;
    
    gifView.animationDuration = 1;
    gifView.animationRepeatCount = 0;
    [gifView startAnimating];
    
}



@end
