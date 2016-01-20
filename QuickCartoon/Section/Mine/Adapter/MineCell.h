//
//  MineCell.h
//  Quick Cartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "MineModel.h"

@interface MineCell : BaseTableViewCell

- (void)upDataWithModel:(MineModel *)model;

@end
