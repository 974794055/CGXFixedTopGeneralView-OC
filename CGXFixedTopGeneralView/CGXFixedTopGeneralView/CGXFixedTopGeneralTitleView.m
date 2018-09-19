//
//  CGXFixedTopGeneralTitleView.m
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXFixedTopGeneralTitleView.h"
#import "CGXFixedTopGeneralTitleCell.h"
@interface CGXFixedTopGeneralTitleView()<CGXFixedTopGeneralTitleCellDelegate>

@property (nonatomic , strong) CGXFixedTopGeneralTitleManager *manager;
@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) NSMutableArray *titleArray;

@property (nonatomic , strong) UIView *topLineView;
@property (nonatomic , strong) UIView *bottomLineView;

@property (nonatomic , strong) UIView *sliderView;
@end
@implementation CGXFixedTopGeneralTitleView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (UIView *)topLineView
{
    if (!_topLineView) {
        _topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), self.manager.lineTopHeight)];
        [self addSubview:_topLineView];
    }
    return _topLineView;
}
- (UIView *)sliderView
{
    if (!_sliderView) {
        _sliderView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds)-self.manager.sliderHeight, CGRectGetWidth(self.bounds), self.manager.sliderHeight)];
        _sliderView.backgroundColor = self.manager.sliderColor;
        [self addSubview:_sliderView];
    }
    return _sliderView;
}
- (UIView *)bottomLineView
{
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds)-self.manager.lineBottomHeight, CGRectGetWidth(self.bounds), self.manager.lineBottomHeight)];
        [self addSubview:_bottomLineView];
    }
    return _bottomLineView;
}
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout*flowLayout= [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        CGFloat yy = 0;
        CGFloat hSpace = 0;
        if (self.manager.isTopLine) {
            yy = self.manager.lineTopHeight;
        }
        if (self.manager.isBottomLine) {
            if (self.manager.isTopLine) {
                hSpace = self.manager.lineBottomHeight+self.manager.lineTopHeight;
            }else{
                hSpace = self.manager.lineBottomHeight;
            }
        }
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, yy, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)-hSpace) collectionViewLayout:flowLayout];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator= NO;
        _collectionView.backgroundColor = self.manager.collectionViewBGColor;
        [_collectionView registerClass:[CGXFixedTopGeneralTitleCell class] forCellWithReuseIdentifier:@"CGXFixedTopGeneralTitleCell"];
        [self addSubview:_collectionView];
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _collectionView;
}

- (void)setManager:(CGXFixedTopGeneralTitleManager *)manager
{
    _manager = manager;
}

- (void)updateWithTitleArray:(NSMutableArray *)titleArray Manager:(CGXFixedTopGeneralTitleManager *)manager
{
    self.manager = manager;
    [self updateWithTitleArray:titleArray];
}

- (void)updateWithTitleArray:(NSMutableArray *)titleArray
{
    self.titleArray = titleArray;
    [self updateM];
}
- (void)updateM
{
    if (self.manager.isTopLine) {
        self.topLineView.backgroundColor = self.manager.lineTopColor;
    }
    if (self.manager.isBottomLine) {
        self.bottomLineView.backgroundColor = self.manager.lineBottomColor;
    }
    [self.collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:self.manager.currentSelected inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionNone];
    
    [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:self.manager.currentSelected inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    [self updatesliderView];
    [self selectCurrentInterCGXFixedTopGeneralTitleView:[NSIndexPath indexPathForRow:self.manager.currentSelected inSection:0]];
    [self.collectionView reloadData];
    
}
- (void)updatesliderView
{
    if (self.manager.isSlider) {
        
        CGFloat btnWidth = CGRectGetWidth(self.bounds) / self.titleArray.count;
        CGFloat sliderW = btnWidth;
        CGFloat sliderH = self.manager.sliderHeight;
        CGFloat sliderX = btnWidth * (self.manager.currentSelected);
        CGFloat sliderY = CGRectGetHeight(self.bounds) - self.manager.sliderHeight;
        
        if (self.manager.isSliderEqual) {
            if (!self.manager.isFirst) {
                [UIView animateWithDuration:0.25 animations:^{
                    self.sliderView.frame = CGRectMake(sliderX, sliderY, sliderW, sliderH);
                }];
            } else{
                self.sliderView.frame = CGRectMake(sliderX, sliderY, sliderW, sliderH);
            }
        } else{
            if (self.manager.sliderWidthScale == 0) {
                CGXFixedTopGeneralTitleItem *model = self.titleArray[self.manager.currentSelected];
                sliderW = [self getSliderWidthModel:model];
                sliderX = sliderX + (btnWidth-sliderW)/2;
            } else{
                sliderW = btnWidth * self.manager.sliderWidthScale;
                sliderX = sliderX + (btnWidth * (1-self.manager.sliderWidthScale))/2;
            }
            if (!self.manager.isFirst) {
                
                [UIView animateWithDuration:0.25 animations:^{
                    self.sliderView.frame = CGRectMake(sliderX, sliderY, sliderW, sliderH);
                }];
                
            } else{
                self.sliderView.frame = CGRectMake(sliderX, sliderY, sliderW, sliderH);
            }
        }
    }
}
- (CGFloat)getSliderWidthModel:(CGXFixedTopGeneralTitleItem *)model
{
    CGSize infoSize = CGSizeMake(CGRectGetWidth(self.bounds)/self.titleArray.count, CGRectGetHeight(self.collectionView.frame));
    if ([model.title length] > 0) {
        NSString *text = model.title;
        NSDictionary *dic = @{NSFontAttributeName : [UIFont systemFontOfSize:17.f ]};
        //默认的
        CGSize strSize = [text boundingRectWithSize:infoSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
        return  ceil(strSize.width) + 1;
    }else{
        NSAttributedString *text = model.titleNormalAttributed;
        CGSize strSize = [text boundingRectWithSize:infoSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
        return  ceil(strSize.width) + 1;
    }
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
- (NSMutableArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [NSMutableArray array];
    }
    return _titleArray;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame) / self.titleArray.count,CGRectGetHeight(self.collectionView.frame)-self.manager.titleSpace);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXFixedTopGeneralTitleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CGXFixedTopGeneralTitleCell" forIndexPath:indexPath];
    
    cell.titleBtn.userInteractionEnabled = self.manager.isUserBtn;
    cell.delegate = self;
    
    CGXFixedTopGeneralTitleItem *item = self.titleArray[indexPath.row];
    [cell updateTitleBtn:item];
    return cell;
    
}
#pragma mark - cell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGXFixedTopGeneralTitleItem *item = self.titleArray[indexPath.row];
    
    if (!item.adjustsImageWhenDisabled) {
        [self selectCurrentInterCGXFixedTopGeneralTitleView:indexPath];
    }
}
- (void)selectBtnWithCell:(CGXFixedTopGeneralTitleCell *)cell TitleBtn:(UIButton *)titleBtn
{
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    
    [self selectCurrentInterCGXFixedTopGeneralTitleView:indexPath];
}
//外界调用 默认选中
- (void)selectCurrentInterCGXFixedTopGeneralTitleViewWithInter:(NSInteger)inter
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:inter inSection:0];
     [self selectCurrentInterCGXFixedTopGeneralTitleView:indexPath];
}
- (void)selectCurrentInterCGXFixedTopGeneralTitleView:(NSIndexPath *)indexPath
{
    if (self.manager.isClick) {
        if (!self.manager.isFirst) {
            if (self.manager.currentSelected == indexPath.row) {
                return;
            }
        }
    }
    self.manager.isFirst = NO;
    self.manager.currentSelected = indexPath.row;
    for (int i = 0; i<self.titleArray.count; i++) {
        CGXFixedTopGeneralTitleItem *item = self.titleArray[i];
        if (i == indexPath.row) {
            item.isSelect = YES;
        } else{
            item.isSelect = NO;
        }
    }
    [self updatesliderView];
    [self.collectionView reloadData];
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectIndexCGXFixedTopGeneralTitleView:didSelectIndex:)]) {
        [self.delegate selectIndexCGXFixedTopGeneralTitleView:self  didSelectIndex:indexPath.row];
    }
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
