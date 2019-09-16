//
//  CGXFixedTopBadgeLabel.h
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/8/8.
//  git下载链接：https://github.com/974794055/CGXFixedTopGeneralView-OC.git
//  Copyright © 2018年 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CGXFixedTopBadgeLabelFlexMode) {
    CGXFixedTopBadgeLabelFlexModeHead,    // 左伸缩 Head Flex    : <==●
    CGXFixedTopBadgeLabelFlexModeTail,    // 右伸缩 Tail Flex    : ●==>
    CGXFixedTopBadgeLabelFlexModeMiddle   // 左右伸缩 Middle Flex : <=●=>
};
@interface CGXFixedTopBadgeLabel : UILabel

+ (instancetype)defaultBadgeLabel;
/** 记录Badge的偏移量 Record the offset of Badge */
@property (nonatomic, assign) CGPoint offset;

/** Badge伸缩的方向, Default is PPBadgeViewFlexModeTail */
@property (nonatomic, assign) CGXFixedTopBadgeLabelFlexMode flexMode;

@end
