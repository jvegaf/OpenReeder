//
//  ORAppDelegate.m
//  OpenReeder
//
//  Created by JOSE VEGA on 03/10/13.
//  Copyright (c) 2013 JOSE VEGA. All rights reserved.
//

#import "ORAppDelegate.h"
#import "ORLoginViewController.h"
#import "ORCategoriesViewController.h"
#import "ORFeedViewController.h"

@implementation ORAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ORCategoriesViewController *categoriesVC = [[ORCategoriesViewController alloc]init];
    ORFeedViewController *feedsVC = [[ORFeedViewController alloc]init];
    ORLoginViewController *loginVC = [[ORLoginViewController alloc]init];
    
    UINavigationController *categoriesNC = [[UINavigationController alloc]initWithRootViewController:categoriesVC];
    
    categoriesVC.tabBarItem.image = [UIImage imageNamed:@"marked"];
    feedsVC.tabBarItem.image = [UIImage imageNamed:@"archive"];
    loginVC.tabBarItem.image = [UIImage imageNamed:@"Feeds"];
//    UITabBarController *selectTabBarVC = [[UITabBarController alloc]init];
//    selectTabBarVC.viewControllers = @[categoriesNC,feedsVC,loginVC];
    self.window.rootViewController = categoriesNC;
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
//    if ([defaults objectForKey:@"URL"] == nil) {
//        self.window.rootViewController = loginViewController;
//    }else{
//        self.window.rootViewController = categories;
//    }
//    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
