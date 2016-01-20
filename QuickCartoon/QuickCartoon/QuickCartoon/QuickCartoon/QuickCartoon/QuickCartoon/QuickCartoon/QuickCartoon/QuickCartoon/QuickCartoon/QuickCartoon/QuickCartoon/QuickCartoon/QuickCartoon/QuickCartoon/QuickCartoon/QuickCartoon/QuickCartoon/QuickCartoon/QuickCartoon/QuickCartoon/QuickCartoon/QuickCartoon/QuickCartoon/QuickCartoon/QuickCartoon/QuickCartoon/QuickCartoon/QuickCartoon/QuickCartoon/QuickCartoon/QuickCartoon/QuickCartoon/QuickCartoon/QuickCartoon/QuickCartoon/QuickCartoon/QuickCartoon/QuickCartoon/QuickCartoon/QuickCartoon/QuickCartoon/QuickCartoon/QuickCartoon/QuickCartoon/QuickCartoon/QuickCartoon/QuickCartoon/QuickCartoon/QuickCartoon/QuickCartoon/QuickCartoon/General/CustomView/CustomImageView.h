//
//  CustomImageView.h
//  Quick Cartoon
//
//  Created by apple on 1/12/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"
#import "DiscoverModel.h"


@interface CustomImageView : UIView

@property (nonatomic,strong) UIImageView *image;
@property (nonatomic,strong) UILabel *cartoonName;
@property (nonatomic,strong) UILabel *userName;

@property (nonatomic,weak) UIViewController *pViewController;

- (void)updateWithModel:(TopicsModel *)model;

@end
