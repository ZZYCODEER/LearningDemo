//
//  ReactiveCocoaVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/7/31.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "ReactiveCocoaVC.h"
#import "ReactiveObjC.h"
@interface ReactiveCocoaVC ()<UITextFieldDelegate>
@property (nonatomic, copy) NSString *name;
@end

#define kScreenWidth self.view.bounds.size.width

@implementation ReactiveCocoaVC

- (void)viewDidLoad {
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITextField *nameTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, kScreenWidth - 20, 30)];
    nameTF.delegate = self;
    nameTF.backgroundColor = [UIColor redColor];
    [self.view addSubview:nameTF];
    
    UITextField *passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(10, 150, kScreenWidth - 20, 30)];
    passwordTF.delegate = self;
    passwordTF.backgroundColor = [UIColor greenColor];
    [self.view addSubview:passwordTF];
    
    
    UIButton *logoBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    logoBtn.frame = CGRectMake(100, 300, 100, 100);
    logoBtn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:logoBtn];
    [logoBtn setTitle:@"logoin" forState:UIControlStateNormal];
    
    [nameTF.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        
        NSLog(@"___%@", x);
    }];
    
    
    RACSignal *enableSignal = [[RACSignal combineLatest:@[nameTF.rac_textSignal, passwordTF.rac_textSignal]] map:^id _Nullable(RACTuple * _Nullable value) {
       
        return @([value[0] length] > 0 && [value[1] length] > 3);
        
    }];
    
    logoBtn.rac_command = [[RACCommand alloc] initWithEnabled:enableSignal signalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        
        return [RACSignal empty];
    }];
    
    
    
    NSArray *array = @[ @1, @2, @3 ];
    RACSequence *steam = [array rac_sequence];
    
   NSLog(@"%@", [[steam map:^id _Nullable(id  _Nullable value) {
        return [value stringValue];
    }] foldLeftWithStart:@"" reduce:^id _Nullable(id  _Nullable accumulator, id  _Nullable value) {
        
        return [accumulator stringByAppendingString:value];

    }]);
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.name = textField.text;
}





@end
