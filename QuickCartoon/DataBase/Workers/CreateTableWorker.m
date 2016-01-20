//
//  CreateTableWorker.m
//  DBMeiziFuli
//
//  Created by jackyshan on 9/23/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "CreateTableWorker.h"

@implementation CreateTableWorker

- (instancetype)init {
    if (self = [super init]) {
        self.execute = ^(FMDatabase *dbHelper) {
            /**
             创建播放列表,表comics_list结构如下:
             title
             likes_count
             cover_image_url
             **/
			NSString *commandText = @"CREATE TABLE IF NOT EXISTS comics_list(id INTEGER PRIMARY KEY, title TEXT, likes_count TEXT, cover_image_url TEXT, tag TEXT)";
			[dbHelper executeUpdate:commandText];
        };
    }
    
    return self;
}

@end
