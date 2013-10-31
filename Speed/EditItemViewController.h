//
//  EditItemViewController.h
//  Speed
//
//  Created by Benjamín Hernández on 11/10/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataHandling.h"

@interface EditItemViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) Train *TrainObject;
@property int TrainIndex;
@property (weak, nonatomic) IBOutlet UITextField *TrainName;
@property (weak, nonatomic) IBOutlet UITextField *MaxSpeed;
@property (weak, nonatomic) IBOutlet UITextField *WheelDiameter;
@property (weak, nonatomic) IBOutlet UITextField *Distance;

@property (weak, nonatomic) IBOutlet UILabel *MaxSpeedMetricLabel;
@property (weak, nonatomic) IBOutlet UILabel *WheelDiameterMetricLabel;
@property (weak, nonatomic) IBOutlet UILabel *TotalDistanceMetricLabel;

@property (weak, nonatomic) IBOutlet UIButton *ResetDistanceButton;
@property (weak, nonatomic) IBOutlet UIButton *SaveButton;

@end
