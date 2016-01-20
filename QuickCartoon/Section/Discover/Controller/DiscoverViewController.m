//
//  DiscoverViewController.m
//  Quick Cartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "DiscoverViewController.h"
#import "DiscoverCell.h"
#import "DiscoverModel.h"
#import "NWDiscover.h"


@interface DiscoverViewController()<UIScrollViewDelegate,UITableViewDataSource,UITableViewDelegate>
{

    NSMutableArray *_tableViewDataArr;
    
    NSMutableArray *_scrollViewDataArr;
    
    NSString *_path;
}

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self addViews];
}

#pragma mark - UITableDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DiscoverCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[DiscoverCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell upDataWithModel:_tableViewDataArr[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 250.f;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return _tableViewDataArr.count;
}

//设置数据

- (void)addViews {

    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, W_SIZE, H_SIZE) style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.showsVerticalScrollIndicator = NO;

    
    [self.view addSubview:_tableView];
    [self tableViewGetData];
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, W_SIZE, 225)];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;

    
    [self scrollViewGetData];
    
    
    _tableView.tableHeaderView = _scrollView;
}

- (void)scrollViewGetData {

    
    _scrollViewDataArr = [NSMutableArray array];
    [_scrollViewDataArr removeAllObjects];
    
    NSString *scrollViewPath = @"/v1/banners";
    
    NWDiscover *scrollView = [[NWDiscover alloc]init];
    [scrollView setCompletion:^(NSArray *arr, BOOL succ) {
        
        if (succ) {
            
            [_scrollViewDataArr addObjectsFromArray:arr];
            [_tableView reloadData];
            
            [self scrollVIewGetImages];
        }
        else {
        
            NSLog(@"滚动视图请求网络shibai");
        }
    }];
    
    [scrollView startRequestWithPath:scrollViewPath andSetTheTyble:2];
    
}

- (void)scrollVIewGetImages {

    CGFloat x  = 0;
    NSInteger index = 0;
        for (ScrollViewModel *model in _scrollViewDataArr) {
            UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(x, 0, W_SIZE, 225)];
            [image sd_setImageWithURL:model.pic];
            [_scrollView addSubview:image];
            x = ++index*W_SIZE;
        }

    
    _scrollView.contentSize = CGSizeMake(W_SIZE*_scrollViewDataArr.count, 0);
}

- (void)tableViewGetData {

    
    _tableViewDataArr = [NSMutableArray array];
    [_tableViewDataArr removeAllObjects];
    
    _path = nil;
    _path = @"/v1/topic_lists/mixed";
    
    NWDiscover *discover = [[NWDiscover alloc] init];
    
    [discover setCompletion:^(NSArray *arr, BOOL succ) {
        
        if (succ) {
            
            [_tableViewDataArr addObjectsFromArray:arr];
            
            [_tableView reloadData];
        }
        else {
            NSLog(@"失败");
        }
    }];
    
    [discover startRequestWithPath:_path andSetTheTyble:1];
    
}
@end
