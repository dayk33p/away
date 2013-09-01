//
//  TabBarController.m
//  Away
//
//  Created by Sam Clark on 9/1/13.
//  Copyright (c) 2013 dayk33p. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()
@property (nonatomic,strong) UINavigationController *navController;

@end

@implementation TabBarController
@synthesize navController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navController = [[UINavigationController alloc] init];
	// Do any additional setup after loading the view.
    // [[self tabBar] setBackgroundImage:[UIImage imageNamed:@"BackgroundTabBar.png"]];
    // [[self tabBar] setSelectionIndicatorImage:[UIImage imageNamed:@"BackgroundTabBarItemSelected.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
