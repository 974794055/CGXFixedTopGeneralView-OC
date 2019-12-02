//
//  CGXFixedTopGeneralTitleManager.m
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/8/8.
//  Copyright © 2018年 CGX. All rights reserved.
//

#import "CGXFixedTopGeneralTitleManager.h"

@implementation CGXFixedTopGeneralTitleManager


- (instancetype)init
{
    self = [super init];
    if (self) {
        _collectionViewBGColor = [UIColor whiteColor];
        _titleHeight = 60;
        _titleSpace = 10;
        _currentSelected = 0;
        _isClick = YES;
        _isFirst = YES;
        _isUserBtn = NO;
        _isTopLine = NO;
         _isBottomLine = YES;
        _lineBottomHeight = 1.5;
        _lineBottomColor = [UIColor colorWithWhite:0.93 alpha:1];
        
        _isTopLine = NO;
        _lineTopHeight = 1;
        _lineTopColor = [UIColor colorWithWhite:0.93 alpha:1];
        
        _isSlider = YES;
        _isSliderEqual = NO;
        
        _sliderColor = [UIColor redColor];
        _sliderHeight = 3;
        _sliderWidthScale = 0;
     
        
    }
    return self;
}



@end
