//
//  AutoScrollViewVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/3/18.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "AutoScrollViewVC.h"
#import "AutoScrollView.h"


#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHight [UIScreen mainScreen].bounds.size.height
@interface AutoScrollViewVC (){
    NSInteger num;
}
@property (nonatomic, strong) UILabel *label;

@end

@implementation AutoScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    

    NSArray *array = @[@"0.jpg", @"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg"];
    
    
    UIView *headView = [[AutoScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 200) imagesArray:array];
    headView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:headView];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
}


    

@end
