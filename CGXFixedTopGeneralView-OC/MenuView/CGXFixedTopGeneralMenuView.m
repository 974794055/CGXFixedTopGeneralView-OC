//
//  CGXFixedTopGeneralMenuView.m
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/8/8.
//  Copyright © 2018年 CGX. All rights reserved.
//

#import "CGXFixedTopGeneralMenuView.h"

#import "CGXFixedTopGeneralMainView.h"
@interface CGXFixedTopGeneralMenuView()<CGXFixedTopGeneralMainViewDelegate,CGXFixedTopGeneralTitleViewDelegate>

@property (nonatomic , strong) CGXFixedTopGeneralTitleView *titleView;
@property (nonatomic , strong) CGXFixedTopGeneralMainView *mainView;
@property (nonatomic , strong) CGXFixedTopGeneralTitleManager *manager;
@end

@implementation CGXFixedTopGeneralMenuView

- (UIViewController*)viewController:(UIView *)view {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        [self viewController:self].edgesForExtendedLayout = UIRectEdgeNone;
        
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
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.titleView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), self.manager.titleHeight);
    self.mainView.frame = CGRectMake(0, self.manager.titleHeight, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)-self.manager.titleHeight);
}
- (CGXFixedTopGeneralTitleManager *)manager
{
    if (!_manager) {
        _manager= [CGXFixedTopGeneralTitleManager new];
    }
    return _manager;
}

- (void)updateMenuWithTitleAry:(NSMutableArray<CGXFixedTopGeneralTitleItem *> *)titleAry VcAry:(NSMutableArray<UIViewController *> *)vcAry
{
    [self.titleView updateWithTitleArray:titleAry Manager:self.manager];
    [self.mainView loadMainVC:vcAry];
}
- (void)updateMenuWithTitleAry:(NSMutableArray<CGXFixedTopGeneralTitleItem *> *)titleAry VcAry:(NSMutableArray<UIViewController *> *)vcAry Manager:(CGXFixedTopGeneralTitleManager *)manager
{
    [self.titleView updateWithTitleArray:titleAry Manager:manager];
    [self.mainView loadMainVC:vcAry];
}

//更新角标
- (void)updateBadgeTitleWithBadge:(NSInteger)badge Inter:(NSInteger)inter
{
    [self.titleView updateBadgeTitleWithBadge:badge Inter:inter];
}
//更新标题文字
- (void)updateWithBtnWithTitle:(NSString *)title Inter:(NSInteger)inter
{
    [self.titleView updateWithBtnWithTitle:title Inter:inter];
}
- (void)updateWithBtnWithAttributedString:(NSAttributedString *)attributed SelAttributedString:(NSAttributedString *)selAttributed Inter:(NSInteger)inter
{
    [self.titleView updateWithBtnWithAttributedString:attributed SelAttributedString:selAttributed Inter:inter];
}
- (void)selectIndexCGXFixedTopGeneralTitleView:(CGXFixedTopGeneralTitleView *)baseView didSelectIndex:(NSInteger)index
{
     [self.mainView selectCurrentInterCGXFixedTopGeneralMainViewWithInter:index];
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectIndexCGXFixedTopGeneralMenuView:didSelectIndex:)]) {
        [self.delegate selectIndexCGXFixedTopGeneralMenuView:self didSelectIndex:index];
    }
   
}
- (void)scrollerIndexCGXFixedTopGeneralTitleView:(CGXFixedTopGeneralTitleView *)baseView didSelectIndex:(NSInteger)index
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(scrollerIndexCGXFixedTopGeneralMenuView:didSelectIndex:)]) {
        [self.delegate scrollerIndexCGXFixedTopGeneralMenuView:self didSelectIndex:index];
    }
}
- (void)selectIndexCGXFixedTopGeneralMainView:(CGXFixedTopGeneralMainView *)baseView Inter:(NSInteger)inter
{
    [self.titleView scrollerCurrentInterCGXFixedTopGeneralTitleViewWithInter:inter];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
