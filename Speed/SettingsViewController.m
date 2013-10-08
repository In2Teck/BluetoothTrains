//
//  SettingsViewController.m
//  Speed
//
//  Created by Benjamín Hernández on 17/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

@synthesize DisplayLabel;

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
    DisplayLabel.text = @"TEST";
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
