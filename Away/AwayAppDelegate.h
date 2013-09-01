//
//  AwayAppDelegate.h
//  Away
//
//  Created by Sam Clark on 8/25/13.
//  Copyright (c) 2013 dayk33p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarController.h"
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     

@interface AwayAppDelegate : UIResponder <UIApplicationDelegate,UITabBarControllerDelegate>
- (void)presentTabBarController;
- (void)logOut;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) TabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *navController;
@end
