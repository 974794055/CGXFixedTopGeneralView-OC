//
//  UIView+CGXFixedTopBadge.h
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/8/8.
//  git下载链接：https://github.com/974794055/CGXFixedTopGeneralView-OC.git
//  Copyright © 2018年 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CGXFixedTopBadgeLabel;
typedef NS_ENUM(NSUInteger, CGXFixedTopBadgeLabelFlexMode);
#pragma mark - Protocol

@protocol CGXFixedTopBadge <NSObject>

@required
/**
 添加带文本内容的Badge, 默认右上角, 红色, 18pts
 
 Add Badge with text content, the default upper right corner, red backgroundColor, 18pts
 */
- (void)gx_addBadgeWithText:(NSString *)text;

/**
 添加带数字的Badge, 默认右上角,红色,18pts
 
 Add the Badge with numbers, the default upper right corner, red backgroundColor, 18pts
 */
- (void)gx_addBadgeWithNumber:(NSInteger)number;

/**
 设置Badge的高度,因为Badge宽度是动态可变的,通过改变Badge高度,其宽度也按比例变化,方便布局
 
 (注意: 此方法需要将Badge添加到控件上后再调用!!!)
 
 Set the height of Badge, because the Badge width is dynamically and  variable.
 By changing the Badge height in proportion to facilitate the layout.
 
 (Note: this method needs to add Badge to the controls and then use it !!!)
 
 @param height 高度大小
 */
- (void)gx_setBadgeHeight:(CGFloat)height;

/**
 设置Badge的偏移量, Badge中心点默认为其父视图的右上角
 
 Set Badge offset, Badge center point defaults to the top right corner of its parent view
 
 @param x X轴偏移量 (x<0: 左移, x>0: 右移) axis offset (x <0: left, x> 0: right)
 @param y Y轴偏移量 (y<0: 上移, y>0: 下移) axis offset ( Y <0: up, y> 0: down)
 */
- (void)gx_moveBadgeWithX:(CGFloat)x Y:(CGFloat)y;

/**
 设置Badge伸缩的方向
 
 Setting the direction of Badge expansion
 
 PPBadgeViewFlexModeHead,    左伸缩 Head Flex    : <==●
 PPBadgeViewFlexModeTail,    右伸缩 Tail Flex    : ●==>
 PPBadgeViewFlexModeMiddle   左右伸缩 Middle Flex : <=●=>
 
 @param flexMode : Default is PPBadgeViewFlexModeTail
 */
- (void)gx_setBadgeFlexMode:(CGXFixedTopBadgeLabelFlexMode)flexMode;

/**
 设置Bage的属性
 
 Set properties for Badge
 */
- (void)gx_setBadgeLabelAttributes:(void(^)(CGXFixedTopBadgeLabel *badgeLabel))attributes;

/// 显示Badge
- (void)gx_showBadge;

/// 隐藏Badge
- (void)gx_hiddenBadge;


@end

#pragma mark - Category

@interface UIView (CGXFixedTopBadge) <CGXFixedTopBadge>

@end

@interface UIView (Frame)
@property (nonatomic, assign) CGFloat p_x;
@property (nonatomic, assign) CGFloat p_y;
@property (nonatomic, assign) CGFloat p_right;
@property (nonatomic, assign) CGFloat p_bottom;
@property (nonatomic, assign) CGFloat p_width;
@property (nonatomic, assign) CGFloat p_height;
@property (nonatomic, assign) CGFloat p_centerX;
@property (nonatomic, assign) CGFloat p_centerY;
@end

