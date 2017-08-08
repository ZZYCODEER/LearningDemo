//
//  TableViewDataSource.h
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/8/8.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewDataSource : NSObject<UITableViewDataSource>

- (instancetype)initWithArray:(NSArray *)dataArray
                   identifier:(NSString *)identifier
              cellConfigBlock:(void (^) (id, NSString *))cellConfigBlock;

@end
