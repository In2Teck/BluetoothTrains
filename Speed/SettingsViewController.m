//
//  SettingsViewController.m
//  Speed
//
//  Created by Benjamín Hernández on 17/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

@synthesize USMetricSystem, ISOMetricSystem;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if([defaults objectForKey:@"IsMetricSystem"] != nil) {
        BOOL IsMetricSystem = [defaults boolForKey:@"IsMetricSystem"];
        if (IsMetricSystem) {
            self.ISOMetricSystem.on = YES;
            self.USMetricSystem.on = NO;
        } else {
            self.ISOMetricSystem.on = NO;
            self.USMetricSystem.on = YES;
        }
    } else {
        [defaults setBool:NO forKey:@"IsMetricSystem"];
        [defaults synchronize];
        self.ISOMetricSystem.on = NO;
        self.USMetricSystem.on = YES;
    }
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)flipUSMetricSystem:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:![defaults boolForKey:@"IsMetricSystem"] forKey:@"IsMetricSystem"];
    [defaults synchronize];
    [self.ISOMetricSystem setOn:!self.ISOMetricSystem.on animated:YES];
}

- (IBAction)flipISOMetricSystem:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:![defaults boolForKey:@"IsMetricSystem"] forKey:@"IsMetricSystem"];
    [defaults synchronize];
    [self.USMetricSystem setOn:!self.USMetricSystem.on animated:YES];
}

@end
