//
//  CGXFixedTopGeneralTitleCell.h
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXFixedTopGeneralTitleItem.h"
#import "UIView+CGXFixedTopBadge.h"
#import "CGXFixedTopBadgeLabel.h"

@protocol CGXFixedTopGeneralTitleCellDelegate;

@interface CGXFixedTopGeneralTitleCell : UICollectionViewCell

@property (nonatomic , strong) UIButton *titleBtn;


@property(nonatomic,weak) id <CGXFixedTopGeneralTitleCellDelegate>delegate;

- (void)updateTitleBtn:(CGXFixedTopGeneralTitleItem *)item;

@end



#pragma mark-------------------TabDelegate-----------------------------
@protocol CGXFixedTopGeneralTitleCellDelegate <NSObject>


- (void)selectBtnWithCell:(CGXFixedTopGeneralTitleCell *)cell TitleBtn:(UIButton *)titleBtn;

@end
