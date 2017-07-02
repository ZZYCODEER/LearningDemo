//
//  BlocksVC.h
//  LearningDemo
//
//  Created by 张中阳 on 16/9/2.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BlocksVC : UIViewController

- (id)initWithComplete:(void(^)(BOOL success, id data))complete;

@end
