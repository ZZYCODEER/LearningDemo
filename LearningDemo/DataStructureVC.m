//
//  DataStructureVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/7/6.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "DataStructureVC.h"

@interface DataStructureVC ()

@end

@implementation DataStructureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 150, 150);
    btn.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clickAction
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(backDelegateWithData:)]) {
        [self.delegate backDelegateWithData:@"zzy"];
    }
    [self.navigationController popViewControllerAnimated:YES];
        
    
    void (^block)() = ^{
        NSLog(@"--");
    };
    
    block();
    
    
}

-(void)dealloc
{
    NSLog(@"--%@ dealloc", NSStringFromClass([self class]));
}

/**
 栈的实现
*/

char stack[100];          /* 作为栈本质的数组 */
char StackPointer = 0;    /* 栈顶指针 */

void Push(char data){
    
    stack[StackPointer] = data;
    StackPointer++;
}

char Pop(){
    
    StackPointer--;
    
    return stack[StackPointer];
}


/**
 队列的实现
 */

char Queue[100];
char SetIndex = 0;
char GetIndex = 0;

/* 存储数据的函数 */
void Set(char data){
    Queue[SetIndex] = data;
    SetIndex++;
    /* 如果已到达数组的末尾则折回到开头 */
    if (SetIndex >= 100) {
        SetIndex = 0;
    }
}

/* 读取数据的函数 */
char Get(){
    char data;
    data = Queue[GetIndex];
    
    GetIndex++;
    /* 如果已到达数组的末尾则折回到开头 */
    if (GetIndex >= 100) {
        GetIndex = 0;
    }
    
    return data;
}
 

/**
   链表：只要改变连接信息，元素就可以呈现出新顺序，不同于其在内存上的物理排列顺序。
 */



@end
