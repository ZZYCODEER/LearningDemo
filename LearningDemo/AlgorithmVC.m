//
//  AlgorithmVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/7/4.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//  算法练习

#import "AlgorithmVC.h"
#import "DataStructureVC.h"

@interface AlgorithmVC ()<UITextFieldDelegate, TestDelegate>
@property (weak, nonatomic) IBOutlet UITextField *numberOneTF;
@property (weak, nonatomic) IBOutlet UITextField *numberTwoTF;
@property (nonatomic, strong) UIViewController *strongVC;

@end

@implementation AlgorithmVC
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //冒泡排序
    NSMutableArray *array = [@[@12, @21, @34, @2, @23, @89, @9] mutableCopy];
//    int array[6] = {1, 23, 45, 9, 33, 5};
    
//    for (int i = 0; i < 6; i++) {
//        for (int j = 0; j < 6 - i; j++) {
//            if (array[j] > array[j + 1]) {
//                NSNumber *temp = array[j];
//                array[j] = array[j + 1];
//                array[j + 1] = temp;
//            }
//        }
//    }
//    NSLog(@"%@", array);
//    for (int i = 0; i < 6; i++) {
//        printf("%d", array[i]);
//    }
    
    NSUInteger count = array.count;
    for (int i = 0; i < count / 2; i++) {
        NSNumber *temp = array[i];
        
        array[i] = array[count - 1 - i];

        array[count - 1 - i] = temp;
        
    }
//    NSLog(@"zzy ===== %@", array);
    
    /**
    
    //二分查找法:0.000276
    int a[8]= {-32, 12, 16, 24, 36, 45, 59, 98};
    
    int i = 98;
    
    int low = 0;
    int high = 8 - 1;
    
    CFAbsoluteTime start = CFAbsoluteTimeGetCurrent();

    while (low <= high) {
        
        int middle = (low + high) / 2;
        int temp = a[middle];
        
        if (i < temp) {
            high = middle - 1;
        }else if (i > temp){
            low = middle + 1;
        }else{
            NSLog(@"找到这个值是----%d", temp);
            
            CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
            
            NSLog(@"耗时----%f", end - start);

            
            return;
        }
    }
    

//    for (int i = 0; i < 8; i++) {
//        if (a[i] == 24) {
//            NSLog(@"找到这个值是----%d", a[i]);
//            CFAbsoluteTime end = CFAbsoluteTimeGetCurrent();
//            NSLog(@"耗时----%f", end - start);
//
//        }
//    }
//    
    */
    
    
    /**
     
     1. 先找到中间位置 middle = (low + high) / 2;
     
     2. 取出中间位置的值 temp = a[middle];
     
     3. 比较中间位置的值跟输入的值 i 的大小：
            如果 i < temp, 查找范围缩小到： 最小值 到 中间值的范围
                high = middle - 1;
            如果 i > temp, 查找范围缩小到： 中间值 到 最大值的范围
                low = middle + 1
            如果 i == temp， 找到
     
     
     */
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 300, 150, 150);
    btn.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clickAction
{
    DataStructureVC *vc = [[DataStructureVC alloc] init];
    
    self.strongVC = vc;
    vc.delegate = self;

    [self.navigationController pushViewController:vc animated:YES];
}


-(void)dealloc
{
    NSLog(@"--%@ dealloc", NSStringFromClass([self class]));
}

/////鸡兔同笼问题
void getComfortableNumber()
{
    int a;
    int b;
    for (int i = 0; i <= 10; i++) {
        for (int n = 0; n <= 10; n++) {
            
            a = i + n;
            b = 2 * i + 4 * n;
            if (a == 10 && b == 32) {
                NSLog(@"i == %d, n == %d", i, n);
            }
        }
    }
}

- (IBAction)countChikenAndRabbit:(id)sender {
    getComfortableNumber();
}













////////////////////////   辗转相除法    ////////////////////
int getLessNumberWithTwoNumber(int maxNum, int minNum)
{
    while (maxNum > minNum) {
        maxNum = maxNum - minNum;
    }
    return maxNum;
}

void countMaxMumCommonDivesorWithNumberOne(int numberOne, int numberTwo)
{
    int a = numberOne > numberTwo ? numberOne : numberTwo;
    int b = numberOne > numberTwo ? numberTwo : numberOne;
   
    while (a != b) {
        if (a > b) {
            a = getLessNumberWithTwoNumber(a, b);
        }
        if (b > a) {
            b = getLessNumberWithTwoNumber(b, a);
        }
    }

}


- (void)countMaxMumCommonDivesorWithNumberOne:(NSInteger)numberOne numberTwo:(NSInteger)numberTwo
{
    /**  辗转相除法
     
     1.给出两个数numberOne, numberTwo，找出最大的和最小的.
     NSInteger a = numberOne > numberTwo ? numberOne : numberTwo;
     NSInteger b = numberOne > numberTwo ? numberTwo : numberOne;

     2.设计算法函数，用大数a减去小数b，直到大数a小于或等于小数b为止.OC里面可以将这个过程封装成代码块block
     
     NSInteger (^CountBlock)(NSInteger, NSInteger) = ^(NSInteger maxNum, NSInteger minNum){
     while (maxNum > minNum) {
        maxNum = maxNum - minNum;
     }
     
        return maxNum;
     };
     
     3.分别用 a 和 b 互相减，直到 a = b
     
     while (a != b) {
        if (a > b) {
        a = CountBlock(a, b);
     }
        if (a < b) {
     
            b = CountBlock(b, a);
        }
     }
     
     */
    
    NSInteger a = numberOne > numberTwo ? numberOne : numberTwo;
    NSInteger b = numberOne > numberTwo ? numberTwo : numberOne;
    
    
    NSInteger (^CountBlock)(NSInteger, NSInteger) = ^(NSInteger maxNum, NSInteger minNum){
        while (maxNum > minNum) {
            maxNum = maxNum - minNum;
        }
        
        return maxNum;
    };
    
    while (a != b) {
        if (a > b) {
          a = CountBlock(a, b);
        }
        if (a < b) {
           b = CountBlock(b, a);
        }
    }
    
    if (a == b) {
        NSLog(@"最大公约数 = %ld", a);
    }
    
}

- (IBAction)MaximumCommonDivesorAction:(id)sender {
    
    [self countMaxMumCommonDivesorWithNumberOne:[_numberOneTF.text integerValue] numberTwo:[_numberTwoTF.text integerValue]];
}

#pragma mark - UITextFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [textField resignFirstResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.numberOneTF resignFirstResponder];
    [self.numberTwoTF resignFirstResponder];
}


@end
