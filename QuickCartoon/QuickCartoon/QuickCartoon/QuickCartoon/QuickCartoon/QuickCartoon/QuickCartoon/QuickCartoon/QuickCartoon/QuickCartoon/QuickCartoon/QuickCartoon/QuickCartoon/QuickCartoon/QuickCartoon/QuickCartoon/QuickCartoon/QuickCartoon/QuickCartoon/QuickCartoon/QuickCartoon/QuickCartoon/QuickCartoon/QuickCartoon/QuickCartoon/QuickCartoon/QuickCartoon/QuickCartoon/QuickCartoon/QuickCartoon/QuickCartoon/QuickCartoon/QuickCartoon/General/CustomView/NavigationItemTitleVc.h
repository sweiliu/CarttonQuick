//
//  NavigationItemTitleVc.h
//  QuickCartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "BaseViewController.h"

@protocol NavigationItemTitleVcDelegate <NSObject>

- (void)changeScrollView:(NSInteger)num;

@end

@interface NavigationItemTitleVc : BaseViewController

@property (nonatomic,strong) id<NavigationItemTitleVcDelegate> delegate;

@property (nonatomic,strong) UIViewController *pViewController;

- (void)changeButtonFrame:(NSInteger)num;

@end
