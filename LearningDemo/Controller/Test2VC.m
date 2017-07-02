//
//  Test2VC.m
//  LearningDemo
//
//  Created by 张中阳 on 16/9/2.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "Test2VC.h"

@interface Test2VC ()

@end

@implementation Test2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);

    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
