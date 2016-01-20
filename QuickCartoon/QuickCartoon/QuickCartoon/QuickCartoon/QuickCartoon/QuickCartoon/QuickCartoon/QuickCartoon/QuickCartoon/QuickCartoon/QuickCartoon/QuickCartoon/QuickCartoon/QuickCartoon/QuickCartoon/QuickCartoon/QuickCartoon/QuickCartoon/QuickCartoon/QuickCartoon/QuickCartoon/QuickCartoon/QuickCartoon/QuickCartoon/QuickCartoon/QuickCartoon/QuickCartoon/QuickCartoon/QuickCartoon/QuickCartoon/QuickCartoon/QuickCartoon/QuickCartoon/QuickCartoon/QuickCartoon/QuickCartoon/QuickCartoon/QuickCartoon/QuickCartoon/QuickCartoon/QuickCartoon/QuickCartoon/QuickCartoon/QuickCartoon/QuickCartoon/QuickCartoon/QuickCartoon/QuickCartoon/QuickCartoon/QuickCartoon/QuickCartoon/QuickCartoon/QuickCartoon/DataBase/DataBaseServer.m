//
//  DataBaseServer.m
//  DBMeiziFuli
//
//  Created by jackyshan on 9/23/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import "DataBaseServer.h"
#import "DatabaseEngine.h"
#import "CreateTableWorker.h"

/**
 *  数据库上级目录
 */
static NSString *databaseDir = @"db";
/**
 *  数据库名称
 */
static NSString *databaseName = @"db.sqlite3";

@implementation DataBaseServer

+ (NSDictionary *)_addToEngine:(DatabaseWorker *)worker {
	return [[DatabaseEngine shareInstanceWithDir:databaseDir name:databaseName] addDbWorker:worker];
}

+ (void)createTable {
	CreateTableWorker *worker = [[CreateTableWorker alloc] init];
	[self _addToEngine:worker];
}

+ (void)insertModel:(HomeModel *)model {
    CollectionWorker *worker = [[CollectionWorker alloc] initInsertModel:model];
    [self _addToEngine:worker];
}

+ (NSArray *)selectCollections {
    CollectionWorker *worker = [[CollectionWorker alloc] initSelectCollections];
    [self _addToEngine:worker];

    return [worker onResult][@"result"];
}

@end
