//
//  CartoonLookViewController.m
//  QuickCartoon
//
//  Created by apple on 1/20/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "CartoonLookViewController.h"
#import "NWCartoonLook.h"

@interface CartoonLookViewController()
{

    NSString *_path;
}

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation CartoonLookViewController


- (void)viewDidLoad {

    [self addViews];
    
    [self.view addSubview:_webView];
}

- (void)addViews {

    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 40, W_SIZE, H_SIZE-40)];
    
    [self viewGetData];
}

- (void)viewGetData {

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:_path]];
    
    [_webView loadRequest:request];
}

- (void)viewControllerSetPath:(NSString *)path {

    
    NSString *str = [NSString stringWithFormat:@"%@/comics/%@",GET_URL_HOST ,path];
    _path = str;
}

@end
