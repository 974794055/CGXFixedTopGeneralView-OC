//
//  CGXFixedTopGeneralTitleManager.h
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
////不规则的布局   默认都是垂直方向有效
////横向热门品牌菜单 默认水平方向有效
//typedef NS_ENUM(NSInteger, CGXCollectionViewGeneralManagerDirectionStyle) {
//    CGXCollectionViewGeneralManagerDirectionStyleV,  //垂直方向
//    CGXCollectionViewGeneralManagerDirectionStyleH,  //水平方向
//};

@interface CGXFixedTopGeneralTitleManager : NSObject


/**
 展示方向
 **/
//@property (nonatomic ,assign) CGXCollectionViewGeneralManagerDirectionStyle directionStyle;


@property (nonatomic , strong) UIColor *collectionViewBGColor;//collectionview背景颜色
//标签高度 默认为50
@property (nonatomic , assign) CGFloat titleHeight;
//标签上下间距 默认为5
@property (nonatomic , assign) CGFloat titleSpace;
//当前点击
@property (nonatomic , assign) NSInteger currentSelected;
//是否防止多次点击 默认为YES
@property (nonatomic , assign) BOOL isClick;
//第一次点击
@property (nonatomic , assign) BOOL isFirst;
//是否有按钮点击false、还是cell点击true。触发事件 默认为false
@property (nonatomic , assign) BOOL isUserBtn;

//是否有下划线
@property (nonatomic , assign) BOOL isBottomLine;
// 滑块高度
@property (nonatomic , assign) CGFloat lineBottomHeight;
// 下划线颜色
@property (nonatomic , strong) UIColor *lineBottomColor;

//是否有下划线
@property (nonatomic , assign) BOOL isTopLine;
// 滑块高度
@property (nonatomic , assign) CGFloat lineTopHeight;
// 下划线颜色
@property (nonatomic , strong) UIColor *lineTopColor;

//是否有滑块
@property (nonatomic , assign) BOOL isSlider;
// 是否下划线等分  默认和字体宽度相同
@property (nonatomic , assign) BOOL isSliderEqual;
// 滑块颜色
@property (nonatomic , strong) UIColor *sliderColor;
/// 滑块高度
@property (nonatomic , assign) CGFloat sliderHeight;
// 滑块宽度的比例。占按钮宽度的比例 0 ～ 1。 默认为0时，宽度为文字的长度
@property (nonatomic , assign) CGFloat sliderWidthScale;




@end
