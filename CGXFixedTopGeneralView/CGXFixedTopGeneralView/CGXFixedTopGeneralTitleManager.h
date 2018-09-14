//
//  CGXFixedTopGeneralTitleManager.h
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//不规则的布局   默认都是垂直方向有效
//横向热门品牌菜单 默认水平方向有效
typedef NS_ENUM(NSInteger, CGXCollectionViewGeneralManagerDirectionStyle) {
    CGXCollectionViewGeneralManagerDirectionStyleV,  //垂直方向
    CGXCollectionViewGeneralManagerDirectionStyleH,  //水平方向
};

@interface CGXFixedTopGeneralTitleManager : NSObject


/**
 展示方向
 **/
@property (nonatomic ,assign) CGXCollectionViewGeneralManagerDirectionStyle directionStyle;


/*
 默认不自适应高度
 */
@property (nonatomic , assign) BOOL isAdaptive;// 默认NO
@property (nonatomic , assign) BOOL isSingle;//是否是单分区。默认是YES
@property (nonatomic , strong) NSMutableArray *registerCellArray;// 注册cell数组，默认为空


@property (nonatomic , strong) UIColor *collectionViewBGColor;//collectionview背景颜色
@property (nonatomic , assign) BOOL showsVerticalScrollIndicator;//暂时水平 默认NO
@property (nonatomic , assign) BOOL showsHorizontalScrollIndicator;//暂时垂直 默认NO
@property (nonatomic, assign)  BOOL sectionHeadersPinToVisibleBounds;//悬停  default NO
@property (nonatomic, assign)  BOOL sectionFootersPinToVisibleBounds;//悬停  default NO
@property (nonatomic , assign) CGFloat headerReferenceSizeH;//头分区高度
@property (nonatomic , assign) CGFloat footerReferenceSizeH;//脚分区高度
@property (nonatomic , copy) UIColor *headerReferenceBg;//头分区背景
@property (nonatomic , copy) UIColor *footerReferenceBg;//脚分区背景

@property (nonatomic , assign) NSInteger minimumLineSpacing;//默认是10
@property (nonatomic , assign) NSInteger minimumInteritemSpacing;//默认是10
@property (nonatomic) UIEdgeInsets insets;//默认是10

@property (nonatomic , assign) NSInteger row;//默认每行两个
@property (nonatomic , assign) CGFloat rowHeight;//默认每行两个

@end
