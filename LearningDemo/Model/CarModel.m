//
//  CarModel.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/3/31.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "CarModel.h"
#import <objc/runtime.h>


static NSMutableDictionary * keyNames = nil;
@implementation CarModel
+ (instancetype)modelWithDict:(NSDictionary *)dict
{
    CarModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

- (void)setValue:(id)value forKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKeyPath:@"ID"];
    }else{
        [super setValue:value forKey:key];
    }
}

//- (void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    NSLog(@"----UndefinedKey == %@", key);
//}

//runtime可以取出一个对象中所有的属性, 不管是私有的还是公开的
+ (instancetype)objsWithDict:(NSDictionary *)dict

{
    
    id objc = [[self alloc] init];
    
    //遍历模型中的属性
    
    unsigned int count = 0;
    
    Ivar *ivars = class_copyIvarList(self, &count);  //把所有属性取出来放到一个数组中, ivars存放这个对象中所有的属性
    
    for (int i = 0; i < count; i++) {
        
        Ivar ivar = ivars[i];  //取出第i个属性
        
        NSString *ivarName = @(ivar_getName(ivar));  //得到属性名
        
        NSLog(@"%@", ivarName);
        
        //此时得到的属性名是带下划线的实例变量名, 如果要对应对象中的属性,需要再转一步
        
        ivarName = [ivarName substringFromIndex:1];
        
        //映射: 需要外界通知内部, 模型中属性名对应字典中里面的哪个key
        
        // ID -> id
        if ([ivarName isEqualToString:@"ID"]) {
            ivarName = @"id";
        }
        
        id value = dict[ivarName];
        
        [objc setValue:value forKeyPath:ivarName];
        
    }
    
    return objc;
    
}
    
    /**
     
     KVC 和 runtime 的一些区别
     
     KVC是字典转模型, 从字典中根据key去对象中找相对应的属性, 如果一致就赋值, 不一致会报错
     
     runtime 正好相反, 是从对象中取出所有的属性, 去字典中找, 如果对应的key一致, 就赋值, 不一致也不会报错, 因为用一个字典不存在的key去字典中取值的时候字典是不会报错的,只是此时的对象对应的属性值为空(null)
     
     */




@end
