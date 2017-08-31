//
//  DataStructureVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/8/31.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "DataStructureVC.h"

@interface DataStructureVC ()

@end

typedef struct Node
{
    int data;
    struct Node *next;
} Node;


//定义链表
typedef struct Node *LinkList;

//单链表的读取: 初始条件，顺序线性表L已经存在， 1<= i <= ListLength(L)， 用e返回L中第i个元素的值
 BOOL getElem(LinkList L, int i, int *e)
{
    int j;
    LinkList p;  //声明一个指针p
    p = L->next;
    
    j = 1;
    
    while (p && j < i) {
        p = p->next;
        ++j;
    }
    
    if (!p || j > i) {
        return NO;
    }
    
    *e = p->data;
    
    return YES;
}

//单链表的建表:
void createListTail(LinkList *list, int n)
{
    LinkList p, r;
    *list = (LinkList)malloc(sizeof(Node));  //整个线性表
    
    //r为指向尾部的结点
    r = *list;
    
    for (int i = 0; i < n; i++) {
        
        //生成新结点:
        p = (Node *)malloc(sizeof(Node));
        
        //随机赋值100以内的数字
        p->data = rand() % 100 + 1;
        
        //将表尾终端结点的指针指向新结点
        r->next = p;
        
        //将当前的新结点定义为表尾终端结点
        r = p;
    }
    
    //表示当前链表结束
    r->next = NULL;
    
}


@implementation DataStructureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}




@end
