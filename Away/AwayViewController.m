//
//  AwayViewController.m
//  Away
//
//  Created by Sam Clark on 8/25/13.
//  Copyright (c) 2013 dayk33p. All rights reserved.
//

#import "AwayViewController.h"

@interface AwayViewController ()

@end

@implementation AwayViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];

	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
