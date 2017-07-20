//
//  UIScrollViewVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/7/13.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "UIScrollViewVC.h"

@interface UIScrollViewVC ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@end

static NSString *cellIdentifier = @"cells";
@implementation UIScrollViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
//    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(50, 50, self.view.bounds.size.width - 100, self.view.bounds.size.height - 164)];
//    scrollView.backgroundColor = [UIColor greenColor];
//    scrollView.pagingEnabled = YES;
//    [self.view addSubview:scrollView];
//    
//    UIImageView *imgV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"0.jpg"]];
//    imgV.frame = CGRectMake(0, 0, CGRectGetWidth(scrollView.frame), 200);
//    [scrollView addSubview:imgV];
//    
//    scrollView.contentSize = CGSizeMake(CGRectGetWidth(scrollView.frame), 2 * CGRectGetHeight(scrollView.frame));
//    scrollView.contentInset = UIEdgeInsetsMake(250, 0, 0, 0);
//    scrollView.delegate = self;
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    
    tableView.contentInset = UIEdgeInsetsMake(0, 0, 64, 0);

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"****%f", self.tableView.contentInset.bottom);

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    NSLog(@"---///%f", scrollView.contentOffset.y);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行", indexPath.row];
    
    return cell;
}


@end
