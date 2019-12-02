//
//  UIButton+CGXFixedTopGeneralTitleAndImageMode.h
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/8/8.
//  Copyright © 2018年 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, CGXFixedTopGeneralTitleAndImageMode) {
    Top,
    Bottom,
    Left, 
    Right
};
@interface UIButton (CGXFixedTopGeneralTitleAndImage)
/// 快速调整图片与文字位置
///
/// - Parameters:
///   - buttonMode: 图片所在位置
///   - spacing: 文字和图片之间的间距

- (void)btn_locationAdjustCGXFixedTopTitleAndImage:(CGXFixedTopGeneralTitleAndImageMode)buttonMode spacing:(CGFloat)spacing;
@end
