//
//  HitTestingVC.m
//  LearningDemo
//
//  Created by 张中阳 on 2016/12/1.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "HitTestingVC.h"

@interface HitTestingVC ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation HitTestingVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
}

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event
{
//    UIView *view = [super hitTest:point withEvent:event];
    
    
    return nil;
}




@end
