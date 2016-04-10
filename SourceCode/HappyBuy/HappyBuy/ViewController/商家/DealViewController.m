//
//  DealViewController.m
//  HappyBuy
//
//  Created by jiyingxin on 16/4/4.
//  Copyright © 2016年 tedu. All rights reserved.
//

#import "DealViewController.h"
#import "BusinessCell.h"
#import "DealViewModel.h"

@interface DealViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cityBarItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) DealViewModel *dealVM;
@end

@implementation DealViewController

#pragma mark - 方法

- (void)cityChanged:(NSNotification *)noti{
    self.cityBarItem.title = kCurrentCity;
}

#pragma mark - 代理UITableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BusinessCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DealCell" forIndexPath:indexPath];
    return cell;
}


#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.cityBarItem.title = kCurrentCity;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cityChanged:) name:kCurrentCityChangedNotification object:nil];
    [self.tableView registerNib:[UINib nibWithNibName:@"BusinessCell" bundle:nil] forCellReuseIdentifier:@"DealCell"];
    [self.tableView addHeaderRefresh:^{
        [self.dealVM getDealWithCategory:@"美食" sort:1 region:@"" requestMode:RequestModeRefresh completionHandler:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView endHeaderRefresh];
        }];
    }];
    [self.tableView addBackFooterRefresh:^{
        [self.dealVM getDealWithCategory:@"美食" sort:1 region:@"" requestMode:RequestModeMore completionHandler:^(NSError *error) {
            [self.tableView reloadData];
            [self.tableView endFooterRefresh];
        }];
    }];
    [self.tableView beginHeaderRefresh];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark - 懒加载

- (DealViewModel *)dealVM {
    if(_dealVM == nil) {
        _dealVM = [[DealViewModel alloc] init];
    }
    return _dealVM;
}

@end
