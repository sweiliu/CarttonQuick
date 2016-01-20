//
//  DiscoverModel.h
//  iOSApp
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "BaseModel.h"


@class TopicsModel;
@protocol TopicsModel <NSObject>
@end

@class ScrollViewModel;
@protocol ScrollViewModel <NSObject>
@end

@interface UserModel :BaseModel
@property (nonatomic,strong) NSString *nickname;
@end


@class UserModel;
@interface TopicsModel : BaseModel

@property (nonatomic,strong) NSURL *vertical_image_url;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UserModel *user;
@end



@interface ScrollViewModel : BaseModel
@property (nonatomic,strong) NSURL *pic;
@end

@class ScrollViewModel;
@class TopicsModel;
@interface DiscoverModel : BaseModel

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *action;
@property (nonatomic,strong) NSArray <TopicsModel> *topics;
@property (nonatomic,strong) NSArray <ScrollViewModel> *banner_group;

@end
