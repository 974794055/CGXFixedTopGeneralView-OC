//
//  UIButton+CGXFixedTopGeneralTitleAndImageMode.m
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/8/8.
//  git下载链接：https://github.com/974794055/CGXFixedTopGeneralView-OC.git
//  Copyright © 2018年 CGX. All rights reserved.
//

#import "UIButton+CGXFixedTopGeneralTitleAndImage.h"

@implementation UIButton (CGXFixedTopGeneralTitleAndImage)

/// 快速调整图片与文字位置
///
/// - Parameters:
///   - buttonMode: 图片所在位置
///   - spacing: 文字和图片之间的间距
- (void)btn_locationAdjustCGXFixedTopTitleAndImage:(CGXFixedTopGeneralTitleAndImageMode)buttonMode spacing:(CGFloat)spacing
{
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
        
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
        
    }
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (buttonMode) {
        case Top:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-spacing/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-spacing/2.0, 0);
            
        }
        break;
        case Left:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -spacing/2.0, 0, spacing/2.0); labelEdgeInsets = UIEdgeInsetsMake(0, spacing/2.0, 0, -spacing/2.0);
        }
        break;
        case Bottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-spacing/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-spacing/2.0, -imageWith, 0, 0);
            
        } break;
        case Right:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+spacing/2.0, 0, -labelWidth-spacing/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-spacing/2.0, 0, imageWith+spacing/2.0);
            
        } break;
        default: break;
    }
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;

  
}

@end
