//
//  DataSourceVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/8/8.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "DataSourceVC.h"
#import "DataSourceCell.h"
#import "TableViewDataSource.h"

@interface DataSourceVC ()<UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) TableViewDataSource *dataSource;

@end

static NSString * const cellIdentifier = @"cells";
@implementation DataSourceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    for (int i = 0; i < 16; i++) {
        [self.dataArray addObject:[NSString stringWithFormat:@"%d", i]];
    }
     self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:self.tableView];
    
    self.dataSource = [[TableViewDataSource alloc] initWithArray:_dataArray
                                                      identifier:cellIdentifier
                                                 cellConfigBlock:^(DataSourceCell *cell, NSString *text) {
                                                                     
                                                            cell.textLabel.text = text;
                                                        }];
    self.tableView.dataSource = _dataSource;
    [self.tableView registerClass:[DataSourceCell class] forCellReuseIdentifier:cellIdentifier];
}

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}




@end
