//
//  AlgorithmVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/7/4.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//  算法练习

#import "AlgorithmVC.h"

@interface AlgorithmVC ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *numberOneTF;
@property (weak, nonatomic) IBOutlet UITextField *numberTwoTF;

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
    
    for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 6 - i; j++) {
            if (array[j] > array[j + 1]) {
                NSNumber *temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
    NSLog(@"%@", array);
//    for (int i = 0; i < 6; i++) {
//        printf("%d", array[i]);
//    }
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
