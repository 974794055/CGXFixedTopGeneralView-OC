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


//图文间距
@property (nonatomic , assign) CGFloat space;

//按钮默认点击动画效果
@property (nonatomic , assign) BOOL adjustsImageWhenDisabled;


@property (nonatomic , assign) CGXFixedTopGeneralTitleItemButtonMode buttonMode;


@end
