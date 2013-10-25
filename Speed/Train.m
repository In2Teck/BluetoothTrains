//
//  Train.m
//  Speed
//
//  Created by Benjamín Hernández on 23/09/13.
//  Copyright (c) 2013 Benjamín Hernández. All rights reserved.
//

#import "Train.h"

@implementation Train

@synthesize name, style, speed, maxSpeed, wheelDiameter, onOff, lowBattery, uId, distance, isMetricSystem;

- (id) initWithName:(NSString*)initName style:(NSString*)initStyle speed:(float)initSpeed maxSpeed:(float)initMaxSpeed wheelDiameter:(float)initWheelDiameter onOff:(BOOL)initOnOff lowBattery:(BOOL)initLowBattery uId:(NSString*)initUId isMetricSystem:(BOOL)initIsMetricSystem
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
        self.distance = 0.0;
        self.isMetricSystem = initIsMetricSystem;
    }
    return self;
}

- (void) updateDistance:(float)data {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if (data > 0){
        float cycleDistance = 0.0;
        if (self.isMetricSystem){
            if ([defaults  boolForKey:@"IsMetricSystem"]) {
                // centimeters
                cycleDistance = (self.wheelDiameter * PI_CONSTANT * F_CONSTANT * KPS_CONSTANT) / data;
            } else {
                // centimeters in one inch = 2.54
                cycleDistance = ( (self.wheelDiameter / CM_IN_CONSTANT) * PI_CONSTANT * F_CONSTANT * MPS_CONSTANT) / data;
            }
        } else {
            if ([defaults  boolForKey:@"IsMetricSystem"]) {
                // centimeters in one inch = 0.3937
                cycleDistance = ( (self.wheelDiameter / IN_CM_CONSTANT) * PI_CONSTANT * F_CONSTANT * KPS_CONSTANT) / data;
            } else {
                // inches
                cycleDistance = (self.wheelDiameter * PI_CONSTANT * F_CONSTANT * MPS_CONSTANT) / data;
            }
        }
        self.distance = self.distance + cycleDistance;
    }
}

- (void)encodeWithCoder:(NSCoder *)coder {
    
    [coder encodeObject:self.name forKey:@"name"];
    [coder encodeObject:self.style forKey:@"style"];
    [coder encodeFloat:self.speed forKey:@"speed"];
    [coder encodeFloat:self.maxSpeed forKey:@"maxSpeed"];
    [coder encodeFloat:self.wheelDiameter forKey:@"wheelDiameter"];
    [coder encodeBool:self.onOff forKey:@"onOff"];
    [coder encodeBool:self.lowBattery forKey:@"lowBattery"];
    [coder encodeObject:self.uId forKey:@"uId"];
    [coder encodeDouble:self.distance forKey:@"distance"];
    [coder encodeBool:self.isMetricSystem forKey:@"isMetricSystem"];
}

- (id)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.name = [coder decodeObjectForKey:@"name"];
        self.style = [coder decodeObjectForKey:@"style"];
        self.speed = [coder decodeFloatForKey:@"speed"];
        self.maxSpeed = [coder decodeFloatForKey:@"maxSpeed"];
        self.wheelDiameter = [coder decodeFloatForKey:@"wheelDiameter"];
        self.onOff = [coder decodeBoolForKey:@"onOff"];
        self.lowBattery = [coder decodeBoolForKey:@"lowBattery"];
        self.uId = [coder decodeObjectForKey:@"uId"];
        self.distance = [coder decodeDoubleForKey:@"distance"];
        self.isMetricSystem = [coder decodeBoolForKey:@"isMetricSystem"];
    }
    return self;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%@, %@, %f, %f, %f, %i, %i, %@, %f, %i", self.name, self.style, self.speed, self.maxSpeed, self.wheelDiameter, self.onOff, self.lowBattery, self.uId, self.distance, self.isMetricSystem];
}

@end
