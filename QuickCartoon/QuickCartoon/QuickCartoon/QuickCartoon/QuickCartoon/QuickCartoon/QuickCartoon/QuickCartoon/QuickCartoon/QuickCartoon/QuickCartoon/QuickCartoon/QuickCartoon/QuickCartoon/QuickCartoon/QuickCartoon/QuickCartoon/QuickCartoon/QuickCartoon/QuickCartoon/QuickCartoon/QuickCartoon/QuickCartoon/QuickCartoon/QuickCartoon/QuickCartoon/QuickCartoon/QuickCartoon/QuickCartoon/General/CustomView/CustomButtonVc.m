//
//  CustomButtonVc.m
//  Quick Cartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "CustomButtonVc.h"
@interface CustomButtonVc(){

    NSString *_imageStr;
    NSString *_title;

}

@property (nonatomic,strong) UIImageView *backGroundImage;

@property (nonatomic,strong) UILabel *titleLable;

@end
@implementation CustomButtonVc

- (instancetype)init {

    if (self = [super init]) {
        
        [self addViews];
        
        self.view.backgroundColor = [UIColor clearColor];
        
        
    }
    return self;
}

- (void)addViews {

    
    _backGroundImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    [self.view addSubview:_backGroundImage];
    
    
    _titleLable = [[UILabel alloc] initWithFrame:CGRectMake(0, 85, 80, 12)];
    _titleLable.font = [UIFont systemFontOfSize:13];
    _titleLable.textColor = [UIColor blackColor];
    _titleLable.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_titleLable];
    
    UITapGestureRecognizer *tapGuesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(gustureAction)];
    [self.view addGestureRecognizer:tapGuesture];
}

- (void)upDataWithDic:(NSDictionary *)dic {

    _backGroundImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",dic[@"img"]]];
    
    _titleLable.text = dic[@"title"];
}

- (void)gustureAction {
    NSLog(@"点击了按钮");
    

}

@end
