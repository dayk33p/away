//
//  AwayAppDelegate.m
//  Away
//
//  Created by Sam Clark on 8/25/13.
//  Copyright (c) 2013 dayk33p. All rights reserved.
// This should be fucking sweet

#import "AwayAppDelegate.h"
#import <Parse/Parse.h>
#import "AwayViewController.h"
#import "HomeViewController.h"
#import "TestViewController.h"
#import  "AwayTableViewController.h"
@interface AwayAppDelegate ()
@property (nonatomic, strong) HomeViewController *homeViewController;
@property (nonatomic, strong) AwayViewController *awayViewController;
@property (nonatomic, strong) TestViewController *testViewController;
@property (nonatomic, strong) AwayTableViewController *awayTableViewController;
@end
    

@implementation AwayAppDelegate

@synthesize window;
@synthesize homeViewController;
@synthesize awayViewController;
@synthesize tabBarController;
@synthesize navController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    [Parse setApplicationId:@"1c3vLekObIhoSKge11lntrrDiBclaLXr5x6PpBMY"
                  clientKey:@"K4NuK38QOIV3n8bwILPeiWx8Z7pvVsQ0VcAO5fyT"];
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    self.awayViewController = [[AwayViewController alloc] init];
    
    
    // buggy
    UIBarButtonItem *logOutButton = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStyleDone target:self action:@selector(logOut)];
     self.awayViewController.navigationItem.rightBarButtonItem = logOutButton; // it's not supports
    // end shit is still buggy
    
  
    self.navController = [[UINavigationController alloc] initWithRootViewController:self.awayViewController];
    self.navController.navigationBarHidden = YES;
    
    self.window.rootViewController = self.navController;
    
  
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

#
- (void)presentTabBarController {
    /* 
     * Initializes views, navigation controllers,tabbar items
     * Called in AwayViewController viewDidLoad()
     */
    
    // create view controllers

    self.tabBarController = [[TabBarController alloc] init];
    self.homeViewController = [[HomeViewController alloc] init];
    self.testViewController = [[TestViewController alloc] init];
    self.awayTableViewController = [[AwayTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    // create navigation controllers
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:self.homeViewController];
    UINavigationController *testNavigationController = [[UINavigationController alloc] initWithRootViewController:self.testViewController];
    UINavigationController *awayTableViewNavigationController = [[UINavigationController alloc] initWithRootViewController:self.awayTableViewController];
    
    
    // create tabbar items

    
    UITabBarItem *homeTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:nil tag:0];
    UITabBarItem *testTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Testt" image:nil tag:0];
    UITabBarItem *awayTableViewTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Aways" image:nil tag:0];
    [homeNavigationController setTabBarItem:homeTabBarItem];
    [testNavigationController setTabBarItem:testTabBarItem];
    [awayTableViewNavigationController setTabBarItem:awayTableViewTabBarItem];
    
    // tie up logic
    self.tabBarController.delegate = self;
    self.tabBarController.viewControllers = @[homeNavigationController,testNavigationController,awayTableViewNavigationController];
    [self.navController setViewControllers:@[ self.awayViewController, self.tabBarController] animated:NO];
}

- (void) logOut{
    /*
     * Logs the user out of parse. Handles resulting navigation logic
     * In future garbage collection tasks might be added to this
     */
    [PFUser logOut];
    [self.navController popToRootViewControllerAnimated:YES];
    // clean up views
    self.homeViewController = nil;
    self.testViewController = nil;
}

@end
