//
//  SettingsViewController.h
//  Speed
//
//  Created by Benjamín Hernández on 17/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataHandling.h"
//#import <ExternalAccessory/ExternalAccessory.h>

@interface SettingsViewController : UIViewController

@property (strong, nonatomic) IBOutlet UISwitch *USMetricSystem;
@property (strong, nonatomic) IBOutlet UISwitch *ISOMetricSystem;

@end
