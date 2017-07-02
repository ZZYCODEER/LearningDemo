//
//  AutoScrollView.m
//  LearningDemo
//
//  Created by ZHANGZHONGYANG on 2017/3/18.
//  Copyright © 2017年 ZHANGZHONGYANG. All rights reserved.
//

#import "AutoScrollView.h"
#import "UIView+ZZYView.h"

@interface AutoScrollView ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *autoScrollView;
@property (nonatomic, copy) NSArray *dataArray;
@property (nonatomic, strong) UIImageView *leftImageV;
@property (nonatomic, strong) UIImageView *currentImageV;
@property (nonatomic, strong) UIImageView *rightImageV;

@end


@implementation AutoScrollView


- (instancetype)initWithFrame:(CGRect)frame imagesArray:(NSArray *)imagesArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArray = [NSArray arrayWithArray:imagesArray];
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    self.autoScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    self.autoScrollView.backgroundColor = [UIColor greenColor];
    self.autoScrollView.delegate = self;
    [self addSubview:_autoScrollView];
    
    self.autoScrollView.bounces = NO;
    self.autoScrollView.pagingEnabled = YES;
//    self.autoScrollView.showsHorizontalScrollIndicator = NO;
    self.autoScrollView.showsVerticalScrollIndicator = NO;
    
    self.autoScrollView.contentSize = CGSizeMake(3 *self.Width, self.Height);

    self.leftImageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.Width, self.Height)];
    self.leftImageV.image = [UIImage imageNamed:_dataArray[_dataArray.count - 1]];
    [self.autoScrollView addSubview:_leftImageV];
    
    self.currentImageV = [[UIImageView alloc] initWithFrame:CGRectMake(self.Width, 0, self.Width, self.Height)];
    self.currentImageV.image = [UIImage imageNamed:_dataArray[0]];
    [self.autoScrollView addSubview:_currentImageV];
    
    self.rightImageV = [[UIImageView alloc] initWithFrame:CGRectMake(2 *self.Width, 0, self.Width, self.Height)];
    self.rightImageV.image = [UIImage imageNamed:_dataArray[1]];
    [self.autoScrollView addSubview:_rightImageV];
    
    [self.autoScrollView setContentOffset:CGPointMake(self.Width, 0) animated:NO];
}





/**
 三张图片实现无限循环滚动大概思路：
1. 初始化的时候，scrollView的contentOffset为一个屏宽：self.view.bounds.size.width
2. 中间的图片index为0，其初始化的tag也是0，左边的图片和右边的图片，其从数组中加载图片的index都是根据中间图片的tag计算而来
3. 右滑的时候，右边图片的index为中间图片的tag + 1 （要考虑临界值），当滚动的瞬间，给右边的图片赋值。当滚动停止（offsetX == self.Width * 2）时，改变中间图片的tag等于右边的图片的tag，然后给中间的图片赋值，同时设置scrollView的偏移量为一个屏幕的宽度
4. 左滑的时候，左边的图片的index为中间图片的tag - 1（要考虑临界值），当滚动的瞬间，给左边的图片赋值。当滚动停止（offsetX ==0）时，改变中间图片的tag等于左边的图片的tag，然后给中间的图片赋值，同时设置scrollView的偏移量为一个屏幕的宽度

 */
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    if (offsetX > self.Width) { //右滑
        self.rightImageV.tag = (_currentImageV.tag + 1) % _dataArray.count;
        self.rightImageV.image = [UIImage imageNamed:_dataArray[_rightImageV.tag]];

        if (offsetX == self.Width * 2) {
            self.currentImageV.tag = _rightImageV.tag;
            self.currentImageV.image = [UIImage imageNamed:_dataArray[_currentImageV.tag]];
            [self.autoScrollView setContentOffset:CGPointMake(self.Width, 0) animated:NO];

        }
    }else if (offsetX < self.Width)
    {
        
        self.leftImageV.tag = (_currentImageV.tag - 1 + _dataArray.count) % _dataArray.count;
        self.leftImageV.image = [UIImage imageNamed:_dataArray[_leftImageV.tag]];
        
        if (offsetX == 0) {
            self.currentImageV.tag = _leftImageV.tag;
            self.currentImageV.image = [UIImage imageNamed:_dataArray[self.currentImageV.tag]];
            [self.autoScrollView setContentOffset:CGPointMake(self.Width, 0) animated:NO];
        }
        
    }

    
}











@end
