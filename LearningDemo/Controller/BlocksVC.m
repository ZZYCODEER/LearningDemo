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
    
    __weak typeof(self)weakSelf = self;
    self.testBlock = ^{
      weakSelf.name = @"周杰伦";
        
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
