//
//  DeepCopyVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/7/3.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "DeepCopyVC.h"

@interface DeepCopyVC ()

@end

@implementation DeepCopyVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    NSMutableString *str1 = [NSMutableString stringWithFormat:@"123"];
    NSArray *subArr = @[str1];
    
    NSArray *originArr = @[str1, @"abc", subArr];
    NSArray *copyArray = [originArr copy];
    NSMutableArray *mutableArr = [originArr mutableCopy];
    NSMutableArray *itemMutableArr = [[NSMutableArray alloc] initWithArray:originArr copyItems:YES];
    NSArray *deepCopyArr = [NSKeyedUnarchiver unarchiveObjectWithData:[NSKeyedArchiver archivedDataWithRootObject:originArr]];
    
    NSLog(@"originArr的地址 == %p", originArr);
    NSLog(@"copyArray的地址 == %p", copyArray);
    NSLog(@"mutableArr的地址 == %p", mutableArr);
    NSLog(@"itemMutableArr的地址 == %p", itemMutableArr);
    NSLog(@"deepCopyArr的地址 == %p", deepCopyArr);

    
    [str1 appendFormat:@"456"];
    
    NSLog(@"%@", originArr);
    NSLog(@"%@", mutableArr);
    NSLog(@"%@", itemMutableArr);
    NSLog(@"%@", deepCopyArr);

    
    NSLog(@"//////////////////////");
    
    
    

}




@end
