//
//  ZhangPerson.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/4/20.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "ZhangPerson.h"

@implementation ZhangPerson
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, NSStringFromClass([self class]));
        NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, NSStringFromClass([super class]));
    }
    return self;
}

- (void)setLastName:(NSString*)lastName
{
    //设置方法一：如果setter采用是这种方式，就可能引起崩溃
    //    if (![lastName isEqualToString:@"陈"])
    //    {
    //        [NSException raise:NSInvalidArgumentException format:@"姓不是陈"];
    //    }
    //    _lastName = lastName;
    
    //设置方法二：如果setter采用是这种方式，就可能引起崩溃
    lastName = @"陈";
    NSLog(@"🔴类名与方法名：%s（在第%d行），描述：%@", __PRETTY_FUNCTION__, __LINE__, @"会调用这个方法,想一下为什么？");
    
}

@end
