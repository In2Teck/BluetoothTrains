//
//  NewItemViewController.m
//  Speed
//
//  Created by Benjamín Hernández on 24/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "NewItemViewController.h"

@implementation NewItemViewController

@synthesize TrainName, MaxSpeed, WheelDiameter, AddTrainButton, UId, MaxSpeedMetricLabel, WheelDiameterMetricLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Register to receive an update when the app goes into the backround
        //It will call our "appEnteredBackground method
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(appEnteredBackground)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [AddTrainButton addTarget:self action:@selector(addTrain) forControlEvents: UIControlEventTouchDown];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"IsMetricSystem"]){
        self.MaxSpeedMetricLabel.text = @"km/h";
        self.WheelDiameterMetricLabel.text = @"cm";
    } else {
        self.MaxSpeedMetricLabel.text = @"mph";
        self.WheelDiameterMetricLabel.text = @"in";
    }
    MaxSpeed.keyboardType = UIKeyboardTypeNumberPad;
    WheelDiameter.keyboardType = UIKeyboardTypeNumberPad;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        UId.tag = 1;
    }
         
}

- (void) addTrain
{
    Train *train = [[Train alloc] initWithName:self.TrainName.text style:@"Classic" speed:0.0 maxSpeed:[self.MaxSpeed.text floatValue] wheelDiameter:[self.WheelDiameter.text intValue] onOff:NO lowBattery:NO uId:self.UId.text isMetricSystem:[[NSUserDefaults standardUserDefaults] boolForKey:@"IsMetricSystem"] ];
    [[DataHandling sharedInstance] addTrain:train];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

/* SCROLL KEYBOARD ON TEXT FIELD EDIT */

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UIView *UIdTextFieldPhone = [textField viewWithTag:1];
    if (UIdTextFieldPhone == nil){
        [self animateTextField: textField up: YES];
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    UIView *UIdTextFieldPhone = [textField viewWithTag:1];
    if (UIdTextFieldPhone == nil){
        [self animateTextField: textField up: NO];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
//This is called when the app goes into the background.
//We must reset the responder because animations will not be saved
- (void)appEnteredBackground{
    [self.TrainName resignFirstResponder];
    [self.WheelDiameter resignFirstResponder];
    [self.MaxSpeed resignFirstResponder];
    [self.UId resignFirstResponder];
}

@end
