//
//  DetailViewController.h
//  Speed
//
//  Created by Benjamín Hernández on 13/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property int trainNumber;
@property (strong, nonatomic) NSString *trainName;
@property (weak, nonatomic) IBOutlet UILabel *trainLabel;

@end
