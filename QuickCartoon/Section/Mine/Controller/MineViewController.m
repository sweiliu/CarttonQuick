//
//  MineViewController.m
//  Quick Cartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "MineViewController.h"

@interface MineViewController()<UITableViewDataSource, UITableViewDelegate> {

    NSDictionary *_dic;
    NSArray *_dataArr;
    MineModel *_model;
}

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation MineViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self initData];
    [self addViews];
    
}


#pragma mark - UITableDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MineCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[MineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    NSDictionary *dic = _dataArr[indexPath.section][indexPath.row];
    MineModel *model = [[MineModel alloc]initWithDictionary:dic error:nil];
    [cell upDataWithModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 15.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {


    return 1.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 45.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    NSArray *arr = _dataArr[section];
    return arr.count;
}


- (void)initData {

    _dataArr = [NSArray array];
    _dic = [NSDictionary dictionary];
    
    _dataArr = @[@[@{@"img":@"ic_me_item_message",@"title":@"我的消息"}],
                 @[@{@"img":@"ic_me_item_follow",@"title":@"我的关注"},
                   @{@"img":@"ic_me_item_collection",@"title":@"我的收藏"}],
                 @[@{@"img":@"ic_me_item_setup",@"title":@"设置"}]];

    _dic = @{@"img":@"ic_personal_headportrait",@"title":@"登录"};
}


- (void)addViews {

    UIView *heardView = [[UIView alloc ]initWithFrame:CGRectMake(0, 0, W_SIZE, 200)];
    CustomButtonVc *button = [[CustomButtonVc alloc]init];
    [button upDataWithDic:_dic];
    button.view.frame = CGRectMake(150, 70, 80, 120);
    
    [heardView addSubview:button.view];
    heardView.backgroundColor = [UIColor yellowColor];
    
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.tableHeaderView = heardView;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}

@end
