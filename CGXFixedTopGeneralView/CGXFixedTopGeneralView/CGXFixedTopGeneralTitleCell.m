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
     
     
        self.titleBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        self.titleBtn.imageView.contentMode = UIViewContentModeCenter;
        self.titleBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
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
//        titleBtn.setTitleColor(UIColor.orange, for: [.highlighted, .selected])

        if (item.buttonMode == CGXFixedTopGeneralTitleItemDone) {

        } else {
        
            NSString * normalImage = item.normalImage;
            NSString * selectImage = item.selectImage;
            if ([normalImage length]> 0){
                [self.titleBtn setImage:[UIImage imageNamed:item.normalImage] forState:UIControlStateNormal];
      
               if ([selectImage length]> 0){
                    [self.titleBtn setImage:[UIImage imageNamed:item.selectImage] forState:UIControlStateSelected];
                } else{
                     [self.titleBtn setImage:[UIImage imageNamed:item.normalImage] forState:UIControlStateSelected];
                }
                [self updateInfoButtonModeWithMode:item.buttonMode Space:item.space];
            }
        }
    } else {
        NSAttributedString *titleNormalAttributed = item.titleNormalAttributed;
        NSAttributedString *titleSelectAttributed = item.titleSelectAttributed;
        if (item.buttonMode == CGXFixedTopGeneralTitleItemDone) {
            [self.titleBtn setAttributedTitle:titleNormalAttributed forState:UIControlStateNormal];
            if ([titleSelectAttributed length] == 0) {
                  [self.titleBtn setAttributedTitle:titleNormalAttributed forState:UIControlStateSelected];
            }else{
                  [self.titleBtn setAttributedTitle:titleSelectAttributed forState:UIControlStateSelected];
            }
        } else{
            [self.titleBtn setAttributedTitle:titleNormalAttributed forState:UIControlStateNormal];
            if ([titleSelectAttributed length] == 0) {
                [self.titleBtn setAttributedTitle:titleNormalAttributed forState:UIControlStateSelected];
            }else{
                [self.titleBtn setAttributedTitle:titleSelectAttributed forState:UIControlStateSelected];
            }
            NSString *normalImage = item.normalImage;
            NSString * selectImage = item.selectImage;
            if ([normalImage length] > 0){
                [self.titleBtn setImage:[UIImage imageNamed:item.normalImage] forState:UIControlStateNormal];
                
                if ([selectImage length]> 0){
                    [self.titleBtn setImage:[UIImage imageNamed:item.selectImage] forState:UIControlStateSelected];
                } else{
                    [self.titleBtn setImage:[UIImage imageNamed:item.normalImage] forState:UIControlStateSelected];
                }
                [self updateInfoButtonModeWithMode:item.buttonMode Space:item.space];
            }
        
        }
    }
    if (item.badge > 0) {
         [self.titleBtn pp_addBadgeWithText:[NSString stringWithFormat:@"%ld",item.badge]];
        [self.titleBtn pp_moveBadgeWithX:item.badgeX Y:item.badgeY];
        [self.titleBtn pp_showBadge];

    } else{
        [self.titleBtn pp_hiddenBadge];
    }
    self.titleBtn.selected = item.isSelect;
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
