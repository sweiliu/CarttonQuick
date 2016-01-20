//
//  RecommndCell.m
//  QuickCartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "RecommndCell.h"
#import "HomeModel.h"
#import "CustomImageView.h"
#import "CustomButton.h"

@interface RecommndCell()
{

}
@property (nonatomic,strong) UIImageView *useImage;//用户头像
@property (nonatomic,strong) UIImageView *cartoonImage;//漫画预览图

@property (nonatomic,strong) UILabel *useName;//用户名
@property (nonatomic,strong) UILabel *cartoonName;//漫画名
@property (nonatomic,strong) UILabel *specialLable;//专题
@property (nonatomic,strong) UILabel *cartoonTitle;//漫画集数


@end

@implementation RecommndCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, W_SIZE, 300-35)];
        UITapGestureRecognizer *tapGuesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backGroundViewAction:)];
        [backgroundView addGestureRecognizer:tapGuesture];
        [self.contentView addSubview:backgroundView];
        
        _cartoonImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 45, W_SIZE, 220)];
        [backgroundView addSubview:_cartoonImage];
        
        
        _useImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 8, 30, 30)];
        [backgroundView addSubview:_useImage];
        _useImage.layer.cornerRadius = _useImage.frame.size.width/2;
        _useImage.layer.borderColor = [UIColor clearColor].CGColor;
        _useImage.clipsToBounds = YES;
        
        
        _specialLable = [[UILabel alloc]initWithFrame:CGRectMake(W_SIZE-30, 13, 25, 20)];
        [backgroundView addSubview:_specialLable];
        _specialLable.text = @"专题";
        _specialLable.font = [UIFont systemFontOfSize:11];
        _specialLable.textColor = [UIColor redColor];
        
        
        _useName = [[UILabel alloc]init];
        _useName.font = [UIFont systemFontOfSize:15];
        _useName.textColor = [UIColor grayColor];
        [backgroundView addSubview:_useName];
        
        
        _cartoonName = [[UILabel alloc]init];
        _cartoonName.font = [UIFont systemFontOfSize:11];
        _cartoonName.textColor = [UIColor grayColor];
        [backgroundView addSubview:_cartoonName];
        
        
        UIImageView *backgroundImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 200, W_SIZE, 65)];
        backgroundImage.image = [UIImage imageNamed:@"ic_common_mask.9"];
        [backgroundView addSubview:backgroundImage];
        
        _cartoonTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 243, W_SIZE-10, 20)];
        _cartoonTitle.textColor = [UIColor whiteColor];
        _cartoonTitle.font = [UIFont systemFontOfSize:14];
        [backgroundView addSubview:_cartoonTitle];
        
        
        CGFloat x = 0;
        for (NSInteger index = 1 ; index <4; index++) {
            CustomButton *button = [CustomButton buttonWithType:UIButtonTypeCustom];
            [self.contentView addSubview:button];
            button.frame = CGRectMake(x+30, 275, 80, 15);
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:12];
            button.tag = 20+index;
            x =index*130;
        }
        
        
        CGFloat s = 0;
        for (NSInteger index = 1; index <3; index++) {
            UIView *view = [[UIView alloc]init];
            view.backgroundColor = [UIColor grayColor];
            [self.contentView addSubview:view];
            view.frame = CGRectMake(s+125, 300-25, 0.5, 15);
            s = 130*index;
        }
        
        
    }
    return self;
}

- (void)updateWithModel:(HomeModel *)model {
    
    if (!model) {
        return;
    }
    
    _cartoonTitle.text = model.title;
    
    [_cartoonImage sd_setImageWithURL:model.cover_image_url placeholderImage:[UIImage imageNamed:@"ic_comic_placeholder"]];
    
    [_useImage sd_setImageWithURL:model.user_image placeholderImage:[UIImage imageNamed:@"ic_personal_headportrait"]];
    
    
    
    for (NSInteger index = 1; index <4; index++) {
        CustomButton *button = [self viewWithTag:20+index];
        switch (button.tag) {
            case 21:
                [button setTitle:model.shared_count forState:UIControlStateNormal];
                [button setImage:[UIImage imageNamed:@"ic_home_share_normal"] forState:UIControlStateNormal];
                [button setImage:[UIImage imageNamed:@"ic_home_share_pressed"] forState:UIControlStateHighlighted];
                break;
            case 22:
                [button setTitle:model.likes_count forState:UIControlStateNormal];
                [button setImage:[UIImage imageNamed:@"ic_details_toolbar_praise_normal"] forState:UIControlStateNormal];
                [button setImage:[UIImage imageNamed:@"ic_details_toolbar_praise_pressed"] forState:UIControlStateSelected];
                break;
            case 23:
                [button setTitle:model.comments_count forState:UIControlStateNormal];
                [button setImage:[UIImage imageNamed:@"ic_home_comment_normal"] forState:UIControlStateNormal];
                [button setImage:[UIImage imageNamed:@"ic_home_comment_pressed"] forState:UIControlStateSelected];
                break;
        }
    }
    
    
    
    
    CGSize useNameSize = [model.user_name boundingRectWithSize:SIZE_TO_FIT_SIZE options:OPTIONS attributes:[NSDictionary dictionaryWithObjectsAndKeys:_useName.font, NSFontAttributeName, nil] context:nil].size;
    
    _useName.frame = CGRectMake(50, 13, useNameSize.width, 20);
    _useName.text = model.user_name;
    
    CGSize cartoonNameSize = [model.cartoon_name boundingRectWithSize:SIZE_TO_FIT_SIZE options:OPTIONS attributes:[NSDictionary dictionaryWithObjectsAndKeys:_cartoonName.font, NSFontAttributeName, nil] context:nil].size;
    
    _cartoonName.frame = CGRectMake(W_SIZE - 40- cartoonNameSize.width , 13, cartoonNameSize.width, 20);
    _cartoonName.text = model.cartoon_name;
    
}


- (void)backGroundViewAction:(UIView *)view {

    
}

- (void)buttonClick:(CustomButton *)btn {

    
}
@end
