//
//  HomeModel.m
//  iOSApp
//
//  Created by apple on 1/17/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel


+ (JSONKeyMapper*)keyMapper {
    
    return [[JSONKeyMapper alloc]initWithDictionary:@{
                                                      @"topic.title":@"cartoon_name",
                                                      @"topic.user.nickname":@"user_name",
                                                      @"topic.user.avatar_url":@"user_image",
                                                      @"topic.vertical_image_url":@"cartoon_imgage"}];
}

@end
