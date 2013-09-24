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

@synthesize TrainName, MaxSpeed, Style, AddTrainButton;

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
}

- (void) addTrain
{
    Train *train = [[Train alloc] initWithName:self.TrainName.text style:self.Style.text speed:0 maxSpeed:[self.MaxSpeed.text intValue] onOff:NO lowBattery:NO macAddress:@"MAC"];
    [[DataHandling sharedInstance] addTrain:train];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
