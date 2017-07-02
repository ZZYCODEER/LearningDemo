//
//  PersonCopy.h
//  LearningDemo
//
//  Created by 张中阳 on 2016/10/30.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonCopy : NSObject <NSCopying>
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;

- (id)initWithFirstName:(NSString *)firstName andLastName:(NSString *)lastName;

- (void)addFriend:(PersonCopy *)person;

- (void)removeFriend:(PersonCopy *)person;



@end
