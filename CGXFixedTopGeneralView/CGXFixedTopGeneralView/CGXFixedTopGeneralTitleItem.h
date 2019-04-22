//
//  CGXFixedTopGeneralTitleItem.h
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CGXFixedTopGeneralTitleItemButtonMode) {
    CGXFixedTopGeneralTitleItemDone,
    CGXFixedTopGeneralTitleItemTop,
    CGXFixedTopGeneralTitleItemBottom,
    CGXFixedTopGeneralTitleItemLeft,
    CGXFixedTopGeneralTitleItemRight
};


typedef NS_ENUM(NSUInteger, CGXFixedTopGeneralTitleItemFlexMode) {
    CGXFixedTopGeneralTitleItemFlexModeHead,    // 左伸缩 Head Flex    : <==●
    CGXFixedTopGeneralTitleItemFlexModeTail,    // 右伸缩 Tail Flex    : ●==>
    CGXFixedTopGeneralTitleItemFlexModeMiddle   // 左右伸缩 Middle Flex : <=●=>
};

@interface CGXFixedTopGeneralTitleItem : NSObject


//标题文字 富文本 默认
@property (nonatomic , strong) NSAttributedString *titleNormalAttributed;
//标题文字 富文本 选中
@property (nonatomic , strong) NSAttributedString *titleSelectAttributed;


//标题文字
@property (nonatomic , strong) NSString *title;


//标题文字默认大小
@property (nonatomic , strong) UIFont *titleNormalFont;


//标题文字默认大小
@property (nonatomic , strong) UIColor *titleNormalColor;

//标题文字选中大小
@property (nonatomic , strong) UIColor *titleSelectColor;

//标题文字 默认图片
@property (nonatomic , strong) NSString *normalImage;

//标题文字 选中图片   可不传
@property (nonatomic , strong) NSString *selectImage;

@property (nonatomic , assign) BOOL isSelect;

//默认为0 不显示
@property (nonatomic , assign) NSInteger badge;
@property (nonatomic , assign) CGFloat badgeX;
@property (nonatomic , assign) CGFloat badgeY;
//角标最大显示999
@property (nonatomic , assign) CGFloat badgePage;
//默认红色
@property (nonatomic , strong) UIColor *badgeTitleColor;
//默认红色
@property (nonatomic , strong) UIFont *badgeFont;
//默认红色
@property (nonatomic , strong) UIColor *badgeBGColor;
//角标方向
@property (nonatomic , assign) CGXFixedTopGeneralTitleItemFlexMode badgeFlexMode;
//图文间距
@property (nonatomic , assign) CGFloat space;

//字体方法。默认 1.0
@property (nonatomic , assign) CGFloat titleMaxScale;

//按钮默认点击动画效果
@property (nonatomic , assign) BOOL adjustsImageWhenDisabled;


@property (nonatomic , assign) CGXFixedTopGeneralTitleItemButtonMode buttonMode;


@end
