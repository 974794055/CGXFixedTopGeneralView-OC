//
//  CGXFixedTopGeneralTitleManager.m
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXFixedTopGeneralTitleManager.h"

@implementation CGXFixedTopGeneralTitleManager


- (instancetype)init
{
    self = [super init];
    if (self) {
        _directionStyle =  CGXCollectionViewGeneralManagerDirectionStyleV;
        _insets =UIEdgeInsetsMake(10, 10, 10, 10);
        _minimumLineSpacing = 10;
        _minimumInteritemSpacing = 10;
        _collectionViewBGColor = [UIColor colorWithWhite:0.93 alpha:1];
        _showsVerticalScrollIndicator = NO;
        _showsHorizontalScrollIndicator = NO;
        _sectionFootersPinToVisibleBounds = NO;
        _sectionHeadersPinToVisibleBounds = NO;
        _headerReferenceSizeH = 0;
        _footerReferenceSizeH = 10;
        _headerReferenceBg =[UIColor colorWithWhite:0.93 alpha:1];
        _footerReferenceBg  =[UIColor colorWithWhite:0.93 alpha:1];
        _row = 2;
        _rowHeight = 150;
        
        
        _registerCellArray = [NSMutableArray array];
    }
    return self;
}


- (BOOL)isSingle
{
    if (!_isSingle) {
        _isSingle  =YES;
    }
    return _isSingle;
}
- (BOOL)isAdaptive
{
    if (!_isAdaptive) {
        _isAdaptive = NO;
    }
    return _isAdaptive;
}

@end
