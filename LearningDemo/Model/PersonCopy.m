//
//  PersonCopy.m
//  LearningDemo
//
//  Created by 张中阳 on 2016/10/30.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "PersonCopy.h"


@implementation PersonCopy
{
    NSMutableSet *_friends;

}

- (id)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName
{
    if (self = [super init]) {
        self.firstName = firstName;   //此处是用设置方法的话，会走copy方法,如果外界传入一个可变字符串，即使修改了也不会变
       // _lastName = lastName;        //此处用的是实例变量接收，如果外界传入一个可变字符串，实例变量也会遭到修改,应该改为下面这种：
        _lastName = [lastName copy];
        
        _friends = [NSMutableSet new];
        
    }
    
    return self;
}

- (void)addFriend:(PersonCopy *)person
{
    [_friends addObject:person];
}

- (void)removeFriend:(PersonCopy *)person
{
    [_friends removeObject:person];
}

- (id)copyWithZone:(NSZone *)zone
{
    PersonCopy *person = [[[self class] allocWithZone:zone] initWithFirstName:_firstName andLastName:_lastName];
//    copy ->_friends = [_friends mutableCopy];
    
    return person;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@, firstName = %@, lastName = %@>", [self class], _firstName, _lastName];
}





@end
