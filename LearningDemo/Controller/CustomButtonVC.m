//
//  CustomButtonVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/7/5.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "CustomButtonVC.h"
#import "CustomeBtn.h"

@interface CustomButtonVC ()

@end

@implementation CustomButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CustomeBtn *btn = [CustomeBtn buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    
    [btn setTitle:@"大搜车" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
}


@end
