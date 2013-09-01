//
//  TestViewController.h
//  Away
//
//  Created by Sam Clark on 9/1/13.
//  Copyright (c) 2013 dayk33p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface TestViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *logOutButton;
-(IBAction) logUserOut;
@end
