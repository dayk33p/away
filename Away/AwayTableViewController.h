//
//  AwayTableViewController.h
//  Away
//
//  Created by Sam Clark on 9/2/13.
//  Copyright (c) 2013 dayk33p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface AwayTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *awayArray;

- (void)addAwayButtonHandler:(id)sender;
- (void)refreshButtonHandler:(id)sender;

@end
