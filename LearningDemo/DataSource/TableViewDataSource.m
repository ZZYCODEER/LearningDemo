//
//  TableViewDataSource.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/8/8.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "TableViewDataSource.h"

@interface TableViewDataSource ()
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) void (^CellConfigBlock)(UITableViewCell *, NSString *);

@end

@implementation TableViewDataSource

- (instancetype)initWithArray:(NSArray *)dataArray identifier:(NSString *)identifier cellConfigBlock:(void (^)(id, NSString *))cellConfigBlock{
    
    if (self = [super init]) {
        self.dataArray = dataArray;
        self.cellIdentifier = identifier;
        self.CellConfigBlock = cellConfigBlock;
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellIdentifier forIndexPath:indexPath];
    if (indexPath.row < _dataArray.count) {
        self.CellConfigBlock(cell, _dataArray[indexPath.row]);
    }
    
    return cell;
}


@end
