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
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    menuView = [[CGXFixedTopGeneralMenuView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64-49)];;
    menuView.delegate = self;
    menuView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:menuView];
    
    
    NSArray *titleArr = @[@"全部",@"代支付",@"已发货",@"已取消",@"已完成"];
    NSArray * nomArr = @[@"me_setting_store",@"me_setting_store",@"me_setting_store",@"me_setting_store",@"me_setting_store"];
    NSArray * selectArr = @[@"me_setting_union",@"me_setting_union",@"me_setting_union",@"me_setting_union",@"me_setting_union"];
   
     vcArr = [NSMutableArray array];
    for (int i = 0; i<5; i++) {
        if (i == 0) {
            PagtViewController *vc =[PagtViewController new];
            vc.view.backgroundColor = randomColor;
            vc.inter = i;
            [vcArr addObject:vc];
        } else if (i == 1){
            PageTwoViewController *vc =[PageTwoViewController new];
            vc.view.backgroundColor = randomColor;
            vc.inter = i;
            [vcArr addObject:vc];
        } else{
            PageThreeViewController *vc =[PageThreeViewController new];
            vc.view.backgroundColor = randomColor;
            vc.inter = i;
            [vcArr addObject:vc];
        }
        
    }
  
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<titleArr.count; i++) {
        CGXFixedTopGeneralTitleItem *item = [CGXFixedTopGeneralTitleItem new];
        item.title = titleArr[i];
        item.normalImage = nomArr[i];
        item.selectImage = selectArr[i];
        if (i == 0) {
            item.badge = 3;
        }
        if (i == 2) {
            item.badge = 13;
        }
        
//                   if (i == 4) {
//                       item.title = @"";
//                       item.titleNormalAttributed = [self stringStr:@"发货" LineSpacing:3 Textcolor:[UIColor blackColor] TextFont:[UIFont systemFontOfSize:14]];
//                        item.titleSelectAttributed = [self stringStr:@"收获" LineSpacing:3 Textcolor:[UIColor redColor] TextFont:[UIFont systemFontOfSize:14]];
//                    }
        item.adjustsImageWhenDisabled = YES;
        item.buttonMode = CGXFixedTopGeneralTitleItemTop;
        [array addObject:item];
    }
      [menuView updateMenuWithTitleAry:array VcAry:vcArr];
    
//
//    for index in 0..<titleArr.count {
//        let item = CGXFixedTopGeneralTitleItem.init()
//        //            if index == 0 {
//        //                item.titleNormalAttributed = self.string(Str: titleArr[index], lineSpeace: 3, textColor: UIColor.orange, textFont: UIFont.systemFont(ofSize: 14))!
//        //            }else{
//        item.title = titleArr[index]
//        //            }
//        item.normalImage = nomArr[index]
//        item.selectImage = selectArr[index]
//        item.buttonMode = .Top
//        //            if index == 0 {
//        //
//        //                item.isSelect = true
//        //            }
//        //            if index == 1 {
//        //                item.buttonMode = .Right
//        //            }
//        //                if index == 2 {
//        //                    item.buttonMode = .Left
//        //            }
//        //            if index == 3 {
//        //                item.buttonMode = .Bottom
//        //            }
//        array.add(item)
}

- (NSAttributedString *)stringStr:(NSString *)str LineSpacing:(CGFloat)lineSpacing Textcolor:(UIColor *)textcolor TextFont:(UIFont *)textFont
{
    // 设置段落
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    // NSKernAttributeName字体间距
//    NSDictionary *attributes = [NSAttributedStringKey.paragraphStyle: paragraphStyle, NSAttributedStringKey.kern: 1.0] as [NSAttributedStringKey : Any] as [NSAttributedStringKey : Any]
    NSMutableAttributedString *attriStr = [[NSMutableAttributedString alloc] initWithString:str attributes:nil];
    //设置字体
//    attriStr addAttribute:<#(nonnull NSAttributedStringKey)#> value:<#(nonnull id)#> range:<#(NSRange)#>
//    attriStr.addAttribute(NSAttributedStringKey.font, value: font, range: NSMakeRange(0,str.count))
//    //设置字体
//    attriStr.addAttribute(NSAttributedStringKey.font, value: UIFont.systemFont(ofSize: 12), range: NSMakeRange(0,1))
//    //设置字体颜色
//    attriStr.addAttribute(NSAttributedStringKey.foregroundColor, value: textcolor, range: NSMakeRange(0, str.count))
//    //设置文本背景颜色
//    attriStr.addAttribute(NSAttributedStringKey.backgroundColor, value: UIColor.orange, range: NSMakeRange(0, 1))
//    //设置背景颜色
//    if #available(iOS 10.0, *) {
//        attriStr.addAttribute(kCTBackgroundColorAttributeName as NSAttributedStringKey, value: UIColor.yellow, range: NSMakeRange(0, str.count))
//    } else {
//        // Fallback on earlier versions
//    }
    return attriStr;
}

- (void)selectIndexCGXFixedTopGeneralMenuView:(CGXFixedTopGeneralMenuView *)baseView didSelectIndex:(NSInteger)index
{
    NSLog(@"选择了：%ld",index);
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
