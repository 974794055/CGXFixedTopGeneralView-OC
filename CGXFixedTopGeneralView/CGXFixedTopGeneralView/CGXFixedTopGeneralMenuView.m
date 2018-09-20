//
//  CGXFixedTopGeneralMenuView.m
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXFixedTopGeneralMenuView.h"

#import "CGXFixedTopGeneralMainView.h"
@interface CGXFixedTopGeneralMenuView()<CGXFixedTopGeneralMainViewDelegate,CGXFixedTopGeneralTitleViewDelegate>

@property (nonatomic , strong) CGXFixedTopGeneralTitleView *titleView;
@property (nonatomic , strong) CGXFixedTopGeneralMainView *mainView;
@property (nonatomic , strong) CGXFixedTopGeneralTitleManager *manager;
@end

@implementation CGXFixedTopGeneralMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
    }
    return self;
}
- (CGXFixedTopGeneralTitleView *)titleView
{
    if (!_titleView) {
        _titleView = [[CGXFixedTopGeneralTitleView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), self.manager.titleHeight)];
        _titleView.delegate = self;
        [self addSubview:_titleView];
    }
    return _titleView;
}
- (CGXFixedTopGeneralMainView *)mainView
{
    if (!_mainView) {
        _mainView = [[CGXFixedTopGeneralMainView alloc] initWithFrame:CGRectMake(0, self.manager.titleHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)-self.manager.titleHeight)];;
        _mainView.delegate = self;
        [self addSubview:_mainView];
    }
    return _mainView;
}
- (CGXFixedTopGeneralTitleManager *)manager
{
    if (!_manager) {
        _manager= [CGXFixedTopGeneralTitleManager new];
    }
    return _manager;
}

- (void)updateMenuWithTitleAry:(NSMutableArray<CGXFixedTopGeneralTitleItem *> *)titleAry VcAry:(NSMutableArray *)vcAry
{
    [self.titleView updateWithTitleArray:titleAry Manager:self.manager];
    [self.mainView loadMainVC:vcAry];
}
- (void)updateMenuWithTitleAry:(NSMutableArray<CGXFixedTopGeneralTitleItem *> *)titleAry VcAry:(NSMutableArray *)vcAry Manager:(CGXFixedTopGeneralTitleManager *)manager
{
    [self.titleView updateWithTitleArray:titleAry Manager:manager];
    [self.mainView loadMainVC:vcAry];
}

//更新角标
- (void)updateBadgeTitleWithBadge:(NSInteger)badge Inter:(NSInteger)inter
{
    [self.titleView updateBadgeTitleWithBadge:badge Inter:inter];
}
- (void)selectIndexCGXFixedTopGeneralTitleView:(CGXFixedTopGeneralTitleView *)baseView didSelectIndex:(NSInteger)index
{
     [self.mainView selectCurrentInterCGXFixedTopGeneralMainViewWithInter:index];
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectIndexCGXFixedTopGeneralMenuView:didSelectIndex:)]) {
        [self.delegate selectIndexCGXFixedTopGeneralMenuView:self didSelectIndex:index];
    }
   
}
- (void)selectIndexCGXFixedTopGeneralMainView:(CGXFixedTopGeneralMainView *)baseView Inter:(NSInteger)inter
{
    [self.titleView selectCurrentInterCGXFixedTopGeneralTitleViewWithInter:inter];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
