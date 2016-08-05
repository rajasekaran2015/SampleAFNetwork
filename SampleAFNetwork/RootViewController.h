//
//  RootViewController.h
//  SampleAFNetwork
//
//  Created by Admin on 05/08/16.
//  Copyright © 2016 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController
@property(nonatomic, strong) NSMutableArray *results;
- (IBAction)refreshAction:(id)sender;
- (IBAction)sampleAction:(id)sender;

@end
