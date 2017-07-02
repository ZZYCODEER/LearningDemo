//
//  KeyboradVC.m
//  LearningDemo
//
//  Created by 张中阳 on 2016/11/3.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "KeyboradVC.h"

@interface KeyboradVC ()<UITextFieldDelegate>
{
    UIButton *doneInKeyboardButton;
}

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation KeyboradVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    doneInKeyboardButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [doneInKeyboardButton setTitle:@"." forState:UIControlStateNormal];
    doneInKeyboardButton.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width / 3, 53);
    [[UIApplication sharedApplication].keyWindow addSubview:doneInKeyboardButton];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    //注册键盘显示通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    //注册键盘隐藏通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleKeyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}


-(void)viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    //注销键盘显示通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark - Action
- (void)handleKeyboardWillShow:(NSNotification *)notification
{
    // NSNotification中的 userInfo字典中包含键盘的位置和大小等信息
    NSDictionary *userInfo = [notification userInfo];
    // UIKeyboardAnimationDurationUserInfoKey 对应键盘弹出的动画时间
    CGFloat animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    // UIKeyboardAnimationCurveUserInfoKey 对应键盘弹出的动画类型
    NSInteger animationCurve = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    //数字彩,数字键盘添加“完成”按钮
    if (doneInKeyboardButton){
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:animationDuration];//设置添加按钮的动画时间
        [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];//设置添加按钮的动画类型
        
        //设置自定制按钮的添加位置(这里为数字键盘添加“.”按钮)
        doneInKeyboardButton.transform = CGAffineTransformMakeTranslation(0, -153);
        
        [UIView commitAnimations];
    }
}

- (void)handleKeyboardWillHide:(NSNotification *)notification
{
    // NSNotification中的 userInfo字典中包含键盘的位置和大小等信息
    NSDictionary *userInfo = [notification userInfo];
    // UIKeyboardAnimationDurationUserInfoKey 对应键盘收起的动画时间
    CGFloat animationDuration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    if (doneInKeyboardButton.superview)
    {
        [UIView animateWithDuration:animationDuration animations:^{
            //动画内容，将自定制按钮移回初始位置
            doneInKeyboardButton.transform=CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            //动画结束后移除自定制的按钮
            [doneInKeyboardButton removeFromSuperview];
        }];
        
    }
}

#pragma mark -- UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    //初始化数字键盘的“完成”按钮
//    if(doneInKeyboardButton.superview==nil)
//        [self configDoneInKeyBoardButton];
    
}


- (void) addDoneButton{
    //获得键盘所在的window视图
    NSArray *array= [[UIApplication sharedApplication]windows];
    
    for (UIWindow *window in array) {
        
        NSString *str=NSStringFromClass([window class]);
        
        if ([str isEqualToString:@"UIRemoteKeyboardWindow"]) {
            
            [window addSubview:doneInKeyboardButton];
            
        }
        
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}



@end
