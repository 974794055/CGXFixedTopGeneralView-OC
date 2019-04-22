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
- (NSAttributedString *)titleNormalAttributed
{
    if (!_titleNormalAttributed) {
        _titleNormalAttributed = [[NSAttributedString alloc] initWithString:@""];
    }
    return _titleNormalAttributed;
}
- (NSAttributedString *)titleSelectAttributed
{
    if (!_titleSelectAttributed) {
        _titleSelectAttributed = [[NSAttributedString alloc] initWithString:@""];
    }
    return _titleSelectAttributed;
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
        _badgeX = -25;
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
- (CGFloat)badgePage
{
    if (!_badgePage) {
        _badgePage = 999;
    }
    return _badgePage;
}
- (CGFloat)titleMaxScale
{
    if (!_titleMaxScale) {
        _titleMaxScale = 1.0;
    }
    return _titleMaxScale;
}
- (UIColor *)badgeBGColor
{
    if (!_badgeBGColor) {
        _badgeBGColor = [UIColor redColor];
    }
    return _badgeBGColor;
}
- (UIColor *)badgeTitleColor
{
    if (!_badgeTitleColor) {
        _badgeTitleColor = [UIColor whiteColor];
    }
    return _badgeTitleColor;
}
- (UIFont *)badgeFont
{
    if (!_badgeFont) {
        _badgeFont = [UIFont systemFontOfSize:12];
    }
    return _badgeFont;
}
- (CGXFixedTopGeneralTitleItemFlexMode)badgeFlexMode
{
    if (!_badgeFlexMode) {
        _badgeFlexMode = CGXFixedTopGeneralTitleItemFlexModeTail;
    }
    return _badgeFlexMode;
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
