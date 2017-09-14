//
//  CarModel.h
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/3/31.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarModel : NSObject<NSCopying>

@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *carName;
@property (nonatomic, copy) NSString *carPrice;
@property (nonatomic, copy) NSString *carAge;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

+ (instancetype)objsWithDict:(NSDictionary *)dict;

@end
