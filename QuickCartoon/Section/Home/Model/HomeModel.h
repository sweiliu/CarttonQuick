//
//  HomeModel.h
//  iOSApp
//
//  Created by apple on 1/17/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "BaseModel.h"

@interface HomeModel : BaseModel

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *likes_count;
@property (nonatomic, strong) NSString *comments_count;
@property (nonatomic, strong) NSString *shared_count;
@property (nonatomic, strong) NSString *user_name;
@property (nonatomic, strong) NSString *cartoon_name;

@property (nonatomic, strong) NSURL *cover_image_url;
@property (nonatomic, strong) NSURL *user_image;

@end
