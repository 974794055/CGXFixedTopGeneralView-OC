//
//  CGXFixedTopGeneralTitleView.h
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/8/8.
//  git下载链接：https://github.com/974794055/CGXFixedTopGeneralView-OC.git
//  Copyright © 2018年 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CGXFixedTopGeneralTitleManager.h"
#import "CGXFixedTopGeneralTitleItem.h"

@protocol CGXFixedTopGeneralTitleViewDelegate;

@interface CGXFixedTopGeneralTitleView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>




@property(nonatomic,weak) id <CGXFixedTopGeneralTitleViewDelegate>delegate;
//更新数据源 配置

- (void)updateWithTitleArray:(NSMutableArray<CGXFixedTopGeneralTitleItem *> *)titleArray Manager:(CGXFixedTopGeneralTitleManager *)manager;
- (void)updateWithTitleArray:(NSMutableArray<CGXFixedTopGeneralTitleItem *> *)titleArray;

//外界调用 默认选中
- (void)selectCurrentInterCGXFixedTopGeneralTitleViewWithInter:(NSInteger)inter;

//更新角标
- (void)updateBadgeTitleWithBadge:(NSInteger)badge Inter:(NSInteger)inter;
@end

#pragma mark-------------------TabDelegate-----------------------------
@protocol CGXFixedTopGeneralTitleViewDelegate <NSObject>

/*点击事件*/
- (void)selectIndexCGXFixedTopGeneralTitleView:(CGXFixedTopGeneralTitleView *)baseView didSelectIndex:(NSInteger)index;


@end

