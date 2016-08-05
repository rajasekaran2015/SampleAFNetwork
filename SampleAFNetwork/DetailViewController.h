//
//  DetailViewController.h
//  SampleAFNetwork
//
//  Created by Admin on 05/08/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *responseTxt;
@property (strong, nonatomic) IBOutlet UITextField *requestURL;
- (IBAction)postRequest:(id)sender;

- (IBAction)getRequest:(id)sender;
@end
