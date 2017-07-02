//
//  GradientNavBarVC.m
//  LearningDemo
//
//  Created by 张中阳 on 2016/12/5.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "GradientNavBarVC.h"
#import "UINavigationBar+BackGroudColor.h"

@interface GradientNavBarVC ()<UITableViewDataSource, UIScrollViewDelegate, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

static NSString * const cellIdentifier = @"cells";
@implementation GradientNavBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    [self.navigationController.navigationBar zzySetBackGroudColor:[UIColor clearColor]];
    
    
    
    NSMutableArray *array = [@[@"adfa", @"adfa"] mutableCopy];
    NSMutableArray *arr1 = [NSMutableArray arrayWithArray:array];
    NSMutableArray *arr2 = array;
    NSLog(@"%p", array);
    NSLog(@"%p", arr1);
    NSLog(@"%p", arr2);

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self scrollViewDidScroll:self.tableView];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar zzyReset];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    return cell;
}

#define NAVBAR_CHANGE_POINT 50
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIColor * color = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
//    UIColor * color = [UIColor blueColor];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > NAVBAR_CHANGE_POINT) {
        CGFloat alpha = MIN(1, 1 - ((NAVBAR_CHANGE_POINT + 64 - offsetY) / 64));
        [self.navigationController.navigationBar zzySetBackGroudColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar zzySetBackGroudColor:[color colorWithAlphaComponent:0]];
    }

}











@end
