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
    
    
    NSMutableArray *array1 = [@[@"zzy", @"jay", @"abc", @"123"] mutableCopy];
    NSMutableArray *array2 = array1;
    [array2 removeObject:@"zzy"];
    
    NSLog(@"array1 == %p", array1);
    NSLog(@"array2 == %p", array2);

    
    
}




@end
