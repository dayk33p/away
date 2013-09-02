//
//  AwayViewController.m
//  Away
//
//  Created by Sam Clark on 8/25/13.
//  Copyright (c) 2013 dayk33p. All rights reserved.
//

#import "AwayViewController.h"
#import "AwayAppDelegate.h"
@interface AwayViewController ()

@end

@implementation AwayViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    /*PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    [testObject setObject:@"bar" forKey:@"foo"];
    [testObject save];*/
    

	// Do any additional setup after loading the view, typically from a nib.
}

- (void) loginLogic {
    // determines which view shows dependin on whether or not a user is currently logged in
    
    if (![PFUser currentUser]) {
        // No user logged in --> loginViewController logic

        [self showLoginView];
        
    }
    else {
        //we have a user code --> present tab view
        [(AwayAppDelegate*)[[UIApplication sharedApplication] delegate] presentTabBarController];
        
    }
    
}
- (void) viewWillAppear:(BOOL)animated {
    /*PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
     [testObject setObject:@"bar" forKey:@"foo"];
     [testObject save];*/
    [super viewWillAppear:animated];
    [self loginLogic];
}

-(void) showLoginView {
    PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
    [logInViewController setDelegate:self]; // Set ourselves as the delegate
    
    // Create the sign up view controller
    PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
    [signUpViewController setDelegate:self]; // Set ourselves as the delegate
    
    // Assign our sign up controller to be displayed from the login controller
    [logInViewController setSignUpController:signUpViewController];
    
    // Present the log in view controller
    [self presentViewController:logInViewController animated:YES completion:NULL];
}

// delegat methods for login work
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"ok"
                      otherButtonTitles:nil] show];
    return NO; // Interrupt login process
}

// Sent to the delegate when a PFUser is logged in.
// This is where the code to move to the home screen could live
- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

// Sent to the delegate when the log in attempt fails.
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}


// Sent to the delegate when the log in screen is dismissed.
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
