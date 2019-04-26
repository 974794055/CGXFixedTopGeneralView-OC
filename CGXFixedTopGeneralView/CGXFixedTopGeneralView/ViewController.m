//
//  ViewController.m
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/8/8.
//  git下载链接：https://github.com/974794055/CGXFixedTopGeneralView-OC.git
//  Copyright © 2018年 CGX. All rights reserved.
//

#import "ViewController.h"
#import "CGXFixedTopGeneralMenuView.h"
#import "PagtViewController.h"
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
    
     self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    menuView = [[CGXFixedTopGeneralMenuView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64-49)];;
    menuView.delegate = self;
    menuView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:menuView];
    
    NSArray *titleArr = @[@"全部",@"代支付",@"已发货",@"已取消",@"已完成"];
    NSArray * nomArr = @[@"me_setting_store",@"me_setting_store",@"me_setting_store",@"me_setting_store",@"ic_tabbar_explore"];
    NSArray * selectArr = @[@"me_setting_union",@"me_setting_union",@"me_setting_union",@"me_setting_union",@"ic_tabbar_explore"];
   
    vcArr = [NSMutableArray array];
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<titleArr.count; i++) {
        PagtViewController *vc =[PagtViewController new];
        vc.view.backgroundColor = randomColor;
        vc.inter = i;
        [vcArr addObject:vc];
        
        CGXFixedTopGeneralTitleItem *item = [CGXFixedTopGeneralTitleItem new];
        item.normalImage = nomArr[i];
        item.selectImage = selectArr[i];
        item.space = 10;
        item.badge = arc4random() % 30;
        
        if (i == 4) {
            item.titleNormalAttributed = [self stringStr:@"发货" LineSpacing:3 Textcolor:[UIColor blackColor] TextFont:[UIFont systemFontOfSize:14]];
            item.titleSelectAttributed = [self stringStr:@"收获" LineSpacing:3 Textcolor:[UIColor redColor] TextFont:[UIFont systemFontOfSize:14]];
        } else{
            item.title = titleArr[i];
        }
        item.adjustsImageWhenDisabled = YES;
        item.buttonMode = CGXFixedTopGeneralTitleItemTop;
        [array addObject:item];
    }
    [menuView updateMenuWithTitleAry:array VcAry:vcArr];
}

- (NSAttributedString *)stringStr:(NSString *)str LineSpacing:(CGFloat)lineSpacing Textcolor:(UIColor *)textcolor TextFont:(UIFont *)textFont
{
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
    
    PagtViewController *vc = vcArr[index];
    vc.inter = index;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
