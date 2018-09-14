//
//  ViewController.m
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/8/18.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "ViewController.h"
#import "CGXFixedTopGeneralMenuView.h"
@interface ViewController ()
{
    CGXFixedTopGeneralMenuView *menuView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    menuView = [[CGXFixedTopGeneralMenuView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 50)];;
    menuView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:menuView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
