//
//  PPBadgeLabel.h
//  PPBadgeViewObjc
//
//  Created by AndyPang on 2017/6/17.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CGXFixedTopBadgeLabel : UILabel

+ (instancetype)defaultBadgeLabel;
/** 记录Badge的偏移量 Record the offset of Badge */
@property (nonatomic, assign) CGPoint offset;
@end
