//
//  CGXFixedTopGeneralTitleView.m
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXFixedTopGeneralTitleView.h"

@implementation CGXFixedTopGeneralTitleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UICollectionViewFlowLayout*flowLayout= [[UICollectionViewFlowLayout alloc] init];
            flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:flowLayout];
        self.collectionView.delegate=self;
        self.collectionView.dataSource=self;
        self.collectionView.showsVerticalScrollIndicator = YES;
        self.collectionView.showsHorizontalScrollIndicator=YES;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        [self.collectionView registerClass:[CGXFixedTopGeneralTitleCell class] forCellWithReuseIdentifier:@"CGXFixedTopGeneralTitleCell"];
        [self addSubview:self.collectionView];
        if (@available(iOS 11.0, *)) {
            self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return self;
}


- (CGXFixedTopGeneralTitleManager *)manager
{
    if (!_manager) {
        _manager = [[CGXFixedTopGeneralTitleManager alloc] init];
    }
    return _manager;
}


#pragma mark UICollectionView Delegate

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
#pragma mark - 返回每个分区的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return 5;
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100,30);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXFixedTopGeneralTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CGXFixedTopGeneralTitleCell" forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithWhite:0.6 alpha:1];
    return cell;
    
}
#pragma mark - cell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
