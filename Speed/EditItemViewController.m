//
//  EditItemViewController.m
//  Speed
//
//  Created by Benjamín Hernández on 11/10/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "EditItemViewController.h"

@implementation EditItemViewController

@synthesize TrainObject, TrainIndex, TrainName, MaxSpeed, WheelDiameter, Distance, ResetDistanceButton, SaveButton;

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
    //self.TrainObject = [[Train alloc] init];
    self.TrainObject = [[DataHandling sharedInstance] getTrainAtIndex:self.TrainIndex];
    self.TrainName.text = self.TrainObject.name;
    self.MaxSpeed.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.maxSpeed];
    self.WheelDiameter.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.wheelDiameter];
    self.Distance.text = [NSString stringWithFormat:@"%.2f", self.TrainObject.distance];
    
    [ResetDistanceButton addTarget:self action:@selector(resetDistance) forControlEvents: UIControlEventTouchDown];
    [SaveButton addTarget:self action:@selector(saveTrain) forControlEvents: UIControlEventTouchDown];
}

- (void) saveTrain
{
    self.TrainObject.name = self.TrainName.text;
    self.TrainObject.maxSpeed = [self.MaxSpeed.text floatValue];
    self.TrainObject.wheelDiameter = [self.WheelDiameter.text floatValue];
    self.TrainObject.distance = [self.Distance.text floatValue];
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


@end
