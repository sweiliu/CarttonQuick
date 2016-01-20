//
//  CollectionWorker.h
//  iOSApp
//
//  Created by apple on 1/17/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "DatabaseWorker.h"
#import "HomeModel.h"

@interface CollectionWorker : DatabaseWorker

- (instancetype)initInsertModel:(HomeModel *)model;
- (instancetype)initSelectCollections;

@end
