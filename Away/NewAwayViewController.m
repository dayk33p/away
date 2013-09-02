//
//  NewAwayViewController.m
//  Away
//
//  Created by Sam Clark on 9/2/13.
//  Copyright (c) 2013 dayk33p. All rights reserved.
//

#import "NewAwayViewController.h"

@interface NewAwayViewController ()

@end

@implementation NewAwayViewController
@synthesize textView;
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
    [self setTitle:@"Add new away"];
    // setup text view
    textView = [[UITextView alloc] initWithFrame:CGRectMake(5, 5, 310, 186)];
    [textView setFont:[UIFont systemFontOfSize:16]];
    [textView becomeFirstResponder];

    // add navigation bar items
    [self.navigationItem setRightBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStyleBordered target:self action:@selector(addButtonTouchHandler:)]];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelButtonTouchHandler:)]];
    
    [self.view addSubview:textView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) addButtonTouchHandler:(id)sender{
    PFObject *newAway = [PFObject objectWithClassName:@"Away"];
    [newAway setObject:[textView text] forKey:@"textContent"];
    [newAway setObject:[PFUser currentUser] forKey:@"user"];
    PFACL *awayACL = [PFACL ACLWithUser:[PFUser currentUser]];
    [awayACL setPublicReadAccess:NO];
    [newAway setACL:awayACL];
    
    [newAway saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error){
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
    }];
}

-(void) cancelButtonTouchHandler:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
