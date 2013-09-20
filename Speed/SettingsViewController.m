//
//  SettingsViewController.m
//  Speed
//
//  Created by Benjamín Hernández on 17/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    //[[DataHandling sharedInstance] addTrain:[[NSMutableArray alloc] initWithObjects:@"Settings New Train", @"Classic", @"40", @"ON", @"MAC", nil] ];
    //[[DataHandling sharedInstance] removeTrainAtIndex: 1];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
