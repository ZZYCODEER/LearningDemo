
//
//  DispatchQueueVC.m
//  LearningDemo
//
//  Created by 张中阳 on 2016/12/4.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "DispatchQueueVC.h"
#import <objc/runtime.h>

@interface DispatchQueueVC ()
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIImageView *imgV;
@end

@implementation DispatchQueueVC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 10, 100, 100)];
    self.webView = webView;
    [self.view addSubview:self.webView];
    
    
    self.imgV = [[UIImageView alloc] initWithFrame:CGRectMake(10, 150, 100, 100)];
    [self.view addSubview:self.imgV];
    
    
    dispatch_queue_t mySerialDispathQueue = dispatch_queue_create("com.example.gcd.MySerialDispatchQueue", NULL);
    
    dispatch_queue_t myConcurrentDispatchQueue = dispatch_queue_create("com.example.gcd.MyConcurrentDispatchQueue", DISPATCH_QUEUE_CONCURRENT);
    
    //主队列
    dispatch_async(dispatch_get_main_queue(), ^{
        
        
    });
    
    //全局并发队列
    dispatch_queue_t globalDispathQueueHigh = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
    });
    
    dispatch_group_notify(dispatch_group_create(), dispatch_get_main_queue(), ^{
        
        
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        
    });
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self downloadImg];
}

- (void)downloadImg
{
    NSLog(@"开始");
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_queue_t queue = dispatch_get_main_queue();
    
    
    dispatch_sync(queue, ^{
        
        NSURL *url = [NSURL URLWithString:@"https://github.com"];
        [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
        
        NSLog(@"加载github完成");
        NSLog(@"current Queue == %@", [NSThread currentThread]);

    });
    
    
    dispatch_sync(queue, ^{
        
        NSURL *url = [NSURL URLWithString:@"http://world.chinadaily.com.cn/img/attachement/jpg/site1/20161126/448a5bd66b8519a3872f47.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *img= [UIImage imageWithData:data];
        self.imgV.image = img;
        
        NSLog(@"加载图片完成");
        
        NSLog(@"current Queue == %@", [NSThread currentThread]);
    });
    
    
    NSLog(@"结束");

}







@end
