//
//  CGXFixedTopGeneralTitleView.h
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/8/8.
//  Copyright © 2018年 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CGXFixedTopGeneralTitleManager.h"
#import "CGXFixedTopGeneralTitleItem.h"

@class CGXFixedTopGeneralTitleView;

@protocol CGXFixedTopGeneralTitleViewDelegate;

#pragma mark-------------------TabDelegate-----------------------------
@protocol CGXFixedTopGeneralTitleViewDelegate <NSObject>

@optional

/*点击事件*/
- (void)selectIndexCGXFixedTopGeneralTitleView:(CGXFixedTopGeneralTitleView *)baseView didSelectIndex:(NSInteger)index;

/*点击事件*/
- (void)scrollerIndexCGXFixedTopGeneralTitleView:(CGXFixedTopGeneralTitleView *)baseView didSelectIndex:(NSInteger)index;

@end

@interface CGXFixedTopGeneralTitleView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>




@property(nonatomic,weak) id <CGXFixedTopGeneralTitleViewDelegate>delegate;
//更新数据源 配置

- (void)updateWithTitleArray:(NSMutableArray<CGXFixedTopGeneralTitleItem *> *)titleArray Manager:(CGXFixedTopGeneralTitleManager *)manager;
- (void)updateWithTitleArray:(NSMutableArray<CGXFixedTopGeneralTitleItem *> *)titleArray;

//外界调用 默认选中
- (void)selectCurrentInterCGXFixedTopGeneralTitleViewWithInter:(NSInteger)inter;

//外界滚动 
- (void)scrollerCurrentInterCGXFixedTopGeneralTitleViewWithInter:(NSInteger)inter;

//更新角标
- (void)updateBadgeTitleWithBadge:(NSInteger)badge Inter:(NSInteger)inter;

//更新标题文字
- (void)updateWithBtnWithTitle:(NSString *)title Inter:(NSInteger)inter;
- (void)updateWithBtnWithAttributedString:(NSAttributedString *)attributed SelAttributedString:(NSAttributedString *)selAttributed Inter:(NSInteger)inter;

@end


