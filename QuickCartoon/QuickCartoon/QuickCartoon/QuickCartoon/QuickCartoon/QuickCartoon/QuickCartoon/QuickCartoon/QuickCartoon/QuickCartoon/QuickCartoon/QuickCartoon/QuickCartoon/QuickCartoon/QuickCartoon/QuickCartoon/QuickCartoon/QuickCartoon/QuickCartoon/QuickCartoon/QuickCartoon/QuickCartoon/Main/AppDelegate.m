//
//  AppDelegate.m
//  QuickCartoon
//
//  Created by apple on 1/18/16.
//  Copyright © 2016 jackyshan. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "DiscoverViewController.h"
#import "MineViewController.h"
#import "DataBaseServer.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"%@",NSHomeDirectory());
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    HomeViewController *home = [[HomeViewController alloc]init];
    UIImage *homeNormalImage = [UIImage imageNamed:@"ic_tabbar_home_normal"];
    UIImage *homeSelectedImage = [UIImage imageNamed:@"ic_tabbar_home_pressed"];
    
    homeNormalImage = [homeNormalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeSelectedImage = [homeSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *homeBarItem = [[UITabBarItem alloc]initWithTitle:@"快看" image:homeNormalImage selectedImage:homeSelectedImage];
    home.tabBarItem = homeBarItem;
    UINavigationController *homeNV = [[UINavigationController alloc]initWithRootViewController:home];
    
    //发现
    DiscoverViewController *discover = [[DiscoverViewController alloc]init];
    UIImage *discoverNormalImage = [UIImage imageNamed:@"ic_tabbar_discover_normal"];
    UIImage *discoverSelectedImage = [UIImage imageNamed:@"ic_tabbar_discover_pressed"];
    
    discoverNormalImage = [discoverNormalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    discoverSelectedImage = [discoverSelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *dicoverBarItem = [[UITabBarItem alloc]initWithTitle:@"发现" image:discoverNormalImage selectedImage:discoverSelectedImage];
    discover.tabBarItem = dicoverBarItem;
    
    //我的
    MineViewController *me = [[MineViewController alloc]init];
    UIImage *meNormalImage = [UIImage imageNamed:@"ic_tabbar_me_normal"];
    UIImage *meselectedImage = [UIImage imageNamed:@"ic_tabbar_me_pressed"];
    
    meNormalImage = [meNormalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    meselectedImage = [meselectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *meBarItem = [[UITabBarItem alloc]initWithTitle:@"个人" image:meNormalImage selectedImage:meselectedImage];
    
    me.tabBarItem = meBarItem;
    
    //将TabBarController 加入到窗口中
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.tabBar.tintColor = [UIColor blackColor];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"AmericanTypewriter" size:13.0f], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    
    tabBarController.viewControllers = @[homeNV, discover, me];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
    
    [DataBaseServer createTable];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
