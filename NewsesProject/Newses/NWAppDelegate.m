//
//  NWAppDelegate.m
//  Newses
//
//  Created by Admin on 01.08.14.
//  Copyright (c) 2014 VantuZ. All rights reserved.
//

#import "NWAppDelegate.h"
#import "NWTableViewController.h"
#import "NWNewsTableViewController.h"

@implementation NWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.0/255.0 green:198.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    // Override point for customization after application launch.

    NWTableViewController *mainView = [[[NWTableViewController alloc] init] autorelease];
    NWNewsTableViewController *newsView = [[[NWNewsTableViewController alloc] init] autorelease];
    // REVIEW В чём разница между release и autorelease?
    // REVIEW Зачем здесь autorelease?
    mainView.newsController = newsView;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:mainView];
    // REVIEW В чём разница между release и autorelease?
    // REVIEW Почему здесь нет release/autorelease?
    
    self.window.rootViewController = navController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [VKSdk processOpenURL:url fromApplication:sourceApplication];
    // REVIEW Зачем это нужно?
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
