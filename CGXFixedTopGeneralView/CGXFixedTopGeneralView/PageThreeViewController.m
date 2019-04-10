//
//  PageThreeViewController.m
//  CGXFixedTopGeneralView
//
//  Created by 曹贵鑫 on 2018/9/15.
//  Copyright © 2018年 曹贵鑫. All rights reserved.
//

#import "PageThreeViewController.h"

@interface PageThreeViewController ()

@end

@implementation PageThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     NSLog(@"PageThreeViewController：%ld",self.inter);
    UILabel *ll = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [self.view addSubview:ll];
    ll.text = [NSString stringWithFormat:@"%ld",self.inter];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
