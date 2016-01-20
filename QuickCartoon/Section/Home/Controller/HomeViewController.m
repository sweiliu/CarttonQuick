//
//  HomeViewController.m
//  Quick Cartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "HomeViewController.h"
#import "RecommendViewController.h"
#import "AttentionViewController.h"
#import "NavigationItemTitleVc.h"

@interface HomeViewController()<UIScrollViewDelegate,NavigationItemTitleVcDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NavigationItemTitleVc *naVc;

@end

@implementation HomeViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    [self addViews];
}

- (void) addViews {

    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, W_SIZE, H_SIZE)];
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(2*W_SIZE, 0);
    _scrollView.pagingEnabled = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.bounces = NO;
    
    [self.view addSubview:_scrollView];
    
    AttentionViewController *attentionViewController = [[AttentionViewController alloc]init];
    [self addChildViewController:attentionViewController];
    [_scrollView addSubview:attentionViewController.view];
    attentionViewController.view.frame = CGRectMake(0, 0, W_SIZE, H_SIZE);
    
    RecommendViewController *recommendViewController = [[RecommendViewController alloc]init];
    [self addChildViewController:recommendViewController];
    [_scrollView addSubview:recommendViewController.view];
    recommendViewController.view.frame = CGRectMake(W_SIZE, 0, W_SIZE, H_SIZE);
    
    _naVc = [[NavigationItemTitleVc alloc]init];
    _naVc.view.frame = CGRectMake(0, 0, 100, 40);

    _naVc.pViewController = self;
    _naVc.delegate = self;
    
    self.navigationItem.titleView = _naVc.view;

    
    UIImageView *searchButton = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    searchButton.image = [UIImage imageNamed:@"ic_search_searchbar_search"];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchButton];
    
    
    [self initData];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    NSInteger num = scrollView.contentOffset.x/W_SIZE;
    
    [_naVc changeButtonFrame:num];
    
}


#pragma mark - NavigationItemTitleVcDelegate
- (void)changeScrollView:(NSInteger)num {

    [_scrollView setContentOffset:CGPointMake(num*W_SIZE, 0) animated:YES];
}

- (void) initData {

    
}

@end
