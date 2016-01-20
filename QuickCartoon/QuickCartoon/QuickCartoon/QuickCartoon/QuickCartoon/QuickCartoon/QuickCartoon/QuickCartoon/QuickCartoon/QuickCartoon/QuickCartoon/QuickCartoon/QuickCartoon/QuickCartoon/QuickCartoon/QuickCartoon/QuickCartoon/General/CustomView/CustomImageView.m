//
//  CustomImageView.m
//  Quick Cartoon
//
//  Created by apple on 1/12/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "CustomImageView.h"

@interface CustomImageView()

@end

@implementation CustomImageView

- (instancetype)initWithFrame:(CGRect)frame {

    if (self = [super initWithFrame:frame]) {
        
        _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 170)];
        [self addSubview:_image];
        
        _image.contentMode = UIViewContentModeScaleToFill;
        
        UIImageView *backgroundImage = [[UIImageView alloc]init];
        backgroundImage.image = [UIImage imageNamed:@"ic_common_mask.9"];
        backgroundImage.frame = CGRectMake(0, 120, 130, 50);
        backgroundImage.backgroundColor = [UIColor clearColor];
        [_image addSubview:backgroundImage];
        
        _cartoonName = [[UILabel alloc]initWithFrame:CGRectMake(7, 130, 120, 20)];
        _cartoonName.font = [UIFont boldSystemFontOfSize:14];
        _cartoonName.textColor = [UIColor whiteColor];
        [_image addSubview:_cartoonName];
        
        _userName = [[UILabel alloc]initWithFrame:CGRectMake(10, 150, 100, 15)];
        _userName.font = [UIFont boldSystemFontOfSize:12];
        _userName.textColor = [UIColor whiteColor];
        [_image addSubview:_userName];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewAction:)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}


- (void)viewAction:(UIView *)view {
//
//    CarttonListDisplayer *viewss = [[CarttonListDisplayer alloc]init];
//    
//    [_pViewController.navigationController pushViewController:viewss animated:YES];
}

@end
