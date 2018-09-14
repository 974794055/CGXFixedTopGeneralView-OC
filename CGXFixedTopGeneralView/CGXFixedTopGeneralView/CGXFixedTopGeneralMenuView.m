//
//  CGXFixedTopGeneralMenuView.m
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "CGXFixedTopGeneralMenuView.h"

@interface CGXFixedTopGeneralMenuView()

@property (nonatomic , strong) CGXFixedTopGeneralTitleView *titleView;
@end

@implementation CGXFixedTopGeneralMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleView = [[CGXFixedTopGeneralTitleView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];;
        [self addSubview:self.titleView];
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
