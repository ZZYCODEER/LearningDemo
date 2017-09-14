//
//  RunLoopVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/7/13.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "RunLoopVC.h"

@interface RunLoopVC ()

@end

@implementation RunLoopVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 150, 150);
    btn.backgroundColor = [UIColor orangeColor];
    
    [btn setTitle:@"runLoop" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clickAction
{
    
    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:3]];

    NSLog(@"---zzy");

}


@end
