//
//  AttentionViewController.m
//  QuickCartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "AttentionViewController.h"

@implementation AttentionViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self addViews];
}

- (void)addViews {
    
    UIImageView *defaultImage = [[UIImageView alloc]initWithFrame:CGRectMake(140, 50, 80, 100)];
    [self.view addSubview:defaultImage];
    defaultImage.image = [UIImage imageNamed:@"ic_content_empty"];
    
    
    UILabel *defaultText = [[UILabel alloc]initWithFrame:CGRectMake(100, 180, 200, 20)];
    [self.view addSubview:defaultText];
    defaultText.textColor = [UIColor grayColor];
    defaultText.font = [UIFont systemFontOfSize:19];
    defaultText.text = @"没登录 , 超多精彩内容看不鸟";
    defaultText.adjustsFontSizeToFitWidth = YES;
    defaultText.minimumScaleFactor = 0.5;
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:loginButton];
    loginButton.frame = CGRectMake(130, 250, 125, 50);
    [loginButton setImage:[UIImage imageNamed:@"attention_empty_login_normal"]];
    
    [loginButton addTarget:self action:@selector(goToLogin:)];
}

- (void)goToLogin:(UIButton *)btn {
    
    NSLog(@"登录帐号");
}

@end
