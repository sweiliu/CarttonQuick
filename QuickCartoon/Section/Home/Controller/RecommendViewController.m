//
//  RecommendViewController.m
//  QuickCartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "RecommendViewController.h"
#import "HomeModel.h"
#import "RecommndCell.h"
#import "NWRecommend.h"
@interface RecommendViewController()<UITableViewDataSource,UITableViewDelegate> {

    NSMutableArray *_dataArr;
    
    NSString *_path;
    
    NSInteger num;
}

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation RecommendViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self addViews];
}

#pragma mark - UITableDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RecommndCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[RecommndCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    [cell updateWithModel:_dataArr[indexPath.section]];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10.f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 300;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _dataArr.count;
}


- (void)addViews {

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, W_SIZE, H_SIZE) style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_tableView];
    
    _dataArr = [NSMutableArray array];
    [self initData];
    
}

- (void)initData {
    
    _path = nil;
    num = 0;
    
    _path = [NSString stringWithFormat:@"/v1/comic_lists/1?offset=%lu&limit=20",num];
    
    NWRecommend *recommnd = [[NWRecommend alloc] init];
    
    [recommnd setCompletion:^(NSArray *arr, BOOL succ) {
        if (succ) {
            [_dataArr addObjectsFromArray:arr];
            
            [_tableView reloadData];
        }
        else {
        
            NSLog(@"失败");
        }
    }];
    
    [recommnd startRequestWithPath:_path];
}

@end
