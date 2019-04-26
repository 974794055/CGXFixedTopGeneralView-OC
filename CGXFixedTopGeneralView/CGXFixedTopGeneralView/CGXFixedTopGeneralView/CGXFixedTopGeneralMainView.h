//
//  CGXFixedTopGeneralMainView.h
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/15.
//  git下载链接：https://github.com/974794055/CGXFixedTopGeneralView-OC.git
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CGXFixedTopGeneralMainViewDelegate;
@interface CGXFixedTopGeneralMainView : UIView

@property(nonatomic,weak) id <CGXFixedTopGeneralMainViewDelegate>delegate;

- (void)loadMainVC:(NSMutableArray<UIViewController *> *)vcAry;

//选中的下标。
- (void)selectCurrentInterCGXFixedTopGeneralMainViewWithInter:(NSInteger)inter;

@end

@protocol CGXFixedTopGeneralMainViewDelegate <NSObject>

- (void)selectIndexCGXFixedTopGeneralMainView:(CGXFixedTopGeneralMainView *)baseView Inter:(NSInteger )inter;

@end
