//
//  DashboardViewController.h
//  Speed
//
//  Created by Benjamín Hernández on 13/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#define refreshNotification @"refreshNotification"

#import <UIKit/UIKit.h>
#import "DataHandling.h"
#import "TrainCell.h"
#import "Hex.h"
#import "EditItemViewController.h"

@interface DashboardViewController : UITableViewController <UIKeyInput> {
    NSMutableString *frame;
}

@property (strong, nonatomic) NSMutableString *frame;

- (void)refreshList;

@end
