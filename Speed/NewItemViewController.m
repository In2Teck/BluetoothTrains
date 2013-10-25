//
//  NewItemViewController.m
//  Speed
//
//  Created by Benjamín Hernández on 24/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "NewItemViewController.h"

@interface NewItemViewController ()

@end

@implementation NewItemViewController

@synthesize TrainName, MaxSpeed, WheelDiameter, AddTrainButton, UId, MaxSpeedMetricLabel, WheelDiameterMetricLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [AddTrainButton addTarget:self action:@selector(addTrain) forControlEvents: UIControlEventTouchDown];
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"IsMetricSystem"]){
        self.MaxSpeedMetricLabel.text = @"km";
        self.WheelDiameterMetricLabel.text = @"cm";
    } else {
        self.MaxSpeedMetricLabel.text = @"miles";
        self.WheelDiameterMetricLabel.text = @"in";
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

@end
