//
//  CGXFixedTopGeneralTitleCell.m
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXFixedTopGeneralTitleCell.h"
#import "UIButton+CGXFixedTopGeneralTitleAndImage.h"
@implementation CGXFixedTopGeneralTitleCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:self.titleBtn];
        self.titleBtn.titleLabel.numberOfLines = 0;
        self.titleBtn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        self.titleBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        //  图片大于或小于显示区域
        self.titleBtn.layer.masksToBounds = YES;//内容超出控件将不进行显示
        self.titleBtn.imageView.clipsToBounds  = YES;
        [self.titleBtn setContentMode:UIViewContentModeScaleAspectFill];
        self.titleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        //        self.titleBtn.imageView.contentMode = UIViewContentModeCenter;
        //        self.titleBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.titleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.titleBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
         [self.titleBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected | UIControlStateHighlighted];
     
        self.titleBtn.frame =CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self.titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
      
    }
    return self;
}

- (void)titleBtnClick:(UIButton *)sender
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectBtnWithCell:TitleBtn:)]) {
        [self.delegate selectBtnWithCell:self TitleBtn:sender];
    }
}

- (void)updateTitleBtn:(CGXFixedTopGeneralTitleItem *)item
{
    self.titleBtn.userInteractionEnabled = item.adjustsImageWhenDisabled;
    NSString *title = item.title;
    
    [self.titleBtn setTitle:@"" forState:UIControlStateNormal];
    [self.titleBtn setAttributedTitle:[[NSAttributedString alloc] initWithString:@""]  forState:UIControlStateNormal];
    [self.titleBtn setTitle:@"" forState:UIControlStateSelected];
    [self.titleBtn setAttributedTitle:[[NSAttributedString alloc] initWithString:@""]  forState:UIControlStateSelected];
    self.titleBtn.adjustsImageWhenDisabled = item.adjustsImageWhenDisabled;
    if ([title length] > 0) {
        [self.titleBtn setTitle:title forState:UIControlStateNormal];
        [self.titleBtn setTitle:title forState:UIControlStateSelected];
        [self.titleBtn setTitleColor:item.titleNormalColor forState:UIControlStateNormal];
        [self.titleBtn setTitleColor:item.titleSelectColor forState:UIControlStateSelected];
        if (item.buttonMode != CGXFixedTopGeneralTitleItemDone) {
            [self showCellImageModel:item];
        }
    } else {
        NSAttributedString *titleNormalAttributed = item.titleNormalAttributed;
        NSAttributedString *titleSelectAttributed = item.titleSelectAttributed;
        [self.titleBtn setAttributedTitle:titleNormalAttributed forState:UIControlStateNormal];
        if ([titleSelectAttributed length] == 0) {
            [self.titleBtn setAttributedTitle:titleNormalAttributed forState:UIControlStateSelected];
        }else{
            [self.titleBtn setAttributedTitle:titleSelectAttributed forState:UIControlStateSelected];
        }
        if (item.buttonMode != CGXFixedTopGeneralTitleItemDone) {
            [self showCellImageModel:item];
        }
    }
    [self.titleBtn pp_setBadgeLabelAttributes:^(CGXFixedTopBadgeLabel *badgeLabel) {
        badgeLabel.p_width = 100 ;
        badgeLabel.p_right = 0;
    }];
    if (item.badge > 0) {
        
        [self.titleBtn pp_setBadgeLabelAttributes:^(CGXFixedTopBadgeLabel *badgeLabel) {
            badgeLabel.textColor = item.badgeTitleColor ;
            badgeLabel.font = item.badgeFont;
            badgeLabel.backgroundColor = item.badgeBGColor;
        }];
        
        
        if (item.badge <item.badgePage) {
            [self.titleBtn pp_addBadgeWithText:[NSString stringWithFormat:@"%ld",item.badge]];
        }else{
            [self.titleBtn pp_addBadgeWithText:@"999+"];
        }
      [self.titleBtn pp_moveBadgeWithX:item.badgeX Y:item.badgeY];
        [self.titleBtn pp_showBadge];
        
        switch (item.badgeFlexMode) {
            case CGXFixedTopGeneralTitleItemFlexModeHead:
                [self.titleBtn pp_setBadgeFlexMode:CGXFixedTopBadgeLabelFlexModeHead];
                break;
            case CGXFixedTopGeneralTitleItemFlexModeTail:
                [self.titleBtn pp_setBadgeFlexMode:CGXFixedTopBadgeLabelFlexModeTail];
                break;
            case CGXFixedTopGeneralTitleItemFlexModeMiddle:
                [self.titleBtn pp_setBadgeFlexMode:CGXFixedTopBadgeLabelFlexModeMiddle];
                break;
            default:
                break;
        }
    } else{
        [self.titleBtn pp_hiddenBadge];
    }
    
    
    
    CGFloat scale = item.isSelect == YES ? item.titleMaxScale : 1.0;
    self.titleBtn.titleLabel.transform = CGAffineTransformMakeScale(scale, scale);
    
    
    self.titleBtn.selected = item.isSelect;
}

- (void)showCellImageModel:(CGXFixedTopGeneralTitleItem *)item
{
    NSString *normalImage = item.normalImage;
    NSString * selectImage = item.selectImage;
    if ([normalImage length] > 0){
        [self.titleBtn setImage:[UIImage imageNamed:item.normalImage] forState:UIControlStateNormal];
        if ([selectImage length]> 0){
            [self.titleBtn setImage:[UIImage imageNamed:item.selectImage] forState:UIControlStateSelected];
        } else{
            [self.titleBtn setImage:[UIImage imageNamed:item.normalImage] forState:UIControlStateSelected];
        }
        self.titleBtn.imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        
      
        [self updateInfoButtonModeWithMode:item.buttonMode Space:item.space];
        
    }
}
- (void)updateInfoButtonModeWithMode:(CGXFixedTopGeneralTitleItemButtonMode)mode Space:(CGFloat)space
{
    if (mode == CGXFixedTopGeneralTitleItemDone) {
        
    } else if (mode == CGXFixedTopGeneralTitleItemTop) {
        [self.titleBtn btn_locationAdjustCGXFixedTopTitleAndImage:Top spacing:space];
    } else if (mode == CGXFixedTopGeneralTitleItemBottom) {
         [self.titleBtn btn_locationAdjustCGXFixedTopTitleAndImage:Bottom spacing:space];
    } else if (mode == CGXFixedTopGeneralTitleItemLeft) {
         [self.titleBtn btn_locationAdjustCGXFixedTopTitleAndImage:Left spacing:space];
    } else if (mode == CGXFixedTopGeneralTitleItemRight) {
        [self.titleBtn btn_locationAdjustCGXFixedTopTitleAndImage:Right spacing:space];
    }
}
@end
