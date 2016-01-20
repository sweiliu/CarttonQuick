//
//  NavigationItemTitleVc.m
//  QuickCartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "NavigationItemTitleVc.h"
@interface NavigationItemTitleVc()<UIScrollViewDelegate>

@property (nonatomic,strong) UIView *linkView;

@end
@implementation NavigationItemTitleVc

- (instancetype)init {

    if (self = [super init]) {
        
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
        [self.view addSubview:scrollView];
        
        NSArray *ar = @[@"关注",@"推荐"];
        CGFloat x = 0;
        for (NSInteger index = 1; index <3; index++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(x, 5, 35, 20);
            [button setTitle:ar[index-1] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.font = [UIFont boldSystemFontOfSize:16];
            [scrollView addSubview:button];
            button.tag = 10+index;
            x = 50*index;
        }
        
        _linkView = [[UIView alloc]init];
        _linkView.backgroundColor = [UIColor grayColor];
        _linkView.frame = CGRectMake(0, 35, 40, 4);
        [scrollView addSubview:_linkView];
    }
    return self;
}

- (void)changeButtonFrame:(NSInteger)num {

    UIButton *button = [self.view viewWithTag:num+11];
    _linkView.frame = CGRectMake(button.frame.origin.x, 35, button.frame.size.width, 4);
}

- (void)buttonAction:(UIButton *)btn {

    _linkView.frame = CGRectMake(btn.frame.origin.x, 35, btn.frame.size.width, 4);
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeScrollView:)]) {
        [self.delegate changeScrollView:btn.tag - 11];
    }
    
}

@end
