//
//  EditItemViewController.m
//  Speed
//
//  Created by Benjamín Hernández on 11/10/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "EditItemViewController.h"

@implementation EditItemViewController

@synthesize TrainObject, TrainIndex, TrainName, MaxSpeed, WheelDiameter, Distance, ResetDistanceButton, SaveButton, MaxSpeedMetricLabel, WheelDiameterMetricLabel, TotalDistanceMetricLabel;

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

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    
    self.TrainObject = [[DataHandling sharedInstance] getTrainAtIndex:self.TrainIndex];
    self.TrainName.text = self.TrainObject.name;
    
    [ResetDistanceButton addTarget:self action:@selector(resetDistance) forControlEvents: UIControlEventTouchDown];
    [SaveButton addTarget:self action:@selector(saveTrain) forControlEvents: UIControlEventTouchDown];
    
    self.MaxSpeed.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.maxSpeed];
    self.WheelDiameter.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.wheelDiameter];
    self.Distance.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.distance];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"IsMetricSystem"]){
        
        if (!self.TrainObject.isMetricSystem){
            // convert to ISO
            self.MaxSpeed.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.maxSpeed / MI_KM_CONSTANT];
            self.WheelDiameter.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.wheelDiameter / IN_CM_CONSTANT];
            self.Distance.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.distance / MI_KM_CONSTANT];
        }
        
        self.MaxSpeedMetricLabel.text = @"km/h";
        self.TotalDistanceMetricLabel.text = @"km";
        self.WheelDiameterMetricLabel.text = @"cm";
        
    } else {
        
        if (self.TrainObject.isMetricSystem){
            // convert to US
            self.MaxSpeed.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.maxSpeed / KM_MI_CONSTANT];
            self.WheelDiameter.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.wheelDiameter / CM_IN_CONSTANT];
            self.Distance.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.distance / KM_MI_CONSTANT];
        }
        
        self.MaxSpeedMetricLabel.text = @"mph";
        self.TotalDistanceMetricLabel.text = @"miles";
        self.WheelDiameterMetricLabel.text = @"in";
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    MaxSpeed.keyboardType = UIKeyboardTypeNumberPad;
    WheelDiameter.keyboardType = UIKeyboardTypeNumberPad;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        TrainName.tag = 2;
    }
    
}

- (void) saveTrain
{
    self.TrainObject.name = self.TrainName.text;
    self.TrainObject.maxSpeed = [self.MaxSpeed.text floatValue];
    self.TrainObject.wheelDiameter = [self.WheelDiameter.text floatValue];
    self.TrainObject.distance = [self.Distance.text floatValue];
    self.TrainObject.isMetricSystem = [[NSUserDefaults standardUserDefaults] boolForKey:@"IsMetricSystem"];
    [[DataHandling sharedInstance] replaceTrainAtIndex:self.TrainIndex withObject:self.TrainObject];
}

- (void) resetDistance
{
    self.Distance.text = @"0";
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
    UIView *UIdTextFieldPhone = [textField viewWithTag:2];
    if (UIdTextFieldPhone == nil){
        [self animateTextField: textField up: YES];
    }
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    UIView *UIdTextFieldPhone = [textField viewWithTag:2];
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
}

@end
