//
//  TestVC.m
//  LearningDemo
//
//  Created by 张中阳 on 16/9/2.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "TestVC.h"

@interface TestVC ()
@property (nonatomic, copy) NSString *name;
@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);

    self.view.backgroundColor = [UIColor whiteColor];

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"TestVC" forState:UIControlStateNormal];

    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setTitle:@"animation" forState:UIControlStateNormal];
    btn1.frame = CGRectMake(100, 250, 100, 100);
    btn1.backgroundColor = [UIColor blueColor];
    [btn1 addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
}


- (void)clickAction
{
    if (self.backTestBlock) {
        self.backTestBlock();
    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    if (self.testBlock) {
        self.testBlock(@"张中阳");
    }
}

- (void)btnAction
{

    [UIView animateWithDuration:0.2 animations:^{
        
        self.name = @"adfad";
        
    }];
}

- (void)testBlockWithBlock:(void (^)())block
{
    block();
    NSLog(@"执行了blocks-----");
}


- (void)dealloc
{
    NSLog(@"-----TestVC dealloc...");
}

- (void)setTestBlock:(PassVulueTestBlock)testBlock
{
    _testBlock = testBlock;
}



@end
