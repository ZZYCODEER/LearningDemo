//
//  BlocksVC.m
//  LearningDemo
//
//  Created by 张中阳 on 16/9/2.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "BlocksVC.h"
#import "TestVC.h"

typedef void(^TestBlock)();
@interface BlocksVC ()
@property (nonatomic, copy) TestBlock testBlock;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) TestVC *testVC;
@end

NSString *ZZY = @"zhangzhongyang";
@implementation BlocksVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);

    self.view.backgroundColor = [UIColor whiteColor];
    
    int a = 10;
    
    __weak typeof(self)weakSelf = self;
    self.testBlock = ^{
      weakSelf.name = @"周杰伦";
        
//        a = 20;
        
        /**  Block为何不能修改外部变量
         
         Block只会捕获外部变量的瞬间值，内部会自动生成对应类型的变量用来存放外部变量。
         修改这些值的时候，之所以报错是因为编译器检查，因为即使你修改了也没用。
         
         __block: 如果变量用__block修饰，那么block内部引用的是指向外部变量的指针，
         所以变量在block中也能修改了。
         
         
         __weak: runtime会维护一个哈希表，以对象（self）的首地址为key，若干个__weak修饰的指针的自身地址所组成的数组为value，当对象被释放时，通过对象的首地址，找到所有指向它的__weak修饰的指针，并将它们都置为nil。
         
         
         Q:调用Copy时不同的Block对象究竟发生了什么：
         
         _NSConcreteStackBlock ：从栈复制到堆
         _NSConcreteGlobalBlock ：什么也不做
         _NSConcreteMallocBlock ：引用计数增加
         
         
         Q:调用Copy时不同的__block对象究竟发生了什么：
         
         栈 ：从栈复制到堆，并且被Block持有
         堆 ：被Block持有
         
         
         */
        
    };
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"BlockVC" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

- (id)initWithComplete:(void (^)(BOOL, id))complete
{
    return self;
}

- (void)clickAction
{
    
//    TestVC *vc = [[TestVC alloc] init];
//    vc.backTestBlock = ^{
//     
//        self.name = @"Jay Chou";
//        NSLog(@"----%@", self.name);
//    };


    self.testVC = [[TestVC alloc] init];
    __weak typeof(self)weakSelf = self;
    self.testVC.backTestBlock = ^{
        weakSelf.name = @"aadfaf";
    };
    
//    [self.testVC testBlockWithBlock:^{
//       self.name = @"陈奕迅";
//    }];
    
    [self.navigationController pushViewController:self.testVC animated:YES];
}





- (void)dealloc
{
    NSLog(@"-----BlocksVC dealloc...");
}


@end
