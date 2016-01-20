//
//  Home_NavigationTitleViewController.m
//  Quick Cartoon
//
//  Created by apple on 1/12/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "Home_NavigationTitleViewController.h"

@interface Home_NavigationTitleViewController()<UIScrollViewDelegate>

@property (nonatomic,strong) UIView *underLineView;

@end

@implementation Home_NavigationTitleViewController

- (void)viewWillAppear:(BOOL)animated {

    NSLog(@"主页导航栏视图初始化");
}

- (void)viewDidLoad {

    self.view.backgroundColor = [UIColor redColor];
    
    NSArray *buttonName = @[@"关注",@"推荐"];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 80, 35)];
    [self.view addSubview:scrollView];
    
    CGFloat x =0;
    for (NSInteger index = 0;index <2 ; index++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(x, 0, 30, 20);
        [scrollView addSubview:button];
        
        [button setTitle:buttonName[index] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonActin:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 10+index;
        x = index*50;
    }
    
    _underLineView = [[UIView alloc]init];
    [scrollView addSubview:_underLineView];
    _underLineView.backgroundColor = [UIColor redColor];
    
}

- (void)buttonActin:(UIButton *)btn {

    NSLog(@"点击了%lu按钮",btn.tag);
}

- (void)underLineContenOffSet:(NSInteger)num {

    _underLineView.frame = CGRectMake(num*50, 33, 30, 2);
}

@end
