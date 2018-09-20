//
//  ViewController.m
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/8/18.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "ViewController.h"
#import "CGXFixedTopGeneralMenuView.h"
#import "PagtViewController.h"
#import "PageTwoViewController.h"
#import "PageThreeViewController.h"
#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]


#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

@interface ViewController ()<CGXFixedTopGeneralMenuViewDelegate>
{
    CGXFixedTopGeneralMenuView *menuView;
    CGXFixedTopGeneralTitleManager *manager;
    NSMutableArray *vcArr;
    NSInteger page;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    page = 10;
    
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    menuView = [[CGXFixedTopGeneralMenuView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height-88-83)];;
    menuView.delegate = self;
    menuView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:menuView];
    
    
    NSArray *titleArr = @[@"全部",@"代支付",@"已发货",@"已取消",@"已完成"];
    NSArray * nomArr = @[@"me_setting_store",@"me_setting_store",@"me_setting_store",@"me_setting_store",@"ic_tabbar_explore"];
    NSArray * selectArr = @[@"me_setting_union",@"me_setting_union",@"me_setting_union",@"me_setting_union",@"ic_tabbar_explore"];
   
    vcArr = [NSMutableArray array];

    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<titleArr.count; i++) {
        
        
        if (i == 0) {
            PagtViewController *vc =[PagtViewController new];
            vc.view.backgroundColor = randomColor;
            vc.inter = i;
            vc.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-49);
            [vcArr addObject:vc];
        } else if (i == 1){
            PageTwoViewController *vc =[PageTwoViewController new];
            vc.view.backgroundColor = randomColor;
            vc.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-49);
            vc.inter = i;
            [vcArr addObject:vc];
        } else{
            PageThreeViewController *vc =[PageThreeViewController new];
            vc.view.backgroundColor = randomColor;
            vc.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-49);
            vc.inter = i;
            [vcArr addObject:vc];
        }
        
        CGXFixedTopGeneralTitleItem *item = [CGXFixedTopGeneralTitleItem new];
        item.title = titleArr[i];
        item.normalImage = nomArr[i];
        item.selectImage = selectArr[i];
        item.space = 10;
        if (i == 0) {
            item.badge = 3000000;
        }
        if (i == 2) {
            item.badge = 13;
        }
        
                   if (i == 4) {
                       item.title = @"";
                       item.titleNormalAttributed = [self stringStr:@"发货" LineSpacing:3 Textcolor:[UIColor blackColor] TextFont:[UIFont systemFontOfSize:14]];
                        item.titleSelectAttributed = [self stringStr:@"收获" LineSpacing:3 Textcolor:[UIColor redColor] TextFont:[UIFont systemFontOfSize:14]];
                   }else{
                       
                   }
        item.adjustsImageWhenDisabled = YES;
        item.buttonMode = CGXFixedTopGeneralTitleItemTop;
        [array addObject:item];
    }
      [menuView updateMenuWithTitleAry:array VcAry:vcArr];
}

- (NSAttributedString *)stringStr:(NSString *)str LineSpacing:(CGFloat)lineSpacing Textcolor:(UIColor *)textcolor TextFont:(UIFont *)textFont
{
    // 设置段落
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    NSDictionary *attributedDict = @{ NSFontAttributeName:textFont,
                                      NSForegroundColorAttributeName:textcolor
                                      };
    
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:str attributes:nil];
    
    [attriStr setAttributes:attributedDict range:NSMakeRange(0, str.length)];
    
    return attriStr;
}

- (void)selectIndexCGXFixedTopGeneralMenuView:(CGXFixedTopGeneralMenuView *)baseView didSelectIndex:(NSInteger)index
{
    NSLog(@"选择了：%ld",index);
    
    page++;
    [menuView updateBadgeTitleWithBadge:page Inter:index];
    if (index == 0) {
        PagtViewController *vc =vcArr[index];

        vc.inter = index;
      
    } else if (index == 1){
        PageTwoViewController *vc =vcArr[index];
      
        vc.inter = index;
     
    } else{
        PageThreeViewController *vc =vcArr[index];
        vc.inter = index;
    }
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
