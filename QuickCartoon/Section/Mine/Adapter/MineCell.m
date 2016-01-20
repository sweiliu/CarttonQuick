//
//  MineCell.m
//  Quick Cartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "MineCell.h"
#import "SweeLiuBussiness.pch"
@interface MineCell()


@property (nonatomic,strong) UIImageView *photohImageView;
@property (nonatomic,strong) UILabel *titleLable;

@end

@implementation MineCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.photohImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 15, 20, 20)];
        [self.contentView addSubview:self.photohImageView];
        
        self.titleLable = [[UILabel alloc]init];
        _titleLable.font = [UIFont systemFontOfSize:15];
        _titleLable.textColor = [UIColor grayColor];
        [self.contentView addSubview:_titleLable];
        
        UIImageView *arrowImageView = [[UIImageView alloc]initWithFrame:CGRectMake(355, 15, 7, 12)];
        arrowImageView.image = [UIImage imageNamed:@"ic_listitem_next"];
        [self.contentView addSubview:arrowImageView];
    }
    return self;
}

- (void)upDataWithModel:(MineModel *)model {

    _photohImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",model.img]];
    
    CGSize titleLableSize = [model.title boundingRectWithSize:SIZE_TO_FIT_SIZE options:OPTIONS attributes:[NSDictionary dictionaryWithObjectsAndKeys:_titleLable.font, NSFontAttributeName, nil] context:nil].size;
    
    _titleLable.frame = CGRectMake(45, 15, titleLableSize.width, 15);
    _titleLable.text = model.title;
}

@end
