//
//  Train.m
//  Speed
//
//  Created by Benjamín Hernández on 23/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "Train.h"

@implementation Train

@synthesize name, style, speed, maxSpeed, wheelDiameter, onOff, lowBattery, uId;

- (id) initWithName:(NSString*)initName style:(NSString*)initStyle speed:(float)initSpeed maxSpeed:(float)initMaxSpeed wheelDiameter:(int)initWheelDiameter onOff:(BOOL)initOnOff lowBattery:(BOOL)initLowBattery uId:(NSString*) initUId
{
    if ( self = [super init] )
    {
        self.name = initName;
        self.style = initStyle;
        self.speed = initSpeed;
        self.maxSpeed = initMaxSpeed;
        self.wheelDiameter = initWheelDiameter;
        self.onOff = initOnOff;
        self.lowBattery = initLowBattery;
        self.uId = initUId;
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.style forKey:@"style"];
    [coder encodeInt:self.speed forKey:@"speed"];
    [coder encodeInt:self.maxSpeed forKey:@"maxSpeed"];
    [coder encodeInt:self.wheelDiameter forKey:@"wheelDiameter"];
    [coder encodeBool:self.onOff forKey:@"onOff"];
    [coder encodeBool:self.lowBattery forKey:@"lowBattery"];
    [coder encodeObject:self.uId forKey:@"uId"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.style = [coder decodeObjectForKey:@"style"];
        self.speed = [coder decodeIntegerForKey:@"speed"];
        self.maxSpeed = [coder decodeIntegerForKey:@"maxSpeed"];
        self.wheelDiameter = [coder decodeIntegerForKey:@"wheelDiameter"];
        self.onOff = [coder decodeBoolForKey:@"onOff"];
        self.lowBattery = [coder decodeBoolForKey:@"lowBatter"];
        self.uId = [coder decodeObjectForKey:@"uId"];
    }
    return self;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%@, %@, %f, %f, %d, %i, %i, %@", self.name, self.style, self.speed, self.maxSpeed, self.wheelDiameter, self.onOff, self.lowBattery, self.uId];
}

@end
