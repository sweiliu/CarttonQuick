//
//  NWRecommend.m
//  QuickCartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "NWRecommend.h"
#import "HomeModel.h"
@implementation NWRecommend

- (void)startRequestWithParams:(NSDictionary *)params {
    _params = params;
    
    _path = @"v1/comic_lists/1?offset=0&limit=20";
    
    [self startGet];
}

- (void)startRequestWithPath:(NSString *)path {

    _path = path;
    
    [self startGet];
    
}

- (void)dealComplete:(id)result succ:(BOOL)succ {
    if (self.completion) {
        
        if (succ) {
            NSArray *arr = [HomeModel arrayOfModelsFromDictionaries:result[@"data"][@"comics"]];
            self.completion(arr, YES);
        }
        else {
            self.completion(result, NO);
        }
        
    }
}

@end
