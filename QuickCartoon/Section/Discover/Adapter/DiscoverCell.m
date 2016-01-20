//
//  DiscoverCell.m
//  QuickCartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "DiscoverCell.h"
#import "CustomImageView.h"
#import "DiscoverModel.h"

@interface DiscoverCell()<UIScrollViewDelegate>


@property (nonatomic,strong) UILabel *classificationLable;

@property (nonatomic,strong) UIView *yellowView;

@property (nonatomic,weak) UIViewController *pViewController;

@property (nonatomic,strong) UIScrollView *scrollView;

@end

@implementation DiscoverCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addViews];
        
    }
    return self;
}

- (void)addViews {

    
    _classificationLable = [[UILabel alloc]initWithFrame:CGRectMake(19, 18, 100, 20)];
    _classificationLable.font = [UIFont systemFontOfSize:15];
    _classificationLable.textColor = [UIColor grayColor];
    [self.contentView addSubview:_classificationLable];
    
    _yellowView = [[UIView alloc]init];
    _yellowView.frame   = CGRectMake(10, 19, 5.5, 17);
    _yellowView.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_yellowView];
    _yellowView.layer.cornerRadius = 2.0f;
    
    UIButton *moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
    moreButton.frame = CGRectMake(W_SIZE-70, 18, 60, 20);
    moreButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [moreButton setTitle:@"查看更多" forState:UIControlStateNormal];
    [moreButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [moreButton addTarget:self action:@selector(moreButtonClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:moreButton];
    
    
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.frame = CGRectMake(0, 55, W_SIZE, 170);
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    [self.contentView addSubview:_scrollView];
    
    
}

- (void)upDataWithModel:(DiscoverModel *)model {

    NSArray *arr = model.topics;
    
    _classificationLable.text = model.title;
    
    
    CGFloat x = 0;
    NSInteger index = 1;
    
    for (TopicsModel *top in arr) {
        CustomImageView *images = [[CustomImageView alloc]initWithFrame:CGRectMake(x+10, 0, 130, 170)];
        images.cartoonName.text = top.title;
        images.userName.text = top.user.nickname;
        [images.image sd_setImageWithURL:top.vertical_image_url];
        [_scrollView addSubview:images];
        x = index++*140;
    }
    
    _scrollView.contentSize = CGSizeMake(140*arr.count, 0);
    
    [self scrollViewAddViews];
    
}


- (void) scrollViewAddViews {

    
}

- (void)moreButtonClickAction:(UIButton *)btn {

    
}
@end
