//
//  DataStructureVC.h
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/7/6.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TestDelegate <NSObject>

- (void)backDelegateWithData:(NSString *)name;

@end

@interface DataStructureVC : UIViewController

@property (nonatomic, weak) id <TestDelegate> delegate;


@end
