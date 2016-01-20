//
//  RecommndCell.h
//  QuickCartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "HomeModel.h"

@interface RecommndCell : BaseTableViewCell

@property (nonatomic,weak) UIViewController *pViewController;

- (void)updateWithModel:(HomeModel *)model;

@end
