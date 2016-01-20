//
//  NWDiscover.m
//  QuickCartoon
//
//  Created by apple on 1/19/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "NWDiscover.h"
#import "DiscoverModel.h"

@interface NWDiscover()
{

    NSString *params;
    
    NSInteger _num;
}
@end

@implementation NWDiscover
- (void)startRequestWithPath:(NSString *)path andSetTheTyble:(NSInteger)num {
    
    _num = num;
    switch (num) {
        case 1:
            params = @"topics";
            break;
        case 2:
            params = @"banner_group";
            break;
            
    }
    
    _path = path;
    
    [self startGet];
    
}

- (void)dealComplete:(id)result succ:(BOOL)succ {
    
    if (self.completion) {
        
        switch (_num) {
            case 1:
                if (succ) {
                    NSArray *arr = [DiscoverModel arrayOfModelsFromDictionaries:result[@"data"][params]];
                    self.completion(arr, YES);
                }
                else {
                    self.completion(result, NO);
                }
                break;
                
                
            case 2:
                if (succ) {
                    NSArray *arr = [ScrollViewModel arrayOfModelsFromDictionaries:result[@"data"][params]];
                    self.completion(arr, YES);
                }
                else {
                    self.completion(result, NO);
                }

                break;
        }
        
    }
}


@end
