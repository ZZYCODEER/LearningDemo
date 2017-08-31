//
//  ViewController.m
//  LearningDemo
//
//  Created by 张中阳 on 16/8/22.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "BlocksVC.h"
#import "CollectionView.h"
#import "PersonCopy.h"
#import "KeyboradVC.h"
#import "StringNullVC.h"
#import "HitTestingVC.h"
#import "DispatchQueueVC.h"
#import "GradientNavBarVC.h"
#import "UIView+ZZYView.h"
#import "ChainCodeVC.h"
#import "NSURLSessionVC.h"
#import "AutoScrollViewVC.h"
#import "KVCAndRuntimeToModelVC.h"
#import "EffectiveVC.h"
#import "HostMacro.h"
#import "RequestVC.h"
#import "DeepCopyVC.h"
#import "AlgorithmVC.h"
#import "CustomButtonVC.h"
#import "UIScrollViewVC.h"
#import "RunLoopVC.h"
#import "ReactiveCocoaVC.h"
#import "DataSourceVC.h"
#import "Test2VC.h"
#import "UIImageView+WebCache.h"
#import "GCDVC.h"


typedef void(^blk_t)(id obj);
@interface ViewController ()<UIAlertViewDelegate, UIScrollViewDelegate>
@property (nonatomic, strong) PersonCopy *person;
@property (nonatomic, strong) NSMutableString *string;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSDictionary *dataDic;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) UIViewController *strongVC;
@property (nonatomic, copy)blk_t blk;
@end


@implementation ViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
//        NSLog( @"//////初始化");
        
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
//        NSLog( @"######初始化");
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = NSStringFromClass([self class]);
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:ALERT_TITLE message:nil delegate:self cancelButtonTitle:nil otherButtonTitles:nil, nil];
//    [alert show];

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 150, 150);
    btn.backgroundColor = [UIColor orangeColor];
    
    [btn setTitle:ALERT_TITLE forState:UIControlStateNormal];
    self.button = btn;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self configure];
    
    [self configPlistData];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(100, 250, 150, 20);
    label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:label];
    
    NSArray *array = [self readPlistData];
    label.text = array[1];
    
    
//    _string = [NSMutableString stringWithFormat:@"zzy"];
//    self.person = [[PersonCopy alloc] initWithFirstName:_string andLastName:_string];
//    NSLog(@"string == %@", _string);
//    NSLog(@"person == %@", _person);
//    
//    for (int i = 0; i < 10; i++) {
//        
//        NSLog(@"-----%d", i);
//    }
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 300, CGRectGetWidth(self.view.frame), 200)];
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = [UIColor greenColor];
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 4, 0);
    [self.view addSubview:_scrollView];
    
    
    NSString *string1 = @"http://img.souche.com/20151207/png/364cf25f6cb8439bda98dc2f1ce3ccb1.png@1e_270w_74h_1c_0i_2o_100Q_1x.jpg|watermark=2&type=ZmFuZ3poZW5naGVpdGk&size=36&text=6L-I6aqP5Lya5rG96L2m&color=IzMzMzMzMw&s=0&t=90&p=5&x=10&voffset=0";
    NSString *string2 = [string1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url1= [NSURL URLWithString:string1];
    
//    NSLog(@"string2 == %@", string2);

//    NSLog(@"NSURL1 == %@", url1);
    
//    NSString *string2 = @"http://img.souche.com/20151207/png/364cf25f6cb8439bda98dc2f1ce3ccb1.png@1e_270w_74h_1c_0i_2o_100Q_1x.jpg?watermark=2&type=ZmFuZ3poZW5naGVpdGk&size=36&text=6L-I6aqP5Lya5rG96L2m&color=IzMzMzMzMw&s=0&t=90&p=5&x=10&voffset=0";
//    NSURL *url2 = [NSURL URLWithString:string2];
//    NSLog(@"NSURL2 == %@", url2);

    
    NSDictionary *dic1 = @{@"str1":@"1234", @"str2":@"5678"};
    self.dataDic = dic1.copy;
//    NSLog(@"%@", _dataDic);
    
    
    
    
    NSMutableArray *mutaArr = [[NSMutableArray alloc] init];
//   __block NSMutableArray * __weak weakArr = mutaArr;
    
   __block int a = 10;
    
    self.blk = ^(id obj){
      
        [mutaArr addObject:obj];
        
//        NSArray *array = [NSArray array];
        
//        mutaArr = array;
        
//        NSLog(@"array = %@", mutaArr);
        
//        NSLog(@"a /// %d", a);
        
        a = 12;
        
//        NSLog(@"a **** %d", a);

    };
    
    _blk(@1);
    
//    NSLog(@"a == %d", a);
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, CGRectGetHeight(self.view.frame) - 150, 100, 100)];
    NSURL *url = [NSURL URLWithString:@"http://f.souche.com/fcfb7a280a9a8d44b79c4b66ddf34452.png?imageMogr2/auto-orient/thumbnail/640x/gravity/Center/crop/640x960/interlace/1/quality/70"];
    
    NSLog(@"执行开始");
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionTask *task = [session dataTaskWithURL:[NSURL URLWithString:@"https://objccn.io/issue-5-4/"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            NSLog(@"downLoad...");
            
        }];
        [task resume];
    
 
    
//    NSURLSessionDownloadTask *task = [session downloadTaskWithURL:url completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        
//        NSLog(@"downLoad...");
//    }];
    
    NSLog(@"执行结束");

    
//    [imageView sd_setImageWithURL:url];
    [self.view addSubview:imageView];

    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBackgroundColor:[UIColor redColor]];
    
//    _blk(@1);
//    _blk(@1);
//
//    _blk(@1);

    
}

- (void)configure
{
//    self.view.backgroundColor = [UIColor redColor];
}

- (void)clickAction
{
   
//    CollectionView *collectionView = [[CollectionView alloc] init];
//    [self.navigationController pushViewController:collectionView animated:YES];
    
/**
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Route" ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString *classString = [dict objectForKey:[[dict allKeys] objectAtIndex:2]];
    if (classString != nil) {
        Class class = NSClassFromString(classString);
        if (class != nil) {
            UIViewController *VC = [[class alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
*/
    
    
//    [_string insertString:@"W" atIndex:0];
//    NSLog(@"_string == %@", _string);
//    NSLog(@"%@", _person);
    
    
    
    
//    KeyboradVC *vc = [[KeyboradVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
//    StringNullVC *vc = [[StringNullVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];

//    HitTestingVC *vc = [[HitTestingVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
//    GradientNavBarVC *vc = [[GradientNavBarVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
    
//    ChainCodeVC *vc = [[ChainCodeVC alloc] init];
    
    
//    NSURLSessionVC *vc = [[NSURLSessionVC alloc] init];
//    AutoScrollViewVC *vc = [[AutoScrollViewVC alloc] init];
//    KVCAndRuntimeToModelVC *vc = [[KVCAndRuntimeToModelVC alloc] init];
//    EffectiveVC *vc = [[EffectiveVC alloc] init];
//    [vc setNameBlock:^(NSString *name) {
//        
//        [self.button setTitle:name forState:UIControlStateNormal];
//    }];
    
//    RequestVC *vc = [[RequestVC alloc] init];
//    DeepCopyVC *vc = [[DeepCopyVC alloc] init];
//      AlgorithmVC *vc = [[AlgorithmVC alloc] init];
 //    CustomButtonVC *vc = [[CustomButtonVC alloc] init];
//    UIScrollViewVC *vc = [[UIScrollViewVC alloc] init];
//    RunLoopVC *vc = [[RunLoopVC alloc] init];
    
//    ReactiveCocoaVC *vc = [[ReactiveCocoaVC alloc] init];
    
//    DataSourceVC *vc = [[DataSourceVC alloc] init];
//    Test2VC *vc = [[Test2VC alloc] init];
    
    GCDVC *vc = [[GCDVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
    
    
    
//    BlocksVC *blocksVC = [[BlocksVC alloc] initWithComplete:^(BOOL success, id data) {
//        
//        
//    }];
//    [self.navigationController pushViewController:blocksVC animated:YES];
}

- (void)backDelegateWithData:(NSString *)name
{
    self.title = name;
}

//plist文件存储数据
- (void)configPlistData
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingString:@"123.plist"];
    
    NSArray *array = @[@"1234", @"zzy", @"iOS"];
    [array writeToFile:fileName atomically:YES];
}

- (NSArray *)readPlistData
{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *fileName = [path stringByAppendingString:@"123.plist"];
//    NSLog(@"%@", fileName);
    NSArray *array = [NSArray arrayWithContentsOfFile:fileName];
//    NSLog(@"resultArray ==  %@", array);
    
    return array;
}

#pragma mark - UIScrollView delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//   NSLog(@"---%f", scrollView.contentOffset.x);
}




@end
