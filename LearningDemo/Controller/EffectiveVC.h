//
//  EffectiveVC.h
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/4/27.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^MyBlock)(NSString *name);

@interface EffectiveVC : UIViewController

@property (nonatomic, copy) MyBlock nameBlock;
@end
