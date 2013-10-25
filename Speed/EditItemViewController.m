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
        // Custom initialization
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
        
        self.MaxSpeedMetricLabel.text = @"km";
        self.TotalDistanceMetricLabel.text = @"km";
        self.WheelDiameterMetricLabel.text = @"cm";
        
    } else {
        
        if (self.TrainObject.isMetricSystem){
            // convert to US
            self.MaxSpeed.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.maxSpeed / KM_MI_CONSTANT];
            self.WheelDiameter.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.wheelDiameter / CM_IN_CONSTANT];
            self.Distance.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.distance / KM_MI_CONSTANT];
        }
        
        self.MaxSpeedMetricLabel.text = @"miles";
        self.TotalDistanceMetricLabel.text = @"miles";
        self.WheelDiameterMetricLabel.text = @"in";
    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
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

@end
