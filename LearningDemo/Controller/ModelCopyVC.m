//
//  ModelCopyVC.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/9/7.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "ModelCopyVC.h"
#import "CarModel.h"

@interface ModelCopyVC ()
@property (nonatomic, strong) CarModel *carModel;
@property (nonatomic, copy) NSString *name;
@end

@implementation ModelCopyVC

- (instancetype)initWithCarModel:(CarModel *)carModel{
    self = [super init];
    if (self) {
        
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    
    int n = 10;
    int k[10] = {30, -31, 2, 3, 4, -5, -23, 3, -117, 51};
    
    MaxSubseqSumWithSome(k, n);
    
}


int MaxSubseqSumWithSome(int A[], int N) {
    int ThisSum, MaxSum;
    int firtI, endI, computeCount = 0;
    ThisSum = MaxSum = 0;
    firtI = endI = 0;
    for (int i = 0; i < N; i++) {
        ThisSum += A[i];
        computeCount++;
        if (ThisSum > MaxSum) {
            firtI = A[i - computeCount + 1];
            endI = A[i];
            MaxSum = ThisSum;
        } else if (ThisSum < 0) {
            ThisSum = 0;
            computeCount = 0;
        }
    }
    printf("MaxSum----->%d,firtI----->%d, endI----->%d", MaxSum, firtI, endI);
    return MaxSum;
}





@end
