//
//  CGXFixedTopGeneralTitleCell.h
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/8/8.
//  git下载链接：https://github.com/974794055/CGXFixedTopGeneralView-OC.git
//  Copyright © 2018年 CGX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXFixedTopGeneralTitleItem.h"
#import "UIView+CGXFixedTopBadge.h"
#import "CGXFixedTopBadgeLabel.h"
#import "UIButton+CGXFixedTopGeneralTitleAndImage.h"

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
