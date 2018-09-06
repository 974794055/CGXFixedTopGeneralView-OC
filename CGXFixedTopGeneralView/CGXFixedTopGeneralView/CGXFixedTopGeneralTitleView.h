//
//  CGXFixedTopGeneralTitleView.h
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/3.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CGXFixedTopGeneralTitleCell.h"
#import "CGXFixedTopGeneralTitleManager.h"
@interface CGXFixedTopGeneralTitleView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic , strong) UICollectionView *collectionView;
@property (nonatomic , strong) NSMutableArray *dataArray;
@property (nonatomic , strong) CGXFixedTopGeneralTitleManager *manager;
@end
