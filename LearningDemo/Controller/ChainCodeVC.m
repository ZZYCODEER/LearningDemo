//
//  ChainCodeVC.m
//  LearningDemo
//
//  Created by 张中阳 on 2017/1/4.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "ChainCodeVC.h"
#import <objc/runtime.h>

@interface ChainCodeVC ()
//@property (nonatomic,copy) ChainCodeVC* (^setFrame)(CGFloat x, CGFloat y, CGFloat w, CGFloat h);
//@property (nonatomic,copy) ChainCodeVC* (^setBackgroundColor)(UIColor* color);

@property (nonatomic, strong) UIView *greenView;
- (ChainCodeVC *(^)(CGFloat, CGFloat, CGFloat, CGFloat))greenViewFrame;
- (ChainCodeVC *(^)(UIColor *))greenViewBackgroundColor;

@end

@implementation ChainCodeVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.greenView = [[UIView alloc] init];
    UIColor *color = [UIColor greenColor];
    
    self.greenViewFrame(100, 100, 100, 100).greenViewBackgroundColor(color);
    
    NSArray *propertiesArr = [self getAllProperties];
    NSLog(@"---%@", propertiesArr);
    
    [self getAllIvarList];
        
}

- (ChainCodeVC *(^)(CGFloat, CGFloat, CGFloat, CGFloat))greenViewFrame
{
    return ^(CGFloat x, CGFloat y, CGFloat w, CGFloat h){
       
        self.greenView.frame = CGRectMake(x, y, w, h);
        [self.view addSubview:self.greenView];
        
        return self;
    };
}

- (ChainCodeVC *(^)(UIColor *))greenViewBackgroundColor
{
    return ^(UIColor *color){
      
        self.greenView.backgroundColor = color;
        return self;
    };
}

- (NSArray *)getAllProperties
{
    u_int count;
    objc_property_t *properties  =class_copyPropertyList([self class], &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    for (int i = 0; i < count ; i++)
    {
        const char* propertyName =property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    
    free(properties);
    
    return propertiesArray;
}

- (void) getAllIvarList {
    unsigned int methodCount = 0;
    Ivar * ivars = class_copyIvarList([self class], &methodCount);
    for (unsigned int i = 0; i < methodCount; i ++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        const char * type = ivar_getTypeEncoding(ivar);
        NSLog(@"拥有的成员变量的类型为%s，名字为 %s ",type, name);
    }
    free(ivars);
}

/* 获取对象的所有方法 */
-(void)getAllMethods
{
    unsigned int mothCout_f =0;
    Method* mothList_f = class_copyMethodList([self class],&mothCout_f);
    for(int i=0;i<mothCout_f;i++)
    {
        Method temp_f = mothList_f[i];
        IMP imp_f = method_getImplementation(temp_f);
        SEL name_f = method_getName(temp_f);
        const char* name_s =sel_getName(method_getName(temp_f));
        int arguments = method_getNumberOfArguments(temp_f);
        const char* encoding =method_getTypeEncoding(temp_f);
        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],
              arguments,
              [NSString stringWithUTF8String:encoding]);
    }
    free(mothList_f);
}


+(void)load
{
    
}


@end
