//
//  NewAwayViewController.h
//  Away
//
//  Created by Sam Clark on 9/2/13.
//  Copyright (c) 2013 dayk33p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface NewAwayViewController : UIViewController

@property (nonatomic, strong) UITextView *textView;

- (void)addButtonTouchHandler:(id)sender;
- (void)cancelButtonTouchHandler:(id)sender;

@end
