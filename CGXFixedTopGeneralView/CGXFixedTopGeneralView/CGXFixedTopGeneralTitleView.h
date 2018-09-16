//
//  CGXFixedTopGeneralTitleView.h
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CGXFixedTopGeneralTitleManager.h"
#import "CGXFixedTopGeneralTitleItem.h"

@protocol CGXFixedTopGeneralTitleViewDelegate;

@interface CGXFixedTopGeneralTitleView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>




@property(nonatomic,weak) id <CGXFixedTopGeneralTitleViewDelegate>delegate;

- (void)updateWithTitleArray:(NSMutableArray *)titleArray Manager:(CGXFixedTopGeneralTitleManager *)manager;

- (void)updateWithTitleArray:(NSMutableArray *)titleArray;

//外界调用 默认选中
- (void)selectCurrentInterCGXFixedTopGeneralTitleViewWithInter:(NSInteger)inter;
@end

#pragma mark-------------------TabDelegate-----------------------------
@protocol CGXFixedTopGeneralTitleViewDelegate <NSObject>

/*点击事件*/
- (void)selectIndexCGXFixedTopGeneralTitleView:(CGXFixedTopGeneralTitleView *)baseView didSelectIndex:(NSInteger)index;


@end

