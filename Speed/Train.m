//
//  Train.m
//  Speed
//
//  Created by Benjamín Hernández on 23/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "Train.h"

@implementation Train

@synthesize name, style, speed, maxSpeed, onOff, lowBattery, macAddress;

- (id) initWithName:(NSString*)initName style:(NSString*)initStyle speed:(int)initSpeed maxSpeed:(int)initMaxSpeed onOff:(BOOL)initOnOff lowBattery:(BOOL)initLowBattery macAddress:(NSString*) initMacAddress
{
    if ( self = [super init] )
    {
        self.name = initName;
        self.style = initStyle;
        self.speed = initSpeed;
        self.maxSpeed = initMaxSpeed;
        self.onOff = initOnOff;
        self.lowBattery = initLowBattery;
        self.macAddress = initMacAddress;
    }
    return self;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%@, %@, %d, %d, %i, %i, %@", self.name, self.style, self.speed, self.maxSpeed, self.onOff, self.lowBattery, self.macAddress];
}

@end
