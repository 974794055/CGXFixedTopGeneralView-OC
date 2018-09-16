//
//  CGXFixedTopGeneralTitleItem.m
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXFixedTopGeneralTitleItem.h"

@implementation CGXFixedTopGeneralTitleItem
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

- (UIFont *)titleNormalFont
{
    if (!_titleNormalFont) {
        _titleNormalFont  =[UIFont systemFontOfSize:14];
    }
    return _titleNormalFont;
}
- (UIColor *)titleNormalColor
{
    if (!_titleNormalColor) {
        _titleNormalColor = [UIColor blackColor];
    }
    return _titleNormalColor;
}
- (UIColor *)titleSelectColor
{
    if (!_titleSelectColor) {
        _titleSelectColor  =[UIColor redColor];
    }
    return _titleSelectColor;
}

- (BOOL)isSelect
{
    if (!_isSelect) {
        _isSelect = NO;
    }
    return _isSelect;
}
- (NSInteger)badge
{
    if (!_badge) {
        _badge = 0;
    }
    return _badge;
}
- (CGFloat)badgeX
{
    if (!_badgeX) {
        _badgeX = -20;
    }
    return _badgeX;
}
- (CGFloat)badgeY
{
    if (!_badgeY) {
        _badgeY = 10;
    }
    return _badgeY;
}
- (CGFloat)space
{
    if (!_space) {
        _space = 5;
    }
    return _space;
}
- (BOOL)adjustsImageWhenDisabled
{
    if (!_adjustsImageWhenDisabled) {
        _adjustsImageWhenDisabled = NO;
    }
    return _adjustsImageWhenDisabled;
}
- (CGXFixedTopGeneralTitleItemButtonMode)buttonMode
{
    if (!_buttonMode) {
        _buttonMode = CGXFixedTopGeneralTitleItemDone;
    }
    return _buttonMode;
}
@end
