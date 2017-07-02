//
//  StringNullVC.m
//  LearningDemo
//
//  Created by 张中阳 on 2016/11/16.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "StringNullVC.h"

@interface StringNullVC ()

@end

@implementation StringNullVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *string = nil;
    NSLog(@"string == %@, string.length = %ld", string, string.length);
    
    
    NSString *str1 = string;
    NSLog(@"str1 == %@, str1.length = %ld", str1, str1.length);
    

    NSString *str2 = [NSString stringWithFormat:@"%@", string];
    NSLog(@"str2 == %@, str2.length = %ld", str2, str2.length);
    
    
//    NSString *string = @"hellow word";
//    [string release];
//    NSLog(@"string = %@", string);
    
    
}




@end
