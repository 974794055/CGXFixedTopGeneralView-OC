//
//  CGXFixedTopGeneralMenuView.h
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXFixedTopGeneralTitleView.h"

@protocol CGXFixedTopGeneralMenuViewDelegate;

@interface CGXFixedTopGeneralMenuView : UIView

@property(nonatomic,weak) id <CGXFixedTopGeneralMenuViewDelegate>delegate;

- (void)updateMenuWithTitleAry:(NSMutableArray *)titleAry VcAry:(NSMutableArray *)vcAry;

- (void)updateMenuWithTitleAry:(NSMutableArray *)titleAry VcAry:(NSMutableArray *)vcAry Manager:(CGXFixedTopGeneralTitleManager *)manager;

//更新角标
- (void)updateBadgeTitleWithBadge:(NSInteger)badge Inter:(NSInteger)inter;
@end



#pragma mark-------------------TabDelegate-----------------------------
@protocol CGXFixedTopGeneralMenuViewDelegate <NSObject>

/*点击事件*/
- (void)selectIndexCGXFixedTopGeneralMenuView:(CGXFixedTopGeneralMenuView *)baseView didSelectIndex:(NSInteger)index;


@end
