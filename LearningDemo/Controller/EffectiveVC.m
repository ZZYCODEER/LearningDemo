//
//  EffectiveVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/4/27.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "EffectiveVC.h"
#import "TestVC.h"

@interface EffectiveVC ()

@end

@implementation EffectiveVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    imgV.image = [UIImage imageNamed:@"4.jpg"];
    [self.view addSubview:imgV];
    
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView *blurView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    blurView.frame = CGRectMake(100, 100, 200, 200);
    [self.view addSubview:blurView];
    
    
}

- (void)setNameBlock:(MyBlock)nameBlock
{
    _nameBlock = nameBlock;
}
    
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    TestVC *VC = [[TestVC alloc] init];
    VC.testBlock = self.nameBlock;
    [self.navigationController pushViewController:VC animated:YES];
}


@end
