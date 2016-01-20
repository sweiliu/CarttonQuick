//
//  NWCartoonLook.m
//  QuickCartoon
//
//  Created by apple on 1/20/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "NWCartoonLook.h"

@implementation NWCartoonLook

- (void)startRequestWithPath:(NSString *)path {

    _path = path;
    
    [self startGet];
}

@end
