//
//  CGXFixedTopGeneralMenuView.h
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/8/8.
//  Copyright © 2018年 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXFixedTopGeneralTitleView.h"

@protocol CGXFixedTopGeneralMenuViewDelegate;

@interface CGXFixedTopGeneralMenuView : UIView

@property(nonatomic,weak) id <CGXFixedTopGeneralMenuViewDelegate>delegate;

- (void)updateMenuWithTitleAry:(NSMutableArray<CGXFixedTopGeneralTitleItem *> *)titleAry VcAry:(NSMutableArray<UIViewController *> *)vcAry;

- (void)updateMenuWithTitleAry:(NSMutableArray<CGXFixedTopGeneralTitleItem *> *)titleAry VcAry:(NSMutableArray<UIViewController *> *)vcAry Manager:(CGXFixedTopGeneralTitleManager *)manager;

//更新角标
- (void)updateBadgeTitleWithBadge:(NSInteger)badge Inter:(NSInteger)inter;
//更新标题文字
- (void)updateWithBtnWithTitle:(NSString *)title Inter:(NSInteger)inter;
- (void)updateWithBtnWithAttributedString:(NSAttributedString *)attributed SelAttributedString:(NSAttributedString *)selAttributed Inter:(NSInteger)inter;
@end



#pragma mark-------------------TabDelegate-----------------------------
@protocol CGXFixedTopGeneralMenuViewDelegate <NSObject>

/*点击事件*/
- (void)selectIndexCGXFixedTopGeneralMenuView:(CGXFixedTopGeneralMenuView *)baseView didSelectIndex:(NSInteger)index;

/*滚动事件*/
- (void)scrollerIndexCGXFixedTopGeneralMenuView:(CGXFixedTopGeneralMenuView *)baseView didSelectIndex:(NSInteger)index;
@end
