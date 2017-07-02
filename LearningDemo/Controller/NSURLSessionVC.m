
//
//  NSURLSessionVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/3/15.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "NSURLSessionVC.h"

@interface NSURLSessionVC ()

@end

@implementation NSURLSessionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"请求" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
}

//1489040252233592
- (void)clickAction
{
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.HTTPAdditionalHeaders = @{@"_TT":@"1489040252233592"};
    NSURLSession *session = [NSURLSession sessionWithConfiguration:config];
    NSURL *url = [NSURL URLWithString:@"https://dfc.souche.com//rest/mall/getMallThemeDetail"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
//    request.HTTPBody = [@"_TT=1489040252233592" dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"----%@", response);
        NSLog(@"----%@", error);
    }];
    
    [task resume];
    
}





@end
