//
//  KVCAndRuntimeToModelVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/3/31.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "KVCAndRuntimeToModelVC.h"
#import "CarModel.h"

@interface KVCAndRuntimeToModelVC ()

@end

@implementation KVCAndRuntimeToModelVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dataDic = @{@"id":@"6788238",
                              @"carName":@"保时捷",
                              @"carPrice":@"120万",
                              @"carAge":@"3年",
                              @"Apple":@"apple",
                              };
    
//    CarModel *model = [CarModel modelWithDict:dataDic];
    CarModel *model = [CarModel objsWithDict:dataDic];
//    NSLog(@"%@, %@, %@, %@", model.ID, model.carName, model.carPrice, model.carAge);
    
    
    NSString *str1 = @"1213";
    NSString *str2 = @"adff";
    NSArray *array1 = [NSArray arrayWithObjects:str1, str2, nil];
    NSArray *array2 = [[NSArray alloc] initWithArray:array1 copyItems:YES];
    
    
    [array1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSLog(@"****%p", obj);
        
    }];
    
    NSLog(@"//////str1=%p, str2=%p, array1=%p, array2=%p", str1, str2, array1, array2);
    [array2 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       
        NSLog(@"===%p", obj);
        
    }];
    

}



@end
