//
//  TestViewController.m
//  Away
//
//  Created by Sam Clark on 9/1/13.
//  Copyright (c) 2013 dayk33p. All rights reserved.
//

#import "TestViewController.h"
#import "AwayAppDelegate.h"

@interface TestViewController ()

@end

@implementation TestViewController

@synthesize logOutButton;
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
    NSLog(@"%@",([PFUser currentUser]));
    
    // Do any additional setup after loading the view from its nib.
}

-(IBAction) logUserOut {

     [(AwayAppDelegate*)[[UIApplication sharedApplication] delegate] logOut];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
