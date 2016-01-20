//
//  DataBaseServer.h
//  DBMeiziFuli
//
//  Created by jackyshan on 9/23/15.
//  Copyright © 2015 jackyshan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CollectionWorker.h"

@interface DataBaseServer : NSObject

+ (void)createTable;

//收藏
+ (void)insertModel:(HomeModel *)model;
+ (NSArray *)selectCollections;

@end
