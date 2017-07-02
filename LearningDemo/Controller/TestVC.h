//
//  TestVC.h
//  LearningDemo
//
//  Created by 张中阳 on 16/9/2.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PassVulueTestBlock)(NSString *name);

typedef void(^BackTestBlock)();

@interface TestVC : UIViewController
@property (nonatomic, copy)  BackTestBlock backTestBlock;

- (void)testBlockWithBlock:(BackTestBlock)block;
@property (nonatomic, copy) PassVulueTestBlock testBlock;

@end
