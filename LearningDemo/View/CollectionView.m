//
//  CollectionView.m
//  LearningDemo
//
//  Created by 张中阳 on 2016/10/23.
//  Copyright © 2016年 ZHANGZHONGYANG. All rights reserved.
//

#import "CollectionView.h"
#import "EnlargeFlowLayout.h"

@interface CollectionView ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *myLayout;
@property (nonatomic, strong) EnlargeFlowLayout *enlargeFlowLayout;
@property (nonatomic, assign) BOOL isSquare;  //是否是方格布局
@end

static NSString *cellIdentifier = @"cellIdentifier";
static NSString *headerIdentifier = @"headerIdenfier";
@implementation CollectionView

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"切换" style:UIBarButtonItemStylePlain target:self action:@selector(changeAction)];
    
    _myLayout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width;
    _myLayout.itemSize = CGSizeMake(itemWidth, 50);
    // 行之间的最小间距
    _myLayout.minimumLineSpacing = 10;
    
    // header参考大小，先要继承UICollectionReusableView,创建一个区头类
    _myLayout.headerReferenceSize = CGSizeMake(100, 70);
    
    // section的inset，用于设置与上、左、底、右的间隔
    _myLayout.sectionInset = UIEdgeInsetsMake(10, 0, 20, 0);
    
    // 9.0以后才有的属性，用于设置header/footer与tableview的section效果一样。
    // 可以悬停
    _myLayout.sectionHeadersPinToVisibleBounds = YES;
    
    _isSquare = NO;
    
    
    _enlargeFlowLayout = [[EnlargeFlowLayout alloc] init];
    [_enlargeFlowLayout layoutAttributesForElementsInRect:CGRectMake(10, 10, 50, 50)];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:_enlargeFlowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    
    [self.view addSubview:self.collectionView];
    
}

#pragma mark - Action
- (void)changeAction
{
    _isSquare = !_isSquare;
    if (_isSquare) {
        CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width / 2 - 10;
        _myLayout.itemSize = CGSizeMake(itemWidth, 50);
        _myLayout.minimumInteritemSpacing = 10;
        
        [self.collectionView reloadData];
    }else
    {
        CGFloat itemWidth = [UIScreen mainScreen].bounds.size.width;
        _myLayout.itemSize = CGSizeMake(itemWidth, 50);
        [self.collectionView reloadData];
    }
}

#pragma mark - UICollectionView dataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

#pragma mark - UICollectionView delegate





@end
