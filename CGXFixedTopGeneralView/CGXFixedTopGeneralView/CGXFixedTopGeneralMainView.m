//
//  CGXFixedTopGeneralMainView.m
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/15.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXFixedTopGeneralMainView.h"
@interface CGXFixedTopGeneralMainView()<UIScrollViewDelegate>

@property (nonatomic , strong) UIScrollView *mainScrollView;
@property (nonatomic , strong) NSMutableArray<UIViewController *> *vcArray;

@end


@implementation CGXFixedTopGeneralMainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.vcArray = [NSMutableArray array];
    }
    return self;
}
- (void)loadMainVC:(NSMutableArray<UIViewController *> *)vcAry
{
        self.vcArray = vcAry;
    [self configMenuMainView];

    [self configSubview];
}
- (void)configMenuMainView
{
    self.mainScrollView = [UIScrollView new];
    self.mainScrollView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    self.mainScrollView.showsVerticalScrollIndicator = NO;
    self.mainScrollView.showsHorizontalScrollIndicator = NO;
    self.mainScrollView.bounces  = NO;
    self.mainScrollView.pagingEnabled = YES;
    self.mainScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds),  CGRectGetHeight(self.bounds));
    self.mainScrollView.delegate = self;
    //滚动矩形区域到可见的区域，如果完全可见就不做任何操作
    [self.mainScrollView scrollRectToVisible:CGRectMake(0, 0, self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height) animated:YES];
    [self addSubview:self.mainScrollView];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
        if (scrollView == self.mainScrollView){
            NSInteger inter = scrollView.contentOffset.x / CGRectGetWidth(self.bounds);
            if (self.delegate && [self.delegate respondsToSelector:@selector(selectIndexCGXFixedTopGeneralMainView:Inter:)]){
                [self.delegate selectIndexCGXFixedTopGeneralMainView:self Inter:inter];
            }
        }
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
        NSInteger inter = scrollView.contentOffset.x / CGRectGetWidth(self.bounds);
        if (self.delegate && [self.delegate respondsToSelector:@selector(selectIndexCGXFixedTopGeneralMainView:Inter:)]){
            [self.delegate selectIndexCGXFixedTopGeneralMainView:self Inter:inter];
        }
}
- (void)configSubview
{
    for (int i = 0; i<self.vcArray.count; i++) {
        
       UIViewController *vc = self.vcArray[i];
        vc.view.frame = CGRectMake(i*CGRectGetWidth(self.bounds), 0, self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height);
        [[self viewController:self] addChildViewController:vc];
        [self.mainScrollView addSubview:vc.view];
    }
    self.mainScrollView.contentSize =  CGSizeMake(self.mainScrollView.frame.size.width * self.vcArray.count,  self.mainScrollView.frame.size.height);
}
- (UIViewController*)viewController:(UIView *)view {
    for (UIView* next = [view superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UINavigationController class]] || [nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)selectCurrentInterCGXFixedTopGeneralMainViewWithInter:(NSInteger)inter
{
    [self.mainScrollView scrollRectToVisible:CGRectMake(self.mainScrollView.frame.size.width*inter, 0, self.mainScrollView.frame.size.width, self.mainScrollView.frame.size.height) animated:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
