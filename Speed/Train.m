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

- (void)encodeWithCoder:(NSCoder *)coder {
    
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.style forKey:@"style"];
    [coder encodeInt:self.speed forKey:@"speed"];
    [coder encodeInt:self.maxSpeed forKey:@"maxSpeed"];
    [coder encodeBool:self.onOff forKey:@"onOff"];
    [coder encodeBool:self.lowBattery forKey:@"lowBattery"];
    [coder encodeObject:self.macAddress forKey:@"macAddress"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.style = [coder decodeObjectForKey:@"style"];
        self.speed = [coder decodeIntegerForKey:@"speed"];
        self.maxSpeed = [coder decodeIntegerForKey:@"maxSpeed"];
        self.onOff = [coder decodeBoolForKey:@"onOff"];
        self.lowBattery = [coder decodeBoolForKey:@"lowBatter"];
        self.macAddress = [coder decodeObjectForKey:@"macAddress"];
    }
    return self;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%@, %@, %d, %d, %i, %i, %@", self.name, self.style, self.speed, self.maxSpeed, self.onOff, self.lowBattery, self.macAddress];
}

@end
