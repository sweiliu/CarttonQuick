//
//  CollectionWorker.m
//  iOSApp
//
//  Created by apple on 1/17/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "CollectionWorker.h"

@implementation CollectionWorker

- (instancetype)initInsertModel:(HomeModel *)model {
    if (self = [super init]) {
        self.execute = ^(FMDatabase *dbHelper) {
            NSString *commandText = @"SELECT * FROM comics_list WHERE title = ?";
            FMResultSet *resultset = [dbHelper executeQuery:commandText, model.title];
            if ([resultset next]) {
                NSLog(@"已经收藏过了");
                return;
            }
            
            commandText = @"INSERT INTO comics_list (title, likes_count, cover_image_url) values (?, ?, ?)";
            [dbHelper executeUpdate:commandText, model.title, model.likes_count, model.cover_image_url];
        };
    }
    
    return self;
}

- (instancetype)initSelectCollections {
    if (self = [super init]) {
        self.execute = ^(FMDatabase *dbHelper) {
            NSString *commandText = @"SELECT * FROM comics_list";
            FMResultSet *resultset = [dbHelper executeQuery:commandText];
            
            NSMutableArray *mArr = [NSMutableArray array];
            while ([resultset next]) {
                HomeModel *model = [[HomeModel alloc] initWithDictionary:[resultset resultDictionary] error:nil];
                [mArr addObject:model];
            }
            
            _result = @{@"result":mArr};
        };
    }
    
    return self;
}

@end
