//
//  PagtViewController.m
//  CGXFixedTopGeneralView
//
//  Created by CGX on 2018/9/15.
//  git下载链接：https://github.com/974794055/CGXFixedTopGeneralView-OC.git
//  Copyright © 2018年 CGX. All rights reserved.
//

#import "PagtViewController.h"
#import "CGXFixedTopGeneralTitleView.h"
@interface PagtViewController ()<UITableViewDelegate,UITableViewDataSource,CGXFixedTopGeneralTitleViewDelegate>
@property (nonatomic , strong) UITableView *tableView;
@end

@implementation PagtViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    CGXFixedTopGeneralTitleView  *titleView = [[CGXFixedTopGeneralTitleView alloc] init];
    titleView.delegate = self;
    titleView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:titleView];
    titleView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 60);
    CGXFixedTopGeneralTitleManager *manager = [[CGXFixedTopGeneralTitleManager alloc] init];
    manager.isSlider = YES;
    manager.sliderHeight = 3;
    NSArray *titleArr = @[@"全部",@"代支付",@"已发货",@"已取消",@"已完成"];
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<titleArr.count; i++) {
        
        CGXFixedTopGeneralTitleItem *item = [CGXFixedTopGeneralTitleItem new];
        
        item.space = 10;
        item.badge = arc4random() % 30;
        item.title = titleArr[i];
        item.adjustsImageWhenDisabled = YES;
        item.buttonMode = CGXFixedTopGeneralTitleItemTop;
        [array addObject:item];
    }
    [titleView updateWithTitleArray:array Manager:manager];
    
    //    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-[[UIApplication sharedApplication] statusBarFrame].size.height-44-([[UIApplication sharedApplication] statusBarFrame].size.height>20 ? (49.0f+34.0f) : 49.0f)-60) style:UITableViewStyleGrouped];
    //    self.tableView.delegate = self;
    //    self.tableView.dataSource = self;
    //    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    //    [self.view addSubview:self.tableView];
}
/*点击事件*/
- (void)selectIndexCGXFixedTopGeneralTitleView:(CGXFixedTopGeneralTitleView *)baseView didSelectIndex:(NSInteger)index
{
    
}

/*点击事件*/
- (void)scrollerIndexCGXFixedTopGeneralTitleView:(CGXFixedTopGeneralTitleView *)baseView didSelectIndex:(NSInteger)index
{
    
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"PagtViewController：%ld",(long)self.inter);
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.01)];
    
    return v;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.01)];
    
    return v;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld--%ld",self.inter,(long)indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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
