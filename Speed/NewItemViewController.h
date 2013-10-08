//
//  NewItemViewController.h
//  Speed
//
//  Created by Benjamín Hernández on 24/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataHandling.h"

@interface NewItemViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *TrainName;
@property (weak, nonatomic) IBOutlet UITextField *MaxSpeed;
@property (weak, nonatomic) IBOutlet UITextField *WheelDiameter;
@property (weak, nonatomic) IBOutlet UITextField *UId;
@property (weak, nonatomic) IBOutlet UIButton *AddTrainButton;

@end
